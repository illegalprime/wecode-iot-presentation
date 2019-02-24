<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_image.xml" --><!DOCTYPE xsl:stylesheet  [
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
<head>
<link rel="stylesheet" type="text/css" href="../css_router.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="JavaScript" src="../public.js" type="text/javascript"></script>
<script language="JavaScript" src="../net.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
<![CDATA[
function send_request(){
	document.form1.command.value = "update";
	send_submit("form1");
}
function resetImage(){
	document.form1.command.value = "reset";
	send_submit("form1");
}

/*	function createXMLHttpRequest() {
		var theRequest = false;
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
            } catch (e) {
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

    var theRequest = false;
    function onAlertRequest() {
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
            } else {
                alert('There was a problem with the getRequest.');
            }
        }
    }
*/

	function sendData(type) {
/*	
		if(type=="autoExposure")
			changeMode();
		if(type=="nightShot"){
			changeMode1();
		}
*/
//		theRequest = createXMLHttpRequest();
//		if (!theRequest) {
//			return false;
//		}
		var hostname = document.form1.hostname.value;
//		sendImageRequest(type, hostname, theRequest, onAlertRequest);
		sendImageRequest(type, hostname, sensor);
	}
	
	function changeMode(){
//		if(document.form1.autoExposure.checked)
//			document.form1.brightness.disabled = false;
//		else
//			document.form1.brightness.disabled = true;
	}
	
//Send commend
var xmlDocSendImage;
var xslDocSendImage;
function LoadXMLXSLTDocSendImage(urlXMLSendImage,urlXSLSendImage){
	xmlDocSendImage=null;
	xslDocSendImage=null;
	new net.ContentLoader(urlXMLSendImage,onXMLLoadSendImage);
}

function onXMLLoadSendImage(){
	xmlDocSendImage=this.req.responseXML;
}

function onXSLLoadSendImage(){
	xslDocSendImage=this.req.responseXML;
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var sensor = "<xsl:value-of select="root/common/sensor " />";
var serial = "<xsl:value-of select="root/common/serial " />";

function InitActiveX(){
	var dcscontrol1 = document.getElementById("dcscontrol1");

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
	dcscontrol1.DynamicProfile(1);
	dcscontrol1.play();
	//for Digital Zoom
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == 0)
		dcscontrol1.EnableDigitalZoom(1);
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == 1)
		dcscontrol1.EnablePTWnd(1);
	dcscontrol1.ModelName = "<xsl:value-of select="root/common/product" />";
	dcscontrol1.StopLiveStreamIn(2);
}

function initForm() 
{
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
		var dcscontrol1 = document.getElementById("dcscontrol1");
		dcscontrol1.ProfileID = 1;
		<xsl:choose>
			<xsl:when test="/root/config/profiles/profile[1]/codec = 'mp4'">
				dcscontrol1.SetStreamType(0);
			</xsl:when>
			<xsl:otherwise>
				dcscontrol1.SetStreamType(1);
			</xsl:otherwise>
		</xsl:choose>
		InitActiveX();
	}

	document.form1.hostname.value = "http://" + window.location.hostname;
	//cs633 dcs2121
	if (sensor == 'mt9m112' || sensor == 'mt9m112_cs633' || sensor == 'mt9m112_dcs2121')
		document.getElementById("mt9m112").style.display="";
	//dcs6410
	if (sensor == 'vx1128_dcs6410')
		document.getElementById("vx1128_dcs6410").style.display="";
	//cs675
	//if (sensor == 'mt9v111' || sensor == 'mt9v111_cs675' || sensor == 'mt9v111_dcs950b1' || sensor == 'mt9m111_dcs5230')
	if (sensor.substr(0, 7) == 'mt9m112'
	    || sensor.substr(0, 7) == 'mt9m131')
	{
		document.getElementById("mt9m112").style.display=""; // the same as mt9m112
	}
	//dcs3410
	if (sensor == 'vx1128_yk2085')
		document.getElementById("vx1128_yk2085").style.display="";
	//dcs1100
	if (sensor.substr(0, 6) == 'ov7725')
		document.getElementById("ov7725").style.display="";
		
	if(sensor.indexOf("mt9m112") != (-1) || sensor.indexOf("ov7725")!= (-1))
		document.getElementById("help2102").style.display="";
	else if(sensor.indexOf("vx1128_dcs6410") != (-1))
		document.getElementById("help6410").style.display="";
	else if(sensor.indexOf("vx1128_yk2085") != (-1))
		document.getElementById("help3410").style.display="";
	else if(sensor.indexOf("yk2085") != (-1))
		document.getElementById("help_yk2085").style.display="";
	else if(sensor.indexOf("vx1128") != (-1))
		document.getElementById("help_vx1128").style.display="";
	else
		document.getElementById("help_other").style.display="";
	
/*
	if (serial == 'DCS-2102' || serial == 'DCS-1100')
		document.getElementById("help2102").style.display="";
	else if (serial == 'DCS-6410')
		document.getElementById("help6410").style.display="";
	else if (serial == 'DCS-3410')
		document.getElementById("help3410").style.display="";
	else 
		document.getElementById("help_other").style.display="";
		*/
	//vis802
/*	if (sensor == 'vx1128')
		document.getElementById("vx1128").style.display="";
	//cs950
	if ('<xsl:value-of select="root/common/sensor " />' == 'vicam3')
		document.getElementById("vicam3").style.display="";
	//cs632
	if (sensor == 'ov7725' || sensor== 'ov7725_cs632' || sensor == 'ov7725_cs637')
		document.getElementById("ov7725").style.display="";
*/

	//checkbox
	if ('<xsl:value-of select="root/config/flip" />' == '1'){
		document.form1.mt9m112_flip.checked=true;
//		document.form1.vicam3_flip.checked=true;
		document.form1.ov7725_flip.checked=true;
	}
	if ('<xsl:value-of select="root/config/mirror" />' == '1'){
		document.form1.mt9m112_mirror.checked=true;
//		document.form1.vicam3_mirror.checked=true;
		document.form1.ov7725_mirror.checked=true;
	}
	if ('<xsl:value-of select="root/config/bw" />' == '1'){
		document.form1.mt9m112_bw.checked=true;
//		document.form1.vicam3_bw.checked=true;
		document.form1.ov7725_bw.checked=true;
	}
	if ('<xsl:value-of select="root/config/autoExposure" />' == '1'){
//		document.form1.mt9m112_autoExposure.checked=true;
//		document.form1.vicam3_autoExposure.checked=true;
	}
//	if ('<xsl:value-of select="root/config/antiFlicker" />' == '1')
//		document.form1.antiFlicker.checked=true;

	//select
	//brightness
	document.form1.mt9m112_brightness.value = '<xsl:value-of select="root/config/brightness" />';
	document.form1.vx1128_brightness.value = '<xsl:value-of select="root/config/brightness" />';
	document.form1.yk2085_brightness.value = '<xsl:value-of select="root/config/brightness" />';
//	document.form1.vicam3_brightness.value = '<xsl:value-of select="root/config/brightness" />';
	document.form1.ov7725_brightness.value = '<xsl:value-of select="root/config/brightness" />';
	//saturation
	document.form1.mt9m112_saturation.value = '<xsl:value-of select="root/config/saturation" />';
	document.form1.vx1128_saturation.value = '<xsl:value-of select="root/config/saturation" />';
	document.form1.yk2085_saturation.value = '<xsl:value-of select="root/config/saturation" />';
//	document.form1.vicam3_saturation.value = '<xsl:value-of select="root/config/saturation" />';
	document.form1.ov7725_saturation.value = '<xsl:value-of select="root/config/saturation" />';
	//contrast
	document.form1.mt9m112_contrast.value = '<xsl:value-of select="root/config/contrast" />';
	document.form1.vx1128_contrast.value = '<xsl:value-of select="root/config/contrast" />';
	document.form1.yk2085_contrast.value = '<xsl:value-of select="root/config/contrast" />';
//	document.form1.vicam3_contrast.value = '<xsl:value-of select="root/config/contrast" />';
	document.form1.ov7725_contrast.value = '<xsl:value-of select="root/config/contrast" />';
	//hue
	document.form1.vx1128_hue.value = '<xsl:value-of select="root/config/hue" />';
	document.form1.yk2085_hue.value = '<xsl:value-of select="root/config/hue" />';
	//sharpness
//	document.form1.vicam3_sharpness.value = '<xsl:value-of select="root/config/sharpness" />';
	//noise reduction
//	document.form1.vicam3_noise.value = '<xsl:value-of select="root/config/noiseReduction" />';
	//backlight compensation
//	document.form1.vicam3_backlight.value = '<xsl:value-of select="root/config/backlightCompensation" />';
	//frequency
	if ('<xsl:value-of select="root/config/frequency" />' == '0'){
		document.form1.mt9m112_frequency.value = '0';
//		document.form1.vicam3_frequency.value = '0'; no this setting in vicam3
//		document.form1.ov7725_frequency.value = '0'; no this setting in ov7725
	}
	if ('<xsl:value-of select="root/config/frequency" />' == '1'){
		document.form1.mt9m112_frequency.value = '1';
//		document.form1.vicam3_frequency.value = '1';
		document.form1.ov7725_frequency.value = '1';
	}
	if ('<xsl:value-of select="root/config/frequency" />' == '2'){
		document.form1.mt9m112_frequency.value = '2';
//		document.form1.vicam3_frequency.value = '2';
		document.form1.ov7725_frequency.value = '2';
	}
	//whitebalance
	if ('<xsl:value-of select="root/config/whiteBalance" />' == '0'){
		document.form1.mt9m112_whiteBalance.value = '0';
		document.form1.yk2085_awb1.checked=true;
//		document.form1.vicam3_whiteBalance.value = '0';
		document.form1.ov7725_whiteBalance.value = '0';
//		document.form1.awb1.checked=true;
	}
	if ('<xsl:value-of select="root/config/whiteBalance" />' == '1'){
		document.form1.mt9m112_whiteBalance.value = '1';
		document.form1.yk2085_awb2.checked=true;
//		document.form1.vicam3_whiteBalance.value = '1';
		document.form1.ov7725_whiteBalance.value = '1';
//		document.form1.awb2.checked=true;
	}
	//autoExposure
	if ('<xsl:value-of select="root/config/autoExposure" />' == '1')
		document.form1.yk2085_aes1.checked=true;
	if ('<xsl:value-of select="root/config/autoExposure" />' == '0')
		document.form1.yk2085_aes2.checked=true;
//	if ('<xsl:value-of select="root/config/autoExposure" />' == '1')
//		document.form1.aes1.checked=true;
//	if ('<xsl:value-of select="root/config/autoExposure" />' == '0')
//		document.form1.aes2.checked=true;
	//backlight control
	if ('<xsl:value-of select="root/config/backlightControl" />' == '1')
		document.form1.yk2085_blc1.checked=true;
	if ('<xsl:value-of select="root/config/backlightControl" />' == '0')
		document.form1.yk2085_blc2.checked=true;
	//auto ain
	if ('<xsl:value-of select="root/config/autoGain" />' == '1')
		document.form1.yk2085_agc1.checked=true;
	if ('<xsl:value-of select="root/config/autoGain" />' == '0')
		document.form1.yk2085_agc2.checked=true;
	//
	//source
//	document.form1.source.value = '<xsl:value-of select="root/config/source" />';
	//night mode
	/*
	if ('<xsl:value-of select="root/config/nightShot" />' == '1'){
		document.form1.nightShotSelect.value = '1';
		document.form1.nightShot.checked=true;
	}
	if ('<xsl:value-of select="root/config/nightShot" />' == '2'){
		document.form1.nightShotSelect.value = '2';
		document.form1.nightShot.checked=true;
	}
*/
	changeMode();
}	
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleSetup" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleSetup" /></title>
</xsl:if>

