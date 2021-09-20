import QtQuick 2.0

Column {
    id: column
    y: y + 300
    width: page.width
    spacing: 20
    states: [
        State {
            name: "red"
            PropertyChanges {
                target: red
                color:"red"
            }
            PropertyChanges {
                target: yellow
                color:"black"
            }
            PropertyChanges {
                target: green
                color:"black"
            }
        },
        State {
            name: "yellow"
            PropertyChanges {
                target: red
                color:"black"
            }
            PropertyChanges {
                target: yellow
                color:"yellow"
            }
            PropertyChanges {
                target: green
                color:"black"
            }
        },
        State {
            name: "green"
            PropertyChanges {
                target: red
                color:"black"
            }
            PropertyChanges {
                target: yellow
                color:"black"
            }
            PropertyChanges {
                target: green
                color:"green"
            }
        }
    ]

    Rectangle {
        id: red
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: width
        radius: width / 2
        color: "red"
    }
    Rectangle {
        id: yellow
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: width
        radius: width / 2
        color: "black"
    }
    Rectangle {
        id: green
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: width
        radius: width / 2
        color: "black"
    }
    Timer {
        interval: 2000
        repeat: true
        running:true
        property int indx: 0
        property var states: ["red", "yellow", "green", "yellow"]
        onTriggered:  {
            indx++;
            parent.state = states[(indx) % 4]
        }
    }
}
