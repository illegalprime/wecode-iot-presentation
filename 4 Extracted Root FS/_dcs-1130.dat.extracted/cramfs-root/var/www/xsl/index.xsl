<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" --><!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<link rel="stylesheet" type="text/css" href="css_router.css" />
<script language="JavaScript" src="public.js" type="text/javascript"></script>
<script language="JavaScript" src="net.js" type="text/javascript"></script>
<script language="JavaScript">

var gp_input1_counter = 0;
var gp_input2_counter = 0;

function checkGPInput(index, isOn)
{
	if (isOn == 1)
	{
		if (index == 1)
			gp_input1_counter++;
		else if (index == 2)
			gp_input2_counter++;

		if (gp_input1_counter == 1 || gp_input2_counter == 1)
		{
			swapImageGPInput(0, 1);
		}
	}
	else
	{
		if (index == 1)
		{
			if (gp_input1_counter != 0)
				gp_input1_counter--;
		}
		else if (index == 2)
		{
			if (gp_input2_counter != 0)
				gp_input2_counter--;
		}

		if (gp_input1_counter == 0)
		{
			if (gp_input2_counter == 0)
				swapImageGPInput(0, 0);
		}
	}
}
</script>
<SCRIPT LANGUAGE="JavaScript" FOR="dcscontrol1" EVENT="OnStreamOutNotify(Result)">
if ('<xsl:value-of select="root/config/ie " />' == 'true')
	Stream_OnStreamOutNotify(Result);
</SCRIPT>
<SCRIPT language="JavaScript" FOR="notify" EVENT="OnNotifyMotionDetection(lRegion, lResult)">
if ('<xsl:value-of select="root/config/ie " />' == 'true'){
	if(lRegion==1)
		swapImageMotion(lResult);
}
</SCRIPT>
<SCRIPT language="JavaScript" FOR="notify" EVENT="OnNotifyGPInput(lIndex, lResult)">
if ('<xsl:value-of select="root/config/ie " />' == 'true'){
	checkGPInput(lIndex, lResult);
}
//	alert("GP Input Index:" + lIndex + " Result:" + lResult);
</SCRIPT>
<SCRIPT language="JavaScript" FOR="notify" EVENT="OnNotifyInRecording(lResult)">
if ('<xsl:value-of select="root/config/ie " />' == 'true')
	swapImageNotifyRecord(lResult);
//	alert("InRecording:" + lResult);
</SCRIPT>
<SCRIPT language="JavaScript" FOR="notify" EVENT="OnNotifySocketClose(lResult)">
if ('<xsl:value-of select="root/config/ie " />' == 'true')
	swapImageMotion(0);
