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
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
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
                    TextField {
                        label: "Введите число"
                        placeholderText: "Number"
                    }
                    Button {
                        anchors.horizontalCenter:  parent.horizontalCenter
                        color: "yellow"
                        backgroundColor: "brown"
                        highlightColor: "orange"
                        highlightBackgroundColor: "blue"
                        text: "Кнопка"
                        onClicked: down = !down
                    }
                    Button {
                        id: but2
                        anchors.horizontalCenter:  parent.horizontalCenter
                        color: "yellow"
                        backgroundColor: "brown"
                        highlightColor: "orange"
                        highlightBackgroundColor: "blue"
                        text: "Кнопка"
                    }
                    Text {
                        id: text
                        anchors.horizontalCenter:  parent.horizontalCenter
                        text: but2.down == true ? "Нажата" : "Отпущена";
                        color: "yellow"
                    }
                    ValueButton {
                        label: "Счетчик"
                        description: "Считает кол-во нажатий"
                        value: "0"
                        onClicked: value = parseInt(value) + 1
                    }
                    DatePicker {
                        width: 600
                        height: 600
                        date: new Date(2021, 0, 1, 0, 0, 0)
                        daysVisible: true
                        weeksVisible: true
                        monthYearVisible: true
                        onDateTextChanged: console.log(dateText)
                    }
                }
            }
        }
    }
}
