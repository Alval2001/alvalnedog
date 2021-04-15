import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.12

// ['TextField', 'BusyIndicator', 'Tumbler', 'Slider', 'TextArea', 'Dial']   3

Page {
    id:page1Alex
        header:Rectangle {
           id: header
           height: 100
           color: "#8b00ff"

        Image {
            id: logo
            source: "qrc:/img/logo.png"
            width: 200
            height: 100
        }

        Label {
              color: "#ffffff"
              text: "Lab 1 Элементы GUI"
              anchors.verticalCenter: logo.verticalCenter
              anchors.leftMargin: 200
              anchors.left: parent.left
              font.weight: Font.Medium
              font.pointSize: 20
              font.family: "Helvetica"
            }
        }


        GridLayout{
            anchors.fill: parent
            //anchors.margins: 3
            Rectangle
               {
                   id: background
                   anchors.fill: parent
                   color: "#f5f5f5"
               }


            ProgressBar {
                value: slider.second.value
                indeterminate: true
                Material.foreground: "#778899"
                font.pointSize: 15
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.row: 0
                Layout.column: 0
            }

            TextArea {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                id: text
                Layout.row: 0
                Layout.column: 1
                placeholderText: qsTr ("Город")
                font.family: "Helvetica"
                font.pointSize: 15
                color: "#778899"
            }

            TextField {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.row: 1
                Layout.column: 0
                placeholderText: qsTr("Введите текст")
                font.family: "Helvetica"
                font.pointSize: 15
                color: "#778899"
            }

            Dial {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.row: 1
                Layout.column: 1
            }

            Tumbler {
                Layout.preferredHeight : 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.row: 2
                Layout.column: 0
                TumblerColumn {
                    model: 5
                    width: 25
                }
                TumblerColumn {
                    width: 25
                    model: [0, 1, 2, 3, 4]
                }
                TumblerColumn {
                    width: 25
                    model: ["A", "B", "C", "D", "E"]
                }
            }

            BusyIndicator {
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            // Layout.minimumWidth: true
                             id: control
                             Layout.row: 2
                             Layout.column: 1

                             contentItem: Item {
                                 implicitWidth: 64
                                 implicitHeight: 64

                                 Item {
                                     id: item
                                     x: parent.width / 2 - 32
                                     y: parent.height / 2 - 32
                                     width: 64
                                     height: 64
                                     opacity: control.running ? 1 : 0

                                     Behavior on opacity {
                                         OpacityAnimator {
                                             duration: 250
                                         }
                                     }

                                     RotationAnimator {
                                         target: item
                                         running: control.visible && control.running
                                         from: 0
                                         to: 360
                                         loops: Animation.Infinite
                                         duration: 1250
                                     }

                                     Repeater {
                                         id: repeater
                                         model: 6

                                         Rectangle {
                                             x: item.width / 2 - width / 2
                                             y: item.height / 2 - height / 2
                                             implicitWidth: 10
                                             implicitHeight: 10
                                             radius: 5
                                             color: "#778899"
                                             transform: [
                                                 Translate {
                                                     y: -Math.min(item.width, item.height) * 0.5 + 5
                                                 },
                                                 Rotation {
                                                     angle: index / repeater.count * 360
                                                     origin.x: 5
                                                     origin.y: 5
                                                 }
                                             ]
                                         }
                                     }
                                 }
                             }
                         }

    }

}
