<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_audiovideo.xml" --><!DOCTYPE xsl:stylesheet  [
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<link rel="stylesheet" type="text/css" href="../css_router.css" />
<script language="JavaScript" src="../public.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
var errMsg1= "<xsl:value-of select="root/lang/body/RTSPErrorMsg1" />";
var errMsg2= "<xsl:value-of select="root/lang/body/RTSPErrorMsg2" />";
var errMsg3= "<xsl:value-of select="root/lang/body/RTSPErrorMsg3" />";
<![CDATA[
function send_request(){
/*
	if(document.form1.inputSize[2].checked){
		if(confirm(updateConfirm)){
		}
		else
			return;
	}
*/
	if(!checkRTSPUrl(errMsg1,errMsg2,errMsg3))
		return false;
	if(document.form1.inputSize[0].checked){//VGA
		document.form1.scale1.value = document.form1.vgaScale1.value;
		document.form1.scale2.value = document.form1.vgaScale2.value;
		document.form1.scale3.value = document.form1.vgaScale3.value;
		document.form1.scale4.value = document.form1.vgaScale4.value;
		document.form1.fps1.value = document.form1.vgaFps1.value;
		document.form1.fps2.value = document.form1.vgaFps2.value;
		document.form1.fps3.value = document.form1.vgaFps3.value;
		document.form1.fps4.value = document.form1.vgaFps4.value;
	}
	else if(document.form1.inputSize[1].checked){//XGA
		document.form1.scale1.value = document.form1.xgaScale1.value;
		document.form1.scale2.value = document.form1.xgaScale2.value;
		document.form1.scale3.value = document.form1.xgaScale3.value;
		document.form1.scale4.value = document.form1.xgaScale4.value;
		document.form1.fps1.value = document.form1.xgaFps1.value;
		document.form1.fps2.value = document.form1.xgaFps2.value;
		document.form1.fps3.value = document.form1.xgaFps3.value;
		document.form1.fps4.value = document.form1.xgaFps4.value;
	}
	else if(document.form1.inputSize[2].checked){//SXGA
		if(document.form1.codec1[1].selected)
			document.form1.scale1.value = document.form1.sxgaJpgScale1.value;
		else
			document.form1.scale1.value = document.form1.sxgaMp4Scale1.value;
		if(document.form1.codec2[1].selected)
			document.form1.scale2.value = document.form1.sxgaJpgScale2.value;
		else
			document.form1.scale2.value = document.form1.sxgaMp4Scale2.value;
		document.form1.scale3.value = document.form1.sxgaJpgScale3.value;
		document.form1.scale4.value = document.form1.sxgaMp4Scale4.value;
		document.form1.fps1.value = document.form1.sxgaFps1.value;
		document.form1.fps2.value = document.form1.sxgaFps2.value;
		document.form1.fps3.value = document.form1.sxgaFps3.value;
		document.form1.fps4.value = document.form1.sxgaFps4.value;
	}
	else if(document.form1.inputSize[3].checked){//NTSC
		document.form1.scale1.value = document.form1.ntscScale1.value;
		document.form1.scale2.value = document.form1.ntscScale2.value;
		document.form1.scale3.value = document.form1.ntscScale3.value;
		document.form1.scale4.value = document.form1.ntscScale4.value;
		document.form1.fps1.value = document.form1.ntscFps1.value;
		document.form1.fps2.value = document.form1.ntscFps2.value;
		document.form1.fps3.value = document.form1.ntscFps3.value;
		document.form1.fps4.value = document.form1.ntscFps4.value;
	}
	else if(document.form1.inputSize[4].checked){//PAL
		document.form1.scale1.value = document.form1.palScale1.value;
		document.form1.scale2.value = document.form1.palScale2.value;
		document.form1.scale3.value = document.form1.palScale3.value;
		document.form1.scale4.value = document.form1.palScale4.value;
		document.form1.fps1.value = document.form1.palFps1.value;
		document.form1.fps2.value = document.form1.palFps2.value;
		document.form1.fps3.value = document.form1.palFps3.value;
		document.form1.fps4.value = document.form1.palFps4.value;
	}

	if (sensor.substr(0, 6) == 'ov7725') {
		if(document.form1.nightShotBoxOV7725.checked)
			document.form1.nightShot.value = document.form1.nightShotSelectOV7725.value;
		else
			document.form1.nightShot.value = "0";
	}
	else {
		if(document.form1.nightShotBox.checked)
			document.form1.nightShot.value = document.form1.nightShotSelect.value;
		else
			document.form1.nightShot.value = "0";
	}

	if (document.form1.spkEnableBox) {
		if(document.form1.spkEnableBox.checked)
			document.form1.spkEnable.value = "on";
		else
			document.form1.spkEnable.value = "off";
	}

	if(document.form1.micEnableBox.checked)
		document.form1.micEnable.value = "on";
	else
		document.form1.micEnable.value = "off";

	send_submit("form1");
}
/*
function changeMode(index)
{
	if(index==1){
		document.form1.fps.value=5;
		document.form1.bitrate.value=320;
		document.form1.quality.value=0;
	}else if(index==2){
		document.form1.fps.value=30;
		document.form1.bitrate.value=2048;
		document.form1.quality.value=2;
	}
}
*/
]]>
</script>
<script language="JavaScript" type="text/javascript">
var updateConfirm = "<xsl:value-of select="root/lang/body/updateConfirm" />";
var sensor = "<xsl:value-of select="root/common/sensor " />";
var serial = "<xsl:value-of select="root/common/serial " />";

var count=60;
function begin_count(){
	window.setInterval("ShowRealTime()", 1000);
	document.getElementById("leavetime").innerHTML = count + " ";
}

function ShowRealTime(){
	count--;
	document.getElementById("leavetime").innerHTML = count + " ";
	if(count==0)
	{
		count = 1;
		location.href='adv_audiovideo.cgi';
	}
}

