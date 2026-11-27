#ifndef CPPCLASS_H
#define CPPCLASS_H

#include <QObject>
#include <QtQml>

class CppClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit CppClass(QObject *parent = nullptr);

signals:
    void sendInt(int parama);
    void sendDouble(double param);
    void sendBoolRealFloat(bool boolparam, qreal realparam, float floatparam);

public slots:
    void cppSlot();

    void receivePoint(QPoint point);
    void receiveRect(QRect rect);
};

#endif // CPPCLASS_H
