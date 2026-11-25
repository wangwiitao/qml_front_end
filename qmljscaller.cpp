#include "qmljscaller.h"
#include <QVariant>
#include <QDebug>

QmlJsCaller::QmlJsCaller(QObject *parent)
    : QObject{parent}
{}

void QmlJsCaller::cppMethod(QString parameter)
{
    qInfo()<< "in c++ call js";
    callJSMethod(parameter);
}

void QmlJsCaller::setQmlRootObject(QObject *value)
{
    qmlRootObject = value;
}

void QmlJsCaller::callJSMethod(QString param)
{
    QVariant returnedValue;
    QVariant cppParameter = QVariant::fromValue(param);

    QMetaObject::invokeMethod(qmlRootObject,"qmlJSFunction",
                              Q_RETURN_ARG(QVariant,returnedValue),
                              Q_ARG(QVariant,cppParameter));
    qDebug() << "C++, done calling qml js, the return value is: " << returnedValue.toString();
}