function initForm(){

	//if (sensor == 'mt9m112' || sensor == 'mt9m112_cs633' || sensor == 'mt9m112_dcs2121' || sensor == 'mt9m111_dcs5230')
	if (sensor.substr(0, 7) == 'mt9m112'
	    || sensor.substr(0, 7) == 'mt9m131')
	{
		document.getElementById("videosensor").style.display="";
	}

	//night mode
	//if (sensor == 'mt9m112' || sensor == 'mt9m112_dcs2121' || sensor == 'mt9m112_dcs5230')
	if (sensor.substr(0, 7) == 'mt9m112'
	    || sensor.substr(0, 7) == 'mt9m131'
	    || sensor.substr(0, 7) == 'mt9v111')
	{
		document.getElementById("nightMode").style.display="";
	}

	if (sensor.substr(0, 6) == 'ov7725') {
		document.getElementById("indoorDisp").style.display="";
	}

	if (serial == 'DCS-2102' ||serial == 'DCS-1100' )
		document.getElementById("help2102").style.display="";
	else if (serial == 'DCS-3411')
		document.getElementById("help6410").style.display="";
	else if (serial == 'DCS-3430')
		document.getElementById("help6410").style.display="";
	else if (serial == 'DCS-6410')
		document.getElementById("help6410").style.display="";
	else
		document.getElementById("help_other").style.display="";
		
	if ('<xsl:value-of select="/root/config/needReboot" />' == '1'){
		document.form1.button1.disabled=true;
		document.form1.button2.disabled=true;
		document.form1.button3.disabled=true;
		document.form1.button4.disabled=true;
		begin_count();
	}
	//checkbox
	if ('<xsl:value-of select="root/config/microphone/enable" />' == '1')
		document.form1.micEnableBox.checked=true;
<xsl:if test="root/common/peripheral/speaker = '1'">
	if ('<xsl:value-of select="root/config/speaker/enable" />' == '1')
		document.form1.spkEnableBox.checked=true;
</xsl:if>

	//select
	//profile1 codec
	if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '0')
		document.form1.codec1.value = '0';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '1')
		document.form1.codec1.value = '1';
	//profile2 codec
	if ('<xsl:value-of select="root/config/profiles/profile[2]/codec" />' == '0')
		document.form1.codec2.value = '0';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/codec" />' == '1')
		document.form1.codec2.value = '1';

	//profile1 bps
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '32')
		document.form1.bps1.value = '32';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '64')
		document.form1.bps1.value = '64';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '128')
		document.form1.bps1.value = '128';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '256')
		document.form1.bps1.value = '256';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '384')
		document.form1.bps1.value = '384';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '512')
		document.form1.bps1.value = '512';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '768')
		document.form1.bps1.value = '768';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '1024')
		document.form1.bps1.value = '1024';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '1280')
		document.form1.bps1.value = '1280';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '1536')
		document.form1.bps1.value = '1536';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '1792')
		document.form1.bps1.value = '1792';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/bps" />' == '2048')
		document.form1.bps1.value = '2048';
	//profile2 bps
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '32')
		document.form1.bps2.value = '32';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '64')
		document.form1.bps2.value = '64';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '128')
		document.form1.bps2.value = '128';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '256')
		document.form1.bps2.value = '256';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '384')
		document.form1.bps2.value = '384';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '512')
		document.form1.bps2.value = '512';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '768')
		document.form1.bps2.value = '768';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '1024')
		document.form1.bps2.value = '1024';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '1280')
		document.form1.bps2.value = '1280';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '1536')
		document.form1.bps2.value = '1536';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '1792')
		document.form1.bps2.value = '1792';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/bps" />' == '2048')
		document.form1.bps2.value = '2048';
	//profile4 bps
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '32')
		document.form1.bps4.value = '32';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '64')
		document.form1.bps4.value = '64';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '128')
		document.form1.bps4.value = '128';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '256')
		document.form1.bps4.value = '256';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '384')
		document.form1.bps4.value = '384';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '512')
		document.form1.bps4.value = '512';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '768')
		document.form1.bps4.value = '768';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '1024')
		document.form1.bps4.value = '1024';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '1280')
		document.form1.bps4.value = '1280';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '1536')
		document.form1.bps4.value = '1536';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '1792')
		document.form1.bps4.value = '1792';
	if ('<xsl:value-of select="root/config/profiles/profile[4]/bps" />' == '2048')
		document.form1.bps4.value = '2048';
	//profile1 quality
	if ('<xsl:value-of select="root/config/profiles/profile[1]/quality" />' == '1')
		document.form1.quality1.value = '1';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/quality" />' == '2')
		document.form1.quality1.value = '2';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/quality" />' == '3')
		document.form1.quality1.value = '3';
	if ('<xsl:value-of select="root/config/profiles/profile[1]/quality" />' == '4')
		document.form1.quality1.value = '4';
	//profile2 quality
	if ('<xsl:value-of select="root/config/profiles/profile[2]/quality" />' == '1')
		document.form1.quality2.value = '1';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/quality" />' == '2')
		document.form1.quality2.value = '2';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/quality" />' == '3')
		document.form1.quality2.value = '3';
	if ('<xsl:value-of select="root/config/profiles/profile[2]/quality" />' == '4')
		document.form1.quality2.value = '4';
	//profile3 quality
	if ('<xsl:value-of select="root/config/profiles/profile[3]/quality" />' == '1')
		document.form1.quality3.value = '1';
	if ('<xsl:value-of select="root/config/profiles/profile[3]/quality" />' == '2')
		document.form1.quality3.value = '2';
	if ('<xsl:value-of select="root/config/profiles/profile[3]/quality" />' == '3')
		document.form1.quality3.value = '3';
	if ('<xsl:value-of select="root/config/profiles/profile[3]/quality" />' == '4')
		document.form1.quality3.value = '4';

	//profile1 scale
	if ('<xsl:value-of select="root/config/profiles/profile[1]/scale" />' == '0'){
		document.form1.vgaScale1.value = '0';
		document.form1.xgaScale1.value = '0';
		document.form1.sxgaMp4Scale1.value = '1';// not support yet
		document.form1.sxgaJpgScale1.value = '0';
		document.form1.ntscScale1.value = '0';
		document.form1.palScale1.value = '0';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/scale" />' == '1'){
		document.form1.vgaScale1.value = '1';
		document.form1.xgaScale1.value = '1';
		document.form1.sxgaMp4Scale1.value = '1';
		document.form1.sxgaJpgScale1.value = '1';
		document.form1.ntscScale1.value = '1';
		document.form1.palScale1.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/scale" />' == '2'){
		document.form1.vgaScale1.value = '2';
		document.form1.xgaScale1.value = '2';
		document.form1.sxgaMp4Scale1.value = '2';
		document.form1.sxgaJpgScale1.value = '2';
		document.form1.ntscScale1.value = '2';
		document.form1.palScale1.value = '2';
	}
	//profile2 scale
	if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '0'){
		document.form1.vgaScale2.value = '0';
		document.form1.xgaScale2.value = '1';//not support yet
		document.form1.sxgaMp4Scale2.value = '1';//not support yet
		document.form1.sxgaJpgScale2.value = '1';//not support yet
		document.form1.ntscScale2.value = '0';
		document.form1.palScale2.value = '0';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1'){
		document.form1.vgaScale2.value = '1';
		document.form1.xgaScale2.value = '1';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '1';
		document.form1.ntscScale2.value = '1';
		document.form1.palScale2.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2'){
		document.form1.vgaScale2.value = '2';
		document.form1.xgaScale2.value = '2';
		document.form1.sxgaMp4Scale2.value = '2';
		document.form1.sxgaJpgScale2.value = '2';
		document.form1.ntscScale2.value = '2';
		document.form1.palScale2.value = '2';
	}
	//profile3 scale
	if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '0'){
		document.form1.vgaScale3.value = '0';
		document.form1.xgaScale3.value = '1';//not support yet
		document.form1.sxgaMp4Scale3.value = '1';// not support yet
		document.form1.sxgaJpgScale3.value = '1';// not support yet
		document.form1.ntscScale3.value = '0';
		document.form1.palScale3.value = '0';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1'){
		document.form1.vgaScale3.value = '1';
		document.form1.xgaScale3.value = '1';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '1';
		document.form1.ntscScale3.value = '1';
		document.form1.palScale3.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2'){
		document.form1.vgaScale3.value = '2';
		document.form1.xgaScale3.value = '2';
		document.form1.sxgaMp4Scale3.value = '2';
		document.form1.sxgaJpgScale3.value = '2';
		document.form1.ntscScale3.value = '2';
		document.form1.palScale3.value = '2';
	}
	//profile4 scale
	if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '0'){
		document.form1.vgaScale4.value = '0';
		document.form1.xgaScale4.value = '1';//not support yet
		document.form1.sxgaMp4Scale4.value = '1';// not support yet
		document.form1.sxgaJpgScale4.value = '1';// not support yet
		document.form1.ntscScale4.value = '0';
		document.form1.palScale4.value = '0';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1'){
		document.form1.vgaScale4.value = '1';
		document.form1.xgaScale4.value = '1';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '1';
		document.form1.ntscScale4.value = '1';
		document.form1.palScale4.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2'){
		document.form1.vgaScale4.value = '2';
		document.form1.xgaScale4.value = '2';
		document.form1.sxgaMp4Scale4.value = '2';
		document.form1.sxgaJpgScale4.value = '2';
		document.form1.ntscScale4.value = '2';
		document.form1.palScale4.value = '2';
	}
	//profile other mode default scale value
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		document.form1.xgaScale1.value = '0';
		document.form1.xgaScale2.value = '1';
		document.form1.xgaScale3.value = '1';
		document.form1.xgaScale4.value = '2';
		document.form1.sxgaMp4Scale1.value = '1';
		document.form1.sxgaJpgScale1.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '1';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '1';
		document.form1.sxgaMp4Scale4.value = '2';
		document.form1.sxgaJpgScale4.value = '2';
		document.form1.ntscScale1.value = '0';
		document.form1.ntscScale2.value = '1';
		document.form1.ntscScale3.value = '0';
		document.form1.ntscScale4.value = '2';
		document.form1.palScale1.value = '0';
		document.form1.palScale2.value = '1';
		document.form1.palScale3.value = '0';
		document.form1.palScale4.value = '2';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		document.form1.vgaScale1.value = '0';
		document.form1.vgaScale2.value = '1';
		document.form1.vgaScale3.value = '0';
		document.form1.vgaScale4.value = '2';
		document.form1.sxgaMp4Scale1.value = '1';
		document.form1.sxgaJpgScale1.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '1';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '1';
		document.form1.sxgaMp4Scale4.value = '2';
		document.form1.sxgaJpgScale4.value = '2';
		document.form1.ntscScale1.value = '0';
		document.form1.ntscScale2.value = '1';
		document.form1.ntscScale3.value = '0';
		document.form1.ntscScale4.value = '2';
		document.form1.palScale1.value = '0';
		document.form1.palScale2.value = '1';
		document.form1.palScale3.value = '0';
		document.form1.palScale4.value = '2';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		document.form1.vgaScale1.value = '0';
		document.form1.vgaScale2.value = '1';
		document.form1.vgaScale3.value = '0';
		document.form1.vgaScale4.value = '2';
		document.form1.xgaScale1.value = '0';
		document.form1.xgaScale2.value = '1';
		document.form1.xgaScale3.value = '1';
		document.form1.xgaScale4.value = '2';
		document.form1.ntscScale1.value = '0';
		document.form1.ntscScale2.value = '1';
		document.form1.ntscScale3.value = '0';
		document.form1.ntscScale4.value = '2';
		document.form1.palScale1.value = '0';
		document.form1.palScale2.value = '1';
		document.form1.palScale3.value = '0';
		document.form1.palScale4.value = '2';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		document.form1.vgaScale1.value = '0';
		document.form1.vgaScale2.value = '0';
		document.form1.vgaScale3.value = '0';
		document.form1.vgaScale4.value = '0';
		document.form1.xgaScale1.value = '0';
		document.form1.xgaScale2.value = '0';
		document.form1.xgaScale3.value = '0';
		document.form1.xgaScale4.value = '0';
		document.form1.sxgaMp4Scale1.value = '1';
		document.form1.sxgaJpgScale1.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '0';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '0';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '0';
		document.form1.palScale1.value = '0';
		document.form1.palScale2.value = '0';
		document.form1.palScale3.value = '0';
		document.form1.palScale4.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		document.form1.vgaScale1.value = '0';
		document.form1.vgaScale2.value = '0';
		document.form1.vgaScale3.value = '0';
		document.form1.vgaScale4.value = '0';
		document.form1.xgaScale1.value = '0';
		document.form1.xgaScale2.value = '0';
		document.form1.xgaScale3.value = '0';
		document.form1.xgaScale4.value = '0';
		document.form1.sxgaMp4Scale1.value = '1';
		document.form1.sxgaJpgScale1.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '0';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '0';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '0';
		document.form1.ntscScale1.value = '0';
		document.form1.ntscScale2.value = '0';
		document.form1.ntscScale3.value = '0';
		document.form1.ntscScale4.value = '0';
	}


	//profile1 FPS
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '1'){
		document.form1.vgaFps1.value = '1';
		document.form1.xgaFps1.value = '1';
		document.form1.sxgaFps1.value = '1';
		document.form1.ntscFps1.value = '1';
		document.form1.palFps1.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '2'){
		document.form1.vgaFps1.value = '2';
		document.form1.xgaFps1.value = '2';
		document.form1.sxgaFps1.value = '2';
		document.form1.ntscFps1.value = '2';
		document.form1.palFps1.value = '2';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '3'){
		document.form1.vgaFps1.value = '3';
		document.form1.xgaFps1.value = '3';
		document.form1.sxgaFps1.value = '3';
		document.form1.ntscFps1.value = '3';
		document.form1.palFps1.value = '3';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '5'){
		document.form1.vgaFps1.value = '5';
		document.form1.xgaFps1.value = '5';
		document.form1.sxgaFps1.value = '5';
		document.form1.ntscFps1.value = '5';
		document.form1.palFps1.value = '5';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '8'){
		document.form1.palFps1.value = '8';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '10'){
		document.form1.vgaFps1.value = '10';
		document.form1.xgaFps1.value = '10';
		document.form1.sxgaFps1.value = '10';
		document.form1.ntscFps1.value = '10';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '12'){
		document.form1.palFps1.value = '12';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '15'){
		document.form1.vgaFps1.value = '15';
		document.form1.ntscFps1.value = '15';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '25'){
		document.form1.palFps1.value = '25';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '30'){
		document.form1.vgaFps1.value = '30';
		document.form1.ntscFps1.value = '30';
	}
	//profile2 FPS
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '1'){
		document.form1.vgaFps2.value = '1';
		document.form1.xgaFps2.value = '1';
		document.form1.sxgaFps2.value = '1';
		document.form1.ntscFps2.value = '1';
		document.form1.palFps2.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '2'){
		document.form1.vgaFps2.value = '2';
		document.form1.xgaFps2.value = '2';
		document.form1.sxgaFps2.value = '2';
		document.form1.ntscFps2.value = '2';
		document.form1.palFps2.value = '2';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '3'){
		document.form1.vgaFps2.value = '3';
		document.form1.xgaFps2.value = '3';
		document.form1.sxgaFps2.value = '3';
		document.form1.ntscFps2.value = '3';
		document.form1.palFps2.value = '3';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '5'){
		document.form1.vgaFps2.value = '5';
		document.form1.xgaFps2.value = '5';
		document.form1.sxgaFps2.value = '5';
		document.form1.ntscFps2.value = '5';
		document.form1.palFps2.value = '5';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '8'){
		document.form1.palFps2.value = '8';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '10'){
		document.form1.vgaFps2.value = '10';
		document.form1.xgaFps2.value = '10';
		document.form1.sxgaFps2.value = '10';
		document.form1.ntscFps2.value = '10';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '12'){
		document.form1.palFps2.value = '12';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '15'){
		document.form1.vgaFps2.value = '15';
		document.form1.ntscFps2.value = '15';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '25'){
		document.form1.palFps2.value = '25';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[2]/fps" />' == '30'){
		document.form1.vgaFps2.value = '30';
		document.form1.ntscFps2.value = '30';
	}
	//profile3 FPS
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '1'){
		document.form1.vgaFps3.value = '1';
		document.form1.xgaFps3.value = '1';
		document.form1.sxgaFps3.value = '1';
		document.form1.ntscFps3.value = '1';
		document.form1.palFps3.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '2'){
		document.form1.vgaFps3.value = '2';
		document.form1.xgaFps3.value = '2';
		document.form1.sxgaFps3.value = '2';
		document.form1.ntscFps3.value = '2';
		document.form1.palFps3.value = '2';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '3'){
		document.form1.vgaFps3.value = '3';
		document.form1.xgaFps3.value = '3';
		document.form1.sxgaFps3.value = '3';
		document.form1.ntscFps3.value = '3';
		document.form1.palFps3.value = '3';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '5'){
		document.form1.vgaFps3.value = '5';
		document.form1.xgaFps3.value = '5';
		document.form1.sxgaFps3.value = '5';
		document.form1.ntscFps3.value = '5';
		document.form1.palFps3.value = '5';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '8'){
		document.form1.palFps3.value = '8';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '10'){
		document.form1.vgaFps3.value = '10';
		document.form1.xgaFps3.value = '10';
		document.form1.sxgaFps3.value = '10';
		document.form1.ntscFps3.value = '10';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '12'){
		document.form1.palFps3.value = '12';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '15'){
		document.form1.vgaFps3.value = '15';
		document.form1.ntscFps3.value = '15';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '25'){
		document.form1.palFps3.value = '25';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[3]/fps" />' == '30'){
		document.form1.vgaFps3.value = '30';
		document.form1.ntscFps3.value = '30';
	}
	//profile4 FPS
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '1'){
		document.form1.vgaFps4.value = '1';
		document.form1.xgaFps4.value = '1';
		document.form1.sxgaFps4.value = '1';
		document.form1.ntscFps4.value = '1';
		document.form1.palFps4.value = '1';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '2'){
		document.form1.vgaFps4.value = '2';
		document.form1.xgaFps4.value = '2';
		document.form1.sxgaFps4.value = '2';
		document.form1.ntscFps4.value = '2';
		document.form1.palFps4.value = '2';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '3'){
		document.form1.vgaFps4.value = '3';
		document.form1.xgaFps4.value = '3';
		document.form1.sxgaFps4.value = '3';
		document.form1.ntscFps4.value = '3';
		document.form1.palFps4.value = '3';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '5'){
		document.form1.vgaFps4.value = '5';
		document.form1.xgaFps4.value = '5';
		document.form1.sxgaFps4.value = '5';
		document.form1.ntscFps4.value = '5';
		document.form1.palFps4.value = '5';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '8'){
		document.form1.palFps4.value = '8';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '10'){
		document.form1.vgaFps4.value = '10';
		document.form1.xgaFps4.value = '10';
		document.form1.sxgaFps4.value = '10';
		document.form1.ntscFps4.value = '10';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '12'){
		document.form1.palFps4.value = '12';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '15'){
		document.form1.vgaFps4.value = '15';
		document.form1.ntscFps4.value = '15';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '25'){
		document.form1.palFps4.value = '25';
	}
	if ('<xsl:value-of select="root/config/profiles/profile[4]/fps" />' == '30'){
		document.form1.vgaFps4.value = '30';
		document.form1.ntscFps4.value = '30';
	}	
	//profile other mode FPS default value
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		document.form1.xgaFps1.value = '10';
		document.form1.xgaFps2.value = '10';
		document.form1.xgaFps3.value = '5';
		document.form1.xgaFps4.value = '5';
		document.form1.sxgaFps1.value = '10';
		document.form1.sxgaFps2.value = '10';
		document.form1.sxgaFps3.value = '5';
		document.form1.sxgaFps4.value = '5';
		document.form1.ntscFps1.value = '30';
		document.form1.ntscFps2.value = '30';
		document.form1.ntscFps3.value = '10';
		document.form1.ntscFps4.value = '5';
		document.form1.palFps1.value = '25';
		document.form1.palFps2.value = '25';
		document.form1.palFps3.value = '8';
		document.form1.palFps4.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		document.form1.vgaFps1.value = '30';
		document.form1.vgaFps2.value = '30';
		document.form1.vgaFps3.value = '10';
		document.form1.vgaFps4.value = '5';
		document.form1.sxgaFps1.value = '10';
		document.form1.sxgaFps2.value = '10';
		document.form1.sxgaFps3.value = '5';
		document.form1.sxgaFps4.value = '5';
		document.form1.ntscFps1.value = '30';
		document.form1.ntscFps2.value = '30';
		document.form1.ntscFps3.value = '10';
		document.form1.ntscFps4.value = '5';
		document.form1.palFps1.value = '25';
		document.form1.palFps2.value = '25';
		document.form1.palFps3.value = '8';
		document.form1.palFps4.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		document.form1.vgaFps1.value = '30';
		document.form1.vgaFps2.value = '30';
		document.form1.vgaFps3.value = '10';
		document.form1.vgaFps4.value = '5';
		document.form1.xgaFps1.value = '10';
		document.form1.xgaFps2.value = '10';
		document.form1.xgaFps3.value = '5';
		document.form1.xgaFps4.value = '5';
		document.form1.ntscFps1.value = '30';
		document.form1.ntscFps2.value = '30';
		document.form1.ntscFps3.value = '10';
		document.form1.ntscFps4.value = '5';
		document.form1.palFps1.value = '25';
		document.form1.palFps2.value = '25';
		document.form1.palFps3.value = '8';
		document.form1.palFps4.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		document.form1.vgaFps1.value = '30';
		document.form1.vgaFps2.value = '30';
		document.form1.vgaFps3.value = '30';
		document.form1.vgaFps4.value = '30';
		document.form1.xgaFps1.value = '10';
		document.form1.xgaFps2.value = '10';
		document.form1.xgaFps3.value = '10';
		document.form1.xgaFps4.value = '10';
		document.form1.sxgaFps1.value = '10';
		document.form1.sxgaFps2.value = '10';
		document.form1.sxgaFps3.value = '10';
		document.form1.sxgaFps4.value = '10';
		document.form1.palFps1.value = '25';
		document.form1.palFps2.value = '25';
		document.form1.palFps3.value = '25';
		document.form1.palFps4.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		document.form1.vgaFps1.value = '30';
		document.form1.vgaFps2.value = '30';
		document.form1.vgaFps3.value = '30';
		document.form1.vgaFps4.value = '30';
		document.form1.xgaFps1.value = '10';
		document.form1.xgaFps2.value = '10';
		document.form1.xgaFps3.value = '10';
		document.form1.xgaFps4.value = '10';
		document.form1.sxgaFps1.value = '10';
		document.form1.sxgaFps2.value = '10';
		document.form1.sxgaFps3.value = '10';
		document.form1.sxgaFps4.value = '10';
		document.form1.ntscFps1.value = '30';
		document.form1.ntscFps2.value = '30';
		document.form1.ntscFps3.value = '30';
		document.form1.ntscFps4.value = '30';
	}	
