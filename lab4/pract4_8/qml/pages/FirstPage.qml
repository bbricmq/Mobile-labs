import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    ListModel {
        id: listModel
        ListElement{name: "Задача №1"; date: "09.04.2021"}
        ListElement{name: "Задача №1.1"; date: "09.04.2021"}
        ListElement{name: "Задача №2"; date: "10.04.2021"}
        ListElement{name: "Задача №2.1"; date: "10.04.2021"}
        ListElement{name: "Задача №2.2"; date: "10.04.2021"}
        ListElement{name: "Задача №3"; date: "11.04.2021"}
        ListElement{name: "Задача №4"; date: "13.04.2021"}
    }

    SlideshowView {
        anchors.centerIn: parent
        model: listModel
        delegate: Text {
            text: date + ":\n\n" + name
            color: "white"
            font.pixelSize: 72
        }
    }
}
