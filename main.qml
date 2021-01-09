import Qt.labs.platform 1.1
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.10


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Image Viewer")
    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit // the image is scaled uniformly to fit without cropping


    }
    background: Rectangle{
        anchors.fill: parent
        color: qsTr("#b78177")
    }

    menuBar: MenuBar{
        Menu{
            title: qsTr("&File")

            MenuItem{
                text: qsTr("&Open")
                onTriggered: openFileDialog.open()
            }
        }

        Menu{
            title: qsTr("&Help")

            MenuItem{
                text:qsTr("&About")
                onTriggered: aboutDialog.open()

            }
        }
    }
    FileDialog{
        id:openFileDialog
        title: qsTr("Select an image file")
        folder: StandardPaths.writableLocation(StandardPaths.PicturesLocation)
        nameFilters: [
            "Image files (*.jpg *.png *.jpeg)",
        ]
        onAccepted: {
            image.source = openFileDialog.file
        }

    }
    Dialog{
        id:aboutDialog
        anchors.centerIn: parent
        title: qsTr("About")
        standardButtons: Dialog.Ok
        Label{
            id:dialogLabel
            anchors.centerIn: parent
            text: qsTr("Develop by DuyNT")
        }
    }
}