/*
	//profile2 scale
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '0')
			document.form1.vgaScale2.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1')
			document.form1.vgaScale2.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2')
			document.form1.vgaScale2.value = '2';
		document.form1.xgaScale2.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '0';
		document.form1.ntscScale2.value = '0';
		document.form1.palScale2.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '0')
			document.form1.xgaScale2.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1')
			document.form1.xgaScale2.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2')
			document.form1.xgaScale2.value = '2';
		document.form1.vgaScale2.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '0';
		document.form1.ntscScale2.value = '0';
		document.form1.palScale2.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '0'){
			if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '0')
				document.form1.sxgaJpgScale2.value = '0';
			if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1')
				document.form1.sxgaJpgScale2.value = '1';
			if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2')
				document.form1.sxgaJpgScale2.value = '2';
		}
		if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '1'){
			if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1')
				document.form1.sxgaMp4Scale2.value = '1';
			if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2')
				document.form1.sxgaMp4Scale2.value = '2';
		}
		document.form1.vgaScale2.value = '0';
		document.form1.xgaScale2.value = '0';
		document.form1.ntscScale2.value = '0';
		document.form1.palScale2.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '0')
			document.form1.ntscScale2.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1')
			document.form1.ntscScale2.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2')
			document.form1.ntscScale2.value = '2';
		document.form1.vgaScale2.value = '0';
		document.form1.xgaScale2.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '0';
		document.form1.palScale2.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '0')
			document.form1.palScale2.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '1')
			document.form1.palScale2.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[2]/scale" />' == '2')
			document.form1.palScale2.value = '2';
		document.form1.vgaScale2.value = '0';
		document.form1.xgaScale2.value = '0';
		document.form1.sxgaMp4Scale2.value = '1';
		document.form1.sxgaJpgScale2.value = '0';
		document.form1.ntscScale2.value = '0';
	}
	//profile3 scale
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '0')
			document.form1.vgaScale3.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1')
			document.form1.vgaScale3.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2')
			document.form1.vgaScale3.value = '2';
		document.form1.xgaScale3.value = '0';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '0';
		document.form1.ntscScale3.value = '0';
		document.form1.palScale3.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '0')
			document.form1.xgaScale3.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1')
			document.form1.xgaScale3.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2')
			document.form1.xgaScale3.value = '2';
		document.form1.vgaScale3.value = '0';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '0';
		document.form1.ntscScale3.value = '0';
		document.form1.palScale3.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '0'){
			if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '0')
				document.form1.sxgaJpgScale3.value = '0';
			if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1')
				document.form1.sxgaJpgScale3.value = '1';
			if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2')
				document.form1.sxgaJpgScale3.value = '2';
		}
		if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '1'){
			if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1')
				document.form1.sxgaMp4Scale3.value = '1';
			if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2')
				document.form1.sxgaMp4Scale3.value = '2';
		}
		document.form1.vgaScale3.value = '0';
		document.form1.xgaScale3.value = '0';
		document.form1.ntscScale3.value = '0';
		document.form1.palScale3.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '0')
			document.form1.ntscScale3.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1')
			document.form1.ntscScale3.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2')
			document.form1.ntscScale3.value = '2';
		document.form1.vgaScale3.value = '0';
		document.form1.xgaScale3.value = '0';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '0';
		document.form1.palScale3.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '0')
			document.form1.palScale3.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '1')
			document.form1.palScale3.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[3]/scale" />' == '2')
			document.form1.palScale3.value = '2';
		document.form1.vgaScale3.value = '0';
		document.form1.xgaScale3.value = '0';
		document.form1.sxgaMp4Scale3.value = '1';
		document.form1.sxgaJpgScale3.value = '0';
		document.form1.ntscScale3.value = '0';
	}
	//profile4 scale
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '0')
			document.form1.vgaScale4.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1')
			document.form1.vgaScale4.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2')
			document.form1.vgaScale4.value = '2';
		document.form1.xgaScale4.value = '0';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '0';
		document.form1.ntscScale4.value = '0';
		document.form1.palScale4.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '0')
			document.form1.xgaScale4.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1')
			document.form1.xgaScale4.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2')
			document.form1.xgaScale4.value = '2';
		document.form1.vgaScale4.value = '0';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '0';
		document.form1.ntscScale4.value = '0';
		document.form1.palScale4.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '0'){
			if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '0')
				document.form1.sxgaJpgScale4.value = '0';
			if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1')
				document.form1.sxgaJpgScale4.value = '1';
			if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2')
				document.form1.sxgaJpgScale4.value = '2';
		}
		if ('<xsl:value-of select="root/config/profiles/profile[1]/codec" />' == '1'){
			if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1')
				document.form1.sxgaMp4Scale4.value = '1';
			if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2')
				document.form1.sxgaMp4Scale4.value = '2';
		}
		document.form1.vgaScale4.value = '0';
		document.form1.xgaScale4.value = '0';
		document.form1.ntscScale4.value = '0';
		document.form1.palScale4.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '0')
			document.form1.ntscScale4.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1')
			document.form1.ntscScale4.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2')
			document.form1.ntscScale4.value = '2';
		document.form1.vgaScale4.value = '0';
		document.form1.xgaScale4.value = '0';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '0';
		document.form1.palScale4.value = '0';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '0')
			document.form1.palScale4.value = '0';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '1')
			document.form1.palScale4.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[4]/scale" />' == '2')
			document.form1.palScale4.value = '2';
		document.form1.vgaScale4.value = '0';
		document.form1.xgaScale4.value = '0';
		document.form1.sxgaMp4Scale4.value = '1';
		document.form1.sxgaJpgScale4.value = '0';
		document.form1.ntscScale4.value = '0';
	}

	//profile1 fps
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '1')
			document.form1.vgaFps1.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '2')
			document.form1.vgaFps1.value = '2';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '3')
			document.form1.vgaFps1.value = '3';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '5')
			document.form1.vgaFps1.value = '5';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '10')
			document.form1.vgaFps1.value = '10';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '15')
			document.form1.vgaFps1.value = '15';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '30')
			document.form1.vgaFps1.value = '30';
		document.form1.xgaFps1.value = '10';
		document.form1.sxgaFps1.value = '10';
		document.form1.ntscFps1.value = '30';
		document.form1.palFps1.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '1')
			document.form1.xgaFps1.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '2')
			document.form1.xgaFps1.value = '2';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '3')
			document.form1.xgaFps1.value = '3';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '5')
			document.form1.xgaFps1.value = '5';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '10')
			document.form1.xgaFps1.value = '10';
		document.form1.vgaFps1.value = '30';
		document.form1.sxgaFps1.value = '10';
		document.form1.ntscFps1.value = '30';
		document.form1.palFps1.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '1')
			document.form1.sxgaFps1.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '2')
			document.form1.sxgaFps1.value = '2';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '3')
			document.form1.sxgaFps1.value = '3';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '5')
			document.form1.sxgaFps1.value = '5';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '10')
			document.form1.sxgaFps1.value = '10';
		document.form1.vgaFps1.value = '30';
		document.form1.xgaFps1.value = '10';
		document.form1.ntscFps1.value = '30';
		document.form1.palFps1.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '1')
			document.form1.ntscFps1.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '2')
			document.form1.ntscFps1.value = '2';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '3')
			document.form1.ntscFps1.value = '3';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '5')
			document.form1.ntscFps1.value = '5';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '10')
			document.form1.ntscFps1.value = '10';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '15')
			document.form1.ntscFps1.value = '15';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '30')
			document.form1.ntscFps1.value = '30';
		document.form1.vgaFps1.value = '30';
		document.form1.xgaFps1.value = '10';
		document.form1.sxgaFps1.value = '10';
		document.form1.palFps1.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '1')
			document.form1.palFps1.value = '1';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '2')
			document.form1.palFps1.value = '2';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '3')
			document.form1.palFps1.value = '3';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '5')
			document.form1.palFps1.value = '5';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '10')
			document.form1.palFps1.value = '10';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '15')
			document.form1.palFps1.value = '15';
		if ('<xsl:value-of select="root/config/profiles/profile[1]/fps" />' == '30')
			document.form1.palFps1.value = '30';
		document.form1.vgaFps1.value = '30';
		document.form1.xgaFps1.value = '10';
		document.form1.sxgaFps1.value = '10';
		document.form1.ntscFps1.value = '25';
	}
*/
/*
	//select
	//mp4 framerate
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		document.form1.mp4Fps1.value = '30';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '1')
			document.form1.mp4Fps1.value = '1';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '2')
			document.form1.mp4Fps1.value = '2';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '3')
			document.form1.mp4Fps1.value = '3';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '5')
			document.form1.mp4Fps1.value = '5';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '10')
			document.form1.mp4Fps1.value = '10';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '15')
			document.form1.mp4Fps1.value = '15';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '30')
			document.form1.mp4Fps1.value = '30';
		document.form1.mp4Fps2.value = '10';
		document.form1.mp4Fps3.value = '10';
		document.form1.mp4FpsNtsc.value = '30';
		document.form1.mp4FpsPal.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		document.form1.mp4Fps2.value = '10';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '1')
			document.form1.mp4Fps2.value = '1';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '2')
			document.form1.mp4Fps2.value = '2';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '3')
			document.form1.mp4Fps2.value = '3';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '5')
			document.form1.mp4Fps2.value = '5';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '10')
			document.form1.mp4Fps2.value = '10';
		document.form1.mp4Fps1.value = '30';
		document.form1.mp4Fps3.value = '10';
		document.form1.mp4FpsNtsc.value = '30';
		document.form1.mp4FpsPal.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		document.form1.mp4Fps3.value = '10';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '1')
			document.form1.mp4Fps3.value = '1';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '2')
			document.form1.mp4Fps3.value = '2';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '3')
			document.form1.mp4Fps3.value = '3';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '5')
			document.form1.mp4Fps3.value = '5';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '10')
			document.form1.mp4Fps3.value = '10';
		document.form1.mp4Fps1.value = '30';
		document.form1.mp4Fps2.value = '10';
		document.form1.mp4FpsNtsc.value = '30';
		document.form1.mp4FpsPal.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		document.form1.mp4FpsNtsc.value = '30';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '1')
			document.form1.mp4FpsNtsc.value = '1';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '2')
			document.form1.mp4FpsNtsc.value = '2';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '3')
			document.form1.mp4FpsNtsc.value = '3';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '5')
			document.form1.mp4FpsNtsc.value = '5';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '10')
			document.form1.mp4FpsNtsc.value = '10';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '15')
			document.form1.mp4FpsNtsc.value = '15';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '30')
			document.form1.mp4FpsNtsc.value = '30';
		document.form1.mp4Fps1.value = '30';
		document.form1.mp4Fps2.value = '10';
		document.form1.mp4Fps3.value = '10';
		document.form1.mp4FpsPal.value = '25';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		document.form1.mp4FpsPal.value = '25';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '1')
			document.form1.mp4FpsPal.value = '1';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '2')
			document.form1.mp4FpsPal.value = '2';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '3')
			document.form1.mp4FpsPal.value = '3';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '5')
			document.form1.mp4FpsPal.value = '5';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '12')
			document.form1.mp4FpsPal.value = '12';
		if ('<xsl:value-of select="root/config/profile[1]/fps" />' == '25')
			document.form1.mp4FpsPal.value = '25';
		document.form1.mp4Fps1.value = '30';
		document.form1.mp4Fps2.value = '10';
		document.form1.mp4Fps3.value = '10';
		document.form1.mp4FpsNtsc.value = '30';
	}
//	if ('<xsl:value-of select="root/config/image/inputSize" />' == 4){//SECAM
//	}

	//mp4 bitrate
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '320')
		document.form1.mp4Bitrate.value = '320';
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '900')
		document.form1.mp4Bitrate.value = '900';
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '1024')
		document.form1.mp4Bitrate.value = '1024';
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '1280')
		document.form1.mp4Bitrate.value = '1280';
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '1536')
		document.form1.mp4Bitrate.value = '1536';
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '1792')
		document.form1.mp4Bitrate.value = '1792';
	if ('<xsl:value-of select="root/config/profile[1]/bitrate" />' == '2048')
		document.form1.mp4Bitrate.value = '2048';

	//jpg framerate
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '1')
			document.form1.jpgFps1.value = '1';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '2')
			document.form1.jpgFps1.value = '2';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '3')
			document.form1.jpgFps1.value = '3';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '5')
			document.form1.jpgFps1.value = '5';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '10')
			document.form1.jpgFps1.value = '10';
		document.form1.jpgFps2.value = '5';
		document.form1.jpgFps3.value = '10';
		document.form1.jpgFpsNtsc.value = '10';
		document.form1.jpgFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '1')
			document.form1.jpgFps2.value = '1';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '2')
			document.form1.jpgFps2.value = '2';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '3')
			document.form1.jpgFps2.value = '3';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '5')
			document.form1.jpgFps2.value = '5';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '10')
			document.form1.jpgFps2.value = '10';
		document.form1.jpgFps1.value = '10';
		document.form1.jpgFps3.value = '10';
		document.form1.jpgFpsNtsc.value = '10';
		document.form1.jpgFpsPal.value = '5';
	}
	if (<xsl:value-of select="root/config/image/inputSize" /> == 1){//SXGA
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '1')
			document.form1.jpgFps3.value = '1';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '2')
			document.form1.jpgFps3.value = '2';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '3')
			document.form1.jpgFps3.value = '3';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '5')
			document.form1.jpgFps3.value = '5';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '10')
			document.form1.jpgFps3.value = '10';
		document.form1.jpgFps1.value = '10';
		document.form1.jpgFps2.value = '5';
		document.form1.jpgFpsNtsc.value = '10';
		document.form1.jpgFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '1')
			document.form1.jpgFpsNtsc.value = '1';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '2')
			document.form1.jpgFpsNtsc.value = '2';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '3')
			document.form1.jpgFpsNtsc.value = '3';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '5')
			document.form1.jpgFpsNtsc.value = '5';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '10')
			document.form1.jpgFpsNtsc.value = '10';
		document.form1.jpgFps1.value = '10';
		document.form1.jpgFps2.value = '5';
		document.form1.jpgFps3.value = '10';
		document.form1.jpgFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '1')
			document.form1.jpgFpsPal.value = '1';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '2')
			document.form1.jpgFpsPal.value = '2';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '3')
			document.form1.jpgFpsPal.value = '3';
		if ('<xsl:value-of select="root/config/profile[2]/fps" />' == '5')
			document.form1.jpgFpsPal.value = '5';
		document.form1.jpgFps1.value = '10';
		document.form1.jpgFps2.value = '5';
		document.form1.jpgFps3.value = '10';
		document.form1.jpgFpsNtsc.value = '10';
	}
//	if ('<xsl:value-of select="root/config/image/inputSize" />' == 4){//SECAM
//	}

	//jpg quality
	if ('<xsl:value-of select="root/config/profile[2]/quality" />' == '0')
		document.form1.jpgQuality.value = '0';
	if ('<xsl:value-of select="root/config/profile[2]/quality" />' == '1')
		document.form1.jpgQuality.value = '1';
	if ('<xsl:value-of select="root/config/profile[2]/quality" />' == '2')
		document.form1.jpgQuality.value = '2';
	//jpg scale
	if ('<xsl:value-of select="root/config/profile[2]/scale" />' == '0'){
		document.form1.jpgScale1.value = '0';
		document.form1.jpgScale2.value = '0';
		document.form1.jpgScale3.value = '0';
		document.form1.jpgScaleNtsc.value = '0';
		document.form1.jpgScalePal.value = '0';
	}
	if ('<xsl:value-of select="root/config/profile[2]/scale" />' == '1'){
		document.form1.jpgScale1.value = '1';
		document.form1.jpgScale2.value = '1';
		document.form1.jpgScale3.value = '0';
		document.form1.jpgScaleNtsc.value = '1';
		document.form1.jpgScalePal.value = '1';
	}
	if ('<xsl:value-of select="root/config/profile[2]/scale" />' == '2'){
		document.form1.jpgScale1.value = '2';
		document.form1.jpgScale2.value = '2';
		document.form1.jpgScale3.value = '0';
		document.form1.jpgScaleNtsc.value = '2';
		document.form1.jpgScalePal.value = '2';
	}

	//mobile framerate
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 0){//VGA
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '1')
			document.form1.mobileFps1.value = '1';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '2')
			document.form1.mobileFps1.value = '2';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '3')
			document.form1.mobileFps1.value = '3';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '5')
			document.form1.mobileFps1.value = '5';
		document.form1.mobileFps2.value = '5';
		document.form1.mobileFps3.value = '5';
		document.form1.mobileFpsNtsc.value = '5';
		document.form1.mobileFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 5){//XGA
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '1')
			document.form1.mobileFps2.value = '1';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '2')
			document.form1.mobileFps2.value = '2';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '3')
			document.form1.mobileFps2.value = '3';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '5')
			document.form1.mobileFps2.value = '5';
		document.form1.mobileFps1.value = '5';
		document.form1.mobileFps3.value = '5';
		document.form1.mobileFpsNtsc.value = '5';
		document.form1.mobileFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 1){//SXGA
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '1')
			document.form1.mobileFps3.value = '1';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '2')
			document.form1.mobileFps3.value = '2';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '3')
			document.form1.mobileFps3.value = '3';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '5')
			document.form1.mobileFps3.value = '5';
		document.form1.mobileFps1.value = '5';
		document.form1.mobileFps2.value = '5';
		document.form1.mobileFpsNtsc.value = '5';
		document.form1.mobileFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 2){//NTSC
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '1')
			document.form1.mobileFpsNtsc.value = '1';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '2')
			document.form1.mobileFpsNtsc.value = '2';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '3')
			document.form1.mobileFpsNtsc.value = '3';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '5')
			document.form1.mobileFpsNtsc.value = '5';
		document.form1.mobileFps1.value = '5';
		document.form1.mobileFps2.value = '5';
		document.form1.mobileFps3.value = '5';
		document.form1.mobileFpsPal.value = '5';
	}
	if ('<xsl:value-of select="root/config/image/inputSize" />' == 3){//PAL
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '1')
			document.form1.mobileFpsPal.value = '1';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '2')
			document.form1.mobileFpsPal.value = '2';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '3')
			document.form1.mobileFpsPal.value = '3';
		if ('<xsl:value-of select="root/config/profile[3]/fps" />' == '5')
			document.form1.mobileFpsPal.value = '5';
		document.form1.mobileFps1.value = '5';
		document.form1.mobileFps2.value = '5';
		document.form1.mobileFps3.value = '5';
		document.form1.mobileFpsNtsc.value = '5';
	}
//	if ('<xsl:value-of select="root/config/image/inputSize" />' == 4){//SECAM
//	}
	//mobile bitrate
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '64')
		document.form1.mobileBitrate.value = '64';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '128')
		document.form1.mobileBitrate.value = '128';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '192')
		document.form1.mobileBitrate.value = '192';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '256')
		document.form1.mobileBitrate.value = '256';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '320')
		document.form1.mobileBitrate.value = '320';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '384')
		document.form1.mobileBitrate.value = '384';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '448')
		document.form1.mobileBitrate.value = '448';
	if ('<xsl:value-of select="root/config/profile[3]/bitrate" />' == '512')
		document.form1.mobileBitrate.value = '512';
	//mobile scale
	if ('<xsl:value-of select="root/config/profile[3]/scale" />' == '1'){
		document.form1.mobileScale1.value = '1';
		document.form1.mobileScale2.value = '1';
		document.form1.mobileScale3.value = '1';
		document.form1.mobileScaleNtsc.value = '1';
		document.form1.mobileScalePal.value = '1';
	}
	if ('<xsl:value-of select="root/config/profile[3]/scale" />' == '2'){
		document.form1.mobileScale1.value = '2';
		document.form1.mobileScale2.value = '2';
		document.form1.mobileScale3.value = '2';
		document.form1.mobileScaleNtsc.value = '2';
		document.form1.mobileScalePal.value = '2';
	}
*/
	//microphone volume
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '0')
		document.form1.micVolume.value = '0';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '10')
		document.form1.micVolume.value = '10';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '20')
		document.form1.micVolume.value = '20';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '30')
		document.form1.micVolume.value = '30';	
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '40')
		document.form1.micVolume.value = '40';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '50')
		document.form1.micVolume.value = '50';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '60')
		document.form1.micVolume.value = '60';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '70')
		document.form1.micVolume.value = '70';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '80')
		document.form1.micVolume.value = '80';	
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '90')
		document.form1.micVolume.value = '90';
	if ('<xsl:value-of select="root/config/microphone/volume" />' == '100')
		document.form1.micVolume.value = '100';