//alert("Socket close");
</SCRIPT>    
<script language="JavaScript" type="text/javascript">
<![CDATA[
var flagRecording = false;
var flagSize = 0;//0=small On, 1=medial On, 2=large On

var imageRecord = new Object( );
imageRecord["recorde_on_f"] = new Image(35, 29);
imageRecord["recorde_on_f"].src = "images/recorde_on_f.gif";
imageRecord["recorde_on_n"] = new Image(35, 29);
imageRecord["recorde_on_n"].src = "images/recorde_on_n.gif";
imageRecord["recorde_on_p"] = new Image(35, 29);
imageRecord["recorde_on_p"].src = "images/recorde_on_p.gif";
imageRecord["recorde_off_f"] = new Image(35, 29);
imageRecord["recorde_off_f"].src  = "images/recorde_off_f.gif";
imageRecord["recorde_off_n"] = new Image(35, 29);
imageRecord["recorde_off_n"].src  = "images/recorde_off_n.gif";
imageRecord["recorde_off_p"] = new Image(35, 29);
imageRecord["recorde_off_p"].src  = "images/recorde_off_p.gif";

function setImageRecord(type){
    if (document.images) {
		if (type == "recording")
			document.recordButton.src = imageRecord["recorde_on_f"].src;
		else if (type == "stopRecord")
			document.recordButton.src = imageRecord["recorde_off_f"].src;
	}
}

var imageStreamOut = new Object( );
imageStreamOut["talk_on_f"] = new Image(35, 29);
imageStreamOut["talk_on_f"].src = "images/talk_on_f.gif";
imageStreamOut["talk_on_n"] = new Image(35, 29);
imageStreamOut["talk_on_n"].src = "images/talk_on_n.gif";
imageStreamOut["talk_on_p"] = new Image(35, 29);
imageStreamOut["talk_on_p"].src = "images/talk_on_p.gif";
imageStreamOut["talk_off_f"] = new Image(35, 29);
imageStreamOut["talk_off_f"].src  = "images/talk_off_f.gif";
imageStreamOut["talk_off_n"] = new Image(35, 29);
imageStreamOut["talk_off_n"].src  = "images/talk_off_n.gif";
imageStreamOut["talk_off_p"] = new Image(35, 29);
imageStreamOut["talk_off_p"].src  = "images/talk_off_p.gif";

function setImageStream(type){
    if (document.images) {
		if (type == "streamOut")
			document.streamoutButton.src = imageStreamOut["talk_on_f"].src;
		else if (type == "stopStreamOut")
			document.streamoutButton.src = imageStreamOut["talk_off_f"].src;
	}
}

var imageListen = new Object( );
imageListen["listen_on_f"] = new Image(35, 29);
imageListen["listen_on_f"].src = "images/listen_on_f.gif";
imageListen["listen_on_n"] = new Image(35, 29);
imageListen["listen_on_n"].src = "images/listen_on_n.gif";
imageListen["listen_on_p"] = new Image(35, 29);
imageListen["listen_on_p"].src = "images/listen_on_p.gif";
imageListen["listen_off_f"] = new Image(35, 29);
imageListen["listen_off_f"].src  = "images/listen_off_f.gif";
imageListen["listen_off_n"] = new Image(35, 29);
imageListen["listen_off_n"].src  = "images/listen_off_n.gif";
imageListen["listen_off_p"] = new Image(35, 29);
imageListen["listen_off_p"].src  = "images/listen_off_p.gif";

function setImageListen(type){
    if (document.images) {
		if (type == "listenOn")
			document.listenButton.src = imageListen["listen_on_f"].src;
		else if (type == "listenOff")
			document.listenButton.src = imageListen["listen_off_f"].src;
	}
}

var imageMotion = new Object( );
imageMotion["motionOn"] = new Image(37, 33);
imageMotion["motionOn"].src = "images/motion_notification_on.gif";
imageMotion["motionOff"] = new Image(37, 33);
imageMotion["motionOff"].src  = "images/motion_notification_off.gif";

function setImageMotion(type){
    if (document.images) {
		if (type == "motionOn")
			document.motionIcon.src = imageMotion["motionOn"].src;
		else if (type == "motionOff")
			document.motionIcon.src = imageMotion["motionOff"].src;
	}
}

var imageSetPath = new Object( );
imageSetPath["path_setting_f"] = new Image(35, 29);
imageSetPath["path_setting_f"].src  = "images/path_setting_f.gif";
imageSetPath["path_setting_n"] = new Image(35, 29);
imageSetPath["path_setting_n"].src = "images/path_setting_n.gif";
imageSetPath["path_setting_p"] = new Image(35, 29);
imageSetPath["path_setting_p"].src = "images/path_setting_p.gif";

var imageSetSnapshot = new Object( );
imageSetSnapshot["snapshot_f"] = new Image(35, 29);
imageSetSnapshot["snapshot_f"].src  = "images/snapshot_f.gif";
imageSetSnapshot["snapshot_n"] = new Image(35, 29);
imageSetSnapshot["snapshot_n"].src = "images/snapshot_n.gif";
imageSetSnapshot["snapshot_p"] = new Image(35, 29);
imageSetSnapshot["snapshot_p"].src = "images/snapshot_p.gif";

var imagePT = new Object( );
imagePT["way_control_n"] = new Image(110, 110);
imagePT["way_control_n"].src  = "images/way_control.jpg";

imagePT["home_f"] = new Image(110, 110);
imagePT["home_f"].src = "images/way_control_center_f.jpg";
imagePT["home_p"] = new Image(110, 110);
imagePT["home_p"].src = "images/way_control_center_p.jpg";

imagePT["down_f"] = new Image(110, 110);
imagePT["down_f"].src = "images/way_control_down_f.jpg";
imagePT["down_p"] = new Image(110, 110);
imagePT["down_p"].src = "images/way_control_down_p.jpg";

imagePT["left_f"] = new Image(110, 110);
imagePT["left_f"].src = "images/way_control_left_f.jpg";
imagePT["left_p"] = new Image(110, 110);
imagePT["left_p"].src = "images/way_control_left_p.jpg";

imagePT["left_down_f"] = new Image(110, 110);
imagePT["left_down_f"].src = "images/way_control_left_down_f.jpg";
imagePT["left_down_p"] = new Image(110, 110);
imagePT["left_down_p"].src = "images/way_control_left_down_p.jpg";

imagePT["left_up_f"] = new Image(110, 110);
imagePT["left_up_f"].src = "images/way_control_left_up_f.jpg";
imagePT["left_up_p"] = new Image(110, 110);
imagePT["left_up_p"].src = "images/way_control_left_up_p.jpg";

imagePT["right_f"] = new Image(110, 110);
imagePT["right_f"].src = "images/way_control_right_f.jpg";
imagePT["right_p"] = new Image(110, 110);
imagePT["right_p"].src = "images/way_control_right_p.jpg";

imagePT["right_down_f"] = new Image(110, 110);
imagePT["right_down_f"].src = "images/way_control_right_down_f.jpg";
imagePT["right_down_p"] = new Image(110, 110);
imagePT["right_down_p"].src = "images/way_control_right_down_p.jpg";

imagePT["right_up_f"] = new Image(110, 110);
imagePT["right_up_f"].src = "images/way_control_right_up_f.jpg";
imagePT["right_up_p"] = new Image(110, 110);
imagePT["right_up_p"].src = "images/way_control_right_up_p.jpg";

imagePT["up_f"] = new Image(110, 110);
imagePT["up_f"].src = "images/way_control_up_f.jpg";
imagePT["up_p"] = new Image(110, 110);
imagePT["up_p"].src = "images/way_control_up_p.jpg";

imagePT["zoon_in_f"] = new Image(110, 110);
imagePT["zoon_in_f"].src = "images/way_control_zoon_in_f.jpg";
imagePT["zoon_in_p"] = new Image(110, 110);
imagePT["zoon_in_p"].src = "images/way_control_zoon_in_p.jpg";

imagePT["zoon_out_f"] = new Image(110, 110);
imagePT["zoon_out_f"].src = "images/way_control_zoon_out_f.jpg";
imagePT["zoon_out_p"] = new Image(110, 110);
imagePT["zoon_out_p"].src = "images/way_control_zoon_out_p.jpg";

var imageSize = new Object( );
imageSize["profile1_on_f"] = new Image(37, 33);
imageSize["profile1_on_f"].src  = "images/profile1_on_f.gif";
imageSize["profile1_on_n"] = new Image(37, 33);
imageSize["profile1_on_n"].src  = "images/profile1_on_n.gif";
imageSize["profile1_on_p"] = new Image(37, 33);
imageSize["profile1_on_p"].src  = "images/profile1_on_p.gif";
imageSize["profile1_off_f"] = new Image(37, 33);
imageSize["profile1_off_f"].src  = "images/profile1_off_f.gif";
imageSize["profile1_off_n"] = new Image(37, 33);
imageSize["profile1_off_n"].src  = "images/profile1_off_n.gif";
imageSize["profile1_off_p"] = new Image(37, 33);
imageSize["profile1_off_p"].src  = "images/profile1_off_p.gif";

imageSize["profile2_on_f"] = new Image(37, 33);
imageSize["profile2_on_f"].src  = "images/profile2_on_f.gif";
imageSize["profile2_on_n"] = new Image(37, 33);
imageSize["profile2_on_n"].src  = "images/profile2_on_n.gif";
imageSize["profile2_on_p"] = new Image(37, 33);
imageSize["profile2_on_p"].src  = "images/profile2_on_p.gif";
imageSize["profile2_off_f"] = new Image(37, 33);
imageSize["profile2_off_f"].src  = "images/profile2_off_f.gif";
imageSize["profile2_off_n"] = new Image(37, 33);
imageSize["profile2_off_n"].src  = "images/profile2_off_n.gif";
imageSize["profile2_off_p"] = new Image(37, 33);
imageSize["profile2_off_p"].src  = "images/profile2_off_p.gif";

imageSize["profile3_on_f"] = new Image(37, 33);
imageSize["profile3_on_f"].src  = "images/profile3_on_f.gif";
imageSize["profile3_on_n"] = new Image(37, 33);
imageSize["profile3_on_n"].src  = "images/profile3_on_n.gif";
imageSize["profile3_on_p"] = new Image(37, 33);
imageSize["profile3_on_p"].src  = "images/profile3_on_p.gif";
imageSize["profile3_off_f"] = new Image(37, 33);
imageSize["profile3_off_f"].src  = "images/profile3_off_f.gif";
imageSize["profile3_off_n"] = new Image(37, 33);
imageSize["profile3_off_n"].src  = "images/profile3_off_n.gif";
imageSize["profile3_off_p"] = new Image(37, 33);
imageSize["profile3_off_p"].src  = "images/profile3_off_p.gif";

imageSize["profile4_on_f"] = new Image(37, 33);
imageSize["profile4_on_f"].src  = "images/profile4_on_f.gif";
imageSize["profile4_on_n"] = new Image(37, 33);
imageSize["profile4_on_n"].src  = "images/profile4_on_n.gif";
imageSize["profile4_on_p"] = new Image(37, 33);
imageSize["profile4_on_p"].src  = "images/profile4_on_p.gif";
imageSize["profile4_off_f"] = new Image(37, 33);
imageSize["profile4_off_f"].src  = "images/profile4_off_f.gif";
imageSize["profile4_off_n"] = new Image(37, 33);
imageSize["profile4_off_n"].src  = "images/profile4_off_n.gif";
imageSize["profile4_off_p"] = new Image(37, 33);
imageSize["profile4_off_p"].src  = "images/profile4_off_p.gif";

var imageNotifyRecord = new Object( );
imageNotifyRecord["notifyRecordOn"] = new Image(35, 32);
imageNotifyRecord["notifyRecordOn"].src = "images/server_recorde_on.gif";
imageNotifyRecord["notifyRecordOff"] = new Image(35, 32);
imageNotifyRecord["notifyRecordOff"].src  = "images/server_recorde_off.gif";

function setImageNotifyRecord(type){
    if (document.images) {
		if (type == "notifyRecordOn")
			document.recordIcon.src = imageNotifyRecord["notifyRecordOn"].src;
		else if (type == "notifyRecordOff")
			document.recordIcon.src = imageNotifyRecord["notifyRecordOff"].src;
	}
}

var imageGPInput = new Object( );
imageGPInput["gpInputOn"] = new Image(27, 32);
imageGPInput["gpInputOn"].src = "images/digital_input_on.gif";
imageGPInput["gpInputOff"] = new Image(27, 32);
imageGPInput["gpInputOff"].src  = "images/digital_input_off.gif";

function setImageGPInput(type){
    if (document.images) {
		if (type == "gpInputOn")
			document.gpInputIcon.src = imageGPInput["gpInputOn"].src;
		else if (type == "gpInputOff")
			document.gpInputIcon.src = imageGPInput["gpInputOff"].src;
	}
}

var imageGPOutput = new Object( );
imageGPOutput["output_on_f"] = new Image(35, 29);
imageGPOutput["output_on_f"].src = "images/digital_output_on_f.gif";
imageGPOutput["output_on_n"] = new Image(35, 29);
imageGPOutput["output_on_n"].src = "images/digital_output_on_n.gif";
imageGPOutput["output_on_p"] = new Image(35, 29);
imageGPOutput["output_on_p"].src = "images/digital_output_on_p.gif";
imageGPOutput["output_off_f"] = new Image(35, 29);
imageGPOutput["output_off_f"].src  = "images/digital_output_off_f.gif";
imageGPOutput["output_off_n"] = new Image(35, 29);
imageGPOutput["output_off_n"].src  = "images/digital_output_off_n.gif";
imageGPOutput["output_off_p"] = new Image(35, 29);
imageGPOutput["output_off_p"].src  = "images/digital_output_off_p.gif";

function setImageGPOutput(type){
    if (document.images) {
		if (type == "startGPOutput")
			document.gpOutputButton.src = imageGPOutput["output_on_f"].src;
		else if (type == "stopGPOutput")
			document.gpOutputButton.src = imageGPOutput["output_off_f"].src;
	}
}

var imageLed = new Object( );
imageLed["led_on_f"] = new Image(35, 29);
imageLed["led_on_f"].src = "images/led_on_f.gif";
imageLed["led_on_n"] = new Image(35, 29);
imageLed["led_on_n"].src = "images/led_on_n.gif";
imageLed["led_on_p"] = new Image(35, 29);
imageLed["led_on_p"].src = "images/led_on_p.gif";
imageLed["led_off_f"] = new Image(35, 29);
imageLed["led_off_f"].src  = "images/led_off_f.gif";
imageLed["led_off_n"] = new Image(35, 29);
imageLed["led_off_n"].src  = "images/led_off_n.gif";
imageLed["led_off_p"] = new Image(35, 29);
imageLed["led_off_p"].src  = "images/led_off_p.gif";

var imageIr = new Object( );
imageIr["ir_on_f"] = new Image(35, 29);
imageIr["ir_on_f"].src = "images/ir_on_f.gif";
imageIr["ir_on_n"] = new Image(35, 29);
imageIr["ir_on_n"].src = "images/ir_on_n.gif";
imageIr["ir_on_p"] = new Image(35, 29);
imageIr["ir_on_p"].src = "images/ir_on_p.gif";
imageIr["ir_off_f"] = new Image(35, 29);
imageIr["ir_off_f"].src  = "images/ir_off_f.gif";
imageIr["ir_off_n"] = new Image(35, 29);
imageIr["ir_off_n"].src  = "images/ir_off_n.gif";
imageIr["ir_off_p"] = new Image(35, 29);
imageIr["ir_off_p"].src  = "images/ir_off_p.gif";

function setImageLed(type){
    if (document.images) {
		if (type == "ledOn")
			document.ledButton.src = imageLed["led_on_f"].src;
		else if (type == "ledOff")
			document.ledButton.src = imageLed["led_off_f"].src;
	}
}
function setImageIR(type){
    if (document.images) {
		if (type == "irOn")
			document.irButton.src = imageIr["ir_on_f"].src;
		else if (type == "irOff")
			document.irButton.src = imageIr["ir_off_f"].src;
	}
}

var imageFullScreen = new Object( );
imageFullScreen["full_screen_f"] = new Image(35, 29);
imageFullScreen["full_screen_f"].src  = "images/full_screen_f.gif";
imageFullScreen["full_screen_n"] = new Image(35, 29);
imageFullScreen["full_screen_n"].src = "images/full_screen_n.gif";
imageFullScreen["full_screen_p"] = new Image(35, 29);
imageFullScreen["full_screen_p"].src = "images/full_screen_p.gif";

function overImage(type){
	if (type == "path_setting")
		document.pathButton.src = imageSetPath["path_setting_f"].src;
	if (type == "snapshotPatten")
		document.snapshotButton.src = imageSetSnapshot["snapshot_f"].src;
	if (type == "listenPatten"){
		if (flagListen == "on")
			document.listenButton.src = imageListen["listen_on_f"].src;
		if (flagListen == "off")
			document.listenButton.src = imageListen["listen_off_f"].src;
	}
	if (type == "recordPatten"){
		if (flagRecording == true)
			document.recordButton.src = imageRecord["recorde_on_f"].src;
		if (flagRecording == false)
			document.recordButton.src = imageRecord["recorde_off_f"].src;
	}
	if (type == "streamoutPatten"){
		if (flagStreaming == true)
			document.streamoutButton.src = imageStreamOut["talk_on_f"].src;
		if (flagStreaming == false)
			document.streamoutButton.src = imageStreamOut["talk_off_f"].src;
	}
	if (type == "left_up")
		document.PTControl.src = imagePT["left_up_f"].src;
	if (type == "up")
		document.PTControl.src = imagePT["up_f"].src;
	if (type == "right_up")
		document.PTControl.src = imagePT["right_up_f"].src;
	if (type == "left")
		document.PTControl.src = imagePT["left_f"].src;
	if (type == "home")
		document.PTControl.src = imagePT["home_f"].src;
	if (type == "right")
		document.PTControl.src = imagePT["right_f"].src;
	if (type == "left_down")
		document.PTControl.src = imagePT["left_down_f"].src;
	if (type == "down")
		document.PTControl.src = imagePT["down_f"].src;
	if (type == "right_down")
		document.PTControl.src = imagePT["right_down_f"].src;
	if (type == "zoon_out")
		document.PTControl.src = imagePT["zoon_out_f"].src;
	if (type == "zoon_in")
		document.PTControl.src = imagePT["zoon_in_f"].src;
	if (type == "profile1"){
		if (flagSize == 0)
			document.profile1.src = imageSize["profile1_on_f"].src;
		else
			document.profile1.src = imageSize["profile1_off_f"].src;
	}
	if (type == "profile2"){
		if (flagSize == 1)
			document.profile2.src = imageSize["profile2_on_f"].src;
		else
			document.profile2.src = imageSize["profile2_off_f"].src;
	}
	if (type == "profile3"){
		if (flagSize == 2)
			document.profile3.src = imageSize["profile3_on_f"].src;
		else
			document.profile3.src = imageSize["profile3_off_f"].src;
	}
	if (type == "profile4"){
		if (flagSize == 3)
			document.profile4.src = imageSize["profile4_on_f"].src;
		else
			document.profile4.src = imageSize["profile4_off_f"].src;
	}
	if (type == "gpOutputPatten"){
		if (flagGPOutput == "on")
			document.gpOutputButton.src = imageGPOutput["output_on_f"].src;
		if (flagGPOutput == "off")
			document.gpOutputButton.src = imageGPOutput["output_off_f"].src;
	}
	if (type == "ledPatten"){
		if (flagLed == "on")
			document.ledButton.src = imageLed["led_on_f"].src;
		if (flagLed == "off")
			document.ledButton.src = imageLed["led_off_f"].src;
	}
	if (type == "irPatten"){
		if (flagIRState == 1)
			document.irButton.src = imageIr["ir_on_f"].src;
		if (flagIRState == 0)
			document.irButton.src = imageIr["ir_off_f"].src;
	}
	if (type == "fullScreenPatten")
		document.fullScreenButton.src = imageFullScreen["full_screen_f"].src;
}

function outImage(type){
	if (type == "path_setting")
		document.pathButton.src = imageSetPath["path_setting_n"].src;
	if (type == "snapshotPatten")
		document.snapshotButton.src = imageSetSnapshot["snapshot_n"].src;
	if (type == "listenPatten"){
		if (flagListen == "on")
			document.listenButton.src = imageListen["listen_on_n"].src;
		if (flagListen == "off")
			document.listenButton.src = imageListen["listen_off_n"].src;
	}
	if (type == "recordPatten"){
		if (flagRecording == true)
			document.recordButton.src = imageRecord["recorde_on_n"].src;
		if (flagRecording == false)
			document.recordButton.src = imageRecord["recorde_off_n"].src;
	}
	if (type == "streamoutPatten"){
		if (flagStreaming == true)
			document.streamoutButton.src = imageStreamOut["talk_on_n"].src;
		if (flagStreaming == false)
			document.streamoutButton.src = imageStreamOut["talk_off_n"].src;
	}
	if (type == "pt_out")
		document.PTControl.src = imagePT["way_control_n"].src;
	if (type == "profile1"){
		if (flagSize == 0)
			document.profile1.src = imageSize["profile1_on_n"].src;
		else
			document.profile1.src = imageSize["profile1_off_n"].src;
	}
	if (type == "profile2"){
		if (flagSize == 1)
			document.profile2.src = imageSize["profile2_on_n"].src;
		else
			document.profile2.src = imageSize["profile2_off_n"].src;
	}
	if (type == "profile3"){
		if (flagSize == 2)
			document.profile3.src = imageSize["profile3_on_n"].src;
		else
			document.profile3.src = imageSize["profile3_off_n"].src;
	}
	if (type == "profile4"){
		if (flagSize == 3)
			document.profile4.src = imageSize["profile4_on_n"].src;
		else
			document.profile4.src = imageSize["profile4_off_n"].src;
	}
	if (type == "gpOutputPatten"){
		if (flagGPOutput == "on")
			document.gpOutputButton.src = imageGPOutput["output_on_n"].src;
		if (flagGPOutput == "off")
			document.gpOutputButton.src = imageGPOutput["output_off_n"].src;
	}
	if (type == "ledPatten"){
		if (flagLed == "on")
			document.ledButton.src = imageLed["led_on_n"].src;
		if (flagLed == "off")
			document.ledButton.src = imageLed["led_off_n"].src;
	}
	if (type == "irPatten"){
		if (flagIRState == 1)
			document.irButton.src = imageIr["ir_on_n"].src;
		if (flagIRState == 0)
			document.irButton.src = imageIr["ir_off_n"].src;
	}
	if (type == "fullScreenPatten")
		document.fullScreenButton.src = imageFullScreen["full_screen_n"].src;
}

function pressImage(type){
	if (type == "path_setting")
		document.pathButton.src = imageSetPath["path_setting_p"].src;
	if (type == "snapshotPatten")
		document.snapshotButton.src = imageSetSnapshot["snapshot_p"].src;
	if (type == "listenPatten"){
		if (flagListen == "on")
			document.listenButton.src = imageListen["listen_on_p"].src;
		if (flagListen == "off")
			document.listenButton.src = imageListen["listen_off_p"].src;
	}
	if (type == "recordPatten"){
		if (flagRecording == true)
			document.recordButton.src = imageRecord["recorde_on_p"].src;
		if (flagRecording == false)
			document.recordButton.src = imageRecord["recorde_off_p"].src;
	}
	if (type == "streamoutPatten"){
		if (flagStreaming == true)
			document.streamoutButton.src = imageStreamOut["talk_on_p"].src;
		if (flagStreaming == false)
			document.streamoutButton.src = imageStreamOut["talk_off_p"].src;
	}
	if (type == "left_up")
		document.PTControl.src = imagePT["left_up_p"].src;
	if (type == "up")
		document.PTControl.src = imagePT["up_p"].src;
	if (type == "right_up")
		document.PTControl.src = imagePT["right_up_p"].src;
	if (type == "left")
		document.PTControl.src = imagePT["left_p"].src;
	if (type == "home")
		document.PTControl.src = imagePT["home_p"].src;
	if (type == "right")
		document.PTControl.src = imagePT["right_p"].src;
	if (type == "left_down")
		document.PTControl.src = imagePT["left_down_p"].src;
	if (type == "down")
		document.PTControl.src = imagePT["down_p"].src;
	if (type == "right_down")
		document.PTControl.src = imagePT["right_down_p"].src;
	if (type == "zoon_out")
		document.PTControl.src = imagePT["zoon_out_p"].src;
	if (type == "zoon_in")
		document.PTControl.src = imagePT["zoon_in_p"].src;
	if (type == "profile1"){
		if (flagSize == 0)
			document.profile1.src = imageSize["profile1_on_p"].src;
		else
			document.profile1.src = imageSize["profile1_off_p"].src;
	}
	if (type == "profile2"){
		if (flagSize == 1)
			document.profile2.src = imageSize["profile2_on_p"].src;
		else
			document.profile2.src = imageSize["profile2_off_p"].src;
	}
	if (type == "profile3"){
		if (flagSize == 2)
			document.profile3.src = imageSize["profile3_on_p"].src;
		else
			document.profile3.src = imageSize["profile3_off_p"].src;
	}
	if (type == "profile4"){
		if (flagSize == 3)
			document.profile4.src = imageSize["profile4_on_p"].src;
		else
			document.profile4.src = imageSize["profile4_off_p"].src;
	}
	if (type == "gpOutputPatten"){
		if (flagGPOutput == "on")
			document.gpOutputButton.src = imageGPOutput["output_on_p"].src;
		if (flagGPOutput == "off")
			document.gpOutputButton.src = imageGPOutput["output_off_p"].src;
	}
	if (type == "ledPatten"){
		if (flagLed == "on")
			document.ledButton.src = imageLed["led_on_p"].src;
		if (flagLed == "off")
			document.ledButton.src = imageLed["led_off_p"].src;
	}
	if (type == "irPatten"){
		if (flagIRState == 1 )
			document.irButton.src = imageIr["ir_on_p"].src;
		if (flagIRState == 0 )
			document.irButton.src = imageIr["ir_off_p"].src;
	}

	if (type == "fullScreenPatten")
		document.fullScreenButton.src = imageFullScreen["full_screen_p"].src;
}
/*
//remove to puublic.js
function zoonOut(){
	overImage('zoon_out');
//	alert("zoon out, not works");
	var ratio = dcs.GetZoomRatio();
	if(ratio > 1){
		ratio = ratio/1.07;
		dcs.SetZoomRatio(ratio);
	}
}

function zoonIn(){
	overImage('zoon_in');
//	alert("zoon in, not works");
	var ratio = dcscontrol1.GetZoomRatio();
	if(ratio < 16){
		ratio = ratio * 1.07;
		dcscontrol1.SetZoomRatio(ratio);
	}
}
*/
function refresh(url) {
	window.location=url;
}

function createCookie( name, value, days ){
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = '; expires='+date.toGMTString();
	}
	else 
		var expires = '';

	document.cookie = name+'='+value+expires+'; path=/';
}

function changeLanguage(langIndex){
	if( langIndex == 0 ) {
		createCookie( 'language', 'eng', '365' );
		refresh('/eng/index.cgi');
		return true;
	}
	else if( langIndex == 1 ) {
		createCookie( 'language', 'cht', '365' );
		refresh('/cht/index.cgi');
		return true;
	}
	else if(langIndex == 2) {
		createCookie( 'language', 'chs', '365' );
		refresh('/chs/index.cgi');
		return true;
	}
	else if( langIndex == 3 ) {
		createCookie( 'language', 'jpn', '365' );
		refresh('/jpn/index.cgi');
		return true;
	}
    else
		return false;
}

var TheRequest = false;
var theRequest = false;

//This part is for PT
function createXMLHttpRequest(){
	//var theRequest = false;
        if (window.XMLHttpRequest) { // Mozilla, Safari,...
		theRequest = new XMLHttpRequest();
		if (theRequest.overrideMimeType) {
                	theRequest.overrideMimeType('text/xml');
		}
		return theRequest;
        }
	if (window.ActiveXObject) { // IE
		try {
			theRequest = new ActiveXObject("Msxml3.XMLHTTP");
		}
		catch (e) {
			try {
				theRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e) {
				alert("no MS XMLHTTP");
				return false;
			}
		}
		return theRequest;
	}
	alert("no XMLHTTP");
	return false;
}

function onAlertRequest(){
	if (theRequest.readyState == 4) {
		if (theRequest.status == 200) {
			try {
				var xmldoc = theRequest.responseXML;
				var node = xmldoc.getElementsByTagName('code').item(0);
				document.form1.resultCode.value = node.firstChild.data;
			}
			catch (e) {
				alert(e);
			}
		}
		else
			alert('There was a problem with the getRequest.');
	}
}

function WebEventNotify() {
	alert("WebEventNotify: TheRequest.readyState = "+TheRequest.readyState);
	alert("WebEventNotify: TheRequest.status = "+TheRequest.status);
	if (TheRequest.readyState == 3) {
		alert("WebEventNotify: status =  "+TheRequest.status);
		if (TheRequest.status == 200) {
			try {
				//alert(TheRequest.getAllResponseHeaders());
				alert(TheRequest.responseText);
				//var xmldoc = theRequest.responseXML;
				//document.form1.resultCode.value = node.firstChild.data;
			}
			catch (e) {
				alert(e);
			}
		}
		else
			alert('There was a problem with the getRequest.');
	}
}
/*
function move(x, y, type) {//PT
	theRequest = createXMLHttpRequest();
	if (!theRequest) return false;
	x = document.form1.panSpeed.value * x;
	y = document.form1.tiltSpeed.value * y;
	var hostname = document.form1.hostname.value;
	overImage(type);
	sendMoveRequest(x, y, hostname, theRequest, onAlertRequest);
}
function move(dirX, dirY, type) {//RS485
	theRequest = createXMLHttpRequest();
	if (!theRequest) return false;
	speedX = document.form1.panSpeed.value;
	speedY = document.form1.tiltSpeed.value;
	var hostname = document.form1.hostname.value;
	overImage(type);
	sendMoveRequest(dirX, dirY, speedX, speedY, hostname, theRequest, onAlertRequest);
}
function move(x, y, type) {//PT
	theRequest = createXMLHttpRequest();
	if (!theRequest) return false;
	if (flagRs485 == 0){
		x = document.form1.panSpeed.value * x;
		y = document.form1.tiltSpeed.value * y;
		var hostname = document.form1.hostname.value;
		overImage(type);
		sendMoveRequest(x, y, hostname, theRequest, onAlertRequest);
	}
	else if (flagRs485 == 1){
		speedX = document.form1.panSpeed.value;
		speedY = document.form1.tiltSpeed.value;
		var hostname = document.form1.hostname.value;
		overImage(type);
		sendMoveRs485Request(x, y, speedX, speedY, hostname, theRequest, onAlertRequest);
	}
}
*/
function goPreset(){

	theRequest = createXMLHttpRequest();
	if (!theRequest) return false;
	var hostname = document.form1.hostname.value;
	var presetName = document.form1.presetName.value
	if(document.form1.presetName[0].selected)
		return 0;
	else
		sendPresetRequest(flagRs485, presetName, hostname, theRequest, onAlertRequest);
	document.getElementById("presetName").value = "0";
}



function home(){
	overImage('home');
	var hostname = document.form1.hostname.value;
	sendHomeRequest(flagRs485, hostname);
}

function sendPatrol(command){
	var hostname = document.form1.hostname.value;
	sendPatrolRequest(command, hostname);
}

/*
function goPreset(){
	var hostname = document.form1.hostname.value;
	var presetName = document.form1.presetName.value
	if(document.form1.presetName[0].selected)
		return 0;
	else
		sendPresetRequest(flagRs485, presetName, hostname);
}
*/

function sendGPOutput(value){
	var urlXML = document.form1.hostname.value + ":" + window.location.port + "/dev/gpioCtrl.cgi?out1=" + value;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDoc(urlXML,urlXSL);
}
	
function sendLed(value){
	var urlXML = document.form1.hostname.value + ":" + window.location.port + "/dev/gpioCtrl.cgi?led=" + value;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDoc(urlXML,urlXSL);
}
function sendIR(value){
	var urlXML = document.form1.hostname.value + ":" + window.location.port + "/dev/ir_ctrl.cgi?ir=" + value;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDoc(urlXML,urlXSL);
}

//send request
var xmlDoc;
var xslDoc;
function LoadXMLXSLTDoc(urlXML,urlXSL){
	xmlDoc=null;
	xslDoc=null;
	new net.ContentLoader(urlXML,onXMLLoad);
//	new net.ContentLoader(urlXSL,onXSLLoad);
}
function LoadXMLXSLTDocSendIndex(urlXML,urlXSL){
	xmlDoc=null;
	xslDoc=null;
	new net.ContentLoader(urlXML,onXMLLoad);
}

function onXMLLoad(){
	xmlDoc=this.req.responseXML;
//	doXSLT();
}

function onXSLLoad(){
	xslDoc=this.req.responseXML;
//	doXSLT();
}

function doXSLT(){
	if (xmlDoc==null){ //alert("null");
	return false; 
	}
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var talkNotify1 = "<xsl:value-of select="root/lang/body/talkNotify1" />";
var talkNotify2 = "<xsl:value-of select="root/lang/body/talkNotify2" />";
var talkNotify3 = "<xsl:value-of select="root/lang/body/talkNotify3" />";
var flagGPOutput = "<xsl:value-of select="root/config/gpio/out1" />";
var flagLed = "<xsl:value-of select="root/config/gpio/led" />";
var flagIR = "<xsl:value-of select="root/common/peripheral/IR" />"; 
var flagIRAuto = "<xsl:value-of select="root/config/ir/irAuto" />";
var flagIRState = "<xsl:value-of select="root/config/ir/irState" />";
var flagListen = readCookie('flagListen');
var flagStreaming = false;
var flagRs485 = "<xsl:value-of select="root/common/peripheral/RS485" />";
var canListen = "yes";
var profile1Width = '<xsl:value-of select="/root/config/profiles/profile[1]/width" />';
var profile1Height = '<xsl:value-of select="/root/config/profiles/profile[1]/height" />';
var profile2Width = '<xsl:value-of select="/root/config/profiles/profile[2]/width" />';
var profile2Height = '<xsl:value-of select="/root/config/profiles/profile[2]/height" />';
var profile3Width = '<xsl:value-of select="/root/config/profiles/profile[3]/width" />';
var profile3Height = '<xsl:value-of select="/root/config/profiles/profile[3]/height" />';

var reloadTime = 1800000;
var profileForNonIE;

var PCM = 0;
var MULAW = 1;
var ADPCM = 2;
var audioType = ADPCM;

function InitActiveX(){
	var ProxyEnable = dcscontrol1.GetIEProxyEnable();
	var proxy = dcscontrol1.GetIEProxy();
	var proxyport = dcscontrol1.GetIEProxyPort();
	dcscontrol1.UseProxy(ProxyEnable);
	if(ProxyEnable == "1"){
		dcscontrol1.Proxy = proxy;
		dcscontrol1.ProxyPort = proxyport;
	}

	dcscontrol1.RemoteHost=location.hostname;
	if (location.port)
		dcscontrol1.RemotePort=location.port;
	else 
		dcscontrol1.RemotePort=80;
	dcscontrol1.SetAuthentication('<xsl:value-of select="/root/config/pageContext" />');
	//for ratio
//	dcscontrol1.EnableAmplify(1);
//	dcscontrol1.AmplifyAduio(1.5);
	dcscontrol1.DynamicProfile(1);
	dcscontrol1.SetAudioStreamType(audioType);
	dcscontrol1.play();
	//for Digital Zoom
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == 0)
		dcscontrol1.EnableDigitalZoom(1);
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == 1)
		dcscontrol1.EnablePTWnd(1);
	dcscontrol1.ModelName = "<xsl:value-of select="root/common/product" />";
}
function move(x, y, type){//PT
	var tilt = document.form1.tiltSpeed.value;
	if('<xsl:value-of select="root/common/serial" />' == "DCS-5230")
		tilt = parseInt(tilt) + 2;	
	tilt *= y;	
	if (flagRs485 == 0){
		x = document.form1.panSpeed.value * x; 
		y = tilt;
		var hostname = document.form1.hostname.value;
		overImage(type);
		sendMoveRequest(x, y, hostname);
	}
	else if (flagRs485 == 1){
		speedX = document.form1.panSpeed.value;
		speedY = tilt;
		var hostname = document.form1.hostname.value;
		overImage(type);
		sendMoveRs485Request(x, y, speedX, speedY, hostname);
	}
}
function NotificationStart(){
	var ProxyEnable = notify.GetIEProxyEnable();
	var proxy = notify.GetIEProxy();
	var proxyport = notify.GetIEProxyPort();
	notify.UseProxy(ProxyEnable);
	if(ProxyEnable == "1"){
		notify.Proxy = proxy;
		notify.ProxyPort = proxyport;
	}

	notify.RemoteHost=location.hostname;
	if (location.port)
		notify.RemotePort=location.port;
	else 
		notify.RemotePort=80;

	notify.SetAuthentication('<xsl:value-of select="/root/config/pageContext" />');
	notify.StartNotification();
}


