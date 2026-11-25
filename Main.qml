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

    function qmlJSFunction(param) {
        console.log("QML talking, c called with" + param);
        return "THIS is qml, over to you c++";
    }

    Button {
        id: mbutton
        text: "Call qml function from C++"
        onClicked: {
            QmlJsCaller.cppMethod("QML calling...");
        }
    }
}