<style type="text/css">
<xsl:comment>
.style1 {font-size: 11px}
</xsl:comment>
</style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();">
<form id="form1" name="form1" method="post" action="adv_image.cgi">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%"><xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/cameraName" /></td>
        <td align="right" nowrap="nowrap">&nbsp;</td>
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/imageSettings" /></div>
							</li>
							<li>
								<div><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/leftPanel/audioVideo" /></a></div>
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
							<li>
								<div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
							</li>
						</ul>
					  </div></td>
                    </tr>
                  </tbody>
              </table></td>
			<td valign="top" id="maincontent_container">			  <div id="maincontent">
				  <!-- === BEGIN MAINCONTENT === -->
                  <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/imageSettings" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /><br />
                    <br />
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						</font>
   				    </xsl:if>
					<xsl:if test="/root/result/code = 'failure'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
					<xsl:if test="/root/result/code = 'invalidParameters'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
	             </div>
				 <br />
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/image" /></h2>
                      <input type="hidden" id="command" name="command" value="" />
                      <input name="hostname" id="hostname" type="hidden" size="30" value="hostname" />
                      <input name="resultCode" type="hidden" size="15" value="N/A" />
                    <p align="center">
							<xsl:if test="/root/config/ie = 'true'">
                              <object classid="clsid:721700FE-7F0E-49C5-BDED-CA92B7CB1245" codebase="/dcsclictrl.cab#version=1,0,0,3818" id="dcscontrol1" width="320" height="240">
                                <param name="RemoteHost" value="127.0.0.1" />
                                <param name="RemotePort" value="80" />
                              </object>
                            </xsl:if>
                            <xsl:if test="/root/config/ie = 'false'">
                                <img id="mjpgImage" alt="Processing..." width="320" height="240" src="/video/mjpg.cgi?profileid=3" />
                            </xsl:if>
					</p>
              </div>
              <div class="box">
                    <h2><xsl:value-of select="root/lang/body/controls" />
                    </h2>
					<div id="mt9m112" style="display:none">
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                      <tbody>
                        <tr>
                          <td width="125"><xsl:value-of select="root/lang/body/brightness" /></td>
                          <td width="156">
                              <label>
                              <select name="mt9m112_brightness" id="mt9m112_brightness" onchange="return sendData('mt9m112_brightness');" >
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                                <option value="32">32</option>
                                <option value="33">33</option>
                                <option value="34">34</option>
                                <option value="35">35</option>
                                <option value="36">36</option>
                                <option value="37">37</option>
                                <option value="38">38</option>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                                <option value="45">45</option>
                                <option value="46">46</option>
                                <option value="47">47</option>
                                <option value="48">48</option>
                                <option value="49">49</option>
                                <option value="50">50</option>
                                <option value="51">51</option>
                                <option value="52">52</option>
                                <option value="53">53</option>
                                <option value="54">54</option>
                                <option value="55">55</option>
                                <option value="56">56</option>
                                <option value="57">57</option>
                                <option value="58">58</option>
                                <option value="59">59</option>
                                <option value="60">60</option>
                                <option value="61">61</option>
                                <option value="62">62</option>
                                <option value="63">63</option>
                                <option value="64">64</option>
                                <option value="65">65</option>
                                <option value="66">66</option>
                                <option value="67">67</option>
                                <option value="68">68</option>
                                <option value="69">69</option>
                                <option value="70">70</option>
                                <option value="71">71</option>
                                <option value="72">72</option>
                                <option value="73">73</option>
                                <option value="74">74</option>
                                <option value="75">75</option>
                                <option value="76">76</option>
                                <option value="77">77</option>
                                <option value="78">78</option>
                                <option value="79">79</option>
                                <option value="80">80</option>
                                <option value="81">81</option>
                                <option value="82">82</option>
                                <option value="83">83</option>
                                <option value="84">84</option>
                                <option value="85">85</option>
                                <option value="86">86</option>
                                <option value="87">87</option>
                                <option value="88">88</option>
                                <option value="89">89</option>
                                <option value="90">90</option>
                                <option value="91">91</option>
                                <option value="92">92</option>
                                <option value="93">93</option>
                                <option value="94">94</option>
                                <option value="95">95</option>
                                <option value="96">96</option>
                                <option value="97">97</option>
                                <option value="98">98</option>
                                <option value="99">99</option>
                                <option value="100">100</option>
                              </select>
                              </label></td>
                          <td width="100"><xsl:value-of select="root/lang/body/saturation" /></td>
                          <td width="156">
                              <select name="mt9m112_saturation" id="mt9m112_saturation" onchange="return sendData('mt9m112_saturation');" >
                                <option value="0">0</option>
                                <option value="20">20</option>
                                <option value="40">40</option>
                                <option value="60">60</option>
                                <option value="80">80</option>
                                <option value="100">100</option>
                              </select>
                          </td>
                        </tr>
                        <tr>
                          <td ><xsl:value-of select="root/lang/body/contrast" /></td>
                          <td >
                              <select name="mt9m112_contrast" id="mt9m112_contrast" onchange="return sendData('mt9m112_contrast');" >
                                <option value="0">0</option>
                                <option value="20">20</option>
                                <option value="40">40</option>
                                <option value="60">60</option>
                                <option value="80">80</option>
                                <option value="100">100</option>
                              </select>
                          </td>
                          <td ><xsl:value-of select="root/lang/body/frequency" /></td>
                          <td >
                            <select name="mt9m112_frequency" id="mt9m112_frequency" onchange="return sendData('mt9m112_frequency');" >
                              <option value="0"><xsl:value-of select="root/lang/body/auto" /></option>
                              <option value="1">50<xsl:value-of select="root/lang/body/hz" /></option>
                              <option value="2">60<xsl:value-of select="root/lang/body/hz" /></option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td ><xsl:value-of select="root/lang/body/whiteBalance" /></td>
                          <td >
                          <select size="1" name="mt9m112_whiteBalance" id="mt9m112_whiteBalance" onchange="return sendData('mt9m112_whiteBalance');" >
                            <option value="0"><xsl:value-of select="root/lang/body/auto" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/disable" /></option>
                          </select>
                          </td>
                          <td ><xsl:value-of select="root/lang/body/bw" /></td>
                          <td >
                            <input type="checkbox" name="mt9m112_bw" id="mt9m112_bw" onclick="return sendData('mt9m112_bw');" />
                          </td>
						</tr>  
                        <tr>
                          <td ><xsl:value-of select="root/lang/body/flip" /></td>
                          <td >
                              <input type="checkbox" name="mt9m112_flip" id="mt9m112_flip" onclick="return sendData('mt9m112_flip');" />
                          </td>
                          <td ><xsl:value-of select="root/lang/body/mirror" /></td>
                          <td >
                            <input type="checkbox" name="mt9m112_mirror" id="mt9m112_mirror" onclick="return sendData('mt9m112_mirror');" />
                          </td>
                        </tr>
						<div style="display:none">
                        <tr style="display:none">
                          <td ><xsl:value-of select="root/lang/body/autoExposure" /></td>
                          <td >
                            <input type="checkbox" name="mt9m112_autoExposure" id="mt9m112_autoExposure" onclick="return sendData('mt9m112_autoExposure');" />
                          </td>
                          <td align="right">&nbsp;</td>
                          <td align="right">&nbsp;</td>
                        </tr>
						</div>
                        <tr>
                          <td colspan="5" >
                              <p></p>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="5" align="center">
                            <input type="button" value="{root/lang/body/reset}" name="reset" onclick="resetImage()" />
                          </td>
                        </tr>
                      </tbody>
                    </table>
					</div>
					<div id="vx1128_dcs6410" style="display:none">
					<table width="540" border="0" cellpadding="2" cellspacing="2">
                      <tr>
					  	<td>&nbsp;</td>
                        <td width="125" ><xsl:value-of select="root/lang/body/brightness" /></td>
                        <td width="156" ><select name="vx1128_brightness" id="vx1128_brightness" onchange="return sendData('vx1128_brightness');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </td>
                        <td width="100"><xsl:value-of select="root/lang/body/saturation" /></td>
                        <td width="156"><label>
                          <select name="vx1128_saturation" id="vx1128_saturation" onchange="return sendData('vx1128_saturation');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
					  	<td>&nbsp;</td>
                        <td ><xsl:value-of select="root/lang/body/contrast" /></td>
                        <td ><select name="vx1128_contrast" id="vx1128_contrast" onchange="return sendData('vx1128_contrast');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select></td>
                        <td><xsl:value-of select="root/lang/body/hue" /></td>
                        <td><label>
                          <select name="vx1128_hue" id="vx1128_hue" onchange="return sendData('vx1128_hue');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr style="display:none">
					  	<td>&nbsp;</td>
                        <td ><xsl:value-of select="root/lang/body/source" /></td>
                        <td ><select name="source" id="source" onchange="return sendData('source');" >
                                <option value="0">Auto</option>
                                <option value="1">NTSC</option>
                                <option value="2">PAL</option>
                                <option value="3">PAL-M</option>
                                <option value="4">PAL-Nc</option>
                              </select> </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td> </td>
                      </tr>
