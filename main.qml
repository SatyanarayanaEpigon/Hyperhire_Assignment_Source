import QtQuick 2.15
import QtQuick.Window 2.11
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Universal 2.2
import Qt.labs.settings 1.0

import QtQuick.Window 2.3
import QtQuick.Particles 2.0
import Qt.labs.platform 1.0


ApplicationWindow
{
    id: mainWindow
    width: 1240
    height: 895
    title: "MainWindow"
    flags: Qt.Window | Qt.WindowMaximized
    modality: Qt.ApplicationModal
    visible: true
    property var currentDate: new Date()

    property int number: 0

    function getCurrentTime()
    {
        var date = new Date();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = (hours >= 12) ? "PM" : "AM";

        // Convert to 12-hour format
        hours = hours % 12;
        hours = (hours === 0) ? 12 : hours;

        // Pad minutes with leading zero if necessary
        minutes = (minutes < 10) ? "0" + minutes : minutes;

        return hours + ":" + minutes + " " + ampm;
    }
    ColumnLayout
    {
        spacing: 0
        anchors.fill: parent

        Rectangle
        {
            width: mainWindow.width
            height: 40
            color: "#301134"
            Layout.fillWidth: true
            RowLayout
            {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter:  parent.verticalCenter
                Rectangle
                {
                    width:10
                    height: 30
                    color: "#301134"
                }
                Rectangle
                {
                    width: 12
                    height: 12
                    radius: 5
                    color: "#ED6A5E"
                }
                Rectangle
                {
                    width: 12
                    height: 12
                    radius: 5
                    color: "#F4BD4F"
                }
                Rectangle
                {
                    width: 12
                    height: 12
                    radius: 5
                    color: "#61C354"
                }
                Label
                {
                    width:250
                    Layout.fillWidth: true

                }
                ToolButton
                {
                    width: 25
                    height: 25
                    Image
                    {
                        source: "qrc:/images/left.png" // Replace with the path to your transparent image
                        sourceSize.width: 25
                        sourceSize.height: 25
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter:  parent.verticalCenter

                    }
                }
                ToolButton
                {
                    width: 25
                    height: 25
                    Image
                    {
                        source: "qrc:/images/Right.png" // Replace with the path to your transparent image
                        sourceSize.width: 25
                        sourceSize.height: 25
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter:  parent.verticalCenter

                    }
                }
                ToolButton
                {
                    width: 25
                    height: 25
                    Image
                    {
                        source:"qrc:/images/Clock.png" // Replace with the path to your transparent image
                        sourceSize.width: 25
                        sourceSize.height: 25
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter:  parent.verticalCenter

                    }
                }
                Rectangle
                {
                    width: 350
                    height: 20
                    radius: 3
                    color: "#FF301134"
                    border.width: 1
                    border.color: "grey"
                    Layout.fillWidth: true
                    RowLayout
                    {
                        spacing: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter:  parent.horizontalCenter

                        Rectangle
                        {
                            width: 12
                            height: 12
                            color: "#FF301134"
                            Image
                            {

                                width: 12
                                height: 12
                                source: "qrc:/images/search.png"
                            }


                        }
                        Label
                        {
                            text:"Search DesignersKR"
                            color: "white" // Set the desired text color
                            font.pixelSize: 15
                        }
                    }

                }
                ToolButton
                {
                    width: 25
                    height: 25
                    Image
                    {
                        source:"qrc:/images/question.png" // Replace with the path to your transparent image
                        sourceSize.width: 25
                        sourceSize.height: 25
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter:  parent.verticalCenter

                    }
                }
                Label
                {
                    width:125
                    Layout.fillWidth: true
                }
                Image
                {
                    source:"qrc:/images/profile.png" // Replace with the path to your transparent image
                    sourceSize.width: 70
                    sourceSize.height: 20
                    fillMode: Image.PreserveAspectFit
                }


            }
        }
        Rectangle
        {
            width: mainWindow.width
            height:2
            color: "grey"
            Layout.fillWidth: true
        }
        RowLayout
        {
            spacing: 0

            Rectangle
            {
                width: 320
                height: mainWindow.height
                color: "#3F0F3F"
                Layout.fillWidth: true
                Layout.fillHeight: true
                RowLayout
                {
                    spacing: 0
                    Rectangle
                    {
                        width: 50
                        height:mainWindow.height
                        color: "#3F0F3F"
                        anchors
                        {
                            top: parent.top
                            topMargin: 20
                        }
                        ListModel
                        {
                            id: buttonModel

                            ListElement { displayText: "A" }
                            ListElement { displayText: "B" }
                            ListElement { displayText: "C" }
                            ListElement { displayText: "+" }

                        }
                        ListView
                        {
                            id: buttonList
                            width: parent.width
                            height: parent.height
                            model: buttonModel
                            spacing: 5
                            Layout.fillHeight: true
                            delegate: Button
                            {
                                id:butn
                                width: 40
                                height: 40
                                text: model.displayText
                                anchors.horizontalCenter: parent.horizontalCenter

                                // Define the background color and border
                                background: Rectangle
                                {
                                    color: "#616061"
                                    border.color: "white"
                                    border.width: 2
                                    radius: 12
                                }

                                // Define the text color and font
                                contentItem: Text
                                {
                                    text: model.displayText
                                    font.family: "Arial"
                                    font.pixelSize: 15
                                    font.weight: Font.Bold

                                    color: "white"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    //elide: Text.ElideRight
                                }
                                onClicked:
                                {
                                    if(butn.text === "+" && number < 10)
                                    {
                                        // Add a new button

                                        var newButtonText2 = "D " + (++number)
                                        buttonModel.append({ displayText: newButtonText2 })


                                        // Move the clicked button down
                                        console.log(number,index,buttonModel.count)
                                        buttonModel.move(index, buttonModel.count - 1,1)
                                    }

                                }
                            }
                        }

                    }
                    Rectangle
                    {
                        width: 2
                        height:mainWindow.height
                        color: "grey"
                        Layout.fillHeight:  true
                    }
                    Rectangle
                    {
                        width: 270
                        height:mainWindow.height
                        color: "grey"
                        Layout.fillHeight:  true
                        ColumnLayout
                        {
                            spacing: 0
                            Rectangle
                            {
                                width: 270
                                height:70
                                color: "#3F0F3F"
                                Layout.fillWidth:   true
                                RowLayout
                                {
                                    spacing: 20
                                    Rectangle
                                    {
                                        color: "#3F0F3F"
                                        width:175
                                        height: 70
                                        ComboBox
                                        {
                                            width:175
                                            height: 70
                                            model: ["Test", "Test 1", "Test 2"]

                                        }


                                    }
                                    Rectangle
                                    {
                                        color: "#3F0F3F"
                                        width:50
                                        height: 50
                                        ToolButton
                                        {
                                            width:50
                                            height: 50
                                            Image
                                            {
                                                source: "qrc:/images/Edit.png" // Replace with the path to your transparent image
                                                sourceSize.width: 40
                                                sourceSize.height: 40
                                                fillMode: Image.PreserveAspectFit
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                anchors.verticalCenter:  parent.verticalCenter
                                            }
                                        }

                                    }
                                }
                            }
                            Rectangle
                            {
                                width: 270
                                height:2
                                color: "grey"
                                Layout.fillWidth:   true
                            }
                            Rectangle
                            {
                                width: 270
                                height:mainWindow.height
                                color: "#3F0F3F"
                                Layout.fillWidth:   true
                                Layout.fillHeight:    true

                                ColumnLayout
                                {
                                    spacing: 0
                                    ListView
                                    {

                                        id:listView
                                        width: 270
                                        height: 100
                                        model: ListModel
                                        {
                                            ListElement { text: "Mentions & reactions"; iconSource: "qrc:/images/Symbol.png" }
                                            ListElement { text: "Saved items"; iconSource: "qrc:/images/SaveItems.png" }
                                            ListElement { text: "More"; iconSource: "qrc:/images/Dots.png" }

                                        }
                                        delegate: Item
                                        {
                                            width: parent.width
                                            height: 30
                                            Rectangle
                                            {
                                                width: parent.width
                                                height: parent.height
                                                color:"#3F0F3F"
                                                anchors
                                                {
                                                    top: parent.top
                                                    left: parent.left

                                                    topMargin: 1
                                                    leftMargin:20
                                                }

                                                GridLayout
                                                {
                                                    anchors.fill: parent
                                                    columns: 2

                                                    //spacing: 5
                                                    //anchors.verticalCenter: parent.verticalCenter
                                                    //anchors.horizontalCenter: parent.horizontalCenter
                                                    Image
                                                    {
                                                        source: model.iconSource
                                                        width: 30
                                                        height: 30
                                                        fillMode: Image.PreserveAspectFit
                                                        verticalAlignment:Image.AlignVCenter
                                                        horizontalAlignment:Image.AlignHCenter

                                                    }

                                                    Text
                                                    {
                                                        text: model.text
                                                        color: "white"
                                                        verticalAlignment: Text.AlignVCenter
                                                        horizontalAlignment: Text.AlignVCenter

                                                        font.family: "Arial"
                                                        font.pixelSize: 15
                                                        font.weight: Font.Bold
                                                    }
                                                }

                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        listView.currentIndex = index
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 15
                                        color:"#3F0F3F"
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 15
                                        color:"#3F0F3F"
                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:20
                                        }
                                        Row
                                        {
                                            spacing: 5

                                            Image
                                            {
                                                source: "qrc:/images/dropdown.png"
                                                width: 10
                                                height: 10
                                                fillMode: Image.PreserveAspectFit
                                                anchors.verticalCenter:  parent.verticalCenter

                                            }

                                            Text
                                            {
                                                text: " Channels"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 15
                                        color:"#3F0F3F"
                                    }

                                    ListView
                                    {
                                        id:listView2
                                        width: 270
                                        height: 210
                                        model: ListModel
                                        {
                                            ListElement { text: "#  Channel-1"; }
                                            ListElement { text: "#  Channel-2"; }
                                            ListElement { text: "#  Channel-3"; }
                                            ListElement { text: "#  Channel-4"; }
                                            ListElement { text: "#  Channel-5"; }
                                            ListElement { text: "#  Channel-6"; }
                                            ListElement { text: "#  Channel-7"; }

                                        }
                                        delegate: Item
                                        {
                                            width: 270
                                            height: 30
                                            Rectangle
                                            {
                                                width: 270
                                                height: 210
                                                color:"#3F0F3F"
                                                anchors
                                                {
                                                    top: parent.top
                                                    left: parent.left

                                                    topMargin: 1
                                                    leftMargin:30
                                                }
                                                Row
                                                {
                                                    spacing: 5
                                                    Text
                                                    {
                                                        text: model.text
                                                        color: "white"
                                                        verticalAlignment: Text.AlignVCenter
                                                        horizontalAlignment: Text.AlignVCenter

                                                        font.family: "Arial"
                                                        font.pixelSize: 15
                                                        font.weight: Font.Bold
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 10
                                        color:"#3F0F3F"
                                    }

                                    Rectangle
                                    {
                                        width: 270
                                        height: 30
                                        color:"#3F0F3F"
                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:25
                                        }

                                        Row
                                        {
                                            spacing: 5
                                            anchors.verticalCenter: parent.Center
                                            Button
                                            {
                                                id: control
                                                text: qsTr("+")
                                                //opacity: 0.10000000149011612
                                                width: 20
                                                height: 20

                                                contentItem: Text
                                                {
                                                    text: control.text
                                                    font.family: "Arial"
                                                    font.pixelSize: 20
                                                    font.weight: Font.Bold
                                                    color: "white"
                                                    horizontalAlignment: Text.AlignHCenter
                                                    verticalAlignment: Text.AlignVCenter
                                                    //elide: Text.ElideRight
                                                }
                                            }

                                            Text
                                            {
                                                text: "Add Channels"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 10
                                        color:"#3F0F3F"
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 25
                                        color:"#3F0F3F"
                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:25
                                        }
                                        Row
                                        {
                                            spacing: 5

                                            Image
                                            {
                                                source: "qrc:/images/dropdown.png"
                                                width: 10
                                                height: 10
                                                fillMode: Image.PreserveAspectFit
                                                anchors.verticalCenter:  parent.verticalCenter

                                            }

                                            Text
                                            {
                                                text: " Direct messages"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 5
                                        color:"#3F0F3F"
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 30
                                        color:"#3F0F3F"
                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:30
                                        }
                                        Row
                                        {
                                            spacing: 5

                                            Image
                                            {
                                                source: "qrc:/images/Avatar.png"
                                                width: 20
                                                height: 20
                                                fillMode: Image.PreserveAspectFit
                                                anchors.verticalCenter:  parent.verticalCenter

                                            }

                                            Text
                                            {
                                                text: "HHH"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                            Text
                                            {
                                                text: " you"
                                                color:  "white"
                                                opacity: 0.44999998807907104
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 12
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 30
                                        color:"#3F0F3F"
                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:30
                                        }
                                        Row
                                        {
                                            spacing: 5

                                            Image
                                            {
                                                source: "qrc:/images/MAvatar4.png"
                                                width: 20
                                                height: 20
                                                fillMode: Image.PreserveAspectFit
                                                anchors.verticalCenter:  parent.verticalCenter

                                            }

                                            Text
                                            {
                                                text: "Heal"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 30
                                        color:"#3F0F3F"

                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:30
                                        }
                                        Row
                                        {
                                            spacing: 5
                                            Image
                                            {
                                                source: "qrc:/images/MAvatar4.png"
                                                width: 20
                                                height: 20
                                                fillMode: Image.PreserveAspectFit
                                                anchors.verticalCenter:  parent.verticalCenter

                                            }

                                            Text
                                            {
                                                text: "Kamran"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 270
                                        height: 30
                                        color:"#3F0F3F"
                                        anchors
                                        {
                                            //top: parent.top
                                            left: parent.left

                                            topMargin: 5
                                            leftMargin:25
                                        }
                                        Row
                                        {
                                            spacing: 5

                                            Button
                                            {
                                                id: control2
                                                text: qsTr("+")
                                                //opacity: 0.10000000149011612
                                                width: 20
                                                height: 20

                                                contentItem: Text
                                                {
                                                    text: control2.text
                                                    font.family: "Arial"
                                                    font.pixelSize: 20
                                                    font.weight: Font.Bold
                                                    color: "white"
                                                    horizontalAlignment: Text.AlignHCenter
                                                    verticalAlignment: Text.AlignVCenter
                                                    //elide: Text.ElideRight
                                                }
                                            }

                                            Text
                                            {
                                                text: "Add Teammates"
                                                color:  "white"
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold

                                            }
                                        }
                                    }
                                }

                            }
                        }
                    }
                }

            }
            Rectangle
            {
                id:viewrec
                width: (mainWindow.width - 320)
                height: mainWindow.height
                color: "white"
                Layout.fillWidth: true
                Layout.fillHeight: true
                ColumnLayout
                {
                    spacing: 0
                    Rectangle
                    {
                        width: viewrec.width
                        height: 70
                        color: "white"
                        Layout.fillWidth: true
                        ColumnLayout
                        {
                            spacing: 0
                            Rectangle
                            {
                                width: viewrec.width
                                height: 10
                                color: "white"
                                Layout.fillWidth: true
                            }
                            Rectangle
                            {
                                width: viewrec.width
                                height: 25
                                color: "white"
                                Layout.fillWidth: true
                                RowLayout
                                {
                                    spacing:10
                                    Rectangle
                                    {
                                        width: 10
                                        height: 25
                                    }
                                    Label
                                    {
                                        width:100
                                        height: 20
                                        text:"# channel-6"
                                        font.family: "Arial"
                                        font.pixelSize: 15
                                        font.weight: Font.Bold
                                        color: "black"
                                    }
                                    Rectangle
                                    {
                                        width: 20
                                        height: 20
                                        Image
                                        {
                                            source: "qrc:/images/Star.png" // Replace with the path to your icon
                                            width: 20
                                            height: 20
                                            fillMode: Image.PreserveAspectFit
                                        }
                                    }
                                    Label
                                    {
                                        width:550
                                        height: 20
                                    }
                                    RowLayout
                                    {
                                        spacing: -5
                                        Rectangle
                                        {
                                            width: 20
                                            height: 20
                                            Image
                                            {
                                                source: "qrc:/images/Avatar7.png" // Replace with the path to your icon
                                                width: 20
                                                height: 20
                                                fillMode: Image.PreserveAspectFit
                                            }

                                        }
                                        Rectangle
                                        {
                                            width: 20
                                            height: 20
                                            Image
                                            {
                                                source: "qrc:/images/MAvatar.png" // Replace with the path to your icon
                                                width: 20
                                                height: 20
                                                fillMode: Image.PreserveAspectFit
                                            }

                                        }
                                        Rectangle
                                        {
                                            width: 20
                                            height: 20
                                            Image
                                            {
                                                source: "qrc:/images/MAvatar2.png" // Replace with the path to your icon
                                                width: 20
                                                height: 20
                                                fillMode: Image.PreserveAspectFit
                                            }

                                        }
                                    }
                                    Label
                                    {
                                        width: 50
                                        height: 20
                                        text:"493"
                                        font.family: "Arial"
                                        font.pixelSize: 15
                                        font.weight: Font.Bold
                                        color: "black"
                                    }

                                    Rectangle
                                    {
                                        width: 20
                                        height: 20
                                        Image
                                        {
                                            source: "qrc:/images/AddPerson.png" // Replace with the path to your icon
                                            width: 20
                                            height: 20
                                            fillMode: Image.PreserveAspectFit
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 20
                                        height: 20
                                        Image
                                        {
                                            source: "qrc:/images/Group.png" // Replace with the path to your icon
                                            width: 20
                                            height: 20
                                            fillMode: Image.PreserveAspectFit
                                        }
                                    }
                                }
                                Rectangle
                                {
                                    width: 20
                                    height: 25
                                }
                            }
                            Rectangle
                            {
                                width: viewrec.width
                                height: 25
                                color: "white"
                                Layout.fillWidth: true
                                RowLayout
                                {
                                    spacing:10
                                    Rectangle
                                    {
                                        width: 10
                                        height: 25
                                    }
                                    Rectangle
                                    {
                                        width: 20
                                        height: 20
                                        Image
                                        {
                                            source: "qrc:/images/Pin.png" // Replace with the path to your icon
                                            width: 20
                                            height: 20
                                            fillMode: Image.PreserveAspectFit
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 2
                                        height: 25
                                        color:"grey"
                                    }
                                    Label
                                    {
                                        width:100
                                        height: 20
                                        text:"📱 Channel for number 6"
                                        font.family: "Arial"
                                        font.pixelSize: 15
                                        //font.weight: Font.Bold
                                        color: "black"
                                    }
                                }
                            }
                            Rectangle
                            {
                                width: viewrec.width
                                height: 10
                                color: "white"
                                Layout.fillWidth: true
                            }
                        }
                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 2
                        color: "grey"
                        Layout.fillWidth: true

                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 65
                        Layout.fillWidth: true

                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 30
                        Layout.fillWidth: true

                        RowLayout
                        {
                            spacing: 0
                            anchors.fill:parent

                            Rectangle
                            {
                                width: 275
                                height: 2
                                color: "grey"
                                Layout.fillWidth: true

                            }
                            Rectangle
                            {
                                width: 125
                                height:30
                                color: "white"
                                radius: 10 // Adjust the radius to control the roundness of the corners
                                border.color: "grey"
                                border.width: 2
                                Layout.fillWidth: true

                                Text
                                {
                                    font.family: "Arial"
                                    font.pixelSize: 12
                                    font.weight: Font.Bold

                                    color: "black"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    text:
                                    {
                                        var months = [
                                                    "January", "February", "March", "April", "May", "June",
                                                    "July", "August", "September", "October", "November", "December"
                                                ];

                                        var date = new Date();
                                        var day = date.getDay(); // Returns the day of the week as a number (0-6)
                                        var month = date.getMonth(); // Returns the month as a number (0-11)
                                        var dayOfMonth = date.getDate(); // Returns the day of the month (1-31)

                                        var dayString = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][day];
                                        var monthString = months[month];

                                        return dayString + ", " + monthString + " " + dayOfMonth;
                                    }
                                }
                            }
                            Rectangle
                            {
                                width: 275
                                height: 2
                                color: "grey"
                                Layout.fillWidth: true

                            }
                            //                            Label
                            //                            {
                            //                                text:"New"
                            //                                font.pixelSize: 20
                            //                                width: 75
                            //                                color: "#CE375C" // Set the text color to red
                            //                            }
                        }
                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 120
                        RowLayout
                        {
                            spacing: 0
                            anchors.fill: parent
                            Rectangle

                            {
                                width: 5
                                height: 120

                            }
                            Rectangle
                            {
                                width: 50
                                height: 120
                                ColumnLayout
                                {
                                    spacing: 0
                                    Rectangle
                                    {
                                        width:40
                                        height: 40
                                        Image
                                        {
                                            source: "qrc:/images/Favatar.png" // Replace with the path to your icon
                                            width: 40
                                            height: 40
                                            fillMode: Image.PreserveAspectFit
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }

                                    }
                                    Rectangle
                                    {
                                        width:50
                                        height: 75

                                    }
                                }
                            }
                            Rectangle
                            {
                                width: viewrec.width
                                height: 120
                                ColumnLayout
                                {
                                    spacing: 0
                                    RowLayout
                                    {
                                        spacing: 0
                                        anchors.fill: parent
                                        Label
                                        {
                                            height: 20

                                            text:"Kamran  "
                                            font.family: "Arial"
                                            font.pixelSize: 15
                                            font.weight: Font.Bold
                                        }
                                        Label
                                        {
                                            height: 20

                                            text:getCurrentTime()
                                            font.family: "Arial"
                                            font.pixelSize: 14
                                            // font.weight: Font.Bold
                                        }
                                    }


                                    TextEdit
                                    {
                                        width: viewrec.width - 50
                                        height: 100
                                        text:"봄날의 햇살 따라 새벽길을 걷네, 작은 꽃들이 눈부신 향기를 품고 서로 맞닿아 웃네. 나비들은 춤추며 색다른 세계를 만들어가고, 그 속에서 나는 풍경에 녹아들어 자유롭게 흘러가네.
어린 그림자들이 덧없이 노래하며 흐르고, 푸른 하늘은 감탄을 자아내며 펼쳐진다. 저 멀리 산들은 우리에게 약속을 전하고, 물결처럼 흐르는 강물은 시간을 담고 흘러간다.
끝없이 이어지는 세상의 수레바퀴, 그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
                                        font.pixelSize: 14
                                        Layout.fillWidth: true

                                    }
                                    Rectangle
                                    {
                                        width: 30
                                        height: 30
                                        RowLayout
                                        {
                                            spacing:5
                                            anchors.fill: parent
                                            Rectangle
                                            {
                                                width: 30
                                                height: 30
                                                color:"grey"
                                                Image
                                                {
                                                    source: "qrc:/images/MAvatar3.png" // Replace with the path to your icon
                                                    width: 30
                                                    height: 30
                                                    fillMode: Image.PreserveAspectFit
                                                }
                                            }
                                            Rectangle
                                            {
                                                width: 30
                                                height: 30
                                                color:"grey"
                                                Image
                                                {
                                                    source: "qrc:/images/MAvatar4.png" // Replace with the path to your icon
                                                    width: 30
                                                    height: 30
                                                    fillMode: Image.PreserveAspectFit
                                                }
                                            }
                                            Rectangle
                                            {
                                                width: 30
                                                height: 30
                                                color:"grey"
                                                Image
                                                {
                                                    source: "qrc:/images/MAvatar5.png" // Replace with the path to your icon
                                                    width: 30
                                                    height: 30
                                                    fillMode: Image.PreserveAspectFit
                                                }
                                            }
                                            Label
                                            {
                                                text:"3 replies "
                                                font.family: "Arial"
                                                font.pixelSize: 14
                                                // font.weight: Font.Bold
                                                color: "blue"
                                            }
                                            Label
                                            {
                                                text:"Last reply today at "+getCurrentTime()
                                                font.family: "Arial"
                                                font.pixelSize: 14
                                                // font.weight: Font.Bold
                                            }

                                        }

                                    }
                                }
                            }
                        }


                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 30
                        RowLayout
                        {
                            spacing: 0

                            anchors.fill: parent
                            Rectangle
                            {
                                width: 275
                                height: 2
                                color: "grey"
                                Layout.fillWidth: true
                            }
                            Rectangle
                            {
                                width: 150
                                height:30
                                color: "white"
                                radius: 10 // Adjust the radius to control the roundness of the corners
                                border.color: "grey"
                                border.width: 2
                                Layout.fillWidth: true
                                Text {
                                    font.family: "Arial"
                                    font.pixelSize: 12
                                    font.weight: Font.Bold

                                    color: "black"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    text: {
                                        var months = [
                                                    "January", "February", "March", "April", "May", "June",
                                                    "July", "August", "September", "October", "November", "December"
                                                ];

                                        var date = new Date();
                                        var day = date.getDay(); // Returns the day of the week as a number (0-6)
                                        var month = date.getMonth(); // Returns the month as a number (0-11)
                                        var dayOfMonth = date.getDate(); // Returns the day of the month (1-31)

                                        var dayString = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][day];
                                        var monthString = months[month];

                                        return dayString + ", " + monthString + " " + dayOfMonth;
                                    }
                                }


                            }
                            Rectangle
                            {
                                width: 275
                                height: 2
                                color: "grey"
                                Layout.fillWidth: true

                            }
                            //                            Label
                            //                            {
                            //                                text:"New"
                            //                                font.pixelSize: 20
                            //                                width: 75
                            //                                color: "#CE375C" // Set the text color to red
                            //                            }
                        }
                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 120
                        Rectangle
                        {
                            width: viewrec.width
                            height: 120
                            //color: "red"
                            RowLayout
                            {
                                spacing: 0
                                Rectangle
                                {
                                    width: 5
                                    height: 120

                                }
                                Rectangle
                                {
                                    width: 50
                                    height: 120
                                    ColumnLayout
                                    {
                                        spacing: 0
                                        Rectangle
                                        {
                                            width:40
                                            height: 40
                                            Image
                                            {
                                                source: "qrc:/images/Favatar.png" // Replace with the path to your icon
                                                width: 40
                                                height: 40
                                                fillMode: Image.PreserveAspectFit
                                                anchors.horizontalCenter:  parent.horizontalCenter

                                            }

                                        }
                                        Rectangle
                                        {
                                            width:50
                                            height: 75

                                        }
                                    }
                                }
                                Rectangle
                                {
                                    width: viewrec.width
                                    height: 120
                                    ColumnLayout
                                    {
                                        spacing: 2
                                        RowLayout
                                        {
                                            spacing: 0
                                            Label
                                            {
                                                height: 20
                                                text:"Kamran  "
                                                font.family: "Arial"
                                                font.pixelSize: 15
                                                font.weight: Font.Bold
                                            }
                                            Label
                                            {
                                                height: 20

                                                text:getCurrentTime()
                                                font.family: "Arial"
                                                font.pixelSize: 14
                                                // font.weight: Font.Bold
                                            }
                                        }


                                        TextEdit
                                        {
                                            width:viewrec-50
                                            height: 100
                                            text:"봄날의 햇살 따라 새벽길을 걷네, 작은 꽃들이 눈부신 향기를 품고 서로 맞닿아 웃네. 나비들은 춤추며 색다른 세계를 만들어가고, 그 속에서 나는 풍경에 녹아들어 자유롭게 흘러가네.
    어린 그림자들이 덧없이 노래하며 흐르고, 푸른 하늘은 감탄을 자아내며 펼쳐진다. 저 멀리 산들은 우리에게 약속을 전하고, 물결처럼 흐르는 강물은 시간을 담고 흘러간다.
    끝없이 이어지는 세상의 수레바퀴, 그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
                                            font.family: "Arial"
                                            font.pixelSize: 14
                                            //font.weight: Font.Bold
                                        }
                                        Rectangle
                                        {
                                            RowLayout
                                            {
                                                spacing:5
                                                Rectangle
                                                {
                                                    width: 30
                                                    height: 30
                                                    color:"grey"
                                                    Image
                                                    {
                                                        source: "qrc:/images/MAvatar3.png" // Replace with the path to your icon
                                                        width: 30
                                                        height: 30
                                                        fillMode: Image.PreserveAspectFit
                                                    }
                                                }
                                                Rectangle
                                                {
                                                    width: 30
                                                    height: 30
                                                    color:"grey"
                                                    Image
                                                    {
                                                        source: "qrc:/images/MAvatar4.png" // Replace with the path to your icon
                                                        width: 30
                                                        height: 30
                                                        fillMode: Image.PreserveAspectFit
                                                    }
                                                }
                                                Rectangle
                                                {
                                                    width: 30
                                                    height: 30
                                                    color:"grey"
                                                    Image
                                                    {
                                                        source: "qrc:/images/MAvatar5.png" // Replace with the path to your icon
                                                        width: 30
                                                        height: 30
                                                        fillMode: Image.PreserveAspectFit
                                                    }
                                                }

                                                Rectangle
                                                {
                                                    width: 30
                                                    height: 30
                                                    color:"grey"
                                                    Image
                                                    {
                                                        source: "qrc:/images/MAvatar.png" // Replace with the path to your icon
                                                        width: 30
                                                        height: 30
                                                        fillMode: Image.PreserveAspectFit
                                                    }
                                                }

                                                Rectangle
                                                {
                                                    width: 30
                                                    height: 30
                                                    color:"grey"
                                                    Image
                                                    {
                                                        source: "qrc:/images/MAvatar6.png" // Replace with the path to your icon
                                                        width: 30
                                                        height: 30
                                                        fillMode: Image.PreserveAspectFit
                                                    }
                                                }
                                                Label
                                                {
                                                    text:"8 replies "
                                                    font.family: "Arial"
                                                    font.pixelSize: 14
                                                    // font.weight: Font.Bold
                                                    color: "blue"
                                                }
                                                Label
                                                {
                                                    text:"Last reply today at "+getCurrentTime()
                                                    font.family: "Arial"
                                                    font.pixelSize: 14
                                                    // font.weight: Font.Bold
                                                }

                                            }

                                        }
                                    }
                                }
                            }
                        }
                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 30
                        RowLayout
                        {
                            spacing: 0

                            anchors.fill: parent
                            Rectangle
                            {
                                width: 250
                                height: 2
                                color: "#CE375C"
                                Layout.fillWidth: true

                            }
                            Rectangle
                            {
                                width: 150
                                height:30
                                color: "white"
                                radius: 10 // Adjust the radius to control the roundness of the corners
                                border.color: "grey"
                                border.width: 2
                                Layout.fillWidth: true

                                Text
                                {
                                    font.family: "Arial"
                                    font.pixelSize: 12
                                    font.weight: Font.Bold

                                    color: "black"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter

                                    text:
                                    {
                                        var months = [
                                                    "January", "February", "March", "April", "May", "June",
                                                    "July", "August", "September", "October", "November", "December"
                                                ];

                                        var date = new Date();
                                        var day = date.getDay(); // Returns the day of the week as a number (0-6)
                                        var month = date.getMonth(); // Returns the month as a number (0-11)
                                        var dayOfMonth = date.getDate(); // Returns the day of the month (1-31)

                                        var dayString = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][day];
                                        var monthString = months[month];

                                        return dayString + ", " + monthString + " " + dayOfMonth;
                                    }
                                }
                            }
                            Rectangle
                            {
                                width: 250
                                height: 2
                                color: "#CE375C"
                                Layout.fillWidth: true

                            }
                            Label
                            {
                                text:"New"
                                font.pixelSize: 20
                                width: 75
                                color: "#CE375C" // Set the text color to red
                                Layout.fillWidth: true

                            }
                        }
                    }


                    Rectangle
                    {
                        width: viewrec.width
                        height: 45
                        Layout.fillWidth: true
                        RowLayout
                        {
                            spacing: 30
                            Rectangle
                            {
                                width: 40
                                height: 40
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                //                                anchors
                                //                                {
                                //                                    top: parent.top
                                //                                    left: parent.left

                                //                                    topMargin: 1
                                //                                    leftMargin:20
                                //                                }
                                Image
                                {
                                    source: "qrc:/images/MAvatar.png" // Replace with the path to your icon
                                    width: 40
                                    height: 40
                                    fillMode: Image.PreserveAspectFit
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            ColumnLayout
                            {
                                spacing: 1
                                Label
                                {
                                    text:"Heal  "+getCurrentTime()
                                    font.family: "Arial"
                                    font.pixelSize: 14
                                    font.weight: Font.Bold
                                }
                                Label
                                {
                                    text:"그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
                                    font.family: "Arial"
                                    font.pixelSize: 14
                                    // font.weight: Font.Bold
                                }
                            }
                        }

                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 30
                        Layout.fillWidth: true
                        color: "white"
                        anchors
                        {
                            // top: parent.top
                            left: parent.left

                            //topMargin: 1
                            leftMargin:65
                        }
                        RowLayout
                        {
                            spacing: 5
                            Rectangle
                            {
                                width: 25
                                height: 25
                                color: "white"
                                Image
                                {
                                    source: "qrc:/images/Thumsup.png" // Replace with the path to your icon
                                    width: 25
                                    height: 25
                                    fillMode: Image.PreserveAspectFit
                                    //anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            Label
                            {
                                text:"1"
                                font.family: "Arial"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                            }
                            Rectangle
                            {
                                width: 25
                                height: 25
                                color: "white"

                                Image
                                {
                                    source: "qrc:/images/Add.png" // Replace with the path to your icon
                                    width: 25
                                    height: 25
                                    fillMode: Image.PreserveAspectFit
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                        }

                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 10
                        color: "white"
                        Layout.fillWidth: true
                    }
                    Rectangle
                    {
                        width: viewrec.width
                        height: 70
                        Layout.fillWidth: true
                        border.color: "grey"  // Set the border color
                        border.width: 2  // Set the border width
                        radius:5
                        color: "white"
                        ColumnLayout
                        {
                            spacing: 0
                            anchors.fill: parent
                            TextEdit
                            {
                                width: viewrec.width
                                height: 40
                                text:"  Message # uxui_design"
                                font.family: "Arial"
                                font.pixelSize: 15
                                //font.weight: Font.Bold
                            }
                            Rectangle
                            {
                                width: viewrec.width -5
                                height: 30
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                //                                anchors
                                //                                {
                                //                                    top: parent.top
                                //                                    left: parent.left
                                //                                    //bottomMargin: 5
                                //                                    topMargin:15
                                //                                    leftMargin:30
                                //                                }
                                RowLayout
                                {
                                    spacing: 5

                                    //anchors.fill: parent
                                    Rectangle
                                    {
                                        width: 15
                                        height: 15
                                        Image
                                        {
                                            source: "qrc:/images/quick.png" // Replace with the path to your icon
                                            width: 15
                                            height: 15
                                            fillMode: Image.PreserveAspectFit
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 320
                                        height: 30
                                        Image
                                        {
                                            source: "qrc:/images/FontView.png" // Replace with the path to your icon
                                            width: 320
                                            height: 30
                                            fillMode: Image.PreserveAspectFit
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 475
                                        height: 30
                                    }
                                    Rectangle
                                    {
                                        width: 30
                                        height: 30
                                        Image
                                        {
                                            source: "qrc:/images/Save.png" // Replace with the path to your icon
                                            width: 30
                                            height: 30
                                            fillMode: Image.PreserveAspectFit
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 15
                                        height: 15
                                        Image
                                        {
                                            source: "qrc:/images/emoji.png"
                                            width: 15
                                            height: 15
                                            fillMode: Image.PreserveAspectFit
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 15
                                        height: 15
                                        Image
                                        {
                                            source: "qrc:/images/clip.png" // Replace with the path to your icon
                                            width: 15
                                            height: 15
                                            fillMode: Image.PreserveAspectFit
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                    Rectangle
                                    {
                                        width: 15
                                        height: 15
                                        Image
                                        {
                                            source: "qrc:/images/send.png" // Replace with the path to your icon
                                            width: 15
                                            height: 15
                                            fillMode: Image.PreserveAspectFit
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
    }
}