function initForm(){
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){	
	<xsl:choose>
		<xsl:when test="/root/config/profiles/profile[1]/codec = 'mp4'">
			document.profile1.title='<xsl:value-of select="root/config/profiles/profile[1]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[1]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[1]/height" />'+",MPEG4";
		</xsl:when>
		<xsl:otherwise>
			document.profile1.title='<xsl:value-of select="root/config/profiles/profile[1]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[1]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[1]/height" />'+",JPEG";
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="/root/config/profiles/profile[2]/codec = 'mp4'">
			document.profile2.title='<xsl:value-of select="root/config/profiles/profile[2]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[2]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[2]/height" />'+",MPEG4";
		</xsl:when>
		<xsl:otherwise>
			document.profile2.title='<xsl:value-of select="root/config/profiles/profile[2]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[2]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[2]/height" />'+",JPEG";
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="/root/config/profiles/profile[3]/codec = 'mp4'">
			document.profile3.title='<xsl:value-of select="root/config/profiles/profile[3]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[3]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[3]/height" />'+",MPEG4";
		</xsl:when>
		<xsl:otherwise>
			document.profile3.title='<xsl:value-of select="root/config/profiles/profile[3]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[3]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[3]/height" />'+",JPEG";
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="/root/config/profiles/profile[4]/codec = 'mp4'">
			document.profile4.title='<xsl:value-of select="root/config/profiles/profile[4]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[4]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[4]/height" />'+",MPEG4";
		</xsl:when>
		<xsl:otherwise>
			document.profile4.title='<xsl:value-of select="root/config/profiles/profile[4]/fps" />'+"FPS@"+'<xsl:value-of select="/root/config/profiles/profile[4]/width" />'+"x"+'<xsl:value-of select="/root/config/profiles/profile[4]/height" />'+",JPEG";
		</xsl:otherwise>
	</xsl:choose>
	}
	if ('<xsl:value-of select="root/config/ie" />' != "false")
	{
		document.getElementById("fullScreenButton").style.display="";
		document.getElementById("snapshotButton").style.display="";
		document.getElementById("pathButton").style.display="";
		document.getElementById("recordButton").style.display="";
	}else
	{
		document.getElementById("snapshotButton").style.display="";
		document.getElementById("pathButton").style.display="";
		document.getElementById("recordButton").style.display="";
	
	}
	
	//if ('<xsl:value-of select="root/config/microphone/enable" />' == 0) {
		//document.getElementById("listenButton").style.display="none";
		//canListen = "no";
	//}
	//alert('<xsl:value-of select="root/config/ie" />');
	
	if ('<xsl:value-of select="root/config/ie" />' == "false")
	{
		document.getElementById("profile1").style.display = "";
		document.getElementById("profile2").style.display = "";
		document.getElementById("profile3").style.display = "";
		document.getElementById("profile4").style.display = "";
	}
	
	if ('<xsl:value-of select="root/config/microphone/enable" />' != 0)
		document.getElementById("listenButton").style.display="";
	else
	{
		
		document.getElementById("listenButton").style.display="none";
		canListen = "no";
	}

	//if ('<xsl:value-of select="root/config/speaker/enable" />' == 0)
		//document.getElementById("streamoutButton").style.display="none";
	if ('<xsl:value-of select="root/config/speaker/enable" />' != 0)
		document.getElementById("streamoutButton").style.display="";
	else{
		document.getElementById("streamoutButton").style.display="none";
	}
		
	//if ('<xsl:value-of select="root/config/privilege/group" />' == 'users'){
		//document.getElementById("gpOutputButton").style.display="none";
		//document.getElementById("ledButton").style.display="none";
	//}
	if ('<xsl:value-of select="root/config/privilege/group" />' != 'users'){
		document.getElementById("gpOutputButton").style.display="";
		document.getElementById("ledButton").style.display="";
	}
	else{
		document.getElementById("gpOutputButton").style.display="none";
		document.getElementById("ledButton").style.display="none";
	}
	//this part is hardware support
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == 1)
		document.getElementById("displayPT").style.display="";
	if ('<xsl:value-of select="root/common/peripheral/RS485" />' == 1){
		document.getElementById("displayPT").style.display="";
		document.getElementById("presetPoint").style.display="none";
		document.getElementById("pt_home").title="";
		document.getElementById("pt_home").alt="";
		if ('<xsl:value-of select="root/config/PTZ485/Enable" />' == 0)
			document.getElementById("displayPT").style.display="none";
	}
	
	//if ('<xsl:value-of select="root/common/peripheral/frontLED" />' == 0)
		//document.getElementById("ledButton").style.display="none";
	//if ('<xsl:value-of select="root/common/peripheral/speaker" />' == 0)
		//document.getElementById("streamoutButton").style.display="none";
	//if ('<xsl:value-of select="root/common/peripheral/microphone" />' == 0) {
		//document.getElementById("listenButton").style.display="none";
		//canListen = "no";
	//}
	if ('<xsl:value-of select="root/common/peripheral/frontLED" />' != 0)
		document.getElementById("ledButton").style.display="";
	else
		document.getElementById("ledButton").style.display="none";

	if ('<xsl:value-of select="root/common/peripheral/IR" />' != 0)
	{
		document.getElementById("irButton").style.display="";
		if( flagIRAuto == 1 || flagIRAuto == 2)
		{
			document.getElementById("irButton").style.display="none";
		}
	}	
		
	if ('<xsl:value-of select="root/common/peripheral/speaker" />' != 0){
		if ('<xsl:value-of select="root/config/speaker/enable" />' != 0)
			document.getElementById("streamoutButton").style.display="";
		else
		{
			document.getElementById("streamoutButton").style.display="none";	
		}
	
	
	}
	else
		document.getElementById("streamoutButton").style.display="none";
		
	if ('<xsl:value-of select="root/common/peripheral/microphone" />' != 0 ) {
		if ('<xsl:value-of select="root/config/microphone/enable" />' != 0)
			document.getElementById("listenButton").style.display="";
		else
		{
			document.getElementById("listenButton").style.display="none";
			canListen = "no";
		}
			
	}else{
		document.getElementById("listenButton").style.display="none";
		canListen = "no";
	}
	
	//if ('<xsl:value-of select="root/common/peripheral/GPINs" />' == 0)
		//document.getElementById("gpInputIcon").style.display="none";
	//if ('<xsl:value-of select="root/common/peripheral/GPOUTs" />' == 0)
		//document.getElementById("gpOutputButton").style.display="none";
		
	if ('<xsl:value-of select="root/common/peripheral/GPINs" />' != 0)
		document.getElementById("gpInputIcon").style.display="";
	else
		document.getElementById("gpInputIcon").style.display="none";
		
	if ('<xsl:value-of select="root/common/peripheral/GPOUTs" />' != 0)
		document.getElementById("gpOutputButton").style.display="";
	else
		document.getElementById("gpOutputButton").style.display="none";

	setLang();

	var mp4Profile = readCookie('mp4Profile');
	if (mp4Profile == "null") mp4Profile = '1';
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
		//if ('<xsl:value-of select="/root/config/profiles/profile[1]/enable" />' == "false")
			//document.getElementById("profile1").style.display="none";
		//if ('<xsl:value-of select="/root/config/profiles/profile[2]/enable" />' == "false")
			//document.getElementById("profile2").style.display="none";
		//if ('<xsl:value-of select="/root/config/profiles/profile[3]/enable" />' == "false")
			//document.getElementById("profile3").style.display="none";
		//if ('<xsl:value-of select="/root/config/profiles/profile[4]/enable" />' == "false")
			//document.getElementById("profile4").style.display="none";
			
		if ('<xsl:value-of select="/root/config/profiles/profile[1]/enable" />' != "false")
			document.getElementById("profile1").style.display="";
		else
			document.getElementById("profile1").style.display="none";
			
		if ('<xsl:value-of select="/root/config/profiles/profile[2]/enable" />' != "false")
			document.getElementById("profile2").style.display="";
		else
			document.getElementById("profile2").style.display="none";
		if ('<xsl:value-of select="/root/config/profiles/profile[3]/enable" />' != "false")
			document.getElementById("profile3").style.display="";
		else
			document.getElementById("profile3").style.display="none";
		if ('<xsl:value-of select="/root/config/profiles/profile[4]/enable" />' != "false")
			document.getElementById("profile4").style.display="";
		else
			document.getElementById("profile4").style.display="none";
				
		var activeXSize = document.getElementById("dcscontrol1");
		if (mp4Profile == '1'){
			document.profile1.src = imageSize["profile1_on_n"].src;
			flagSize = 0;
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[1]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[1]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[1]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[1]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[1]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[1]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 1;
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[1]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
		}
		else if (mp4Profile == '2'){
			document.profile2.src = imageSize["profile2_on_n"].src;
			flagSize = 1;
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[2]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[2]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[2]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[2]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[2]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[2]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 2;
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[2]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
		}
		else if (mp4Profile == '3'){
			document.profile3.src = imageSize["profile3_on_n"].src;
			flagSize = 2;
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[3]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[3]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[3]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[3]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[3]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[3]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 3;
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[3]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
		}
		else if (mp4Profile == '4'){
			document.profile4.src = imageSize["profile4_on_n"].src;
			flagSize = 3;
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[4]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[4]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[4]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[4]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[4]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[4]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 4;
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[4]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
		}

		if (dcscontrol1 != null)
			InitActiveX();
		if (notify != null)
			NotificationStart();
		setRecordPath();
		initIconPatten();
	}
	else{

		var mjpgProfile = readCookie('mjpgProfile');
		if (mjpgProfile == "null") mjpgProfile = '1';
		
		if ('<xsl:value-of select="/root/config/profiles/profile[1]/codec" />' != 'mp4')
			document.getElementById("profile1").style.display = "";
		else
			document.getElementById("profile1").style.display = "none";
		if ('<xsl:value-of select="/root/config/profiles/profile[2]/codec" />' != 'mp4')
			document.getElementById("profile2").style.display = "";
		else
			document.getElementById("profile2").style.display = "none";
		if ('<xsl:value-of select="/root/config/profiles/profile[3]/codec" />' != 'mp4')
			document.getElementById("profile3").style.display = "";
		else
			document.getElementById("profile3").style.display = "none";
		if ('<xsl:value-of select="/root/config/profiles/profile[4]/codec" />' != 'mp4')
			document.getElementById("profile4").style.display = "";
		else
			document.getElementById("profile4").style.display = "none";

		
		if(mjpgProfile != 1)
		{
			flagSize = parseInt(mjpgProfile) - 1;
		}
		else
		{
			<xsl:if test="/root/config/userSelect/profile/id = '1'">
				flagSize = 0;
			</xsl:if>
			<xsl:if test="/root/config/userSelect/profile/id = '2'">
				flagSize = 1;
			</xsl:if>
			<xsl:if test="/root/config/userSelect/profile/id = '3'">
				flagSize = 2;
			</xsl:if>
			<xsl:if test="/root/config/userSelect/profile/id = '4'">
				flagSize = 3;
			</xsl:if>
		}
		initIconPatten();
		changeIndex(flagSize+1);
		var Eventapplet = document.getElementById("EventApplet");
		try
		{
			if(Eventapplet.testInstalledJRE() != 1)
			{
				document.getElementById("testApplet").style.display = "";
			}
		}
		catch(err)
		{
			document.getElementById("testApplet").style.display = "";
		}
		window.setInterval("reflashImage()",reloadTime);
	}
	document.form1.hostname.value = "http://" + window.location.hostname;
	initAudio();

}
function setProfileToInativeImg()
{
	document.profile1.src = imageSize["profile1_off_n"].src;
	document.profile2.src = imageSize["profile2_off_n"].src;
	document.profile3.src = imageSize["profile3_off_n"].src;
	document.profile4.src = imageSize["profile4_off_n"].src;
}
function adjestBlockForNoneIE(userSelectWidth,userSelectWidthHeight,selectedID)
{
	flagSize = selectedID-1;
	if(userSelectWidth == 1024)
	{
			document.getElementById("topnav_container_index").style.display="none";
			document.getElementById("footer_container").style.width="1200px";
			document.getElementById("header_container").style.width="1200px";
			document.getElementById("indexWidth1").style.width="1200px";
			document.getElementById("indexWidth2").style.width="1200px";
		}
		if(userSelectWidth == 1280){
			document.getElementById("topnav_container_index").style.display="none";
			document.getElementById("footer_container").style.width="1460px";
			document.getElementById("header_container").style.width="1460px";
			document.getElementById("indexWidth1").style.width="1460px";
			document.getElementById("indexWidth2").style.width="1460px";
		}
		else
		{
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873px";
			document.getElementById("header_container").style.width="873px";
			document.getElementById("indexWidth1").style.width="873px";
			document.getElementById("indexWidth2").style.width="873px";
		}
		document.getElementById("showWidth").innerHTML = userSelectWidth;
		document.getElementById("showHeight").innerHTML = userSelectWidthHeight;
		setProfileToInativeImg();
		document.getElementById("profile"+ selectedID).src = imageSize["profile"+ selectedID +"_on_n"].src;
}
function closeForm(){
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
		var activeXSize = document.getElementById("dcscontrol1");
		dcscontrol1.Stop();
	}
	
}

