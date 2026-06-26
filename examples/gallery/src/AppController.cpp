#include "AppController.h"

AppController::AppController(QObject *parent)
    : QObject(parent)
{
}

QString AppController::version() const
{
    return QStringLiteral("0.1.0");
}

QString AppController::route() const
{
    return m_route;
}

void AppController::setRoute(const QString &route)
{
    if (m_route == route) {
        return;
    }

    m_route = route;
    Q_EMIT routeChanged();
}

QString AppController::greeting() const
{
    return QStringLiteral("晚上好，准备开始今天的工作了吗？");
}

QString AppController::capabilitySummary() const
{
    return QStringLiteral("本地文件、系统能力、跨端任务和 AI 对话会通过 C++ Agent 接入。");
}