<!--
                      <tr>
					  	<td>&nbsp;</td>
                        <td ><xsl:value-of select="root/lang/body/AWB" /></td>
                        <td ><input type="radio" value="0" name="vx1128_whiteBalance" id="awb1" onclick="return sendData('vx1128_whiteBalance');"/>
                          On&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="1" name="vx1128_whiteBalance" id="awb2" onclick="return sendData('vx1128_whiteBalance');"/>
Off </td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/AES" /></td>
                        <td><input type="radio" value="1" name="vx1128_autoExposure" id="aes1" onclick="return sendData('vx1128_autoExposure');"/>
                          On&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="0" name="vx1128_autoExposure" id="aes2" onclick="return sendData('vx1128_autoExposure');"/>
Off </td>
                      </tr>
-->
                      <tr>
                        <td colspan="7" ><p></p></td>
                      </tr>
                      <tr>
                        <td colspan="7" align="center"><input type="button" value="{root/lang/body/reset}" name="reset" onclick="resetImage()" />                        </td>
                      </tr>
                    </table>
					</div>
					<div id="vx1128_yk2085" style="display:none">
					<table cellspacing="1" cellpadding="1" width="525" border="0">
                      <tr>
                        <td width="12" height="22"></td>
                        <td width="100" ><xsl:value-of select="root/lang/body/BLC" /> </td>
                        <td width="156" ><input name="yk2085_backlightControl" type="radio" id="yk2085_blc1" onclick="return sendData('yk2085_backlightControl');" value="1" width="80" />
                          On&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="0" name="yk2085_backlightControl" id="yk2085_blc2" onclick="return sendData('yk2085_backlightControl');"/>
