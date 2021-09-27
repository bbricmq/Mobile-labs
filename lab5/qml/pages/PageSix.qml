import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 7")
                onClicked: pageStack.push(Qt.resolvedUrl("PageSeven.qml"))
            }
        }

        ListModel {
            id: dataModel
        }
        Column {

            width: parent.width
            height: parent.height
            spacing: 30

            TextField {
                id: textField
            }
            Button {
                id: addButton
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Добавить"
                onClicked:
                {
                    dataBase.addElement(textField.text)
                    dataBase.selectNotes();
                }
            }
            SilicaListView {
                id: listview
                width: parent.width; height: parent.height - addButton.height - textField.height - 60;
                model:dataModel
                delegate: Label {
                    id: label
                    width:parent.width
                    height: 70
                    text: model.note

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            dataBase.deleteElement(label.text)
                            dataBase.selectNotes();
                        }
                    }
                }
                Component.onCompleted:
                {
                    dataBase.selectNotes();
                }
            }
        }
        Item {
            id: dataBase
            property var db

            Component.onCompleted:
            {
                db = LocalStorage.openDatabaseSync("db", "1.0"); // открытие базы данных
                createTable();
            }

            function createTable() {
                db.transaction(function(tx) {
                   tx.executeSql("CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, note TEXT NOT NULL);")
                });
            }

            function addElement(note) {
                db.transaction(function(tx) {
                   tx.executeSql("INSERT INTO notes(note) VALUES(?);",[note])
                });
            }
            function deleteElement(note) {
                db.transaction(function(tx) {
                   tx.executeSql("DELETE FROM notes WHERE note = ?;", [note])
                });
            }
            function clearTable() {
                db.transaction(function(tx) {
                   tx.executeSql("DELETE FROM notes;")
                });
            }

            function retrieveNotes(callback) {
                db.readTransaction(function(tx) {
                   var result = tx.executeSql("SELECT * FROM notes");
                    callback(result.rows);
                });
            }
            function selectNotes() { // наполнение модели данными
                dataModel.clear();
                dataBase.retrieveNotes(function(notes){
                   for(var i = 0; i < notes.length; i++) { // организуется цикл по массиву notes, где данные каждого объекта в массиве добавляются к DataModel
                        var note = notes.item(i);
                        dataModel.append({id:note.id, note:note.note});
                   }
                });
            }
        }

    }
}
