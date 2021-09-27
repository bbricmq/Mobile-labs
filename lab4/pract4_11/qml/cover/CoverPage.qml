import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: coverLable
        property int count: 0
        text: count
        anchors.centerIn: parent
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-new"
            onTriggered: coverLable.count += 1
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-cancel"
            onTriggered: coverLable.count = 0
        }
    }
}
