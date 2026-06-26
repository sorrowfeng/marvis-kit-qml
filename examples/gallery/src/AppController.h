#pragma once

#include <QObject>
#include <QString>

class AppController final : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString version READ version CONSTANT)
    Q_PROPERTY(QString route READ route WRITE setRoute NOTIFY routeChanged)

public:
    explicit AppController(QObject *parent = nullptr);

    QString version() const;
    QString route() const;
    void setRoute(const QString &route);

    Q_INVOKABLE QString greeting() const;
    Q_INVOKABLE QString capabilitySummary() const;

Q_SIGNALS:
    void routeChanged();

private:
    QString m_route = QStringLiteral("assistant");
};
