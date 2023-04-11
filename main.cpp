#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(u"qrc:/main.qml"_qs));
    return app.exec();
}
