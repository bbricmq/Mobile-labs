import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 1")
                onClicked: pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Pract3")
            }
            Item {
                x: 50
                y: 100
                Column {
                    spacing: 10
                    TimePicker {
                        width: 400
                        height: 400
                        id: timePicker
                        hour: 12
                        minute: 0
                        Label {
                            anchors.centerIn: timePicker
                            text: timePicker.timeText
                            font.pixelSize: Theme.fontSizeExtraLarge
                        }
                        onTimeTextChanged: console.log(timeText)
                    }
                    ComboBox {
                        label: "Выпадающий список"
                        menu: ContextMenu {
                            MenuItem { text: "Первая строка" }
                            MenuItem { text: "Вторая строка" }
                            MenuItem { text: "Третья строка" }
                        }
                        onCurrentIndexChanged: console.log(value)
                    }
                    TextSwitch {
                        text: checked ? "Включен" : "Выключен"
                    }
                    Slider {
                        width: parent.width
                        label: "Текущее значение: " + value;
                        minimumValue: 0
                        maximumValue: 100
                        value: 0
                        stepSize: 1
                        valueText: value
                    }
                }
            }
        }
    }
}
