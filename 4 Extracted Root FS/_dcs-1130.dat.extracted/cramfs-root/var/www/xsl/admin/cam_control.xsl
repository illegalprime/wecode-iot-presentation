<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="cam_control.xml" --><!DOCTYPE xsl:stylesheet  [
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
<script language="JavaScript" src="../net.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
<![CDATA[
var imagePT = new Object( );
imagePT["way_control_n"] = new Image(110, 110);
imagePT["way_control_n"].src  = "../images/way-control.jpg";

imagePT["home_f"] = new Image(110, 110);
imagePT["home_f"].src = "../images/way-control_center_f.jpg";
imagePT["home_p"] = new Image(110, 110);
imagePT["home_p"].src = "../images/way-control_center_p.jpg";

imagePT["down_f"] = new Image(110, 110);
imagePT["down_f"].src = "../images/way-control_down_f.jpg";
imagePT["down_p"] = new Image(110, 110);
imagePT["down_p"].src = "../images/way-control_down_p.jpg";

imagePT["left_f"] = new Image(110, 110);
imagePT["left_f"].src = "../images/way-control_left_f.jpg";
imagePT["left_p"] = new Image(110, 110);
imagePT["left_p"].src = "../images/way-control_left_p.jpg";

imagePT["left_down_f"] = new Image(110, 110);
imagePT["left_down_f"].src = "../images/way-control_left-down_f.jpg";
imagePT["left_down_p"] = new Image(110, 110);
imagePT["left_down_p"].src = "../images/way-control_left-down_p.jpg";

imagePT["left_up_f"] = new Image(110, 110);
imagePT["left_up_f"].src = "../images/way-control_left-up_f.jpg";
imagePT["left_up_p"] = new Image(110, 110);
imagePT["left_up_p"].src = "../images/way-control_left-up_p.jpg";

imagePT["right_f"] = new Image(110, 110);
imagePT["right_f"].src = "../images/way-control_right_f.jpg";
imagePT["right_p"] = new Image(110, 110);
imagePT["right_p"].src = "../images/way-control_right_p.jpg";

imagePT["right_down_f"] = new Image(110, 110);
imagePT["right_down_f"].src = "../images/way-control_right-down_f.jpg";
imagePT["right_down_p"] = new Image(110, 110);
imagePT["right_down_p"].src = "../images/way-control_right-down_p.jpg";

imagePT["right_up_f"] = new Image(110, 110);
imagePT["right_up_f"].src = "../images/way-control_right-up_f.jpg";
imagePT["right_up_p"] = new Image(110, 110);
imagePT["right_up_p"].src = "../images/way-control_right-up_p.jpg";

imagePT["up_f"] = new Image(110, 110);
imagePT["up_f"].src = "../images/way-control_up_f.jpg";
imagePT["up_p"] = new Image(110, 110);
imagePT["up_p"].src = "../images/way-control_up_p.jpg";

imagePT["zoon_in_f"] = new Image(110, 110);
imagePT["zoon_in_f"].src = "../images/way-control_zoom-in_f.jpg";
imagePT["zoon_in_p"] = new Image(110, 110);
imagePT["zoon_in_p"].src = "../images/way-control_zoom-in_p.jpg";

imagePT["zoon_out_f"] = new Image(110, 110);
imagePT["zoon_out_f"].src = "../images/way-control_zoom-out_f.jpg";
imagePT["zoon_out_p"] = new Image(110, 110);
imagePT["zoon_out_p"].src = "../images/way-control_zoom-out_p.jpg";

function overImage(type){
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
}

function outImage(type){
	if (type == "pt_out")
		document.PTControl.src = imagePT["way_control_n"].src;
}

function pressImage(type){
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
}

function delPreset(){	
	send_submit("form3");
}
/*
    //This part is for PT
	function createXMLHttpRequest() {
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

    function sendHomeRequest(hostname, request, onAlert) {
		var url = hostname + '/cgi/ptdc.cgi?command=go_home';
        request.onreadystatechange = onAlert;
		try {
        	request.open('GET', url, true);
        	request.send("");
		}
		catch(e) {
			alert(e);
		}
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

	function move(x, y) {
		theRequest = createXMLHttpRequest();
		if (!theRequest) {
			return false;
		}
		x = document.form1.panSpeed.value * x;
		y = document.form1.tiltSpeed.value * y;
		var hostname = document.form1.hostname.value;
		sendMoveRequest(x, y, hostname, theRequest, onAlertRequest);
	}

	function home() {
		theRequest = createXMLHttpRequest();
		if (!theRequest) {
			return false;
		}
		var hostname = document.form1.hostname.value;
		sendHomeRequest(hostname, theRequest, onAlertRequest);
	}
*/


function home(){
	overImage('home');
	var hostname = document.form1.hostname.value;
	sendHomeRequest(flagRs485, hostname);
}

function setHomePos(command){
	var hostname = document.form1.hostname.value;
	sendHomePosRequest(command, hostname);
}

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
//	wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth);
}

function onXSLLoad(){
	xslDoc=this.req.responseXML;
//	wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth);
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var flagRs485 = "<xsl:value-of select="root/common/peripheral/RS485" />";
var waitTimeError1 = "<xsl:value-of select="root/lang/body/waitTimeError1" />";
var waitTimeError2 = "<xsl:value-of select="root/lang/body/waitTimeError2" />";
var waitTimeError3 = "<xsl:value-of select="root/lang/body/waitTimeError3" />";

function addPreset(){
	var name = new Array();
	var i=0;
	var j=0;
	var flag=0;
	var theSamePresetName = "<xsl:value-of select="root/lang/body/theSamePresetName" />";
	var presetNameError = "<xsl:value-of select="root/lang/body/presetNameError" />";
//	var presetError = "<xsl:value-of select="root/lang/body/presetError" />";
	
	<xsl:for-each select="root/config/preset">
		name[i] = '<xsl:value-of select="presetName"/>';
		i++;
	</xsl:for-each>

    if (document.form2.presetName.value == ''){
		alertAndSelect(document.form2.presetName,presetNameError);
		return false;
	}
	else{
		if(checkPreset(presetNameError)==false)
			return false;
	}

	for(j=0;j!=i;j++){
		if (name[j] == document.form2.presetName.value){
			if(confirm(theSamePresetName)){
				flag = 1;
				send_submit("form2");
			}
			else
				return false;
		}
	}

	if(flag == 1){
	}
	else{
		if(i == 10){
			alert("<xsl:value-of select="root/lang/message/full" />");
			return false;
		}
	}

	send_submit("form2");
}
function move(x, y, type){//PT
	var tilt = document.form1.tiltSpeed.value;
	if('<xsl:value-of select="root/common/serial" />' == "DCS-5230")
		tilt = parseInt(tilt) +2;	
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
function addPatrol(){
	var presetList = document.form4.presetList;
	var patrolPoint = document.form4.patrolPoint;
	if(patrolPoint.options.length == 20)
	{
		alert("<xsl:value-of select="root/lang/message/selectFull" />");
		return false;
	}
	if("<xsl:value-of select="root/config/route" />" == "")
		if(patrolPoint.options[0].text=="")
			patrolPoint.remove(0);
			
	for(var i=0;;i++){
		if(presetList.options[i].selected){
			var e = presetList.options[i];
			patrolPoint.options.add(new Option(e.text, e.value));
		}
		if(i == presetList.options.length - 1)
			break;
	}
}
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
}

function initForm(){

	//select
	document.form4.patrolSpeed.value = '<xsl:value-of select="root/config/patrolSpeed" />';

	var route = "<xsl:value-of select="root/config/route" />";
	getPoint(route);
	pointText();

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
}

function pointText(){
	var presetList = document.form4.presetList;
	var patrolPoint = document.form4.patrolPoint;
	var name = new Array();
	var i=0;

	for(i=0;i!=patrolPoint.length;i++){
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[1]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[1]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[2]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[2]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[3]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[3]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[4]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[4]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[5]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[5]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[6]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[6]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[7]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[7]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[8]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[8]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[9]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[9]/presetName" />";
		if (patrolPoint.options[i].value == '<xsl:value-of select="root/config/preset[10]/index" />')
			patrolPoint.options[i].text = "<xsl:value-of select="root/config/preset[10]/presetName" />";
		
	}
}

function savePoint(){
	var waitTime=get_by_id("waitTime").value;
	if (waitTime == ""){
	alert(waitTimeError1);
		return false;
	}
	if (isNaN(waitTime)){
		alert(waitTimeError2);
		return false;
	}
	
	if(checkWaitTime(document.form4.waitTime,waitTimeError3)==false)
		return false;

	checkPoint()

	send_submit("form4");
}
function disableEnterKeydown(e) 
{    
	var key;

     if(window.event)
          key = window.event.keyCode;     //IE
     else
          key = e.which;     //firefox
     if(key == 13)
          return false;
     else
          return true;
		
	 
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

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();">
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
								<div><a href="adv_image.cgi"><xsl:value-of select="root/lang/leftPanel/imageSettings" /></a></div>
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/cameraControl" /></div>
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
                    <h1><xsl:value-of select="root/lang/body/cameraControl" /></h1>
            	        <xsl:value-of select="root/lang/body/description1" /><br />
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						</font>
					</xsl:if>
        			<xsl:if test="/root/result/code = 'failure'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/failure" />
						</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'full'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/full" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'duplicate'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/duplicate" />
						</font>
   				    </xsl:if>
                    <xsl:if test="/root/result/code = 'over'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidParameters" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidParameters'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidParameters" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'oob'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/oob" />
						</font>
   				    </xsl:if>
              </div>
              <div class="box">
                    <h2><xsl:value-of select="root/lang/body/cameraControl" /></h2>
                    <table width="525" border="0" cellpadding="0" cellspacing="0">
                      <form id="form1" name="form1">
                        <tr>
                          <td>&nbsp;</td>
                          <td rowspan="8" width="320">
							<xsl:if test="/root/config/ie = 'true'">
                              <object classid="clsid:721700FE-7F0E-49C5-BDED-CA92B7CB1245" codebase="/dcsclictrl.cab#version=1,0,0,3818" id="dcscontrol1" width="320" height="240">
                                <param name="RemoteHost" value="127.0.0.1" />
                                <param name="RemotePort" value="80" />
                              </object>
                            </xsl:if>
                              <xsl:if test="/root/config/ie = 'false'">
								 <img id="mjpgImage" alt="Processing..." width="320" height="240" src="/video/mjpg.cgi?profileid=3" />
                              </xsl:if>
                          </td>
						  <td valign="top" align="center" width="180">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" colspan="2">
									<img name="PTControl" src="../images/way-control.jpg" width="120" height="120" border="0" usemap="#MapMap" align="center" />
									<map name="MapMap" id="MapMap">
									<area shape="poly" coords="7,37,18,20,39,8,39,25,32,30,28,35,24,38" onmousedown="pressImage('left_up')" onmouseup="return move(-1, 1, 'left_up');" onmouseover="overImage('left_up')" onmouseout="outImage('pt_out')" id="pt_left_up" alt="left up" title="left up" />
									<area shape="poly" coords="40,6,77,6,78,24,70,21,60,20,48,21,39,24" onmousedown="pressImage('up')" onmouseup="return move(0, 1, 'up');" onmouseover="overImage('up')" onmouseout="outImage('pt_out')" id="pt_up" alt="up" title="up" />
									<area shape="poly" coords="78,5,97,16,112,36,94,36,89,30,84,24,77,20" onmousedown="pressImage('right_up')" onmouseup="return move(1, 1, 'right_up');" onmouseover="overImage('right_up')" onmouseout="outImage('pt_out')" id="pt_right_up" alt="right up" title="right up" />
									<area shape="poly" coords="27,77,6,78,4,38,25,40,22,48,23,56,22,64,23,72" onmousedown="pressImage('left')" onmouseup="return move(-1, 0, 'left');" onmouseover="overImage('left')" onmouseout="outImage('pt_out')" id="pt_left" alt="left" title="left" />
									<area shape="circle" coords="59,59,15" onmousedown="pressImage('home')" onmouseup="return home();" onmouseover="overImage('home')" onmouseout="outImage('pt_out')" id="pt_home" alt="home" title="home" />
									<area shape="poly" coords="113,39,113,75,94,75,99,66,100,57,100,48,97,38" onmousedown="pressImage('right')" onmouseup="return move(1, 0, 'right');" onmouseover="overImage('right')" onmouseout="outImage('pt_out')" id="pt_right" alt="right" title="right" />
									<area shape="poly" coords="26,79,8,79,23,101,42,110,41,94,35,89,30,84" onmousedown="pressImage('left_down')" onmouseup="return move(-1, -1, 'left_down');" onmouseover="overImage('left_down')" onmouseout="outImage('pt_out')" id="pt_left_down" alt="left down" title="left down" />
									<area shape="poly" coords="43,91,42,112,80,112,80,93,72,97,62,96,51,96" onmousedown="pressImage('down')" onmouseup="return move(0, -1, 'down');" onmouseover="overImage('down')" onmouseout="outImage('pt_out')" id="pt_down" alt="down" title="down" />
									<area shape="poly" coords="79,91,80,112,100,98,115,78,93,78,91,83,84,88" onmousedown="pressImage('right_down')" onmouseup="return move(1, -1, 'right_down');" onmouseover="overImage('right_down')" onmouseout="outImage('pt_out')" id="pt_right_down" alt="right down" title="right down" />
									<area shape="poly" coords="60,43,58,23,46,23,34,32,25,42,23,61,27,79,37,87,47,93,60,95,60,73,49,69,45,57,49,48" onmousedown="pressImage('zoon_in')" onmouseup="return zoonIn();" onmouseover="overImage('zoon_in')" onmouseout="outImage('pt_out')" id="pt_zoon_in" alt="Zoom-in" title="Zoom in" />
									<area shape="poly" coords="61,23,76,23,90,31,97,41,97,54,95,69,90,81,79,90,72,94,63,93,61,74,69,70,74,63,74,55,70,47,61,44" onmousedown="pressImage('zoon_out')" onmouseup="return zoonOut();" onmouseover="overImage('zoon_out')" onmouseout="outImage('pt_out')" id="pt_zoon_out" alt="Zoom-out" title="Zoom out" />
									<area shape="poly" coords="18,22" href="#" />
									</map>								</td>
								</tr>
								<tr>
									<td align="center" colspan="3">
									<xsl:value-of select="root/lang/body/homeDefinition" /><br />
									<input name="button6" type="button" onclick="return setHomePos('set_home');" value="{root/lang/body/setAsHome}" /><br />
									<input name="button7" type="button" onclick="return setHomePos('restore_home');" value="{root/lang/body/defaultHome}" />                          </td>
								</tr>
								<tr height="30">
									<td><xsl:value-of select="root/lang/body/panSpeed" /></td>
									<td><select name="panSpeed" id="panSpeed" >
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
									</select>                          </td>
									</tr>
									<tr>
									<td><xsl:value-of select="root/lang/body/tiltSpeed" /></td>
									<td><select name="tiltSpeed" id="tiltSpeed" >
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
									<input name="hostname" id="hostname" type="hidden" size="30" value="hostname" />
									<input name="resultCode" type="hidden" size="15" value="N/A" />                          </td>
								</tr>
							</table>
						  
						  </td>
                        </tr>
                      </form>
                      <tr> </tr>
                    </table>
					<br />
                    <table width="525" border="0" cellpadding="0" cellspacing="0">
                      <form id="form2" name="form2" onkeypress="return disableEnterKeydown(event)" method="post" action="cam_control.cgi">
                        <tr>
                          <td>&nbsp;</td>
                          <td width="135"><xsl:value-of select="root/lang/body/currentPosition" />
                              <input type="hidden" id="command" name="command" value="add" /></td>
                          <td width="200"><input maxlength="20" size="25" name="presetName" id="presetName" value="{root/config/camera/currentPosition}" onkeypress="return disableEnterKeydown(event)"  /></td>
                          <td width="200" colspan="2"><input type="button" onclick="addPreset()" value="{root/lang/body/add}" name="Submit" /></td>
                        </tr>
                      </form>
                      <form id="form3" name="form3" method="post" action="cam_control.cgi">
                        <tr>
                          <td>&nbsp;</td>
                          <td width="135"><xsl:value-of select="root/lang/body/presetPosition" />
                              <input type="hidden" id="command" name="command" value="del" /></td>
                          <td width="200"><select name="presetName">
                              <option value="0" selected="selected"><xsl:value-of select="root/lang/body/none" /></option>
                              <xsl:for-each select="root/config/preset">
                                <option value="{presetName}"><xsl:value-of select="presetName"/></option>
                              </xsl:for-each>
                            </select>                          </td>
                          <td colspan="2"><input type="button" onclick="delPreset()" value="{root/lang/body/delete}" name="Submit1" /></td>
                        </tr>
                      </form>

						<form id="form4" name="form4" method="post"  onkeypress="return disableEnterKeydown(event)" action="cam_control.cgi">
                        <tr>
						  <td>&nbsp;</td>
                          <td width="135"><xsl:value-of select="root/lang/body/patrolSelection" />
                              <input type="hidden" id="command" name="command" value="set" />
							  <input type="hidden" id="route" name="route" value="" /></td>
                          <td width="200">
						  <xsl:value-of select="root/lang/body/presetLocations" /><br />
						  <select name="presetList" multiple="multiple" size="8" style="width:150px;" >
						  	<xsl:for-each select="root/config/preset">
								<option value="{index}"><xsl:value-of select="presetName"/></option>
							</xsl:for-each>
						  </select></td>
                          <td colspan="2"><input type="button" onclick="addPatrol()" value="{root/lang/body/select}" name="Submit2" /></td>
                        </tr>
                        <tr>
						  <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td >
						  <xsl:value-of select="root/lang/body/selectedLocations" /><br />
						  <select name="patrolPoint" size="8" style="width:150px;" onclick="" multiple="multiple">
                          </select></td>
                          <td>
						  <xsl:value-of select="root/lang/body/patrolSpeed" /><br /><br />
						  <xsl:value-of select="root/lang/body/dwellingTime" /></td>
						  <td>
						  <select name="patrolSpeed" id="patrolSpeed" >
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
						  </select><br /><br />
						  <input maxlength="2" size="3" value="{root/config/waitTime}" name="waitTime" id="waitTime" onkeypress="return disableEnterKeydown(event)" />						  
						  </td>
                        </tr>
                        <tr>
						  <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td ><input type="button" onclick="changepos(-1)" value="{root/lang/body/up}" name="Submit3" />
                            <input type="button" onclick="changepos(1)" value="{root/lang/body/down}" name="Submit4" />
                            <input type="button" onclick="delPatrol()" value="{root/lang/body/remove}" name="Submit5" /></td>
                          <td><input type="button" onclick="savePoint()" value="{root/lang/body/save}" name="Submit6" /></td>
                          <td>&nbsp;</td>
                        </tr>
                      </form>
                    </table>
              </div>
              <!-- === END MAINCONTENT === -->
          </div></td>
		  <td valign="top" width="150" id="sidehelp_container" align="left">
				<table width="125" border="0" 
      cellpadding="2" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#ffffff" bordercolordark="#ffffff" bgcolor="#ffffff">
                  <tbody>
                    <tr>
                      <td id="help_text"><strong><xsl:value-of select="root/lang/hint/helpfulHints" /></strong><br />
                          <br />                          
                        <strong><xsl:value-of select="root/lang/hint/homeDefinition" /></strong><xsl:value-of select="root/lang/hint/description1" /><br />
                          <br />
                      <strong><xsl:value-of select="root/lang/hint/patrolSelection" /></strong><xsl:value-of select="root/lang/hint/description2" /><strong><xsl:value-of select="root/lang/hint/selectedLocations" /></strong><xsl:value-of select="root/lang/hint/description3" /><strong><xsl:value-of select="root/lang/hint/autoPatrol" /></strong><xsl:value-of select="root/lang/hint/description4" /></td>
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
