#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "errorlevel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterUncreatableType<ErrorLevel>("a.b.c",1,0,"ErrorLevel","Can not create ErrorLevel type in QML. Not allowed.");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []()
        { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("context", "Main");

    return QGuiApplication::exec();
}
