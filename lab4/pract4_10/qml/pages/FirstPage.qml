import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaListView {
        anchors.fill: parent
        model: 5
        delegate: ListItem {
            id: delegate
            Label {
                x: Theme.paddingLarge
                text: "Элемент списка №" + index
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            menu: ContextMenu {
                MenuLabel{text: "Context Menu"}
                MenuItem {
                    text: "1-ый"
                    onClicked: console.log(text + " " + index)
                }
                MenuItem {
                    text: "2-ой"
                    onClicked: console.log(text + " " + index)
                }
                MenuItem {
                     text: "3-ий"
                     onClicked: console.log(text + " " + index)
                }
            }
        }
    }
}
