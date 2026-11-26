#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "mysingleton.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MySingleton *singleton = new MySingleton(&app);
    qmlRegisterSingletonInstance("wwt.wwt.wwt", 1, 0, "MySingleton", singleton);
    QQmlApplicationEngine engine;

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
