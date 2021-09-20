import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            y: y + 300

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
                    name: "yellow1"
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
                },
                State {
                    name: "yellow2"
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
                id: time
                interval: 2000
                repeat: true
                running:true
                property int indx: 0
                property var states: ["red", "yellow1", "green", "yellow2"]
                onTriggered:  {
                    indx++;
                    if(parent.state === "yellow1") {
                        human.state = human.state === "Right" ? "Left" : "Right";
                    }
                    parent.state = states[(indx) % 4]
                }
            }
            Image {
                id: human
                y: +50
                width: 200
                height: 200
                source: "human.png"
                state: "Left"
                states: [
                    State {
                        name: "Right"
                        PropertyChanges {
                            target: human
                            x: 500
                        }
                    },
                    State {
                        name: "Left"
                        PropertyChanges {
                            target: human
                            x: 0
                        }
                    }
                ]
                transitions: [
                    Transition {
                        SequentialAnimation {
                            PropertyAnimation {
                                property: "x";
                                duration: time.interval
                            }
                        }
                    }
                ]
            }
        }
    }
}
