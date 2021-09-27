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
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }
        }

        ListModel {
            id: listModel
            property int count: 1
        }

        Button {
            y: 50
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Добавить"
            onClicked:
            {
                listModel.append({text: "Элемент " + listModel.count})
                listModel.count++
            }
        }

        SilicaListView {
            y: 60 + addButton.height
            spacing: 10
            width: parent.width
            height: parent.height - addButton.height
            header: PageHeader {title: "Список"}
            model: listModel
            delegate: Rectangle {
                width: parent.width
                height: 70
                color: "skyblue"
                Text {
                    anchors.centerIn: parent
                    text: model.text
                    }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listModel.remove(index, 1);
                    }
                }
            }
        }
    }
}
