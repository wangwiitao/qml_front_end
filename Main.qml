import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

// import context

ApplicationWindow {
    id: root
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

    Counter {
        id: counterId
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Rectangle {
            width: 200
            height: 200
            radius: 10
            color: (counterId.count >= 0) ? "green" : "red"

            Text {
                id: mText
                text: counterId.count
                anchors.centerIn: parent
                font.pointSize: 40
                color: "white"
            }
        }
        Button {
            id: button1Id
            width: 200
            text: "start"
            onClicked: {
                counterId.start();
            }
        }
        Button {
            id: button2Id
            // anchors.top: button1Id.bottom
            width: 200
            text: "stop"
            onClicked: {
                counterId.stop();
            }
        }
        Button {
            id: button3Id
            // anchors.top: button2Id.bottom
            width: 200
            text: "up"
            onClicked: {
                counterId.up = true;
            }
        }
        Button {
            id: button4Id
            // anchors.top: button3Id.bottom
            width: 200
            text: "down"
            onClicked: {
                counterId.up = false;
            }
        }
    }
}
