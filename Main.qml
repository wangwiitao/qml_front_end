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

    Row {
        Rectangle {
            id: redRectId
            width: 100
            height: 100
            color: "red"
            MouseArea {
                id: redMouseAreaId
                anchors.fill: parent
            }
        }
        Rectangle {
            id: blueRectId
            width: 100
            height: 100
            color: "blue"

            Connections {
                target: redMouseAreaId

                function onClicked() {
                    console.log("blue click");
                }
            }
        }
        Rectangle {
            id: greenRectId
            width: 100
            height: 100
            color: "green"
            Connections {
                target: redMouseAreaId

                function onClicked() {
                    console.log("green click");
                }
            }
        }
    }
}
