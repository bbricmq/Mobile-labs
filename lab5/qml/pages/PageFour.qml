import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 5")
                onClicked: pageStack.push(Qt.resolvedUrl("PageFive.qml"))
            }
        }

        XmlListModel {
           id: xmlListModel
           source: "http://www.cbr.ru/scripts/XML_daily.asp"
           query: "/ValCurs/Valute"
           XmlRole { // определение полей модели
               name:"Name"
               query: "Name/string()"
           }
           XmlRole {
               name:"Value"
               query: "Value/string()"
           }
         }

         SilicaListView {
           anchors.fill: parent
           header: PageHeader {title: "Валюты"}
           model: xmlListModel
           spacing: 20
           delegate: Column {
               x:10; width: parent.width - 20
               Label {
                   width: parent.width
                   wrapMode: Text.WordWrap
                   text: Name
               }
               Label {
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: Value
               }
           }
        }
    }
}