function setLang(){
	var seLang = document.getElementById('lang');
	seLang.value = 0;
	var lang = readCookie('language');
	if (lang == 'eng') {
		seLang.value = 0;
	}
	else if (lang == 'cht') {
		seLang.value = 1;
	}
	else if (lang == 'chs') {
		seLang.value = 2;
	}
	else if (lang == 'jpn') {
		seLang.value = 3;
	}
}

function setRecordPath(){
	var path = document.getElementById('savePath');
	path.value = readCookie('savePath');
	if (path.value == "null"){/*alert("null")*/}
	else
		dcscontrol1.StoringPath = path.value;
}


function changeIndex(profileid) 
{
	var RecordApplet = document.getElementById("RecordApplet");

	if(flagRecording == true)
	{
		RecordApplet.StopRecordStreamIn();
		setImageRecord('stopRecord');
	}
	profileForNonIE = profileid;
	RecordApplet.ProfileID = profileid;
	RecordApplet.imageWidth = eval("profile"+profileid+"Width");
	RecordApplet.imageHeight = eval("profile"+profileid+"Height");
	
	document.getElementById("mjpgImage").src= "";
	document.getElementById("mjpgImage").src="/video/mjpg.cgi?profileid="+profileid;
	document.getElementById("mjpgImage").style.width = eval("profile"+profileid+"Width")+"px";
	document.getElementById("mjpgImage").style.height = eval("profile"+profileid+"Height")+"px";
	
	adjestBlockForNoneIE(eval("profile"+profileid+"Width"),eval("profile"+profileid+"Height"),profileid);
	createCookie('mjpgProfile', profileid , '365' );
	
	if(flagRecording == true)
	{
		RecordApplet.RecordStreamIn();
		setImageRecord('recording');	
	}
}

