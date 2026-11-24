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

    Connections {
        target: CppSignalSender

        function onCallQml(parameter) {
            console.log("This is QML: callQml signal cought.");
            // body...
        }
        function onCppTimer(value) {
            mRectText.text = value;
        }
    }
    Column {
        Rectangle {
            width: 200
            height: 200
            color: "red"
            radius: 10
            Text {
                id: mRectText
                text: "0"
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 30
            }
        }
        Button {
            text: "Call C++ button"
            onClicked: {
                CppSignalSender.cppSlot();
            }
        }
        Text {
            id: mText
            text: qsTr("Default")
        }
    }
}