<xsl:if test="root/common/peripheral/speaker = '1'">
	//speaker volume
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '0')
		document.form1.spkVolume.value = '0';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '10')
		document.form1.spkVolume.value = '10';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '20')
		document.form1.spkVolume.value = '20';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '30')
		document.form1.spkVolume.value = '30';	
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '40')
		document.form1.spkVolume.value = '40';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '50')
		document.form1.spkVolume.value = '50';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '60')
		document.form1.spkVolume.value = '60';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '70')
		document.form1.spkVolume.value = '70';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '80')
		document.form1.spkVolume.value = '80';	
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '90')
		document.form1.spkVolume.value = '90';
	if ('<xsl:value-of select="root/config/speaker/volume" />' == '100')
		document.form1.spkVolume.value = '100';
</xsl:if>

	//radio
	if ('<xsl:value-of select="root/config/image/inputSize" />' == '0')
		document.form1.VGA.checked=true;
	if ('<xsl:value-of select="root/config/image/inputSize" />' == '1')
		document.form1.SXGA.checked=true;
	if ('<xsl:value-of select="root/config/image/inputSize" />' == '5')
		document.form1.XGA.checked=true;
	if ('<xsl:value-of select="root/config/image/inputSize" />' == '2')
		document.form1.NTSC.checked=true;
	if ('<xsl:value-of select="root/config/image/inputSize" />' == '3')
		document.form1.PAL.checked=true;

	//night mode
	if ('<xsl:value-of select="root/config/night/nightShot" />' == '1'){
		document.form1.nightShotSelect.value = '1';
		document.form1.nightShotBox.checked=true;
		document.form1.nightShotBoxOV7725.checked=true;
		document.form1.nightShotSelectOV7725.value = '1';
	}
	if ('<xsl:value-of select="root/config/night/nightShot" />' == '2'){
		document.form1.nightShotSelect.value = '2';
		document.form1.nightShotBox.checked=true;
		document.form1.nightShotBoxOV7725.checked=true;
		document.form1.nightShotSelectOV7725.value = '2';
	}
	if ('<xsl:value-of select="root/config/night/nightShot" />' == '3'){
		document.form1.nightShotSelect.value = '3';
		document.form1.nightShotBox.checked=true;
		document.form1.nightShotBoxOV7725.checked=true;
		document.form1.nightShotSelectOV7725.value = '3';
	}

	if ('<xsl:value-of select="root/config/camEnv/indoor" />' == '0')
		document.form1.radioOutdoor.checked = true;
	else
		document.form1.radioIndoor.checked = true;

<xsl:if test="root/common/peripheral/IR = '1'">
	document.form1.irMode.value = '<xsl:value-of select="root/config/IR/irMode" />';
</xsl:if>

	changeMode();
	changeMode1();
	changeMode2();
	changeMode6();
	changeModeOV7725();
}