function changeSize(selectedSize){
	var activeXSize = document.getElementById("dcscontrol1");
	if (!activeXSize)
		return;

	if (selectedSize == '0'){
		if (flagSize != '0'){
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[1]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[1]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[1]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[1]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[1]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[1]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 1;
			flagSize = 0;
			createCookie( 'mp4Profile', '1', '365' );
			document.profile1.src = imageSize["profile1_on_n"].src;
			document.profile2.src = imageSize["profile2_off_n"].src;
			document.profile3.src = imageSize["profile3_off_n"].src;
			document.profile4.src = imageSize["profile4_off_n"].src;
			activeXSize.Stop();
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[1]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
			activeXSize.DynamicProfile(1);
			activeXSize.play();
			if (flagRecording == true) {
				recording();
			}
		}
	}
	else if (selectedSize == '1'){
		if (flagSize != '1'){
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[2]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[2]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[2]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[2]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[2]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[2]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 2;
			flagSize = 1;
			createCookie( 'mp4Profile', '2', '365' );
			document.profile1.src = imageSize["profile1_off_n"].src;
			document.profile2.src = imageSize["profile2_on_n"].src;
			document.profile3.src = imageSize["profile3_off_n"].src;
			document.profile4.src = imageSize["profile4_off_n"].src;
			activeXSize.Stop();
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[2]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
			activeXSize.DynamicProfile(1);
			activeXSize.play();
			if (flagRecording == true) {
				recording();
			}
		}
	}
	else if (selectedSize == '2'){
		if (flagSize != '2'){
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[3]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[3]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[3]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[3]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[3]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[3]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 3;
			flagSize = 2;
			createCookie( 'mp4Profile', '3', '365' );
			document.profile1.src = imageSize["profile1_off_n"].src;
			document.profile2.src = imageSize["profile2_off_n"].src;
			document.profile3.src = imageSize["profile3_on_n"].src;
			document.profile4.src = imageSize["profile4_off_n"].src;
			activeXSize.Stop();
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[3]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
			activeXSize.DynamicProfile(1);
			activeXSize.play();
			if (flagRecording == true) {
				recording();
			}
		}
	}
	else if (selectedSize == '3'){
		if (flagSize != '3'){
			activeXSize.width  = '<xsl:value-of select="/root/config/profiles/profile[4]/width" />';
			activeXSize.height = '<xsl:value-of select="/root/config/profiles/profile[4]/height" />';
			document.getElementById("showWidth").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[4]/width" />';
			document.getElementById("showHeight").innerHTML = '<xsl:value-of select="/root/config/profiles/profile[4]/height" />';
			document.getElementById("topnav_container_index").style.display="";
			document.getElementById("footer_container").style.width="873";
			document.getElementById("header_container").style.width="873";
			document.getElementById("indexWidth1").style.width="873";
			document.getElementById("indexWidth2").style.width="873";
			if(<xsl:value-of select="/root/config/profiles/profile[4]/width" /> == 1024){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1200";
				document.getElementById("header_container").style.width="1200";
				document.getElementById("indexWidth1").style.width="1200";
				document.getElementById("indexWidth2").style.width="1200";
			}
			if(<xsl:value-of select="/root/config/profiles/profile[4]/width" /> == 1280){
				document.getElementById("topnav_container_index").style.display="none";
				document.getElementById("footer_container").style.width="1460";
				document.getElementById("header_container").style.width="1460";
				document.getElementById("indexWidth1").style.width="1460";
				document.getElementById("indexWidth2").style.width="1460";
			}
			activeXSize.ProfileID = 4;
			flagSize = 3;
			createCookie( 'mp4Profile', '4', '365' );
			document.profile1.src = imageSize["profile1_off_n"].src;
			document.profile2.src = imageSize["profile2_off_n"].src;
			document.profile3.src = imageSize["profile3_off_n"].src;
			document.profile4.src = imageSize["profile4_on_n"].src;
			activeXSize.Stop();
			<xsl:choose>
				<xsl:when test="/root/config/profiles/profile[4]/codec = 'mp4'">
					activeXSize.SetStreamType(0);
				</xsl:when>
				<xsl:otherwise>
					activeXSize.SetStreamType(1);
				</xsl:otherwise>
			</xsl:choose>
			activeXSize.DynamicProfile(1);
			activeXSize.play();
			if (flagRecording == true) {
				recording();
			}
		}
	}
	else if (selectedSize == '4'){
		activeXSize.SetFullScreen(1);
	}

	if (canListen == "no" || flagListen == "off") 
		activeXSize.StopLiveStreamIn(2);
	else
	{
		activeXSize.SetAudioStreamType(audioType);
		activeXSize.LiveStreamIn(2);
	}
}

