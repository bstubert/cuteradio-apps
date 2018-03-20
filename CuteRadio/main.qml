import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10

Window {
    id: mainWindow
    visible: true
    width: 800
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "blue"

        property real _menuWidth: 0.25 * mainWindow.width
        property real _rowHeight: 0.125 * mainWindow.height

        Rectangle {
            id: statusBar
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent._rowHeight
            color: "#946846" // raw umber
        }

        Rectangle {
            id: menu
            anchors.left: parent.left
            anchors.top: statusBar.bottom
            anchors.bottom: toolBar.top
            width: parent._menuWidth
            color: "#E3C16F" // straw
        }

        Rectangle {
            id: stationInfo
            anchors.left: menu.right
            anchors.right: favorites.left
            anchors.top: statusBar.bottom
            anchors.bottom: toolBar.top
            color: "#6D213C" // wine
        }


        Rectangle {
            id: favorites
            anchors.right: parent.right
            anchors.top: statusBar.bottom
            anchors.bottom: toolBar.top
            width: parent._menuWidth
            color: "#FAFF70" // unmellow yellow
        }

        Rectangle {
            id: toolBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: parent._rowHeight
            color: "#BAAB68" // dark khaki

            Button {
                id: playButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 0.125 * mainWindow.width
                checkable: true
                text: checked ? qsTr("Stop") : qsTr("Play")
            }
        }
    }
}
