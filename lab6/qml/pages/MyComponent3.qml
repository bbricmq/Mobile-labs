import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    anchors.horizontalCenter: parent.horizontalCenter
    property var hours: 0
    property var minutes: 0
    property var seconds: 0
    text: (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds)
    font.pixelSize: 80
    Timer {
        id: timer
        interval: 1000
        repeat: true
        running:false
        onTriggered:  {
            parent.seconds++;
            minutes += seconds === 60 ? 1 : 0;
            seconds = seconds === 60 ? 0 : seconds;
            hours += minutes === 60 ? 1 : 0;
            minutes = minutes === 60 ? 0 : minutes;
            hours = hours === 24 ? 0 : hours;
        }
    }
    Button {
        y: +150
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Start"
        onClicked: {
            text = text == "Start" ? "Stop" : "Start";
            timer.running = timer.running ? false : true;
        }
    }
}
