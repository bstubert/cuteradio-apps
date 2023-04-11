import QtQuick
import QtQuick.Controls
import QtMultimedia
import QtQuick.Window

Window {
    id: mainWindow
    visible: true
    title: qsTr("CuteRadio")
    width: 1280
    height: 800

    Rectangle {
        anchors.fill: parent
        color: "blue"

        property real _menuWidth: 0.25 * width
        property real _rowHeight: 0.125 * height

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
//        Component.onCompleted: g_player.play()
        source: "http://mp3channels.webradio.antenne.de/antenne"
        onErrorOccurred: (_, errorString) => console.log("Error = ", errorString)
    }
}
