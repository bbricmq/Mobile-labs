import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    ListModel {
        id: listModel
        ListElement{name: "Задача №1"; date: "09.04.2021"}
        ListElement{name: "Задача №2"; date: "10.04.2021"}
        ListElement{name: "Задача №3"; date: "11.04.2021"}
        ListElement{name: "Задача №4"; date: "13.04.2021"}
    }

    SilicaListView {
        anchors.fill: parent
        model: listModel // отображает модель listModel
        header: PageHeader {title: "Задачи"}
        section { // определение секций внутри списка
            property: 'date'
            delegate: SectionHeader {text: section}
        }
        delegate: Text {
            text: name
            color: "light blue"
        }
    }
}
