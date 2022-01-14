import QtQuick 2.4
import Geometry 1.0

Item {
    width: 400
    height: 400

    Row {
        id: row
        anchors.fill: parent

        Circle {}
        Square {}
        Rect {}
    }
}