Off </td>
                        <td width="8">&nbsp;</td>
                        <td width="125"><xsl:value-of select="root/lang/body/brightness" /></td>
                        <td width="156"><label>
                          <select name="yk2085_brightness" id="yk2085_brightness" onchange="return sendData('yk2085_brightness');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td width="12" height="22"></td>
                        <td ><xsl:value-of select="root/lang/body/AWB" /></td>
                        <td ><input type="radio" value="0" name="yk2085_whiteBalance" id="yk2085_awb1" onclick="return sendData('yk2085_whiteBalance');"/>
                          On&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="1" name="yk2085_whiteBalance" id="yk2085_awb2" onclick="return sendData('yk2085_whiteBalance');"/>
Off </td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/contrast" /></td>
                        <td><label>
                          <select name="yk2085_contrast" id="yk2085_contrast" onchange="return sendData('yk2085_contrast');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td width="12" height="22"></td>
                        <td ><xsl:value-of select="root/lang/body/AGC" /> </td>
                        <td ><input type="radio" value="1" name="yk2085_autoGain" id="yk2085_agc1" onclick="return sendData('yk2085_autoGain');"/>
                          High
                            &nbsp; <input type="radio" value="0" name="yk2085_autoGain" id="yk2085_agc2" onclick="return sendData('yk2085_autoGain');"/>
