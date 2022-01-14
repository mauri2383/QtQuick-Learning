import QtQuick 2.0

Item {
    width: side
    height: side

    property int side: 50
    property color color: "red"

    Rectangle
    {
        width: side
        height: side
        color: parent.color
    }

}