function changeMode(){
	if(document.form1.inputSize[0].checked){//VGA
		document.getElementById("vgaScale1").style.display="";
		document.getElementById("vgaScale2").style.display="";
		document.getElementById("vgaScale3").style.display="";
		document.getElementById("vgaScale4").style.display="";
		document.getElementById("xgaScale1").style.display="none";
		document.getElementById("xgaScale2").style.display="none";
		document.getElementById("xgaScale3").style.display="none";
		document.getElementById("xgaScale4").style.display="none";
		document.getElementById("sxgaMp4Scale1").style.display="none";
		document.getElementById("sxgaMp4Scale2").style.display="none";
		document.getElementById("sxgaMp4Scale3").style.display="none";
		document.getElementById("sxgaMp4Scale4").style.display="none";
		document.getElementById("sxgaJpgScale1").style.display="none";
		document.getElementById("sxgaJpgScale2").style.display="none";
		document.getElementById("sxgaJpgScale3").style.display="none";
		document.getElementById("sxgaJpgScale4").style.display="none";
		document.getElementById("ntscScale1").style.display="none";
		document.getElementById("ntscScale2").style.display="none";
		document.getElementById("ntscScale3").style.display="none";
		document.getElementById("ntscScale4").style.display="none";
		document.getElementById("palScale1").style.display="none";
		document.getElementById("palScale2").style.display="none";
		document.getElementById("palScale3").style.display="none";
		document.getElementById("palScale4").style.display="none";

		document.getElementById("vgaFps1").style.display="";
		document.getElementById("vgaFps2").style.display="";
		document.getElementById("vgaFps3").style.display="";
		document.getElementById("vgaFps4").style.display="";
		document.getElementById("xgaFps1").style.display="none";
		document.getElementById("xgaFps2").style.display="none";
		document.getElementById("xgaFps3").style.display="none";
		document.getElementById("xgaFps4").style.display="none";
		document.getElementById("sxgaFps1").style.display="none";
		document.getElementById("sxgaFps2").style.display="none";
		document.getElementById("sxgaFps3").style.display="none";
		document.getElementById("sxgaFps4").style.display="none";
		document.getElementById("ntscFps1").style.display="none";
		document.getElementById("ntscFps2").style.display="none";
		document.getElementById("ntscFps3").style.display="none";
		document.getElementById("ntscFps4").style.display="none";
		document.getElementById("palFps1").style.display="none";
		document.getElementById("palFps2").style.display="none";
		document.getElementById("palFps3").style.display="none";
		document.getElementById("palFps4").style.display="none";
	}
	else if(document.form1.inputSize[1].checked){//XGA
		document.getElementById("vgaScale1").style.display="none";
		document.getElementById("vgaScale2").style.display="none";
		document.getElementById("vgaScale3").style.display="none";
		document.getElementById("vgaScale4").style.display="none";
		document.getElementById("xgaScale1").style.display="";
		document.getElementById("xgaScale2").style.display="";
		document.getElementById("xgaScale3").style.display="";
		document.getElementById("xgaScale4").style.display="";
		document.getElementById("sxgaMp4Scale1").style.display="none";
		document.getElementById("sxgaMp4Scale2").style.display="none";
		document.getElementById("sxgaMp4Scale3").style.display="none";
		document.getElementById("sxgaMp4Scale4").style.display="none";
		document.getElementById("sxgaJpgScale1").style.display="none";
		document.getElementById("sxgaJpgScale2").style.display="none";
		document.getElementById("sxgaJpgScale3").style.display="none";
		document.getElementById("sxgaJpgScale4").style.display="none";
		document.getElementById("ntscScale1").style.display="none";
		document.getElementById("ntscScale2").style.display="none";
		document.getElementById("ntscScale3").style.display="none";
		document.getElementById("ntscScale4").style.display="none";
		document.getElementById("palScale1").style.display="none";
		document.getElementById("palScale2").style.display="none";
		document.getElementById("palScale3").style.display="none";
		document.getElementById("palScale4").style.display="none";

		document.getElementById("vgaFps1").style.display="none";
		document.getElementById("vgaFps2").style.display="none";
		document.getElementById("vgaFps3").style.display="none";
		document.getElementById("vgaFps4").style.display="none";
		document.getElementById("xgaFps1").style.display="";
		document.getElementById("xgaFps2").style.display="";
		document.getElementById("xgaFps3").style.display="";
		document.getElementById("xgaFps4").style.display="";
		document.getElementById("sxgaFps1").style.display="none";
		document.getElementById("sxgaFps2").style.display="none";
		document.getElementById("sxgaFps3").style.display="none";
		document.getElementById("sxgaFps4").style.display="none";
		document.getElementById("ntscFps1").style.display="none";
		document.getElementById("ntscFps2").style.display="none";
		document.getElementById("ntscFps3").style.display="none";
		document.getElementById("ntscFps4").style.display="none";
		document.getElementById("palFps1").style.display="none";
		document.getElementById("palFps2").style.display="none";
		document.getElementById("palFps3").style.display="none";
		document.getElementById("palFps4").style.display="none";
	}
	else if(document.form1.inputSize[2].checked){//SXGA
		document.getElementById("vgaScale1").style.display="none";
		document.getElementById("vgaScale2").style.display="none";
		document.getElementById("vgaScale3").style.display="none";
		document.getElementById("vgaScale4").style.display="none";
		document.getElementById("xgaScale1").style.display="none";
		document.getElementById("xgaScale2").style.display="none";
		document.getElementById("xgaScale3").style.display="none";
		document.getElementById("xgaScale4").style.display="none";
		if(document.form1.codec1[1].selected){
			document.getElementById("sxgaMp4Scale1").style.display="none";
			document.getElementById("sxgaJpgScale1").style.display="";
		}
		else{
			document.getElementById("sxgaMp4Scale1").style.display="";
			document.getElementById("sxgaJpgScale1").style.display="none";
		}
		if(document.form1.codec2[1].selected){
			document.getElementById("sxgaMp4Scale2").style.display="none";
			document.getElementById("sxgaJpgScale2").style.display="";
		}
		else{
			document.getElementById("sxgaMp4Scale2").style.display="";
			document.getElementById("sxgaJpgScale2").style.display="none";
		}
		document.getElementById("sxgaMp4Scale3").style.display="none";
		document.getElementById("sxgaJpgScale3").style.display="";
		document.getElementById("sxgaMp4Scale4").style.display="";
		document.getElementById("sxgaJpgScale4").style.display="none";

		document.getElementById("ntscScale1").style.display="none";
		document.getElementById("ntscScale2").style.display="none";
		document.getElementById("ntscScale3").style.display="none";
		document.getElementById("ntscScale4").style.display="none";
		document.getElementById("palScale1").style.display="none";
		document.getElementById("palScale2").style.display="none";
		document.getElementById("palScale3").style.display="none";
		document.getElementById("palScale4").style.display="none";

		document.getElementById("vgaFps1").style.display="none";
		document.getElementById("vgaFps2").style.display="none";
		document.getElementById("vgaFps3").style.display="none";
		document.getElementById("vgaFps4").style.display="none";
		document.getElementById("xgaFps1").style.display="none";
		document.getElementById("xgaFps2").style.display="none";
		document.getElementById("xgaFps3").style.display="none";
		document.getElementById("xgaFps4").style.display="none";
		document.getElementById("sxgaFps1").style.display="";
		document.getElementById("sxgaFps2").style.display="";
		document.getElementById("sxgaFps3").style.display="";
		document.getElementById("sxgaFps4").style.display="";
		document.getElementById("ntscFps1").style.display="none";
		document.getElementById("ntscFps2").style.display="none";
		document.getElementById("ntscFps3").style.display="none";
		document.getElementById("ntscFps4").style.display="none";
		document.getElementById("palFps1").style.display="none";
		document.getElementById("palFps2").style.display="none";
		document.getElementById("palFps3").style.display="none";
		document.getElementById("palFps4").style.display="none";
	}
	else if (document.form1.inputSize[3].checked){//NTSC
		document.getElementById("vgaScale1").style.display="none";
		document.getElementById("vgaScale2").style.display="none";
		document.getElementById("vgaScale3").style.display="none";
		document.getElementById("vgaScale4").style.display="none";
		document.getElementById("xgaScale1").style.display="none";
		document.getElementById("xgaScale2").style.display="none";
		document.getElementById("xgaScale3").style.display="none";
		document.getElementById("xgaScale4").style.display="none";
		document.getElementById("sxgaMp4Scale1").style.display="none";
		document.getElementById("sxgaMp4Scale2").style.display="none";
		document.getElementById("sxgaMp4Scale3").style.display="none";
		document.getElementById("sxgaMp4Scale4").style.display="none";
		document.getElementById("sxgaJpgScale1").style.display="none";
		document.getElementById("sxgaJpgScale2").style.display="none";
		document.getElementById("sxgaJpgScale3").style.display="none";
		document.getElementById("sxgaJpgScale4").style.display="none";
		document.getElementById("ntscScale1").style.display="";
		document.getElementById("ntscScale2").style.display="";
		document.getElementById("ntscScale3").style.display="";
		document.getElementById("ntscScale4").style.display="";
		document.getElementById("palScale1").style.display="none";
		document.getElementById("palScale2").style.display="none";
		document.getElementById("palScale3").style.display="none";
		document.getElementById("palScale4").style.display="none";

		document.getElementById("vgaFps1").style.display="none";
		document.getElementById("vgaFps2").style.display="none";
		document.getElementById("vgaFps3").style.display="none";
		document.getElementById("vgaFps4").style.display="none";
		document.getElementById("xgaFps1").style.display="none";
		document.getElementById("xgaFps2").style.display="none";
		document.getElementById("xgaFps3").style.display="none";
		document.getElementById("xgaFps4").style.display="none";
		document.getElementById("sxgaFps1").style.display="none";
		document.getElementById("sxgaFps2").style.display="none";
		document.getElementById("sxgaFps3").style.display="none";
		document.getElementById("sxgaFps4").style.display="none";
		document.getElementById("ntscFps1").style.display="";
		document.getElementById("ntscFps2").style.display="";
		document.getElementById("ntscFps3").style.display="";
		document.getElementById("ntscFps4").style.display="";
		document.getElementById("palFps1").style.display="none";
		document.getElementById("palFps2").style.display="none";
		document.getElementById("palFps3").style.display="none";
		document.getElementById("palFps4").style.display="none";
	}
	else if (document.form1.inputSize[4].checked){//PAL
		document.getElementById("vgaScale1").style.display="none";
		document.getElementById("vgaScale2").style.display="none";
		document.getElementById("vgaScale3").style.display="none";
		document.getElementById("vgaScale4").style.display="none";
		document.getElementById("xgaScale1").style.display="none";
		document.getElementById("xgaScale2").style.display="none";
		document.getElementById("xgaScale3").style.display="none";
		document.getElementById("xgaScale4").style.display="none";
		document.getElementById("sxgaMp4Scale1").style.display="none";
		document.getElementById("sxgaMp4Scale2").style.display="none";
		document.getElementById("sxgaMp4Scale3").style.display="none";
		document.getElementById("sxgaMp4Scale4").style.display="none";
		document.getElementById("sxgaJpgScale1").style.display="none";
		document.getElementById("sxgaJpgScale2").style.display="none";
		document.getElementById("sxgaJpgScale3").style.display="none";
		document.getElementById("sxgaJpgScale4").style.display="none";
		document.getElementById("ntscScale1").style.display="none";
		document.getElementById("ntscScale2").style.display="none";
		document.getElementById("ntscScale3").style.display="none";
		document.getElementById("ntscScale4").style.display="none";
		document.getElementById("palScale1").style.display="";
		document.getElementById("palScale2").style.display="";
		document.getElementById("palScale3").style.display="";
		document.getElementById("palScale4").style.display="";

		document.getElementById("vgaFps1").style.display="none";
		document.getElementById("vgaFps2").style.display="none";
		document.getElementById("vgaFps3").style.display="none";
		document.getElementById("vgaFps4").style.display="none";
		document.getElementById("xgaFps1").style.display="none";
		document.getElementById("xgaFps2").style.display="none";
		document.getElementById("xgaFps3").style.display="none";
		document.getElementById("xgaFps4").style.display="none";
		document.getElementById("sxgaFps1").style.display="none";
		document.getElementById("sxgaFps2").style.display="none";
		document.getElementById("sxgaFps3").style.display="none";
		document.getElementById("sxgaFps4").style.display="none";
		document.getElementById("ntscFps1").style.display="none";
		document.getElementById("ntscFps2").style.display="none";
		document.getElementById("ntscFps3").style.display="none";
		document.getElementById("ntscFps4").style.display="none";
		document.getElementById("palFps1").style.display="";
		document.getElementById("palFps2").style.display="";
		document.getElementById("palFps3").style.display="";
		document.getElementById("palFps4").style.display="";
	}
/*
		if(document.form1.inputSize[0].checked){//VGA
			document.getElementById("mp4Fps1").style.display="";
			document.getElementById("jpgFps1").style.display="";
			document.getElementById("mobileFps1").style.display="";
			document.getElementById("mp4Fps2").style.display="none";
			document.getElementById("jpgFps2").style.display="none";
			document.getElementById("mobileFps2").style.display="none";
			document.getElementById("mp4Fps3").style.display="none";
			document.getElementById("jpgFps3").style.display="none";
			document.getElementById("mobileFps3").style.display="none";
			document.getElementById("jpgScale1").style.display="";
			document.getElementById("mobileScale1").style.display="";
			document.getElementById("jpgScale2").style.display="none";
			document.getElementById("mobileScale2").style.display="none";
			document.getElementById("jpgScale3").style.display="none";
			document.getElementById("mobileScale3").style.display="none";
			document.getElementById("sxga_text1").style.display="none";
			document.getElementById("sxga_text2").style.display="none";
			
			document.getElementById("mp4FpsNtsc").style.display="none";
			document.getElementById("mp4FpsPal").style.display="none";
			document.getElementById("jpgFpsNtsc").style.display="none";
			document.getElementById("jpgFpsPal").style.display="none";
			document.getElementById("mobileFpsNtsc").style.display="none";
			document.getElementById("mobileFpsPal").style.display="none";
			document.getElementById("jpgScaleNtsc").style.display="none";
			document.getElementById("jpgScalePal").style.display="none";
			document.getElementById("mobileScaleNtsc").style.display="none";
			document.getElementById("mobileScalePal").style.display="none";
		}
		else if(document.form1.inputSize[1].checked){//XGA
			document.getElementById("mp4Fps1").style.display="none";
			document.getElementById("jpgFps1").style.display="none";
			document.getElementById("mobileFps1").style.display="none";
			document.getElementById("mp4Fps2").style.display="";
			document.getElementById("jpgFps2").style.display="";
			document.getElementById("mobileFps2").style.display="";
			document.getElementById("mp4Fps3").style.display="none";
			document.getElementById("jpgFps3").style.display="none";
			document.getElementById("mobileFps3").style.display="none";
			document.getElementById("jpgScale1").style.display="none";
			document.getElementById("mobileScale1").style.display="none";
			document.getElementById("jpgScale2").style.display="";
			document.getElementById("mobileScale2").style.display="";
			document.getElementById("jpgScale3").style.display="none";
			document.getElementById("mobileScale3").style.display="none";
			document.getElementById("sxga_text1").style.display="none";
			document.getElementById("sxga_text2").style.display="none";
			
			document.getElementById("mp4FpsNtsc").style.display="none";
			document.getElementById("mp4FpsPal").style.display="none";
			document.getElementById("jpgFpsNtsc").style.display="none";
			document.getElementById("jpgFpsPal").style.display="none";
			document.getElementById("mobileFpsNtsc").style.display="none";
			document.getElementById("mobileFpsPal").style.display="none";
			document.getElementById("jpgScaleNtsc").style.display="none";
			document.getElementById("jpgScalePal").style.display="none";
			document.getElementById("mobileScaleNtsc").style.display="none";
			document.getElementById("mobileScalePal").style.display="none";
		}
		else if(document.form1.inputSize[2].checked){//SXGA
			document.getElementById("mp4Fps1").style.display="none";
			document.getElementById("jpgFps1").style.display="none";
			document.getElementById("mobileFps1").style.display="none";
			document.getElementById("mp4Fps2").style.display="none";
			document.getElementById("jpgFps2").style.display="none";
			document.getElementById("mobileFps2").style.display="none";
			document.getElementById("mp4Fps3").style.display="";
			document.getElementById("jpgFps3").style.display="";
			document.getElementById("mobileFps3").style.display="";
			document.getElementById("jpgScale1").style.display="none";
			document.getElementById("mobileScale1").style.display="none";
			document.getElementById("jpgScale2").style.display="none";
			document.getElementById("mobileScale2").style.display="none";
			document.getElementById("jpgScale3").style.display="";
			document.getElementById("mobileScale3").style.display="";
			document.getElementById("sxga_text1").style.display="";
			document.getElementById("sxga_text2").style.display="";
			
			document.getElementById("mp4FpsNtsc").style.display="none";
			document.getElementById("mp4FpsPal").style.display="none";
			document.getElementById("jpgFpsNtsc").style.display="none";
			document.getElementById("jpgFpsPal").style.display="none";
			document.getElementById("mobileFpsNtsc").style.display="none";
			document.getElementById("mobileFpsPal").style.display="none";
			document.getElementById("jpgScaleNtsc").style.display="none";
			document.getElementById("jpgScalePal").style.display="none";
			document.getElementById("mobileScaleNtsc").style.display="none";
			document.getElementById("mobileScalePal").style.display="none";
		}
		else if (document.form1.inputSize[3].checked){//NTSC
			document.getElementById("mp4Fps1").style.display="none";
			document.getElementById("jpgFps1").style.display="none";
			document.getElementById("mobileFps1").style.display="none";
			document.getElementById("mp4Fps2").style.display="none";
			document.getElementById("jpgFps2").style.display="none";
			document.getElementById("mobileFps2").style.display="none";
			document.getElementById("mp4Fps3").style.display="none";
			document.getElementById("jpgFps3").style.display="none";
			document.getElementById("mobileFps3").style.display="none";
			document.getElementById("jpgScale1").style.display="none";
			document.getElementById("mobileScale1").style.display="none";
			document.getElementById("jpgScale2").style.display="none";
			document.getElementById("mobileScale2").style.display="none";
			document.getElementById("jpgScale3").style.display="none";
			document.getElementById("mobileScale3").style.display="none";
			document.getElementById("sxga_text1").style.display="none";
			document.getElementById("sxga_text2").style.display="none";
			
			document.getElementById("mp4FpsNtsc").style.display="";
			document.getElementById("mp4FpsPal").style.display="none";
			document.getElementById("jpgFpsNtsc").style.display="";
			document.getElementById("jpgFpsPal").style.display="none";
			document.getElementById("mobileFpsNtsc").style.display="";
			document.getElementById("mobileFpsPal").style.display="none";
			document.getElementById("jpgScaleNtsc").style.display="";
			document.getElementById("jpgScalePal").style.display="none";
			document.getElementById("mobileScaleNtsc").style.display="";
			document.getElementById("mobileScalePal").style.display="none";
		}
		else if (document.form1.inputSize[4].checked){//PAL
			document.getElementById("mp4Fps1").style.display="none";
			document.getElementById("jpgFps1").style.display="none";
			document.getElementById("mobileFps1").style.display="none";
			document.getElementById("mp4Fps2").style.display="none";
			document.getElementById("jpgFps2").style.display="none";
			document.getElementById("mobileFps2").style.display="none";
			document.getElementById("mp4Fps3").style.display="none";
			document.getElementById("jpgFps3").style.display="none";
			document.getElementById("mobileFps3").style.display="none";
			document.getElementById("jpgScale1").style.display="none";
			document.getElementById("mobileScale1").style.display="none";
			document.getElementById("jpgScale2").style.display="none";
			document.getElementById("mobileScale2").style.display="none";
			document.getElementById("jpgScale3").style.display="none";
			document.getElementById("mobileScale3").style.display="none";
			document.getElementById("sxga_text1").style.display="none";
			document.getElementById("sxga_text2").style.display="none";
			
			document.getElementById("mp4FpsNtsc").style.display="none";
			document.getElementById("mp4FpsPal").style.display="";
			document.getElementById("jpgFpsNtsc").style.display="none";
			document.getElementById("jpgFpsPal").style.display="";
			document.getElementById("mobileFpsNtsc").style.display="none";
			document.getElementById("mobileFpsPal").style.display="";
			document.getElementById("jpgScaleNtsc").style.display="none";
			document.getElementById("jpgScalePal").style.display="";
			document.getElementById("mobileScaleNtsc").style.display="none";
			document.getElementById("mobileScalePal").style.display="";
		}
		*/
}

