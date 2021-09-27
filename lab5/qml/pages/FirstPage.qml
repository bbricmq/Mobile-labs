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

        ListModel { // Model
                    id: dataModel
                    ListElement {color: "black"; text: "white"}
                    ListElement {color: "white"; text: "black"}
                    ListElement {color: "red"; text: "blue"}
         }

         SilicaListView { // View
            spacing: 10
            anchors.fill: parent
            model:dataModel
            delegate: Rectangle {
                width:parent.width
                height: 100
                color: model.text
                Text {
                    anchors.centerIn:parent
                    text: model.text
                    color: model.color
                }
            }
        }
    }
}