//for snapshot
function snapshot(){
	overImage('snapshotPatten');
	if (ieCheck())
                dcscontrol1.snapshot();
        else {
			var RecordApplet = document.getElementById("RecordApplet");
			RecordApplet.snapshot();
        }
}

//for recording path
function setPath(){
/*
	var filepath;
	var path = document.getElementById('savePath');
	overImage('path_setting');
//	alert("readCookie = " + readCookie('savePath'))

	if (readCookie('savePath') == "null")
		filepath = dcscontrol1.SelectDirectory(dcscontrol1.StoringPath);
	else
		filepath = dcscontrol1.SelectDirectory(path.value);
		
	if(filepath != ""){
		dcscontrol1.StoringPath = filepath;
		createCookie( 'savePath', filepath, '365' );
		path.value = filepath;
	}
//	alert("StoringPath = " + dcscontrol1.StoringPath)
*/
	var sLocalPath = readCookie("savePath");
	overImage("path_setting");
	//alert("sLocalPath = "+sLocalPath);
	if (sLocalPath == "null") {
		if (ieCheck())
			sLocalPath = dcscontrol1.SelectDirectory(dcscontrol1.StoringPath);
		else {
			var RecordApplet = document.getElementById("RecordApplet");
			RecordApplet.SelectDirectory(sLocalPath);
		}
	}
	else {
		if (ieCheck())
			sLocalPath = dcscontrol1.SelectDirectory(sLocalPath);
		else {
			var RecordApplet = document.getElementById("RecordApplet");
			RecordApplet.SelectDirectory(sLocalPath);
		}
	}
	//It will store the original value or new local path value.
	if (sLocalPath != "") {
		if (ieCheck()){
			dcscontrol1.StoringPath = sLocalPath;
			createCookie('savePath', sLocalPath, '365');
		}
	}
}

function savePath_java(pathstring){
	var path = pathstring;
	createCookie('savePath', path, '365');
}

function record(){
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
		if(flagRecording == false){
			setImageRecord('recording')
			recording();
			document.recordButton.alt = '<xsl:value-of select="root/lang/body/stopRecording" />';
			document.recordButton.title = '<xsl:value-of select="root/lang/body/stopRecording" />';
			flagRecording = true;
		}
		else{
			setImageRecord('stopRecord')
			stopRecording();
			document.recordButton.alt = '<xsl:value-of select="root/lang/body/recording" />';
			document.recordButton.title = '<xsl:value-of select="root/lang/body/recording" />';
			flagRecording = false;
		}
	} 
	else 
	{
		if(flagRecording == false)
		{
			setImageRecord('recording');
			flagRecording = true;
			var RecordApplet = document.getElementById("RecordApplet");
			RecordApplet.RecordStreamIn();
			document.recordButton.alt = '<xsl:value-of select="root/lang/body/stopRecording" />';
			document.recordButton.title = '<xsl:value-of select="root/lang/body/stopRecording" />';
        }
        else
		{
        	setImageRecord('stopRecord');
			flagRecording = false;
			var RecordApplet = document.getElementById("RecordApplet");
			RecordApplet.StopRecordStreamIn();
        	document.recordButton.alt = '<xsl:value-of select="root/lang/body/recording" />';
        	document.recordButton.title = '<xsl:value-of select="root/lang/body/recording" />';
        }
	}
}
//for recording
function recording(){
	if(dcscontrol1.IsOnRecordStreamIn(0))
		dcscontrol1.StopRecordStreamIn(0);
	else
		dcscontrol1.RecordStreamIn(0);
}

//stop recording
function stopRecording(){
	dcscontrol1.StopRecordStreamIn(0);
}

function disableButton(flag){
	document.getElementById("f_Browse").disabled = flag;
	document.getElementById("f_snapshot").disabled = flag;
}

function stream(){
	if(flagStreaming == false){
		setImageStream('streamOut');
		flagStreaming = true;
		startSteamOut();
		document.streamoutButton.alt = '<xsl:value-of select="root/lang/body/stopSteamOut" />';
		document.streamoutButton.title = '<xsl:value-of select="root/lang/body/stopSteamOut" />';
	}
	else{
		setImageStream('stopStreamOut');
		flagStreaming = false;
		stopSteamOut();
		document.streamoutButton.alt = '<xsl:value-of select="root/lang/body/startSteamOut" />';
		document.streamoutButton.title = '<xsl:value-of select="root/lang/body/startSteamOut" />';
	}
}

//start steam out
function startSteamOut(){
	if (ieCheck())
		dcscontrol1.StartStreamOut();
	else {
		//var cxplugApplet = document.getElementById("xplugApplet");
		var speakerApplet = document.getElementById("Speaker");
		speakerApplet.StartStreamOut();
	}
}

//stop steam out
function stopSteamOut(){
	if (ieCheck())
		dcscontrol1.StopStreamOut();
	else {
		//var cxplugApplet = document.getElementById("xplugApplet");
		var speakerApplet = document.getElementById("Speaker");
		speakerApplet.StopStreamOut();
	}
}

//steam out event
function Stream_OnStreamOutNotify(Result){
//	alert("Audio stream out has been used!");
	document.streamoutButton.src = imageStreamOut["talk_off_n"].src;
	document.streamoutButton.alt = '<xsl:value-of select="root/lang/body/startSteamOut" />';
	document.streamoutButton.title = '<xsl:value-of select="root/lang/body/startSteamOut" />';
	flagStreaming = false;

	if(Result == 1)
		alert(talkNotify1);
	if(Result == 2)
		alert(talkNotify2);
	if(Result == 3)
		alert(talkNotify3);
}

function listen(){
	if (canListen == "no")
		return;

	if(flagListen == "on"){
		setImageListen('listenOff');
		flagListen = "off";
		createCookie( 'flagListen', 'off', '365' );
		if (ieCheck())
			dcscontrol1.StopLiveStreamIn(2);
		else {
			//var cxplugApplet = document.getElementById("xplugApplet");
			var audioApplet = document.getElementById("Audio");
			audioApplet.StopLiveStreamIn();
			audioApplet.style.display = "none";
		}
		document.listenButton.alt = '<xsl:value-of select="root/lang/body/listenOn" />';
		document.listenButton.title = '<xsl:value-of select="root/lang/body/listenOn" />';
	}
	else{
		setImageListen('listenOn');
		flagListen = "on";
		createCookie( 'flagListen', 'on', '365' );
		if (ieCheck())
		{
			dcscontrol1.SetAudioStreamType(audioType);
			dcscontrol1.LiveStreamIn(2);
		}
		else {
			var audioApplet = document.getElementById("Audio");
			//var cxplugApplet = document.getElementById("xplugApplet");
			audioApplet.style.display = "";
			audioApplet.LiveStreamIn();
		}
		document.listenButton.alt = '<xsl:value-of select="root/lang/body/listenOff" />';
		document.listenButton.title = '<xsl:value-of select="root/lang/body/listenOff" />';
	}
}

function swapImageMotion(index){
	if (index == 0)
		setImageMotion('motionOff');
	else
		setImageMotion('motionOn');
}

function swapImageNotifyRecord(index){
	if (index == 0)
		setImageNotifyRecord('notifyRecordOff');
	else
		setImageNotifyRecord('notifyRecordOn');
}

function swapImageGPInput(inputNum, index){
	if (index == 0)
		setImageGPInput('gpInputOff');
	else
		setImageGPInput('gpInputOn');
}

function gpOutput(){
	if (flagGPOutput == "on"){
		setImageGPOutput('stopGPOutput');
		sendGPOutput(0);
		document.gpOutputButton.alt = '<xsl:value-of select="root/lang/body/startGPOutput" />';
		document.gpOutputButton.title = '<xsl:value-of select="root/lang/body/startGPOutput" />';
		flagGPOutput = "off";
	}
	else{
		setImageGPOutput('startGPOutput');
		sendGPOutput(1);
		document.gpOutputButton.alt = '<xsl:value-of select="root/lang/body/stopGPOutput" />';
		document.gpOutputButton.title = '<xsl:value-of select="root/lang/body/stopGPOutput" />';
		flagGPOutput = "on";
	}
}

function led(){
	if(flagLed == "on"){
		setImageLed('ledOff');
		sendLed(0);
		document.ledButton.alt = '<xsl:value-of select="root/lang/body/ledOn" />';
		document.ledButton.title = '<xsl:value-of select="root/lang/body/ledOn" />';
		flagLed = "off";
	}
	else{
		setImageLed('ledOn');
		sendLed(1);
		document.ledButton.alt = '<xsl:value-of select="root/lang/body/ledOff" />';
		document.ledButton.title = '<xsl:value-of select="root/lang/body/ledOff" />';
		flagLed = "on";
	}
}

function ir(){
	if(flagIRState == 1 ){
		setImageIR('irOff');
		sendIR(0);
		document.irButton.alt = '<xsl:value-of select="root/lang/body/irOn" />';
		document.irButton.title = '<xsl:value-of select="root/lang/body/irOn" />';
		flagIRState = 0;
	}
	else{
		setImageIR('irOn');
		sendIR(1);
		document.irButton.alt = '<xsl:value-of select="root/lang/body/irOff" />';
		document.irButton.title = '<xsl:value-of select="root/lang/body/irOff" />';
		flagIRState = 1;
	}
}


