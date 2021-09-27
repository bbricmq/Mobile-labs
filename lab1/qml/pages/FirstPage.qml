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
                onClicked: pageStack.animatorPush(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge // определяет расстояние между каждым объектом внутри colomn
            PageHeader {
                title: qsTr("pract1")
            }
            Label {
                id: label
                anchors.horizontalCenter: parent.horizontalCenter
                property int count: 0
                text: count
            }
            Button {
                 id: button
                 text: "Add"
                 anchors.horizontalCenter: parent.horizontalCenter
                 width: 400
                 onClicked: label.count++;

           }
        }
    }
}
