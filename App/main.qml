import QtQuick 2.15
import QtQuick.Window 2.15
import Geometry 1.0

Window {
    width: 420
    height: 200
    visible: true
    title: qsTr("Hello World")


    Row
    {
        spacing: 10
        anchors.centerIn: parent

        Square{
            anchors.verticalCenter: parent.verticalCenter
            side: 70
        }

        Rect{
            anchors.verticalCenter: parent.verticalCenter

        }

        Circle
        {
            anchors.verticalCenter: parent.verticalCenter
            radius: 75
        }
    }
}