Low </td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/saturation" /></td>
                        <td><label>
                          <select name="yk2085_saturation" id="yk2085_saturation" onchange="return sendData('yk2085_saturation');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td width="12" height="22"></td>
                        <td ><xsl:value-of select="root/lang/body/AES" /> </td>
                        <td ><input type="radio" value="1" name="yk2085_autoExposure" id="yk2085_aes1" onclick="return sendData('yk2085_autoExposure');"/>
                          On&nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="radio" value="0" name="yk2085_autoExposure" id="yk2085_aes2" onclick="return sendData('yk2085_autoExposure');"/>
Off </td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/hue" /></td>
                        <td><label>
                          <select name="yk2085_hue" id="yk2085_hue" onchange="return sendData('yk2085_hue');" >
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                            <option value="32">32</option>
                            <option value="33">33</option>
                            <option value="34">34</option>
                            <option value="35">35</option>
                            <option value="36">36</option>
                            <option value="37">37</option>
                            <option value="38">38</option>
                            <option value="39">39</option>
                            <option value="40">40</option>
                            <option value="41">41</option>
                            <option value="42">42</option>
                            <option value="43">43</option>
                            <option value="44">44</option>
                            <option value="45">45</option>
                            <option value="46">46</option>
                            <option value="47">47</option>
                            <option value="48">48</option>
                            <option value="49">49</option>
                            <option value="50">50</option>
                            <option value="51">51</option>
                            <option value="52">52</option>
                            <option value="53">53</option>
                            <option value="54">54</option>
                            <option value="55">55</option>
                            <option value="56">56</option>
                            <option value="57">57</option>
                            <option value="58">58</option>
                            <option value="59">59</option>
                            <option value="60">60</option>
                            <option value="61">61</option>
                            <option value="62">62</option>
                            <option value="63">63</option>
                            <option value="64">64</option>
                            <option value="65">65</option>
                            <option value="66">66</option>
                            <option value="67">67</option>
                            <option value="68">68</option>
                            <option value="69">69</option>
                            <option value="70">70</option>
                            <option value="71">71</option>
                            <option value="72">72</option>
                            <option value="73">73</option>
                            <option value="74">74</option>
                            <option value="75">75</option>
                            <option value="76">76</option>
                            <option value="77">77</option>
                            <option value="78">78</option>
                            <option value="79">79</option>
                            <option value="80">80</option>
                            <option value="81">81</option>
                            <option value="82">82</option>
                            <option value="83">83</option>
                            <option value="84">84</option>
                            <option value="85">85</option>
                            <option value="86">86</option>
                            <option value="87">87</option>
                            <option value="88">88</option>
                            <option value="89">89</option>
                            <option value="90">90</option>
                            <option value="91">91</option>
                            <option value="92">92</option>
                            <option value="93">93</option>
                            <option value="94">94</option>
                            <option value="95">95</option>
                            <option value="96">96</option>
                            <option value="97">97</option>
                            <option value="98">98</option>
                            <option value="99">99</option>
                            <option value="100">100</option>
                          </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td colspan="7" ><p></p></td>
                      </tr>
                      <tr>
                        <td colspan="7" align="center"><input type="button" value="{root/lang/body/reset}" name="reset" onclick="resetImage()" />                        </td>
                      </tr>
                    </table>
					</div>
					<div id="ov7725" style="display:none;font-size:11px">
					<table width="400" border="0" cellpadding="2" cellspacing="2" align="center" id="table_middle" >
                      <tbody>
                        <tr>
						  <td>&nbsp;</td>
                          <td width="160"><xsl:value-of select="root/lang/body/brightness" /></td>
                          <td width="156">
                              <label>
                              <select name="ov7725_brightness" id="ov7725_brightness" onchange="return sendData('ov7725_brightness');" >
                                <option value="0">0</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="30">30</option>
                                <option value="35">35</option>
                                <option value="40">40</option>
                                <option value="45">45</option>
                                <option value="50">50</option>
                                <option value="55">55</option>
                                <option value="60">60</option>
                                <option value="65">65</option>
                                <option value="70">70</option>
                                <option value="75">75</option>
                                <option value="80">80</option>
                                <option value="85">85</option>
                                <option value="90">90</option>
                                <option value="95">95</option>
                                <option value="100">100</option>
                              </select>
                              </label></td>
                          <td width="100"><xsl:value-of select="root/lang/body/saturation" /></td>
                          <td width="156">
                              <select name="ov7725_saturation" id="ov7725_saturation" onchange="return sendData('ov7725_saturation');" >
                                <option value="0">0</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="75">75</option>
                                <option value="100">100</option>
                              </select>
                          </td>
                        </tr>
                        <tr>
						  <td>&nbsp;</td>
                          <td ><xsl:value-of select="root/lang/body/contrast" /></td>
                          <td >
                              <select name="ov7725_contrast" id="ov7725_contrast" onchange="return sendData('ov7725_contrast');" >
                                <option value="0">0</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="75">75</option>
                                <option value="100">100</option>
                              </select>
                          </td>
                          <td ><xsl:value-of select="root/lang/body/frequency" /></td>
                          <td >
                            <select name="ov7725_frequency" id="ov7725_frequency" onchange="return sendData('ov7725_frequency');" >
                              <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
                              <option value="1">50<xsl:value-of select="root/lang/body/hz" /></option>
                              <option value="2">60<xsl:value-of select="root/lang/body/hz" /></option>
                            </select>
                          </td>
                        </tr>
                        <tr>
						  <td>&nbsp;</td>
                          <td ><xsl:value-of select="root/lang/body/whiteBalance" /></td>
                          <td >
                          <select size="1" name="ov7725_whiteBalance" id="ov7725_whiteBalance" onchange="return sendData('ov7725_whiteBalance');" >
                            <option value="0"><xsl:value-of select="root/lang/body/auto" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/disable" /></option>
                          </select>
                          </td>
                          <td ><xsl:value-of select="root/lang/body/bw" /></td>
                          <td >
                            <input type="checkbox" name="ov7725_bw" id="ov7725_bw" onclick="return sendData('ov7725_bw');" />
                          </td>
						</tr>
                        <tr>
						  <td>&nbsp;</td>
                          <td ><xsl:value-of select="root/lang/body/flip" /></td>
                          <td ><input type="checkbox" name="ov7725_flip" id="ov7725_flip" onclick="return sendData('ov7725_flip');" /></td>
                          <td ><xsl:value-of select="root/lang/body/mirror" /></td>
                          <td ><input type="checkbox" name="ov7725_mirror" id="ov7725_mirror" onclick="return sendData('ov7725_mirror');" /></td>
                        </tr>
