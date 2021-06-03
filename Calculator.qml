import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

syntax error

Item {
    id: calculator

    property string operation: ""
    property bool isOperationPending: false

    property var values: []

    function digit(n) {
        if (isOperationPending) {
            if (calculateTextArea.text.length > 0) {
                values.push(parseFloat(calculateTextArea.text));
                calculateTextArea.text = "";

                values.push(operation);
            }
        }

        calculateTextArea.text += n;
        isOperationPending = false;
    }

    function clear() {
        values = [];
        calculateTextArea.text = "";
    }

    function setOp(op) {
        operation = op;
        isOperationPending = true;
    }

    function equals() {
        if (calculateTextArea.text.length > 0) {
            values.push(parseFloat(calculateTextArea.text));
        }
        var val = 0;
        for (var i = 0; i < values.length; i++) {
            if (values[i] === "+") {
                val += values[++i]
            } else if (values[i] === "-") {
                val -= values[++i]
            } else {
                val = values[i];
            }
        }

        values = [];

        calculateTextArea.text = val;
        operation = "";
        isOperationPending = true;
    }


    component FillButton : Button {
        Layout.fillWidth: true
        Layout.fillHeight: true
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 10
        columns: 4
        TextArea {
            id: calculateTextArea
            Layout.columnSpan: 4
            Layout.fillWidth: true
            placeholderText: "0"
            placeholderTextColor: color
            readOnly: true
            font.bold: true
        }

        FillButton {
            text: "7"
            onPressed: calculator.digit(7)
        }

        FillButton {
            text: "8"
            onPressed: calculator.digit(8)
        }

        FillButton {
            text: "9"
            onPressed: calculator.digit(9)
        }

        FillButton {
            text: "C"
            onPressed: calculator.clear()
        }

        FillButton {
            text: "4"
            onPressed: calculator.digit(4)
        }
        FillButton {
            text: "5"
            onPressed: calculator.digit(5)
        }
        FillButton {
            text: "6"
            onPressed: calculator.digit(6)
        }

        FillButton {
            text: "+"
            onPressed: calculator.setOp("+")
        }

        FillButton {
            text: "1"
            onPressed: calculator.digit(1)
        }
        FillButton {
            text: "2"
            onPressed: calculator.digit(2)
        }
        FillButton {
            text: "3"
            onPressed: calculator.digit(3)
        }
        FillButton {
            text: "-"
            onPressed: calculator.setOp("-")
        }

        FillButton {
            text: "0"
            onPressed: calculator.digit(0)
        }

        FillButton {
            text: "="
            onPressed: calculator.equals()

            Layout.columnSpan: 3
        }
    }
}
