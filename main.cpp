#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "movie.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Movie movie;
    movie.setTitle("Tiantic");
    movie.setMainCharacter("Leonardo D");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Movie", &movie);
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
