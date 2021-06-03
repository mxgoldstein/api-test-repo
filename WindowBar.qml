import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import QtTest

ToolBar {
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton

            property int mouseDragX: -1
            property int mouseDragY: -1

            onPressed: {
                mouseDragX = mouseArea.mouseX
                mouseDragY = mouseArea.mouseY
            }

            onReleased: {
                mouseArea.mouseDragX = mouseArea.mouseDragY = -1
            }

            onMouseXChanged: {
                if (pressed && mouseDragX !== -1) {
                    var newX = root.x + mouseArea.mouseX - mouseDragX;
                    root.x = newX;
                }
            }
            onMouseYChanged: {
                if (pressed && mouseDragY !== -1) {
                    var newY = root.y + mouseArea.mouseY - mouseDragY;
                    if (newY > 0)
                        root.y = newY;
                }
            }
        }

        Label {
            anchors.centerIn: parent
            text: root.title
            font.bold: true
        }

        RowLayout {
            anchors.right: parent.right
            ToolButton {
                text: "X"
                onClicked: Qt.exit(0)
            }
        }
    }
