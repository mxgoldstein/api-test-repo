import QtQuick
import QtQuick.Controls.Material

import Calculator 1.0

syntax error 2

ApplicationWindow {
    id: root
    width: 300
    height: 480
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WA_TranslucentBackground
    title: qsTr("Fancy Pants Calculator")

    color: "transparent"

    TestQuickItem {}

    background: Rectangle {
        SequentialAnimation  on color {
            loops: Animation.Infinite
            PropertyAnimation { to: Qt.rgba(0.9, 0.9, 1, 0.6); duration: 1000 }
            PropertyAnimation { to: Qt.rgba(1, 0.9, 0.9, 0.6); duration: 1000 }
            PropertyAnimation { to: Qt.rgba(0.9, 1, 0.9, 0.6); duration: 1000 }
        }
        border.width: 1
        border.color: "gray"
        radius: 6
    }



    header: WindowBar {}
    Calculator { anchors.fill: parent }
}
