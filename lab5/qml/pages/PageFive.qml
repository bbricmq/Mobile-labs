import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 6")
                onClicked: pageStack.push(Qt.resolvedUrl("PageSix.qml"))
            }
        }

         XmlListModel {
            id: xmlListModel
            query: "/ValCurs/Valute"
            XmlRole { // определение полей модели
                name: "Name"
                query: "Name/string()"
            }
            XmlRole {
                name: "Value"
                query: "Value/string()"
            }
          }

          SilicaListView {
            anchors.fill: parent
            header: PageHeader {title: "XMLHttpRequest"}
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
        Component.onCompleted: update()
        function update() {
            var xhr = new XMLHttpRequest(); // создание экземпляра объекта
            xhr.open('GET', "http://www.cbr.ru/scripts/XML_daily.asp", true) // ининцилизация объекта(метод, url, async(происходит ли работа в ассинхронном режиме или нет))
            xhr.onreadystatechange = function() { // обработчик изменения состояния
                if(xhr.readyState === XMLHttpRequest.DONE){ // (xhr.ReadyState === 4) т.е данные успещно загружены
                    xmlListModel.xml = xhr.responseText; // текст ответа на запрос
                }
            }
            xhr.send(); // отправление запроса на сервер
        }
    }
}
