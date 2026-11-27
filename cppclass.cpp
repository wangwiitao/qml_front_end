#include "cppclass.h"
#include <QDebug>

CppClass::CppClass(QObject *parent)
    : QObject{parent}
{}

void CppClass::cppSlot()
{
    qDebug() << "cppslot called";
    emit sendInt(123);
}

void CppClass::receivePoint(QPoint point)
{

}

void CppClass::receiveRect(QRect rect)
{

}
