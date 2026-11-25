#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "qmljscaller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QmlJsCaller caller;

    engine.rootContext()->setContextProperty("QmlJsCaller", &caller);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []()
        { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("context", "Main");
    auto rootObjects = engine.rootObjects();

    if(engine.rootObjects().isEmpty()){
        return -1;
    }else{
        caller.setQmlRootObject(rootObjects[0]);
    }

    return QGuiApplication::exec();
}
