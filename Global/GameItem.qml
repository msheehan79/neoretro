import QtQuick 2.8
import QtGraphicalEffects 1.12

Item {
    id: cpnt_gameList_game

    Item {
        anchors.fill: parent

        Image {
            id: img_game_screenshot
            source: model.assets.screenshot || model.assets.background
            anchors.fill: parent
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
        }

        // Favourite tag
        Item {
            id: favetag
            anchors {
                fill: parent
            }
            opacity: model.favorite && root.state === "games" ? 1 : 0
            Behavior on opacity {
                NumberAnimation { duration: 100 }
            }

            Image {
                id: favebg
                anchors {
                    top: parent.top
                    topMargin: vpx(0)
                    right: parent.right
                    rightMargin: vpx(0)
                }
                source: "../assets/favebg.svg"
                width: vpx(32)
                height: vpx(32)
                sourceSize {
                    width: vpx(32)
                    height: vpx(32)
                }
                visible: false
            }

            ColorOverlay {
                anchors.fill: favebg
                source: favebg
                color: "#ED3496"
                z: 10
            }

            Image {
                id: star
                anchors {
                    top: parent.top
                    topMargin: vpx(3)
                    right: parent.right
                    rightMargin: vpx(3)
                }
                source: "../assets/star.svg"
                width: vpx(13)
                height: vpx(13)
                sourceSize {
                    width: vpx(32)
                    height: vpx(32)
                }
                smooth: true
                z: 11
            }

            z: 12
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: favetag.width
                    height: favetag.height

                    Rectangle {
                        anchors.centerIn: parent
                        width: favetag.width
                        height: favetag.height
                    }
                }
            }
        }

        // Completed Game Ribbon
        Item {
            visible: (model.extra.completed !== undefined) && (model.extra.completed.toString() === 'True') && (root.state === "games") ? true : false
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            width: parent.width
            height: parent.height / 5

            Image {
                id: completedbg
                anchors {
                    centerIn: parent
                }
                source: "../assets/ribbon.svg"
                fillMode: Image.PreserveAspectFit
                height: vpx(18)
            }

            Text {
                anchors {
                    centerIn: completedbg
                    verticalCenterOffset: vpx(-3)
                }
                text: "COMPLETED"
                font {
                    family: montserratMedium.name
                    weight: Font.Bold
                    pixelSize: vpx(10)
                }
                color: "white"
                z: 15
            }

            ColorOverlay {
                anchors.fill: completedbg
                source: completedbg
                cached: true
                color: "#ff6400"
                z: 10
            }
        }

        Image {
            id: img_game_logo
            source: model.assets.logo
            anchors {
                fill: parent
                margins: parent.width * 0.15
            }
            asynchronous: true
            fillMode: Image.PreserveAspectFit
        }

        Text {
            anchors.fill: parent
            text: model.title
            font {
                family: global.fonts.sans
                weight: Font.Medium
                pixelSize: vpx(16)
            }
            color: "white"

            horizontalAlignment : Text.AlignHCenter
            verticalAlignment : Text.AlignVCenter
            wrapMode: Text.Wrap

            visible: model.assets.logo === ""
        }

        Rectangle {
            anchors.fill: parent
            color: "black"
            opacity: doubleFocus ? 0.8 : 0
            Behavior on opacity {
                NumberAnimation { duration: 200; }
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border {
                width: vpx(5)
                color: "#00991E"
            }
            visible: doubleFocus
        }

        Rectangle {
            width: parent.height * 0.2
            height: width
            anchors.centerIn: parent
            radius: width

            color: "#00991E"
            Text {
                anchors.centerIn: parent
                text: "A"
                font {
                    family: global.fonts.sans
                    weight: Font.Bold
                    pixelSize: parent.height * 0.75
                }
                color: "white"
            }
            visible: doubleFocus
        }
    }

}