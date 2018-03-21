import QtQuick 2.10
import QtQuick.Controls 2.3
import QtMultimedia 5.8

Rectangle {
    id: bottomBar
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
