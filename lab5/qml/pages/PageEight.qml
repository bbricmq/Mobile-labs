import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        ConfigurationGroup { // в отличие от value позволяет получить доступ сразу к нескольким настройкам
            id: settings
            path: "/apps/app_name/settings"
            property string text: ""
            property bool flag: false
        }
        Column {
            PageHeader {title: "Settings"}
            width: parent.width
            height: parent.height
            spacing: 30
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: settings.text + " " + settings.flag
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
                    settings.text = textField.text
                    settings.flag = sw.checked
                }
            }
        }
    }
}
