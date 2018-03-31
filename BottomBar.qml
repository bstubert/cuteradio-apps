import QtQuick 2.9
import QtQuick.Controls 2.2
import QtMultimedia 5.8

Pane
{
    id: bottomBar

    property MediaPlayer player

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
        onToggled: checked ? player.play() : player.pause()

        Image {
            anchors.centerIn: parent
            height: 0.8 * playButton.height
            width: height
            source: playButton.checked ? "/Images/icPause.png" : "/Images/icPlay.png"
        }
    }
}
