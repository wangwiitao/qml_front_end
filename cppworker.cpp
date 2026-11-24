#include "cppworker.h"
#include <QDebug>

CppWorker::CppWorker(QObject *parent)
    : QObject{parent}
{
}

void CppWorker::regularMethod()
{
    qDebug() << "this is c++ talking, regularMethod";
}

QString CppWorker::regularMethodWithReturn(QString name, int age)
{
    qDebug() << "This is C++ talking, name : " << name << "age: " << age;
    return QString(name + ":" + QString::number(age) + "years old");
}

void CppWorker::cppSlot()
{
    qDebug() << "This is cppSlot";
}