<!--
                        <tr>
						  <td>&nbsp;</td>
                          <td ><xsl:value-of select="root/lang/body/nightMode" /></td>
                          <td ><input type="checkbox" name="nightShot" id="nightShot" onclick="return sendData('nightShot');" /></td>
                          <td ><xsl:value-of select="root/lang/body/flip" /></td>
                          <td ><input type="checkbox" name="flip" id="flip" onclick="return sendData('flip');" /></td>
                        </tr>
                        <tr>
						  <td>&nbsp;</td>
                          <td >&nbsp;</td>
                          <td ><select size="1" name="nightShotSelect" id="nightShotSelect" onchange="return sendData('nightShot');" >
							<option value="2">5FPS</option>
                            <option value="1">10FPS</option>
                          </select>
						  </td>
                          <td><xsl:value-of select="root/lang/body/mirror" /></td>
                          <td><input type="checkbox" name="mirror" id="mirror" onclick="return sendData('mirror');" /></td>
                        </tr>
-->
                        <tr style="display:none">
						  <td>&nbsp;</td>
                          <td ><xsl:value-of select="root/lang/body/autoExposure" /></td>
                          <td >
                            <input type="checkbox" name="ov7725_autoExposure" id="ov7725_autoExposure" onclick="return sendData('autoExposure');" />
                          </td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan="5" >
                              <p></p>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="5" align="center">
                            <input type="button" value="{root/lang/body/reset}" name="reset" onclick="resetImage()" />
                          </td>
                        </tr>
                      </tbody>
                    </table></div>
              </div>
                  <!-- === END MAINCONTENT === -->
            </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table width="125" border="0" 
      cellpadding="2" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#ffffff" bordercolordark="#ffffff" bgcolor="#ffffff">
                  <tbody>
                    <tr>
                      <td id="help_text">
                      <strong><xsl:value-of select="root/lang/hint/helpfulHints" /></strong><br /><br />
					  <div id="help2102" style="display:none;font-size:11px">
					  	
                        <xsl:value-of select="root/lang/hint/description0" />
					  </div>
					  <div id="help6410" style="display:none;font-size:11px">
					  	
                        <xsl:value-of select="root/lang/hint/description1" /> <br /> <br /> 
