import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    property var dataModel: [
        {color: "black", text: "white"},
        {color: "white", text: "black"},
        {color: "red", text: "blue"}
    ]

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 4")
                onClicked: pageStack.push(Qt.resolvedUrl("PageFour.qml"))
            }
        }

         SilicaListView {
            anchors.fill: parent
            header: PageHeader{title: "JavaScript"}
            model:dataModel
            spacing: 10
            delegate: Rectangle {
                width:parent.width
                height: 100
                color: modelData.text
                Text {
                    anchors.centerIn:parent
                    text: modelData.text
                    color: modelData.color
                }
            }
        }
    }
}
