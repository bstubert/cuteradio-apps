import QtQuick 2.9
import QtQuick.Controls 2.2
import QtMultimedia 5.8
import QtQuick.Window 2.9

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
            anchors.bottom: bottomBar.top
            width: parent._menuWidth
            color: "#E3C16F" // straw
        }

        Rectangle {
            id: stationInfo
            anchors.left: menu.right
            anchors.right: favorites.left
            anchors.top: statusBar.bottom
            anchors.bottom: bottomBar.top
            color: "#FAFF70" // unmellow yellow

            Label {
                anchors.centerIn: parent
                text: "Antenne Bayern"
                font.pixelSize: 36
            }
        }


        Rectangle {
            id: favorites
            anchors.right: parent.right
            anchors.top: statusBar.bottom
            anchors.bottom: bottomBar.top
            width: parent._menuWidth
            color: "#6D213C" // wine
        }

        BottomBar {
            id: bottomBar
            anchors.left: parent.left
            anchors.leftMargin: menu.width
            anchors.right: parent.right
            anchors.rightMargin: favorites.width
            anchors.bottom: parent.bottom
            height: parent._rowHeight
            player: g_player
        }
    }

    MediaPlayer {
        id: g_player
        autoPlay: true
        source: "http://mp3channels.webradio.antenne.de/antenne"
    }
}