function changeModeOV7725(){
	if(document.form1.nightShotBoxOV7725.checked){
		document.form1.nightShotSelectOV7725.disabled = false;
		document.getElementById("nightmode_text_ov7725").style.display="";
	}
	else{
		document.form1.nightShotSelectOV7725.disabled = true;
		document.getElementById("nightmode_text_ov7725").style.display="none";
	}
}

function changeMode1(){
	if(document.form1.nightShotBox.checked){
		document.form1.nightShotSelect.disabled = false;
		document.getElementById("nightmode_text").style.display="";
	}
	else{
		document.form1.nightShotSelect.disabled = true;
		document.getElementById("nightmode_text").style.display="none";
	}
}

function changeMode2(){
	if(document.form1.inputSize[2].checked){
		if(document.form1.codec1[1].selected){
			document.getElementById("sxgaMp4Scale1").style.display="none";
			document.getElementById("sxgaJpgScale1").style.display="";
		}
		else{
			document.getElementById("sxgaMp4Scale1").style.display="";
			document.getElementById("sxgaJpgScale1").style.display="none";
		}
		if(document.form1.codec2[1].selected){
			document.getElementById("sxgaMp4Scale2").style.display="none";
			document.getElementById("sxgaJpgScale2").style.display="";
		}
		else{
			document.getElementById("sxgaMp4Scale2").style.display="";
			document.getElementById("sxgaJpgScale2").style.display="none";
		}
	}

	if(document.form1.codec1[0].selected){
		document.form1.quality1.disabled=true;
		document.form1.bps1.disabled=false;
	}
	else{
		document.form1.quality1.disabled=false;
		document.form1.bps1.disabled=true;
	}
	
	if(document.form1.codec2[0].selected){
		document.form1.quality2.disabled=true;
		document.form1.bps2.disabled=false;
	}
	else{
		document.form1.quality2.disabled=false;
		document.form1.bps2.disabled=true;
	}
}

function changeMode5(){
	if(document.form1.inputSize[0].checked){//VGA
		document.form1.codec1.value = '1';
		document.form1.codec2.value = '1';
		changeMode2();
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="none";
	}
	else if(document.form1.inputSize[1].checked){//XGA
		document.form1.codec1.value = '1';
		document.form1.codec2.value = '1';
		changeMode2();
		document.getElementById("xga_text").style.display="";
		document.getElementById("sxga_text").style.display="none";
	}
	else if(document.form1.inputSize[2].checked){//SXGA
		document.form1.codec1.value = '0';
		document.form1.codec2.value = '1';
		changeMode2();
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="";
	}
	else if (document.form1.inputSize[3].checked){//NTSC
		document.form1.codec1.value = '1';
		document.form1.codec2.value = '1';
		changeMode2();
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="none";
	}
	else if (document.form1.inputSize[4].checked){//PAL
		document.form1.codec1.value = '1';
		document.form1.codec2.value = '1';
		changeMode2();
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="none";
	}
}

function changeMode6(){
	if(document.form1.inputSize[0].checked){//VGA
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="none";
	}
	else if(document.form1.inputSize[1].checked){//XGA
		document.getElementById("xga_text").style.display="";
		document.getElementById("sxga_text").style.display="none";
	}
	else if(document.form1.inputSize[2].checked){//SXGA
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="";
	}
	else if (document.form1.inputSize[3].checked){//NTSC
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="none";
	}
	else if (document.form1.inputSize[4].checked){//PAL
		document.getElementById("xga_text").style.display="none";
		document.getElementById("sxga_text").style.display="none";
	}
}
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleSetup" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleSetup" /></title>
</xsl:if>

</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%"><xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/cameraName" /></td>
        <td align="right" nowrap="nowrap"></td>
        <td align="right" nowrap="nowrap"><xsl:value-of select="root/lang/frame/version" />
										  <xsl:value-of select="root/common/version" /></td>
      </tr>
    </table>
	<table id="topnav_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="../images/dlink.gif" width="836" height="92" /></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF">
		<tr id="topnav_container">
        	
			
		<xsl:if test="root/common/peripheral/wireless = '0'">
			<td width="125"><img src="../images/model.gif" width="125" height="25" /></td>
		</xsl:if>
		<xsl:if test="root/common/peripheral/wireless = '1'">
			<td width="125"><img src="../images/model_w.gif" width="125" height="25" /></td>
		</xsl:if>
			
            
			<td id="topnavoff"><a href="../index.cgi"><xsl:value-of select="root/lang/frame/home" /></a></td>
			<td id="topnavon"><a href="adv_wizard.cgi"><xsl:value-of select="root/lang/frame/advanced" /></a></td>
			<td id="topnavoff"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavoff"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
			<td id="topnavoff"><a href="support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td id="sidenav_container" valign="top" width="125" align="left">
				<table cellspacing="0" cellpadding="0" border="0">
                  <tbody>
                    <tr>
                      <td id="sidenav_container">
					  <div id="sidenav">
						<ul>
						  	<li>
								<div><a href="adv_wizard.cgi"><xsl:value-of select="root/lang/leftPanel/wizard" /></a></div>
							</li>
							<li>
								<div><a href="adv_lan.cgi"><xsl:value-of select="root/lang/leftPanel/networkSettings" /></a></div>
							</li>
							<xsl:if test="root/common/peripheral/wireless = '1'">
							<li>
								<div><a href="adv_wireless.cgi"><xsl:value-of select="root/lang/leftPanel/wireless" /></a></div>
							</li>
							</xsl:if>
							<li>
								<div><a href="adv_ddns.cgi"><xsl:value-of select="root/lang/leftPanel/ddns" /></a></div>
							</li>
							<li>
								<div><a href="adv_image.cgi"><xsl:value-of select="root/lang/leftPanel/imageSettings" /></a></div>
							</li>
							<li>
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/audioVideo" /></div>
							</li>
<!--
							<li>
								<div><a href="adv_mail_ftp.cgi"><xsl:value-of select="root/lang/leftPanel/mailFtp" /></a></div>
							</li>
-->
							<li>
								<div><a href="mot_detect.cgi"><xsl:value-of select="root/lang/leftPanel/motionDetection" /></a></div>
							</li>
							<li>
								<div><a href="tools_system.cgi"><xsl:value-of select="root/lang/leftPanel/timeAndDate" /></a></div>
							</li>
							<xsl:if test="root/common/peripheral/PT = '1'">
							<li>
								<div><a href="cam_control.cgi"><xsl:value-of select="root/lang/leftPanel/cameraControl" /></a></div>
							</li>
							</xsl:if>
							<li>
								<div><a href="recorder.cgi"><xsl:value-of select="root/lang/leftPanel/recording" /></a></div>
							</li>
							<li>
								<div><a href="adv_snapshot_cont.cgi"><xsl:value-of select="root/lang/leftPanel/snapshot" /></a></div>
							</li>
							<xsl:if test="root/common/peripheral/GPOUTs != '0'">
							<li>
								<div><a href="adv_do.cgi"><xsl:value-of select="root/lang/leftPanel/digitalOutput" /></a></div>
							</li>
							</xsl:if>
							<xsl:if test="root/common/peripheral/RS485 = '1'">
							<li>
								<div><a href="rs485.cgi"><xsl:value-of select="root/lang/leftPanel/rs485" /></a></div>
							</li>
							</xsl:if>
							<xsl:if test="root/common/peripheral/localStorage = '1'">
							<li>
								<div><a href="adv_sdcard.cgi"><xsl:value-of select="root/lang/leftPanel/playback" /></a></div>
							</li>
							</xsl:if>
							<li>
								<div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
							</li>
						</ul>
					  </div></td>
                    </tr>
                  </tbody>
              </table></td>
			<form id="form1" name="form1" method="post" action="adv_audiovideo.cgi">
			<td valign="top" id="maincontent_container" width="563">
				<div id="maincontent">
                  <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/audioVideoSettings" /></h1>
                    <xsl:choose>
						<xsl:when test="contains(root/common/sensor, 'mt9m112') or contains(root/common/sensor, 'mt9m131') or contains(root/common/sensor, 'mt9v111')">
                       <xsl:value-of select="root/lang/body/description1" /> <br /><br />
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="root/lang/body/descriptionNoNightmode" /><br /><br /></xsl:otherwise>
					</xsl:choose>
                    <xsl:if test="contains(root/common/sensor, 'mt9m112') or contains(root/common/sensor, 'mt9m131')">
                     <xsl:value-of select="root/lang/body/description2" /> <br /><br />
                    </xsl:if>
                   
					<center>
                    <input id="button1" name="button1" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
                    <input id="button2" name="button2" type="reset" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_audiovideo.cgi'" />
					</center>
					<xsl:if test="/root/result/code = 'invalidParameter'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/config/needReboot = '1'">
						<font color="#FF0000">
						<br />
						<xsl:value-of select="root/lang/body/reboot1" />
						<span name="leavetime" id="leavetime"></span>
						<xsl:value-of select="root/lang/body/reboot2" />
						</font>
   				    </xsl:if>
                  </div>
				<div class="box" id="videosensor" name="videosensor" style="display:none">
                    <h2><xsl:value-of select="root/lang/body/videoSensor" /></h2>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                <tr id="xga_text" name="xga_text" style="display:none">
                  <td colspan="2"><font color="#FF0000"><xsl:value-of select="root/lang/body/xgaText" /></font></td>
                </tr>
                <tr id="sxga_text" name="sxga_text" style="display:none">
                  <td colspan="2"><font color="#FF0000"><xsl:value-of select="root/lang/body/sxgaText1" /><br />
				  <xsl:value-of select="root/lang/body/sxgaText2" /></font></td>
                </tr>
                <tr>
                  <td width="155"><xsl:value-of select="root/lang/body/sensorOutput" /></td>
                  <td width="370">
				  <input type="radio" value="0" name="inputSize" id="VGA" onclick="changeMode();changeMode5()" />
				  <xsl:value-of select="root/lang/body/vga" /></td>
				 </tr>
                <tr>
                  <td width="155">&nbsp;</td>
                  <td width="370">
				  <input type="radio" value="5" name="inputSize" id="XGA" onclick="changeMode();changeMode5()" />
				  <xsl:value-of select="root/lang/body/xga" />
				  </td>
				</tr>
                <tr>
                  <td width="155">&nbsp;</td>
                  <td width="370">
				  <input type="radio" value="1" name="inputSize" id="SXGA" onclick="changeMode();changeMode5()" />
				  <xsl:value-of select="root/lang/body/sxga" />
				  </td>
				</tr>
                <tr style="display:none">
                  <td width="155">&nbsp;</td>
                  <td width="370">
				  <input type="radio" value="2" name="inputSize" id="NTSC" onclick="changeMode();changeMode5()" />
				  NTSC (704x480)
				  </td>
				</tr>
                <tr style="display:none">
                  <td width="155">&nbsp;</td>
                  <td width="370">
				  <input type="radio" value="3" name="inputSize" id="PAL" onclick="changeMode();changeMode5()" />
				  PAL (704x576)
				  </td>
				</tr>
              </table>
                  </div>
				  <div class="box">
                    <h2>VIDEO PROFILE 1</h2>
					<table id="id_box_table" width="525" style="border-collapse: collapse" bordercolor="#111111">
				<tr>
					<td width="100" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/encodeType"/></td>
					<td width="95" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/resolution" /></td>
					<td width="55" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/FPS" /></td>
					<td width="120" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/BPS" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/JPEG_Quality" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/RTSP_URL" /></td>
				</tr>
				<tr>
					<td width="99" height="25">
					<select name="codec1" id="codec1" onchange="changeMode2()" onclick="changeMode2()">
                              <option value="1">MPEG4</option>
                              <option value="0">JPEG</option>
                      </select></td>
					<td width="90" height="25">
						<select name="vgaScale1" id="vgaScale1">
							<option value="0">640x480</option>
							<option value="1">320x240</option>
							<option value="2">160x120</option>
						</select>
						<select name="xgaScale1" id="xgaScale1" style="display:none">
							<option value="0">1024x768</option>
							<option value="1">512x384</option>
							<option value="2">256x192</option>
						</select>
						<select name="sxgaMp4Scale1" id="sxgaMp4Scale1" style="display:none">
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="sxgaJpgScale1" id="sxgaJpgScale1" style="display:none">
							<option value="0">1280x1024</option>
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="ntscScale1" id="ntscScale1" style="display:none">
							<option value="0">704X480</option>
							<option value="1">352X240</option>
							<option value="2">176X120</option>
						</select>
						<select name="palScale1" id="palScale1" style="display:none">
							<option value="0">704x576</option>
							<option value="1">352x288</option>
							<option value="2">176x144</option>
						</select>
						<input name="scale1" id="scale1" type="hidden" />
					</td>
					<td width="56" height="25">
					<select class="text" size="1" name="vgaFps1" id="vgaFps1">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="xgaFps1" id="xgaFps1" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="sxgaFps1" id="sxgaFps1" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="ntscFps1" id="ntscFps1" style="display:none">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="palFps1" id="palFps1" style="display:none">
                      <option value="25">25</option>
                      <option value="12">12</option>
                      <option value="8">8</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<input name="fps1" id="fps1" type="hidden" />
					</td>
					<td width="65" height="25">
						<select class="text" size="1" name="bps1" id="bps1">
							<option value="2048">2 <xsl:value-of select="root/lang/body/mbps" /></option>
							<!--<option value="1792">1.75 <xsl:value-of select="root/lang/body/mbps" /></option>-->
							<option value="1536">1.5 <xsl:value-of select="root/lang/body/mbps" /></option>
							<!--<option value="1280">1.25 <xsl:value-of select="root/lang/body/mbps" /></option>-->
							<option value="1024">1 <xsl:value-of select="root/lang/body/mbps" /></option>
							<option value="768">768 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="512">512 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="384">384 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="256">256 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="128">128 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="64">64 <xsl:value-of select="root/lang/body/kbps" /></option>
							<!--<option value="32">32 <xsl:value-of select="root/lang/body/kbps" /></option>-->
						</select>
					</td>
					<td width="89" height="25">
						<select class="text" size="1" name="quality1" id="quality1">
							<option value="0"><xsl:value-of select="root/lang/body/low" /></option>
							<option value="1"><xsl:value-of select="root/lang/body/fair" /></option>
							<option value="2"><xsl:value-of select="root/lang/body/standard" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/good" /></option>
							<option value="4"><xsl:value-of select="root/lang/body/excellent" /></option>
						</select>
					</td>
					<td width="89" height="25">
						<input maxlength="30" size="15" value="{root/config/RTSP/url[1]}" name="url1" id="url1" />					</td>
				</tr>
				</table>
                  </div>
