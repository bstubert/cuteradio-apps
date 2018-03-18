import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    visible: true
    width: 800
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "blue"
    }
}
