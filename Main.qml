import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("Hello World")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    Column {
        spacing: 20

        Text {
            id: titleId
            width: 500
            text: Movie === null ? "" : Movie.title
            // text:Movie.title
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: mainCharId
            width: 500
            text: Movie === null ? "" : Movie.mainCharacter
            // text:Movie.maincharacter
            font.pointSize: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: titleTextFieldId
                width: 300
            }
            Button {
                id: button1
                width: 200
                text: "change title"
                onClicked: {
                    Movie.title = titleTextFieldId.text;
                }
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            TextField {
                id: mainCharTextFieldId
                width: 300
            }
            Button {
                id: button2
                width: 200
                text: "change main character"
                onClicked: {
                    Movie.mainCharacter = mainCharTextFieldId.text;
                }
            }
        }
    }
}
