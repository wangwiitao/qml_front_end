import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import context

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

    CppClass {
        id: cppClassId

        onSendInt: function (param) {
            console.log("Received int: " + param + ",type is : " + typeof param);
        }

        onSendDouble: function (doubleParam) {
            console.log("Received double: " + doubleParam + ",type is : " + typeof doubleParam);
        }

        onSendBoolRealFloat: (boolparam, realparam, floatparam) => {
            console.log("Received bool :" + boolparam + typeof boolparam);
            console.log("Received real :" + realparam + typeof realparam);
            console.log("Received float :" + floatparam + typeof floatparam);
        }
    }
    Button {
        id: buttonId
        text: "Click me"
        onClicked: {
            cppClassId.cppSlot();
        }
    }
}