<div class="box">
                    <h2>VIDEO PROFILE 2</h2>
					<table id="id_box_table" width="525" style="border-collapse: collapse" bordercolor="#111111">
				<tr>
					<td width="100" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/encodeType"/></td>
					<td width="95" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/resolution" /></td>
					<td width="55" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/FPS" /></td>
					<td width="120" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/BPS" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/JPEG_Quality" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/RTSP_URL" /></td>
				</tr>
				<tr>
					<td width="99" height="25">
					<select name="codec2" id="codec2" onchange="changeMode2()" onclick="changeMode2()">
                              <option value="1">MPEG4</option>
                              <option value="0">JPEG</option>
                      </select></td>
					<td width="90" height="25">
						<select name="vgaScale2" id="vgaScale2">
							<option value="0">640x480</option>
							<option value="1">320x240</option>
							<option value="2">160x120</option>
						</select>
						<select name="xgaScale2" id="xgaScale2" style="display:none">
							<!--<option value="0">1024x768</option>-->
							<option value="1">512x384</option>
							<option value="2">256x192</option>
						</select>
						<select name="sxgaMp4Scale2" id="sxgaMp4Scale2" style="display:none">
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="sxgaJpgScale2" id="sxgaJpgScale2" style="display:none">
							<!--<option value="0">1280x1024</option>-->
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="ntscScale2" id="ntscScale2" style="display:none">
							<option value="0">704X480</option>
							<option value="1">352X240</option>
							<option value="2">176X120</option>
						</select>
						<select name="palScale2" id="palScale2" style="display:none">
							<option value="0">704X576</option>
							<option value="1">352X288</option>
							<option value="2">176X144</option>
						</select>
						<input name="scale2" id="scale2" type="hidden" />
					</td>
					<td width="56" height="25">
					<select class="text" size="1" name="vgaFps2" id="vgaFps2">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="xgaFps2" id="xgaFps2" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="sxgaFps2" id="sxgaFps2" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="ntscFps2" id="ntscFps2" style="display:none">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="palFps2" id="palFps2" style="display:none">
                      <option value="25">25</option>
                      <option value="12">12</option>
                      <option value="8">8</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
					 </select>
					<input name="fps2" id="fps2" type="hidden" />
					</td>
					<td width="65" height="25">
						<select class="text" size="1" name="bps2" id="bps2">
							<option value="2048">2 <xsl:value-of select="root/lang/body/mbps" /></option>
							<!--<option value="1792">1.75 <xsl:value-of select="root/lang/body/mbps" /></option>-->
							<option value="1536">1.5 <xsl:value-of select="root/lang/body/mbps" /></option>
							<!--<option value="1280">1.25 <xsl:value-of select="root/lang/body/mbps" /></option>-->
							<option value="1024">1 <xsl:value-of select="root/lang/body/mbps" /></option>
							<option value="768">768 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="512">512 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="384">384 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="256">256 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="128">128 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="64">64 <xsl:value-of select="root/lang/body/kbps" /></option>
							<!--<option value="32">32 <xsl:value-of select="root/lang/body/kbps" /></option>-->
						</select>
					</td>
					<td width="89" height="25">
						<select class="text" size="1" name="quality2" id="quality2">
							<option value="0"><xsl:value-of select="root/lang/body/low" /></option>
							<option value="1"><xsl:value-of select="root/lang/body/fair" /></option>
							<option value="2"><xsl:value-of select="root/lang/body/standard" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/good" /></option>
							<option value="4"><xsl:value-of select="root/lang/body/excellent" /></option>
						</select>
					</td>
					<td width="89" height="25">
						<input maxlength="30" size="15" value="{root/config/RTSP/url[2]}" name="url2" id="url2" />					</td>
				</tr>
				</table>
                  </div>
<div class="box">
                    <h2>VIDEO PROFILE 3</h2>
					<table id="id_box_table" width="525" style="border-collapse: collapse" bordercolor="#111111">
				<tr>
					<td width="100" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/encodeType"/></td>
					<td width="95" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/resolution" /></td>
					<td width="55" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/FPS" /></td>
					<td width="120" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/BPS" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/JPEG_Quality" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/RTSP_URL" /></td>
				</tr>
				<tr>
					<td width="99" height="25">JPEG<input name="codec3" id="codec3" type="hidden" value="0" /></td>
					<td width="90" height="25">
						<select name="vgaScale3" id="vgaScale3">
							<option value="0">640x480</option>
							<option value="1">320x240</option>
							<option value="2">160x120</option>
						</select>
						<select name="xgaScale3" id="xgaScale3" style="display:none">
							<!--<option value="0">1024x768</option>-->
							<option value="1">512x384</option>
							<option value="2">256x192</option>
						</select>
						<select name="sxgaMp4Scale3" id="sxgaMp4Scale3" style="display:none">
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="sxgaJpgScale3" id="sxgaJpgScale3" style="display:none">
							<!--<option value="0">1280x1024</option>-->
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="ntscScale3" id="ntscScale3" style="display:none">
							<option value="0">704X480</option>
							<option value="1">352X240</option>
							<option value="2">176X120</option>
						</select>
						<select name="palScale3" id="palScale3" style="display:none">
							<option value="0">704X576</option>
							<option value="1">352X288</option>
							<option value="2">176X144</option>
						</select>
						<input name="scale3" id="scale3" type="hidden" />
					</td>
					<td width="56" height="25">
					<select class="text" size="1" name="vgaFps3" id="vgaFps3">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="xgaFps3" id="xgaFps3" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="sxgaFps3" id="sxgaFps3" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="ntscFps3" id="ntscFps3" style="display:none">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="palFps3" id="palFps3" style="display:none">
                      <option value="25">25</option>
                      <option value="12">12</option>
                      <option value="8">8</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<input name="fps3" id="fps3" type="hidden" />
					</td>
					<td width="65" height="25">
						<center>--</center>
					</td>
					<td width="89" height="25">
						<select class="text" size="1" name="quality3" id="quality3">
							<option value="0"><xsl:value-of select="root/lang/body/low" /></option>
							<option value="1"><xsl:value-of select="root/lang/body/fair" /></option>
							<option value="2"><xsl:value-of select="root/lang/body/standard" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/good" /></option>
							<option value="4"><xsl:value-of select="root/lang/body/excellent" /></option>
						</select>
					</td>
					<td width="89" height="25">
						<input maxlength="30" size="15" value="{root/config/RTSP/url[3]}" name="url3" id="url3" />					</td>
				</tr>
				</table>
                  </div>
				  <div class="box">
                    <h2>VIDEO PROFILE 4 <xsl:value-of select="root/lang/body/mobileOnly" /></h2>
					<table id="id_box_table" width="525" style="border-collapse: collapse" bordercolor="#111111">
				<tr>
					<td width="100" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/encodeType"/></td>
					<td width="95" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/resolution" /></td>
					<td width="55" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/FPS" /></td>
					<td width="120" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/BPS" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/JPEG_Quality" /></td>
					<td width="75" bgcolor="#C0C0C0" height="20"><xsl:value-of select="root/lang/body/RTSP_URL" /></td>
				</tr>
				<tr>
					<td width="99" height="25">MPEG4<input name="codec4" id="codec4" type="hidden" value="1" /></td>
					<td width="90" height="25">
						<select name="vgaScale4" id="vgaScale4">
							<option value="0">640x480</option>
							<option value="1">320x240</option>
							<option value="2">160x120</option>
						</select>
						<select name="xgaScale4" id="xgaScale4" style="display:none">
							<!--<option value="0">1024x768</option>-->
							<option value="1">512x384</option>
							<option value="2">256x192</option>
						</select>
						<select name="sxgaMp4Scale4" id="sxgaMp4Scale4" style="display:none">
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="sxgaJpgScale4" id="sxgaJpgScale4" style="display:none">
							<!--<option value="0">1280x1024</option>-->
							<option value="1">640x512</option>
							<option value="2">320x256</option>
						</select>
						<select name="ntscScale4" id="ntscScale4" style="display:none">
							<option value="0">704X480</option>
							<option value="1">352X240</option>
							<option value="2">176X120</option>
						</select>
						<select name="palScale4" id="palScale4" style="display:none">
							<option value="0">704X576</option>
							<option value="1">352X288</option>
							<option value="2">176X144</option>
						</select>
						<input name="scale4" id="scale4" type="hidden" />
					</td>
					<td width="56" height="25">
					<select class="text" size="1" name="vgaFps4" id="vgaFps4">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="xgaFps4" id="xgaFps4" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="sxgaFps4" id="sxgaFps4" style="display:none">
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="ntscFps4" id="ntscFps4" style="display:none">
                      <option value="30">30</option>
                      <option value="15">15</option>
                      <option value="10">10</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<select class="text" size="1" name="palFps4" id="palFps4" style="display:none">
                      <option value="25">25</option>
                      <option value="12">12</option>
                      <option value="8">8</option>
                      <option value="5">5</option>
                      <option value="3">3</option>
					  <option value="2">2</option>
                      <option value="1">1</option>
                    </select>
					<input name="fps4" id="fps4" type="hidden" />
					</td>
					<td width="65" height="25">
						<select class="text" size="1" name="bps4" id="bps4">
							<option value="2048">2 <xsl:value-of select="root/lang/body/mbps" /></option>
							<!--<option value="1792">1.75 <xsl:value-of select="root/lang/body/mbps" /></option>-->
							<option value="1536">1.5 <xsl:value-of select="root/lang/body/mbps" /></option>
							<!--<option value="1280">1.25 <xsl:value-of select="root/lang/body/mbps" /></option>-->
							<option value="1024">1 <xsl:value-of select="root/lang/body/mbps" /></option>
							<option value="768">768 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="512">512 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="384">384 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="256">256 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="128">128 <xsl:value-of select="root/lang/body/kbps" /></option>
							<option value="64">64 <xsl:value-of select="root/lang/body/kbps" /></option>
							<!--<option value="32">32 <xsl:value-of select="root/lang/body/kbps" /></option>-->
						</select>
					</td>
					<td width="89" height="25">
						<center>
						  --    
						</center>
					</td>
					<td width="89" height="25">
						<input maxlength="30" size="15" value="{root/config/RTSP/url[4]}" name="url4" id="url4" />					</td>
				</tr>
				</table>
                  </div>

