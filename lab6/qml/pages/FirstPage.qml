import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int counter: 0

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column
            y: y + 300
            width: page.width
            spacing: Theme.paddingLarge
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
            Component.onCompleted: {
                pageStack.onDepthChanged.connect(pageCount)
            }

            function pageCount() {
                counter = pageStack.depth
                console.log(counter)
            }
        }
    }
}