function initIconPatten(){
	if(flagGPOutput == "on"){
		document.gpOutputButton.src = imageGPOutput["output_on_n"].src;
		document.gpOutputButton.alt = '<xsl:value-of select="root/lang/body/stopGPOutput" />';
		document.gpOutputButton.title = '<xsl:value-of select="root/lang/body/stopGPOutput" />';
	}
	else{
		document.gpOutputButton.src = imageGPOutput["output_off_n"].src;
		document.gpOutputButton.alt = '<xsl:value-of select="root/lang/body/startGPOutput" />';
		document.gpOutputButton.title = '<xsl:value-of select="root/lang/body/startGPOutput" />';
	}

	if(flagLed == "on"){
		document.ledButton.src = imageLed["led_on_n"].src;
		document.ledButton.alt = '<xsl:value-of select="root/lang/body/ledOff" />';
		document.ledButton.title = '<xsl:value-of select="root/lang/body/ledOff" />';
	}
	else{
		document.ledButton.src = imageLed["led_off_n"].src;
		document.ledButton.alt = '<xsl:value-of select="root/lang/body/ledOn" />';
		document.ledButton.title = '<xsl:value-of select="root/lang/body/ledOn" />';
	}
	if(flagIRState == 1){
		document.irButton.src = imageIr["ir_on_n"].src;
		document.irButton.alt = '<xsl:value-of select="root/lang/body/irOff" />';
		document.irButton.title = '<xsl:value-of select="root/lang/body/irOff" />';
	}
	else{
		document.irButton.src = imageIr["ir_off_n"].src;
		document.irButton.alt = '<xsl:value-of select="root/lang/body/irOn" />';
		document.irButton.title = '<xsl:value-of select="root/lang/body/irOn" />';
	}
	//init listen icon and status	
}
function initAudio()
{
	if(flagListen != "on"){
		if(flagListen != "off")
			flagListen = "on";
	}
	if(flagListen == "on"){
		document.listenButton.src = imageListen["listen_on_f"].src;
		document.listenButton.alt = '<xsl:value-of select="root/lang/body/listenOff" />';
		document.listenButton.title = '<xsl:value-of select="root/lang/body/listenOff" />';
		if (ieCheck()) {
			if (canListen == "yes")
			{
				dcscontrol1.SetAudioStreamType(audioType);
				dcscontrol1.LiveStreamIn(2);
			}
			else
				dcscontrol1.StopLiveStreamIn(2);
		}
		else {
			//var cxplugApplet = document.getElementById("xplugApplet");
			var audioApplet = document.getElementById("Audio");
			
			if (canListen == "yes")
			{
				audioApplet.style.display = "";
				audioApplet.LiveStreamIn();
			}
			else
			{
				audioApplet.StopLiveStreamIn();
				audioApplet.style.display = "none";
				
			}
		}
	}
	else{
		document.listenButton.src = imageListen["listen_off_f"].src;
		document.listenButton.alt = '<xsl:value-of select="root/lang/body/listenOn" />';
		document.listenButton.title = '<xsl:value-of select="root/lang/body/listenOn" />';
		if (ieCheck())
			dcscontrol1.StopLiveStreamIn(2);
		else {
			//var cxplugApplet = document.getElementById("xplugApplet");
			var audioApplet = document.getElementById("Audio");
			audioApplet.StopLiveStreamIn();
			audioApplet.style.display = "none";
		}
	}
}
function reloadImg()
{
	reflashImage();
}
function showDiscWritingError(fileName)
{
	var errMsg = '<xsl:value-of select="root/lang/body/errRecord" />';
	var status =  document.getElementById("recordStatus");
	status.style.display = "";
	document.getElementById("errMsg").innerHTML = fileName + errMsg;
}	
function hideDiscWritingError(fileName)
{
	document.getElementById("recordStatus").style.display = "none";
	
}
/* for reload mjpg
var imgError;
var errorTime = 2000;
var errFlag;
function imageError()
{
	if(!errFlag)
	{
		imgError = window.setInterval("reflashImage()",errorTime);
		errFlag = true;
	}
}
function imageLoaded()
{
	errFlag = false;
	clearInterval(imgError);
}
*/
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleLiveVideo" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleLiveVideo" /></title>
</xsl:if>
<style type="text/css">
<xsl:comment>
.style1 {font-size: 11px}
</xsl:comment>
</style>
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();" onunload="closeForm();">
<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="873" align="center">
<tr>
	<td width="100%"><xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/cameraName" /></td>
	<td align="right" nowrap="nowrap">&nbsp;</td>
	<td align="right" nowrap="nowrap"><xsl:value-of select="root/lang/frame/version" /><xsl:value-of select="root/common/version" /></td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="873" align="center" id="topnav_container_index">
<tr>
	<td align="center" valign="middle"><img src="images/dlink.gif" width="871" height="92" /></td>
</tr>
</table>
<table border="0" cellpadding="2" cellspacing="1" width="873" align="center" bgcolor="#FFFFFF" id="indexWidth2">
<tr id="topnav_container">
	    <xsl:if test="root/common/peripheral/wireless = '0'">
			<td width="125"><img src="images/model.gif" width="125" height="25" /></td>
		</xsl:if>
		<xsl:if test="root/common/peripheral/wireless = '1'">
			<td width="125"><img src="images/model_w.gif" width="125" height="25" /></td>
		</xsl:if>
	<td id="topnavon_index"><a href="index.cgi"><xsl:value-of select="root/lang/frame/home" /></a></td>
	<td id="topnavoff_index"><a href="admin/adv_wizard.cgi"><xsl:value-of select="root/lang/frame/advanced" /></a></td>
	<td id="topnavoff_index"><a href="admin/tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
	<td id="topnavoff_index"><a href="admin/st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
	<td id="topnavoff_index"><a href="admin/support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
</tr>
</table>
<table border="0" cellpadding="2" cellspacing="1" width="873" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF" id="indexWidth1">
<tr>
	<td valign="top" id="sidenav_container" width="125">
		<form id="form1" name="form1">
		<table width="100%" cellspacing="0" cellpadding="2" bgcolor="#ffffff" border="0">
		<tbody>
		<tr>
			<input name="hostname" id="hostname" type="hidden" size="30" value="hostname" />
			<input name="resultCode" type="hidden" size="15" value="N/A" />
			<input name="savePath" id="savePath" type="hidden" size="100" value="" />
			<td id="sidenav_container_less">
				<p align="center">
					<img id="gpInputIcon" name="gpInputIcon" src="images/digital_input_off.gif" width="27" height="32" alt="{root/lang/body/diIndicator}" title="{root/lang/body/diIndicator}" />
					<img id="motionIcon" name="motionIcon" src="images/motion_notification_off.gif" width="37" height="33" alt="{root/lang/body/moIndicator}" title="{root/lang/body/moIndicator}" />
					<img id="recordIcon" name="recordIcon" src="images/server_recorde_off.gif" width="35" height="32" alt="{root/lang/body/reIndicator}" title="{root/lang/body/reIndicator}" />				</p>
				<div id="sidenav">
					<ul>
					  	<li>
							<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/camera" /></div>
						</li>
						<li>
							<div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
						</li>
					</ul>
				</div>
				<div id="displayPT" style="display:none"><div align="center">
					<br />
					<img name="PTControl" src="images/way_control.jpg" width="110" height="110" border="0" usemap="#MapMap" align="center" />
					<map name="MapMap" id="MapMap">
						<area shape="poly" coords="0,36,14,15,35,1,35,20,28,25,24,30,20,36" onmousedown="pressImage('left_up')" onmouseup="return move(-1, 1, 'left_up');" onmouseover="overImage('left_up')" onmouseout="outImage('pt_out')" id="pt_left_up" alt="left up" title="left up" />
						<area shape="poly" coords="35,-7,73,-11,74,20,66,17,56,16,44,17,35,20" onmousedown="pressImage('up')" onmouseup="return move(0, 1, 'up');" onmouseover="overImage('up')" onmouseout="outImage('pt_out')" id="pt_up" alt="up" title="up" />
						<area shape="poly" coords="74,1,94,14,108,36,90,36,85,30,80,24,73,20" onmousedown="pressImage('right_up')" onmouseup="return move(1, 1, 'right_up');" onmouseover="overImage('right_up')" onmouseout="outImage('pt_out')" id="pt_right_up" alt="right up" title="right up" />
						<area shape="poly" coords="22,73,0,73,0,36,20,36,17,44,16,52,17,60,18,68" onmousedown="pressImage('left')" onmouseup="return move(-1, 0, 'left');" onmouseover="overImage('left')" onmouseout="outImage('pt_out')" id="pt_left" alt="left" title="left" />
						<area shape="circle" coords="55,55,15" onmousedown="pressImage('home')" onmouseup="return home();" onmouseover="overImage('home')" onmouseout="outImage('pt_out')" id="pt_home" alt="home" title="home" />
						<area shape="poly" coords="113,36,113,73,88,73,93,64,94,55,94,46,91,36" onmousedown="pressImage('right')" onmouseup="return move(1, 0, 'right');" onmouseover="overImage('right')" onmouseout="outImage('pt_out')" id="pt_right" alt="right" title="right" />
						<area shape="poly" coords="21,73,0,73,15,96,36,108,36,88,30,83,25,78" onmousedown="pressImage('left_down')" onmouseup="return move(-1, -1, 'left_down');" onmouseover="overImage('left_down')" onmouseout="outImage('pt_out')" id="pt_left_down" alt="left down" title="left down" />
						<area shape="poly" coords="36,87,36,111,74,114,74,86,66,90,55,91,44,90" onmousedown="pressImage('down')" onmouseup="return move(0, -1, 'down');" onmouseover="overImage('down')" onmouseout="outImage('pt_out')" id="pt_down" alt="down" title="down" />
						<area shape="poly" coords="74,86,74,108,95,94,110,73,88,73,86,78,79,83" onmousedown="pressImage('right_down')" onmouseup="return move(1, -1, 'right_down');" onmouseover="overImage('right_down')" onmouseout="outImage('pt_out')" id="pt_right_down" alt="right down" title="right down" />
						<area shape="poly" coords="55,39,55,15,41,17,27,27,19,39,16,56,21,73,30,84,42,89,55,91,55,69,44,65,40,53,44,44" onmousedown="pressImage('zoon_in')" onmouseup="return zoonIn();" onmouseover="overImage('zoon_in')" onmouseout="outImage('pt_out')" id="pt_zoon_in" alt="Zoom-in" title="Zoom in" />
						<area shape="poly" coords="55,16,70,19,84,27,91,37,94,50,92,65,87,78,74,86,65,91,55,91,55,70,63,66,68,59,68,51,64,43,55,40" onmousedown="pressImage('zoon_out')" onmouseup="return zoonOut();" onmouseover="overImage('zoon_out')" onmouseout="outImage('pt_out')" id="pt_zoon_out" alt="Zoom-out" title="Zoom out" />
						<area shape="poly" coords="18,22" href="#" />
					</map></div>
					<br />
					<div id="presetPoint">
					<div align="center">
							<input name="button2" type="button" onclick="return sendPatrol('single_pan');" value="{root/lang/body/autoPan}" />
							<input name="button" type="button" onclick="return sendPatrol('single_patrol');" value="{root/lang/body/autoPatrol}" />
					<input name="button" type="button" onclick="return sendPatrol('stop');" value="{root/lang/body/stop}" />
					</div><br />
					<font color="#FFFFFF"><xsl:value-of select="root/lang/body/goTo" /></font>
					<br />
					<select name="presetName" id="presetName" onChange="goPreset()">
						<option value="0" selected="selected" ><xsl:value-of select="root/lang/body/selectOne" /></option>
						<xsl:for-each select="root/config/preset">
						<option value="{presetName}"><xsl:value-of select="presetName"/></option>
						</xsl:for-each>
					</select>
					<br /><br />
					</div>
					<font color="#FFFFFF"><xsl:value-of select="root/lang/body/panSpeed" /></font>
					<br />
					<select name="panSpeed" id="panSpeed">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10" selected="selected">10</option>
					</select>
					<br />
					<br />
					<font color="#FFFFFF"><xsl:value-of select="root/lang/body/tiltSpeed" /></font>
					<br />
					<select name="tiltSpeed" id="tiltSpeed">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10" selected="selected">10</option>
					</select>
					</div>
				<br />
					<font color="#FFFFFF"><xsl:value-of select="root/lang/body/language" /></font>
					<br />
					<select name="lang" id="lang" onchange="return changeLanguage(this.value);" >
						<option value="0"><xsl:value-of select="root/lang/body/english" /></option>
						<option value="1"><xsl:value-of select="root/lang/body/mandarin" /></option>
					</select>			</td>
		</tr>
		</tbody>
		</table>
		
		</form>
	</td>
	<td valign="top" id="maincontent_container">
		<div id="maincontent">
			<div id="box_header">
				<h1><xsl:value-of select="root/lang/body/camera" /></h1>
				<xsl:value-of select="root/lang/body/description1" /> <br />
				<xsl:value-of select="root/lang/body/description2" />
				<span name="showWidth" id="showWidth"></span>&nbsp;x <span name="showHeight" id="showHeight"></span>
			</div>
			<div class="box">
				<h2><xsl:value-of select="root/lang/body/liveVideo" /></h2>
				<div align="center">
					<xsl:if test="/root/config/ie = 'true'">
					<object classid="clsid:721700FE-7F0E-49C5-BDED-CA92B7CB1245" codebase="/dcsclictrl.cab#version=1,0,0,3818" id="dcscontrol1" width="0" height="0">
						<param name="RemoteHost" value="127.0.0.1" />
						<param name="RemotePort" value="80" />
					</object>
					<object classid="clsid:22CF8705-058B-4C21-9F44-09FEC1175BEB" codebase="/dcsclictrl.cab#version=1,0,0,3818" id="notify"></object>
					</xsl:if>
					
					<xsl:if test="/root/config/ie = 'false'">
					<!-- disable java applet temparately-->
					<img id="mjpgImage" alt="Processing..." width="0" height="0"/>
					<object classid="java:Audio.class" type="application/x-java-applet" archive="Audio.jar" width="0" height="0" name="Audio" id="Audio" style="display:none">
						<param name="codebase" value="" />
						<param name="scriptable" value="true" />
						<param name="type" value="application/x-java-applet;version=1.4" />
						<param name="RemotePort" value="80" />
						<param name="AudioFormat" value="msadpcm" />
						<param name="mayscript" value="true" />
						<param name="productID" value="{/root/common/product}" />
						<param name="pageContext" value="{/root/config/pageContext}" />
						<param name="microphone" value="{/root/config/microphone/enable}" />
					</object>
					<object classid="java:Speaker.class" type="application/x-java-applet" archive="Speaker.jar" width="0" height="0" name="Speaker" id="Speaker">
						<param name="codebase" value="" />
						<param name="scriptable" value="true" />
						<param name="type" value="application/x-java-applet;version=1.4" />
						<param name="RemotePort" value="80" />
						<param name="mayscript" value="true" />
						<param name="productID" value="{/root/common/product}" />
						<param name="profileid" value="{/root/config/userSelect/profile/id}" />
						<param name="pageContext" value="{/root/config/pageContext}" />
						<param name="speaker" value="{/root/config/speaker/enable}" />
					</object>
					<object classid="java:Record.class" type="application/x-java-applet" archive="Record.jar" width="0" height="0" name="RecordApplet" id="RecordApplet">
						<param name="codebase" value="" />
						<param name="scriptable" value="true" />
						<param name="type" value="application/x-java-applet;version=1.4" />
						<param name="mayscript" value="true" />
						<param name="AudioFormat" value="msadpcm" /> <!-- supporting format 1. pcm 2. mulaw 3. msadpcm -->
						<param name="productID" value="{/root/common/product}" />
						<param name="profileid" value="{/root/config/userSelect/profile/id}" />
						<param name="imageWidth" value="{/root/config/userSelect/profile/width}" />
						<param name="imageHeight" value="{/root/config/userSelect/profile/height}" />
						<param name="pageContext" value="{/root/config/pageContext}" />
						<param name="microphone" value="{/root/config/microphone/enable}" />
					</object>
					<object classid="java:Event.class" type="application/x-java-applet" archive="Event.jar" width="0" height="0" name="EventApplet" id="EventApplet">
						<param name="codebase" value="" />
						<param name="scriptable" value="true" />
