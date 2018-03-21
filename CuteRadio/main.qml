import QtQuick 2.10
import QtQuick.Controls 2.3
import QtMultimedia 5.8
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
            color: "#6D213C" // wine
        }


        Rectangle {
            id: favorites
            anchors.right: parent.right
            anchors.top: statusBar.bottom
            anchors.bottom: bottomBar.top
            width: parent._menuWidth
            color: "#FAFF70" // unmellow yellow
        }

        Rectangle {
            id: bottomBar
            anchors.left: parent.left
            anchors.leftMargin: menu.width
            anchors.right: parent.right
            anchors.rightMargin: favorites.width
            anchors.bottom: parent.bottom
            height: parent._rowHeight
            color: "#BAAB68" // dark khaki

            Slider {
                id: volumeSlider
                anchors.left: parent.left
                anchors.right: playButton.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                value: 0.5
                onMoved: player.volume = volumeSlider.value
            }

            Button {
                id: playButton
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 0.125 * mainWindow.width
                checkable: true
                checked: player.autoPlay
                icon.source: checked ? "/Images/icPause.png" : "/Images/icPlay.png"
                onToggled: checked ? player.play() : player.pause()
            }
        }
    }

    MediaPlayer {
        id: player
        autoPlay: true
        source: "http://mp3channels.webradio.antenne.de/antenne"
    }
}
