import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 8")
                onClicked: pageStack.push(Qt.resolvedUrl("PageEight.qml"))
            }
        }
        ConfigurationValue {
            id: setting
            key: "/apps/app_name/setting"
        }
        ConfigurationValue {
            id: setting2
            key: "/apps/app_name/setting2"
        }
        Column {
            PageHeader {title: "Settings"}
            width: parent.width
            height: parent.height
            spacing: 30
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: setting.value + " " + setting2.value
            }
            TextField {
                id: textField
            }
            Switch {
                id: sw
            }
            Button {
                id: addButton
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Сохранить"
                onClicked:
                {
                    setting.value = textField.text
                    setting2.value = sw.checked
                }
            }
        }
    }
}
