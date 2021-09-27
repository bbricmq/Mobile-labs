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
                text: qsTr("Show Page 4")
                onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                id: label1
                text: "Hello world!"
                font.pixelSize: 100
                color: "blue"
                state: "state1"
                states: [
                    State {
                        name: "state1"
                        PropertyChanges {
                        target: label1
                        y: 50
                        }
                    },
                    State {
                        name: "state2"
                        PropertyChanges {
                            target: label1
                            y: 1000
                            color:"green"
                            rotation: 180
                        }
                    }
                ]
                transitions: [
                    Transition {
                        to: "state2"
                        SequentialAnimation {
                            PropertyAnimation {
                                property: "y";
                                duration: 2000
                            }
                        }
                        RotationAnimation {
                            duration: 2000;
                            direction: RotationAnimation.Counterclockwise
                        }
                    },
                    Transition {
                        to: "state1"
                        SequentialAnimation {
                            PropertyAnimation {
                                property: "y";
                                duration: 2000
                            }
                        }
                        RotationAnimation {
                            duration: 2000;
                            direction: RotationAnimation.Clockwise
                        }
                    }
                ]
                MouseArea {
                    anchors.fill:parent
                    onPressed: parent.state = "state2"
                    onReleased: parent.state = "state1"
                }
            }
        }
    }
}
