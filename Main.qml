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

    function arrayObjectFunc(arr, obj) {
        console.log("-----Printing array----");
        arr.forEach(function (ele) {
            console.log("Array item :" + ele);
        });

        console.log("------Printing object ---");
        for (let mKey in obj) {
            console.log("Object[" + mKey + "] :" + obj[mKey]);
        }
    }

    // CppClass {
    //     id: cppClassId
    // }

    Button {
        id: button1Id
        text: "call qml fn"
        onClicked: {
            let arr = ['Africa', 'Asia', 'Europe', 'North America', 'Sourth America', 'Oceania', 'Antarctica'];
            let obj = {
                firstName: "John",
                lastName: "Doe",
                location: "Earth"
            };
            CppClass.passFromQmlToCpp(arr, obj);
        }
    }

    Button {
        id: button2Id
        text: "GetVariantListFromCpp"
        anchors.top: button1Id.bottom
        onClicked: {
            let data = CppClass.getVariantListFromCpp();
            data.forEach(function (ele) {
                console.log("Array item : " + ele);
            });
        }
    }
    Button {
        id: button3Id
        text: "GetVariantMapFromCpp"
        anchors.top: button2Id.bottom
        onClicked: {
            let data = CppClass.getVariantMapFromCpp();
            for (let mKey in data) {
                console.log("Object[" + mKey + "] :" + data[mKey]);
            }
        }
    }
    Button {
        id: button4Id
        text: "GetVariantMapFromCpp"
        anchors.top: button3Id.bottom
        onClicked: {
            CppClass.triggerJSCall();
        }
    }
}
