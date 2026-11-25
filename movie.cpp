#include "movie.h"
#include <QDebug>
Movie::Movie(QObject *parent)
    : QObject{parent}
{
    qDebug()<< "movie create";
}

QString Movie::mainCharacter() const
{
    qDebug()<< "get maincharacter";
    return m_mainCharacter;
}

void Movie::setMainCharacter(const QString &newMainCharacter)
{
    if (m_mainCharacter == newMainCharacter)
        return;
    qDebug()<< "set maincharacter";
    m_mainCharacter = newMainCharacter;
    emit mainCharacterChanged();
}

QString Movie::title() const
{
    qDebug()<< "get title";
    return m_title;
}

void Movie::setTitle(const QString &newTitle)
{
    if (m_title == newTitle)
        return;
    qDebug()<< "set title ";
    m_title = newTitle;
    emit titleChanged();
}
