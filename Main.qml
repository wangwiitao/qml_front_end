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

    Rectangle {
        id: mRect1
        width: mText1.implicitWidth + 20
        height: mText1.implicitHeight + 20

        color: "beige"
        border.color: "yellowgreen"
        Text {
            id: mText1
            anchors.centerIn: parent
            text: lastname
            font.pointSize: 20
        }
    }
    Rectangle {
        id: mRect2
        anchors.left: mRect1.right
        anchors.leftMargin: 5
        width: mText2.implicitWidth + 20
        height: mText2.implicitHeight + 20

        color: "beige"
        border.color: "yellowgreen"
        Text {
            id: mText2
            anchors.centerIn: parent
            text: firstname
            font.pointSize: 20
        }
    }
}
