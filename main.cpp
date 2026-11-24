#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cppworker.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    CppWorker cppworker;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("BWorker", &cppworker);
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
