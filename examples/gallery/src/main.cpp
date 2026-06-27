#include <QGuiApplication>
#include <QDateTime>
#include <QFile>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QQuickStyle>
#include <QSurfaceFormat>
#include <QTextStream>
#include <QTimer>
#include <QUrl>
#include <QtQml/qqmlextensionplugin.h>

#include "AppController.h"

Q_IMPORT_QML_PLUGIN(MarvisKitPlugin)

#ifdef Q_OS_WIN
#include <dwmapi.h>
#include <windows.h>
#endif

namespace {
void messageHandler(QtMsgType type, const QMessageLogContext &, const QString &message)
{
    QFile logFile(QStringLiteral("marvis-runtime.log"));
    if (!logFile.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
        return;
    }

    QTextStream stream(&logFile);
    stream << QDateTime::currentDateTime().toString(Qt::ISODate) << " ";
    switch (type) {
    case QtDebugMsg:
        stream << "DEBUG";
        break;
    case QtInfoMsg:
        stream << "INFO";
        break;
    case QtWarningMsg:
        stream << "WARN";
        break;
    case QtCriticalMsg:
        stream << "CRITICAL";
        break;
    case QtFatalMsg:
        stream << "FATAL";
        break;
    }
    stream << " " << message << "\n";
}

void applyWindowChrome(QQuickWindow *window)
{
    if (!window) {
        return;
    }

    window->setColor(Qt::transparent);

#ifdef Q_OS_WIN
    const HWND hwnd = reinterpret_cast<HWND>(window->winId());
    if (hwnd) {
        // The gallery draws its own antialiased rounded shell in QML. Disable
        // Windows 11's native rounding to avoid a second corner behind it.
        constexpr int doNotRoundCornerPreference = 1;
        constexpr DWORD windowCornerPreferenceAttribute = 33;
        DwmSetWindowAttribute(
            hwnd,
            windowCornerPreferenceAttribute,
            &doNotRoundCornerPreference,
            sizeof(doNotRoundCornerPreference));
    }
#endif
}
}

int main(int argc, char *argv[])
{
    qInstallMessageHandler(messageHandler);

    QSurfaceFormat format;
    format.setAlphaBufferSize(8);
    QSurfaceFormat::setDefaultFormat(format);
    QQuickWindow::setDefaultAlphaBuffer(true);

    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName(QStringLiteral("MarvisKit Gallery"));
    QGuiApplication::setOrganizationName(QStringLiteral("Marvis"));
    QQuickStyle::setStyle(QStringLiteral("Basic"));

    QString screenshotPath;
    const QStringList arguments = app.arguments();
    const qsizetype screenshotIndex = arguments.indexOf(QStringLiteral("--screenshot"));
    if (screenshotIndex >= 0 && screenshotIndex + 1 < arguments.size()) {
        screenshotPath = arguments.at(screenshotIndex + 1);
    }

    AppController controller;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("appController"), &controller);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    if (!screenshotPath.isEmpty()) {
        QObject::connect(
            &engine,
            &QQmlApplicationEngine::objectCreated,
            &app,
            [screenshotPath](QObject *object, const QUrl &) {
                auto *window = qobject_cast<QQuickWindow *>(object);
                if (!window) {
                    QCoreApplication::exit(-1);
                    return;
                }
                applyWindowChrome(window);

                QTimer::singleShot(900, window, [window, screenshotPath]() {
                    const QImage image = window->grabWindow();
                    if (!image.save(screenshotPath)) {
                        qWarning() << "Failed to save screenshot" << screenshotPath;
                        QCoreApplication::exit(-1);
                        return;
                    }
                    QCoreApplication::quit();
                });
            },
            Qt::SingleShotConnection);
    }

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [](QObject *object, const QUrl &) {
            applyWindowChrome(qobject_cast<QQuickWindow *>(object));
        });

    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/MarvisKitGallery/qml/Main.qml")));

    return app.exec();
}
