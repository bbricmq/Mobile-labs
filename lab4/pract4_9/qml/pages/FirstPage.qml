import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        PullDownMenu {
            MenuItem {
                id: i1
                text: "Первый сверху"
                onClicked: textField.text = i1.text
            }
            MenuItem {
                id: i2
                text: "Второй сверху"
                onClicked: textField.text = i2.text
            }
            MenuItem {
                id: i3
                text: "Третий сверху"
                onClicked: textField.text = i3.text
            }
        }
        PushUpMenu  {
            MenuItem {
                id: j1
                text: "Первый снизу"
                onClicked: textField.text = j1.text
            }
            MenuItem {
                id: j2
                text: "Второй снизу"
                onClicked: textField.text = j2.text
            }
            MenuItem {
                id: j3
                text: "Третий снизу"
                onClicked: textField.text = j3.text
            }
        }

        anchors.fill: parent
        header: PageHeader {title: "Pract4_9"}
        TextField {
            x: 220
            y: 500
            width: 800
            id: textField
            readOnly: true
            text: ""
        }
    }
}