<param name="type" value="application/x-java-applet;version=1.4" />
						<param name="mayscript" value="true" />
						<param name="webEvent" value="0" />
						<param name="pageContext" value="{/root/config/pageContext}" />
					</object>
					</xsl:if>
			  </div>
				<label></label>
				<br />
				<div align="center">
					<xsl:if test="/root/config/ie = 'true'">
					<img style="display:none" name="profile1" id="profile1" src="images/profile1_off_n.gif" width="35" height="29" onmousedown="pressImage('profile1')" onmouseup="changeSize(0);" onmouseover="overImage('profile1')" onmouseout="outImage('profile1')" alt="1" title="Profile 1"/> 
					<img style="display:none" name="profile2" id="profile2" src="images/profile2_off_n.gif" width="35" height="29" onmousedown="pressImage('profile2')" onmouseup="changeSize(1);" onmouseover="overImage('profile2')" onmouseout="outImage('profile2')" alt="2" title="Profile 2"/>
					<img style="display:none" name="profile3" id="profile3" src="images/profile3_off_n.gif" width="35" height="29" onmousedown="pressImage('profile3')" onmouseup="changeSize(2);" onmouseover="overImage('profile3')" onmouseout="outImage('profile3')" alt="3" title="Profile 3"/>
					<img style="display:none" name="profile4" id="profile4" src="images/profile4_off_n.gif" width="35" height="29" onmousedown="pressImage('profile4')" onmouseup="changeSize(3);" onmouseover="overImage('profile4')" onmouseout="outImage('profile4')" alt="4" title="Profile 4"/>
					<img style="display:none" name="fullScreenButton" id="fullScreenButton" src="images/full_screen_n.gif" width="35" height="29" onmousedown="pressImage('fullScreenPatten')" onmouseup="changeSize(4);" onmouseover="overImage('fullScreenPatten')" onmouseout="outImage('fullScreenPatten')" alt="{root/lang/body/fullScreen}" title="{root/lang/body/fullScreen}"/>
					</xsl:if>
					<xsl:if test="/root/config/ie = 'false'">
					    <img style="display:none" name="profile1" id="profile1" src="images/profile1_off_n.gif" width="35" height="29" onmousedown="pressImage('profile1')" onmouseup="changeIndex(1);" onmouseover="overImage('profile1')" onmouseout="outImage('profile1')" alt="1" title="Profile 1"/> 
					    <img style="display:none" name="profile2" id="profile2" src="images/profile2_off_n.gif" width="35" height="29" onmousedown="pressImage('profile2')" onmouseup="changeIndex(2);" onmouseover="overImage('profile2')" onmouseout="outImage('profile2')" alt="2" title="Profile 2"/>
					    <img style="display:none" name="profile3" id="profile3" src="images/profile3_off_n.gif" width="35" height="29" onmousedown="pressImage('profile3')" onmouseup="changeIndex(3);" onmouseover="overImage('profile3')" onmouseout="outImage('profile3')" alt="3" title="Profile 3"/>
					    <img style="display:none" name="profile4" id="profile4" src="images/profile4_off_n.gif" width="35" height="29" onmousedown="pressImage('profile4')" onmouseup="changeIndex(4);" onmouseover="overImage('profile4')" onmouseout="outImage('profile4')" alt="4" title="Profile 4"/>
					</xsl:if>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!--<img name="iconLine1" id="iconLine1" src="images/line.gif" width="1" height="43" />&nbsp;-->
					<img style="display:none" name="snapshotButton" id="snapshotButton" src="images/snapshot_n.gif" width="35" height="29" onmousedown="pressImage('snapshotPatten')" onmouseup="snapshot()" onmouseover="overImage('snapshotPatten')" onmouseout="outImage('snapshotPatten')" alt="{root/lang/body/snapshot}" title="{root/lang/body/snapshot}" /> 
					<img style="display:none" name="recordButton" id="recordButton" src="images/recorde_off_n.gif" width="35" height="29" onmousedown="pressImage('recordPatten')" onmouseup="record();" onmouseover="overImage('recordPatten')" onmouseout="outImage('recordPatten')" alt="{root/lang/body/recording}" title="{root/lang/body/recording}" /> 
					<img  style="display:none" name="pathButton" id="pathButton" src="images/path_setting_n.gif" width="35" height="29" onmousedown="pressImage('path_setting')" onmouseup="setPath()" onmouseover="overImage('path_setting')" onmouseout="outImage('path_setting')" alt="{root/lang/body/setPath}" title="{root/lang/body/setPath}"/> 
					<!--<img src="images/line.gif" width="1" height="43" />&nbsp;-->
					<img style="display:none" name="listenButton" id="listenButton" src="images/listen_on_n.gif" width="35" height="29" onmousedown="pressImage('listenPatten')" onmouseup="listen();" onmouseover="overImage('listenPatten')" onmouseout="outImage('listenPatten')" alt="{root/lang/body/listenOff}" title="{root/lang/body/listenOff}" /> 
					<img style="display:none" name="streamoutButton" id="streamoutButton"  src="images/talk_off_n.gif" width="35" height="29" onmousedown="pressImage('streamoutPatten')" onmouseup="stream();" onmouseover="overImage('streamoutPatten')" onmouseout="outImage('streamoutPatten')" alt="{root/lang/body/startSteamOut}" title="{root/lang/body/startSteamOut}" /> 
					<!--<span name="iconLine2" id="iconLine2" style="display:none"><img src="images/line.gif" width="1" height="43" /></span>-->
					<img style="display:none" name="gpOutputButton" id="gpOutputButton" src="images/digital_output_off_n.gif" width="35" height="29" onmousedown="pressImage('gpOutputPatten')" onmouseup="gpOutput();" onmouseover="overImage('gpOutputPatten')" onmouseout="outImage('gpOutputPatten')" alt="{root/lang/body/startGPOutput}" title="{root/lang/body/startGPOutput}" /> 
					<img style="display:none" name="ledButton" id="ledButton" src="images/led_off_n.gif" width="35" height="29" onmousedown="pressImage('ledPatten')" onmouseup="led(this);" onmouseover="overImage('ledPatten')" onmouseout="outImage('ledPatten')" alt="{root/lang/body/ledOn}" title="{root/lang/body/ledOn}" /> 
					<img style="display:none" name="irButton" id="irButton" src="images/ir_off_n.gif" width="35" height="29" onmousedown="pressImage('irPatten')" onmouseup="ir(this);" onmouseover="overImage('irPatten')" onmouseout="outImage('irPatten')" alt="{root/lang/body/irOn}" title="{root/lang/body/irOn}" /> 
				</div>
				<div id="recordStatus" style="display:none">
					<span id="errMsg" style="font:bold; color:#FF0000"></span> 
                    
					 <br />
                </div>
				<div id="testApplet" style="display:none">
					<strong> This browser doesn't support or disable Java JRE . &nbsp; 
						<a target="_blank" href="http://java.sun.com/products/plugin/downloads/index.html">
						Get the latest Java JRE here</a> or enable Java JRE.
					</strong>
				</div>
			</div>
		</div>
	</td>
	<td valign="top" id="" align="left">
	</td>
</tr>
</table>
<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="873" align="center">
<tr>
	<td width="125" align="center">&nbsp;&nbsp;<img src="images/wireless_bottom.gif" width="114" height="35" /></td>
	<td width="10">&nbsp;</td><td>&nbsp;</td>
</tr>
</table>
<br />
<div align="center">
	<xsl:value-of select="root/lang/frame/copyright1" /> &copy; <xsl:value-of select="root/lang/frame/copyright2" />
</div>
<br />
<map name="Map" id="Map">
	<area shape="rect" coords="-1,0,139,35" onclick="return move(0, 1);" alt="up" />
	<area shape="rect" coords="0,89,135,124" onclick="return move(0, -1);" alt="down" /><area shape="rect" coords="0,34,40,90" onclick="return move(-1, 0);" alt="left" />
	<area shape="rect" coords="39,34,93,90" onclick="return home();" alt="home" />
	<area shape="rect" coords="92,34,148,90" onclick="return move(1, 0);" alt="right" />
</map>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