<!-- ov7725 -->
<div class="box" id="indoorDisp" style="display:none">
<h2><xsl:value-of select="root/lang/body/cameraEnv" /></h2>
<table cellspacing="1" cellpadding="1" width="525" border="0">
<!-- night mode text -->
	<tr id="nightmode_text_ov7725" name="nightmode_text_ov7725" style="display:none">
		<td colspan="2"><font color="#FF0000"><xsl:value-of select="root/lang/body/nightModeText" /></font></td>
	</tr>
<!-- night mode enable -->
	<tr>
		<td width="155"><xsl:value-of select="root/lang/body/enableNightMode" /></td>
		<td width="370">
			<input type="checkbox" name="nightShotBoxOV7725" id="nightShotBoxOV7725" onclick="changeModeOV7725()" />
		</td>
	</tr>
<!-- night mode shutter -->
	<tr>
		<td>&nbsp;</td>
		<td><xsl:value-of select="root/lang/body/shutter" />&nbsp;
			<select size="1" name="nightShotSelectOV7725" id="nightShotSelectOV7725" >
				<option value="1">1/15</option>
				<option value="2">1/7.5</option>
				<option value="3">1/3.25</option>
			</select>&nbsp;<xsl:value-of select="root/lang/body/second" />
		</td>
	</tr>
<!-- indoor -->
	<tr>
		<td><xsl:value-of select="root/lang/body/placedLocation" /></td>	
		<td>
			<input type="radio" value="1" name="indoor" id="radioIndoor" />
			<xsl:value-of select="root/lang/body/indoor" />
			&nbsp;
			<input type="radio" value="0" name="indoor" id="radioOutdoor"/>
			<xsl:value-of select="root/lang/body/outdoor" />
		</td>
	</tr>
</table>
</div>
<!-- end of ov7725 -->

				  <div class="box" id="nightMode" style="display:none">
                    <h2><xsl:value-of select="root/lang/body/nightMode" /></h2>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                <tr id="nightmode_text" name="nightmode_text" style="display:none">
                  <td colspan="2"><font color="#FF0000"><xsl:value-of select="root/lang/body/nightModeText" /></font></td>
                </tr>
                <tr>
                  <td width="155"><xsl:value-of select="root/lang/body/enableNightMode" /></td>
                  <td width="370">
				  <input type="checkbox" name="nightShotBox" id="nightShotBox" onclick="changeMode1()" />
				  <input name="nightShot" id="nightShot" type="hidden" size="1" value="0" />
				  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><xsl:value-of select="root/lang/body/shutter" />&nbsp;
                    <select size="1" name="nightShotSelect" id="nightShotSelect" >
                      <option value="1">1/15</option>
                      <option value="2">1/10</option>
                      <option value="3">1/5</option>
                    </select>
                    &nbsp;<xsl:value-of select="root/lang/body/second" /></td>
                </tr>

<xsl:if test="root/common/peripheral/IR = '1' and not (contains(root/common/sensor, 'vx1128'))">
                <tr>
                  <td><xsl:value-of select="root/lang/body/irLed" /></td>
		  <td><select size="1" name="irMode" id="irMode" >
                      <option value="0"><xsl:value-of select="root/lang/body/auto" /></option>

<xsl:if test="root/common/peripheral/PIR = '1'">
                      <option value="3"><xsl:value-of select="root/lang/body/autoPIR" /></option>
</xsl:if>

                      <option value="1"><xsl:value-of select="root/lang/body/on" /></option>
                      <option value="2"><xsl:value-of select="root/lang/body/off" /></option>
                    </select></td>
                </tr>
</xsl:if>

              </table>
                  </div>
				  <xsl:if test="contains(root/common/sensor, 'vx1128') and root/common/peripheral/IR = '1'">
				<div class="box" id="nightMode">
                    <h2><xsl:value-of select="root/lang/body/cameraEnv" /></h2>
                <table cellspacing="1" cellpadding="1" width="525" border="0">

<xsl:if test="root/common/peripheral/IR = '1'">
                <tr>
                  <td><xsl:value-of select="root/lang/body/irLed" /></td>
		  <td><select size="1" name="irMode" id="irMode" >
                      <option value="0"><xsl:value-of select="root/lang/body/auto" /></option>

<xsl:if test="root/common/peripheral/PIR = '1'">
                      <option value="3"><xsl:value-of select="root/lang/body/autoPIR" /></option>
</xsl:if>

                      <option value="1"><xsl:value-of select="root/lang/body/on" /></option>
                      <option value="2"><xsl:value-of select="root/lang/body/off" /></option>
                    </select></td>
                </tr>
</xsl:if>

              </table>
                  </div>
</xsl:if>

				  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/audioSettings" /></h2>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
<xsl:if test="root/common/peripheral/speaker = '1'">
                <tr>
                  <td width="155" ><xsl:value-of select="root/lang/body/enableSpeaker" /></td> 
                  <td width="370" ><input type="checkbox" name="spkEnableBox" id="spkEnableBox" />
                    <input name="spkEnable" id="spkEnable" type="hidden" size="3" value="off" /></td>
                  </tr>
                <tr>
                  <td><xsl:value-of select="root/lang/body/volume" /></td> 
                  <td><select name="spkVolume" id="spkVolume">
                      <option value="0">0</option>
                      <option value="10">10</option>
                      <option value="20">20</option>
                      <option value="30">30</option>
                      <option value="40">40</option>
                      <option value="50">50</option>
                      <option value="60">60</option>
                      <option value="70">70</option>
                      <option value="80">80</option>
                      <option value="90">90</option>
                      <option value="100">100</option>
                  </select>                    
				  </td>
                  </tr>
</xsl:if>
                <tr>
                  <td width="155"><xsl:value-of select="root/lang/body/enableMicrophone" /></td> 
                  <td width="370"><input type="checkbox" name="micEnableBox" id="micEnableBox" />
                    <input name="micEnable" id="micEnable" type="hidden" size="3" value="off" /></td>
                  </tr>
                <tr>
                  <td><xsl:value-of select="root/lang/body/volume" /></td> 
                  <td><select name="micVolume" id="micVolume">
                      <option value="0">0</option>
                      <option value="10">10</option>
                      <option value="20">20</option>
                      <option value="30">30</option>
                      <option value="40">40</option>
                      <option value="50">50</option>
                      <option value="60">60</option>
                      <option value="70">70</option>
                      <option value="80">80</option>
                      <option value="90">90</option>
                      <option value="100">100</option>
                  </select>                    
				  </td>
                  </tr>
              </table>
                  </div><br />
					<center>
                    <input id="button3" name="button3" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
                    <input id="button4" name="button4" type="reset" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_audiovideo.cgi'" />
					</center>
			  </div></td>
		  </form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text">
                      	<div id="help_other" style="display:none;font-size:11px">
                        <b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />  
                          <xsl:if test="contains(root/common/sensor, 'mt9m112') or  contains(root/common/sensor, 'mt9m131')">
                          <xsl:value-of select="root/lang/hint/descriptionThreeResolution" /><br />
                          <strong><xsl:value-of select="root/lang/hint/VGA" /></strong>
						  <xsl:value-of select="root/lang/hint/VGA1" /> <br />
                          <strong><xsl:value-of select="root/lang/hint/XGA" /></strong>
						  <xsl:value-of select="root/lang/hint/XGA1" /> <br />
                          <strong><xsl:value-of select="root/lang/hint/SXGA" /></strong>
						  <xsl:value-of select="root/lang/hint/SXGA1" /> <br /><br />
                          </xsl:if>
                         
                          <strong><xsl:value-of select="root/lang/hint/EncodeType1" /></strong>
						  <xsl:value-of select="root/lang/hint/EncodeType2" /> <br /><br />
                          <strong><xsl:value-of select="root/lang/hint/Resolution1" /></strong>
						  <xsl:value-of select="root/lang/hint/Resolution2" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/FPS" /></strong>
						  <xsl:value-of select="root/lang/hint/FPS1" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/BPS" /></strong>
						  <xsl:value-of select="root/lang/hint/BPS1" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/JPEG_Quality" /></strong>
						  <xsl:value-of select="root/lang/hint/JPEG_Quality1" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/RTSP_URL" /></strong>
						  <xsl:value-of select="root/lang/hint/RTSP_URL1" /><br />
						  <xsl:value-of select="root/lang/hint/RTSP_URL2" /> <br /><br />
                          <xsl:if test="contains(root/common/sensor, 'mt9m112') or contains(root/common/sensor, 'mt9m131') or contains(root/common/sensor, 'mt9v111')">
                          <strong><xsl:value-of select="root/lang/hint/night" /></strong><xsl:value-of select="root/lang/hint/night1" /> <br /><br />
                          </xsl:if>
						  <xsl:if test="root/common/peripheral/IR = '1'">
						  <strong><xsl:value-of select="root/lang/hint/irled" /></strong>
						  <xsl:value-of select="root/lang/hint/irled1" /> <br /><br />
						  </xsl:if>
						  <strong><xsl:value-of select="root/lang/hint/Audio_Setup" /></strong>
						  <xsl:value-of select="root/lang/hint/Audio_Setup1" /> <br /><br />
                          <xsl:if test="root/common/peripheral/speaker = '1'">
						  <strong><xsl:value-of select="root/lang/hint/description4" /></strong><xsl:value-of select="root/lang/hint/description5" /><br /><br />
                          <strong><xsl:value-of select="root/lang/hint/Speaker_Volume" /></strong><xsl:value-of select="root/lang/hint/Speaker_Volume1" /><br /><br />
                          </xsl:if>
                           <strong><xsl:value-of select="root/lang/hint/description6" /></strong>
							<xsl:value-of select="root/lang/hint/description7" /><br /><br />
                            <strong><xsl:value-of select="root/lang/hint/Microphone_Volume" /></strong>
							<xsl:value-of select="root/lang/hint/Microphone_Volume1" /><br /><br />
							<xsl:value-of select="root/lang/hint/description11" /><br />
                        </div>
					  	<div id="help2102" style="display:none;font-size:11px">
					  	  <b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />                          
                          <xsl:value-of select="root/lang/hint/description10" /><br /><br />
                            <xsl:if test="contains(root/common/sensor, 'mt9m112')">       
                          <xsl:value-of select="root/lang/hint/description1" /><strong><xsl:value-of select="root/lang/hint/description2" /></strong><xsl:value-of select="root/lang/hint/description3" /><br /><br />
                            </xsl:if>
                            <strong><xsl:value-of select="root/lang/hint/EncodeType1" /></strong>
						  <xsl:value-of select="root/lang/hint/EncodeType2" /> <br /><br />
                          <strong><xsl:value-of select="root/lang/hint/Resolution1" /></strong>
						  <xsl:value-of select="root/lang/hint/Resolution2" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/FPS" /></strong>
						  <xsl:value-of select="root/lang/hint/FPS1" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/BPS" /></strong>
						  <xsl:value-of select="root/lang/hint/BPS1" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/JPEG_Quality" /></strong>
						  <xsl:value-of select="root/lang/hint/JPEG_Quality1" /> <br /><br />
						  <strong><xsl:value-of select="root/lang/hint/RTSP_URL" /></strong>
						  <xsl:value-of select="root/lang/hint/RTSP_URL1" /><br />
						  <xsl:value-of select="root/lang/hint/RTSP_URL2" /> <br /><br />
						  <xsl:value-of select="root/lang/hint/description8" /><br /><br />
						  <xsl:value-of select="root/lang/hint/description9" /><br /><br />
                          <xsl:if test="root/common/peripheral/speaker = '1'">
						  <strong><xsl:value-of select="root/lang/hint/description4" /></strong><xsl:value-of select="root/lang/hint/description5" /><br /><br />
                          </xsl:if>
                           <strong><xsl:value-of select="root/lang/hint/night" /></strong>
							<xsl:value-of select="root/lang/hint/night1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/hint/lightsource" /></strong>
							<xsl:value-of select="root/lang/hint/lightsource1" /><br /><br />
						  <strong><xsl:value-of select="root/lang/hint/description6" /></strong><xsl:value-of select="root/lang/hint/description7" /><br />
						</div>
						<div id="help6410" style="display:none;font-size:11px">
							<b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br /><br />
                            <xsl:value-of select="root/lang/hint/description10" /><br /><br />
                             <strong><xsl:value-of select="root/lang/hint/EncodeType1" /></strong>
						  <xsl:value-of select="root/lang/hint/EncodeType2" /> <br /><br />
                          <strong><xsl:value-of select="root/lang/hint/Resolution1" /></strong>
						  <xsl:value-of select="root/lang/hint/Resolution2" /> <br /><br />
							<strong><xsl:value-of select="root/lang/hint/FPS" /></strong>
							<xsl:value-of select="root/lang/hint/FPS1" /> <br /><br />
							<strong><xsl:value-of select="root/lang/hint/BPS" /></strong>
							<xsl:value-of select="root/lang/hint/BPS1" /> <br /><br />
							<strong><xsl:value-of select="root/lang/hint/JPEG_Quality" /></strong>
							<xsl:value-of select="root/lang/hint/JPEG_Quality1" /> <br /><br />
							<strong><xsl:value-of select="root/lang/hint/RTSP_URL" /></strong>
							<xsl:value-of select="root/lang/hint/RTSP_URL1" /><br />
							<xsl:value-of select="root/lang/hint/RTSP_URL2" /> <br /><br />
							<xsl:value-of select="root/lang/hint/description8" /><br /><br />
							<xsl:value-of select="root/lang/hint/description9" /><br /><br />
							<strong><xsl:value-of select="root/lang/hint/description4" /></strong>
							<xsl:value-of select="root/lang/hint/description5" /><br /><br />
							<strong><xsl:value-of select="root/lang/hint/description6" /></strong>
							<xsl:value-of select="root/lang/hint/description7" /><br />
						</div>
					  </td>
                    </tr>
                  </tbody>
			  </table></td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="../images/wireless_bottom.gif" width="114" height="35" /></td>
			<td width="10">&nbsp;</td><td>&nbsp;</td>
		</tr>
	</table>
<br />
<div align="center"><xsl:value-of select="root/lang/frame/copyright1" /> &copy; <xsl:value-of select="root/lang/frame/copyright2" /></div>
<br />
</body>
</html>
</xsl:template>
</xsl:stylesheet>
