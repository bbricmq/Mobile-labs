import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

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

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Pract2")
            }
            Item {
                x: 50
                y: 20
                Rectangle {
                    width: 100
                    height: 100
                    color: "red"
                }
                Rectangle {
                    x: 100
                    y: 50
                    width: 100
                    height: 100
                    color: "green"
                }
                Rectangle {
                    x: 150
                    width: 100
                    height: 100
                    color: "blue"
                    Text {
                        text: "Квадрат"
                        font.family: "Helvetica"
                        font.pointSize: 18
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
            }
            Item {
                x: 50
                y: 190
                Row {
                    spacing: 10
                    Column {
                        spacing: 10
                        Rectangle {
                            width: 100
                            height: 100
                            color: "red"
                        }
                        Rectangle {
                            width: 100
                            height: 100
                            color: "pink"
                        }
                    }
                    Rectangle {
                        width: 100
                        height: 100
                        color: "green"
                    }
                    Column {
                        spacing: 10
                        Rectangle {
                            width: 100
                            height: 100
                            color: "blue"
                        }
                        Rectangle {
                            width: 100
                            height: 100
                            color: "black"
                        }
                    }
                }
            }
            Item {
                x: 50
                y: 430
                Grid {
                    rows: 2
                    columns: 3
                    spacing: 10
                    Rectangle {
                        width: 100
                        height: 100
                        color: "red"
                    }
                    Rectangle {
                        width: 100
                        height: 100
                        color: "green"
                    }
                    Rectangle {
                        width: 100
                        height: 100
                        color: "blue"
                    }
                    Rectangle {
                        width: 100
                        height: 100
                        color: "pink"
                    }
                    Rectangle {
                        width: 100
                        height: 100
                        color: "transparent"
                    }
                    Rectangle {
                        width: 100
                        height: 100
                        color: "black"
                    }
                }
            }
            Item {
                x: 50
                y: 670
                Rectangle {
                    width: 200
                    height: 200
                    color: "black"
                }
                Rectangle {
                    width: 200
                    height: 200
                    color: "black"
                    transform: [
                    Scale {
                        xScale: 0.5
                        yScale: 1
                    },
                    Rotation {
                        angle: 45
                    },
                    Translate {
                        x: + 400
                    }]
                }
            }
            Item {
                x: 50
                y: 900
                Rectangle {
                    id: animationRectangle
                    color: "blue"
                    width: 100
                    height: 100
                    ParallelAnimation {
                        running: true
                        NumberAnimation {
                            target: animationRectangle
                            property: "y"
                            to: 180
                            duration: 10000
                        }
                        NumberAnimation {
                            target: animationRectangle
                            property: "width"
                            to: 200
                            duration: 10000
                        }
                        NumberAnimation {
                            target: animationRectangle
                            property: "height"
                            to: 200
                            duration: 10000
                        }
                    }
                }
            }
            Component {
                id: dialog
                Dialog {
                    DialogHeader{}
                    Column {
                        anchors.centerIn: parent
                        width: parent.width
                        spacing: Theme.paddingMedium
                        Label {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Введите два числа:"
                        }
                        TextField {
                            id: field1
                            width: parent.width
                            inputMethodHints: Qt.ImhFormattedNumbersOnly
                            placeholderText: label
                            color: Theme.highlightColor
                        }
                        TextField {
                            id: field2
                            width: parent.width
                            inputMethodHints: Qt.ImhFormattedNumbersOnly
                            placeholderText: label
                            color: Theme.highlightColor
                        }
                        Button {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Сложить"
                            onClicked: console.log(parseInt(field1.text) + parseInt(field2.text));
                        }
                    }
                    onAccepted: console.log(parseInt(field1.text) + parseInt(field2.text));
                    onRejected: helloLabel.text = "Отменил действие"
                }
            }
            Item {
                x: 500
                y: 1200
                Button {
                    text: "Открыть диалог"
                    anchors.centerIn: parent
                    onClicked: {
                        onClicked: pageStack.push(dialog)
                        //dialog.open();
                    }
                }
            }
        }
    }
}
