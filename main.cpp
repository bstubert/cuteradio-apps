#include <QAudioDeviceInfo>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtDebug>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    for (auto dev : QAudioDeviceInfo::availableDevices(QAudio::AudioOutput)) {
        qDebug() << "@ Audio device = " << dev.deviceName();
    }
    qDebug() << "@ Default audio device = " << QAudioDeviceInfo::defaultOutputDevice().deviceName();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
