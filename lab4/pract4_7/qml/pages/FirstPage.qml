import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaWebView {
        id: webView
        anchors {
            top: parent.top
            bottom: urlField.top
            left: parent.left
            right: parent.right
        }
        url: "https://portal.unn.ru/"
    }
    TextField { // для ввода web адресса
        id: urlField
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        text: "https://portal.unn.ru/"
        label: webView.title
        EnterKey.onClicked: webView.url = text
    }
}