<!--
                        <strong><xsl:value-of select="root/lang/body/BLC" /></strong>
						<xsl:value-of select="root/lang/hint/description2" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AWB" /></strong>
						<xsl:value-of select="root/lang/hint/description3" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AGC" /></strong>
						<xsl:value-of select="root/lang/hint/description4" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AES" /></strong>
						<xsl:value-of select="root/lang/hint/description5" /> <br /> <br />
-->
						<strong><xsl:value-of select="root/lang/body/brightness" /></strong>
						<xsl:value-of select="root/lang/hint/brightness1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/saturation" /></strong>
						<xsl:value-of select="root/lang/hint/saturation1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/contrast" /></strong>
						<xsl:value-of select="root/lang/hint/contrast1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/hue" /></strong>
						<xsl:value-of select="root/lang/body/hue1" /><br /><br />
					  </div>
                      <div id="help_yk2085" style="display:none;font-size:11px">
                        
                        <strong><xsl:value-of select="root/lang/body/BLC" /></strong>
						<xsl:value-of select="root/lang/hint/description2" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AWB" /></strong>
						<xsl:value-of select="root/lang/hint/description3" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AGC" /></strong>
						<xsl:value-of select="root/lang/hint/description4" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AES" /></strong>   
                        <xsl:value-of select="root/lang/hint/description5" /> <br /> <br />
                          
                      </div>
                      <div id="help_vx1128" style="display:none;font-size:11px">
                      	<strong><xsl:value-of select="root/lang/body/brightness" /></strong>
						<xsl:value-of select="root/lang/hint/brightness1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/saturation" /></strong>
						<xsl:value-of select="root/lang/hint/saturation1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/contrast" /></strong>
						<xsl:value-of select="root/lang/hint/contrast1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/hue" /></strong>
						<xsl:value-of select="root/lang/body/hue1" /><br /><br />
                      </div>
                      <div id="help_other" style="display:none;font-size:11px">   	
                        <xsl:value-of select="root/lang/hint/description6" /> <br /> <br /> 
                        <strong><xsl:value-of select="root/lang/body/brightness" /></strong>
						<xsl:value-of select="root/lang/hint/brightness1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/saturation" /></strong>
						<xsl:value-of select="root/lang/hint/saturation1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/contrast" /></strong>
						<xsl:value-of select="root/lang/hint/contrast1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/hint/frequency" /></strong>
						<xsl:value-of select="root/lang/hint/frequency1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/hint/whitebalance" /></strong>
						<xsl:value-of select="root/lang/hint/whitebalance1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/hint/bw" /></strong>
						<xsl:value-of select="root/lang/hint/bw1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/hint/flip" /></strong>
						<xsl:value-of select="root/lang/hint/flip1" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/hint/mirror" /></strong>
						<xsl:value-of select="root/lang/hint/mirror1" /> <br /> <br />
                        
                      </div>
					  <div id="help3410" style="display:none;font-size:11px">
					  
                        <xsl:value-of select="root/lang/hint/description1" /> <br /> <br /> 
                        <strong><xsl:value-of select="root/lang/body/BLC" /></strong>
						<xsl:value-of select="root/lang/hint/description2" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AWB" /></strong>
						<xsl:value-of select="root/lang/hint/description3" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AGC" /></strong>
						<xsl:value-of select="root/lang/hint/description4" /> <br /> <br />
                        <strong><xsl:value-of select="root/lang/body/AES" /></strong>
						<xsl:value-of select="root/lang/hint/description5" /> <br /> <br />
						<strong><xsl:value-of select="root/lang/body/brightness" /></strong>
						<xsl:value-of select="root/lang/hint/brightness1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/saturation" /></strong>
						<xsl:value-of select="root/lang/hint/saturation1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/contrast" /></strong>
						<xsl:value-of select="root/lang/hint/contrast1" /><br /><br />
                        <strong><xsl:value-of select="root/lang/body/hue" /></strong>
						<xsl:value-of select="root/lang/body/hue1" /><br /><br />
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
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
