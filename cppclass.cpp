#include "cppclass.h"
#include <QDebug>

CppClass::CppClass(QObject *parent)
    : QObject{parent}
{
}

void CppClass::cppSlot()
{
    qDebug() << "cppslot called";
    emit sendInt(123);
    emit sendDouble(123.456);
    emit sendBoolRealFloat(true, 2.11, 3.3);
}

void CppClass::receivePoint(QPoint point)
{
}

void CppClass::receiveRect(QRect rect)
{
}
