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
                title: qsTr("Pract4_4")
            }
            Button {
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Дата"
                onClicked: {
                    var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog", {date: new Date()}) // чтобы открыть диалог, его необходимо поместить на стек
                    dialog.accepted.connect(function() {
                        textField.text = dialog.dateText
                    })
                }
            }
            TextField {
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                id: textField
                readOnly: true
                text: ""
            }
        }
    }
}
