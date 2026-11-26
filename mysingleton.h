#ifndef MYSINGLETON_H
#define MYSINGLETON_H

#include <QObject>
#include <QtQml>

class MySingleton : public QObject
{
    Q_OBJECT
 /*    QML_SINGLETON
    QML_ELEMENT */
public:
    explicit MySingleton(QObject *parent = nullptr);

    Q_INVOKABLE void doSomething() const{
        qDebug() << "Doing something...";
    }

signals:
};

#endif // MYSINGLETON_H
