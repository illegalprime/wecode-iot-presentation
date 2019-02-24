<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="mot_detect.xml" --><!DOCTYPE xsl:stylesheet  [
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
<!--
<SCRIPT language="JavaScript" FOR="dcscontrol1" EVENT="OnNotifyMotionAreaChanged(lResult)">
  RestartSensitive();
</SCRIPT>
-->
<script language="JavaScript" type="text/javascript">
<![CDATA[
var region = new Array();
var sense = new Array();
var oldRegion = 0;
var newRegion = 0;

function send_request(){
//	newRegion = document.form1.regions.value;
	newRegion = 0;
	if(checkSense()==-1){
		document.form1.sense.select();
		return false;
	}
	
	if(ieFlag == "true"){
		getMotionData(newRegion);
		sense[newRegion] = document.form1.sense.value;
		document.form1.region1.value = region[0];
		document.form1.sense1.value = sense[0];
		document.form1.region2.value = region[1];
		document.form1.sense2.value = sense[1];
		document.form1.region3.value = region[2];
		document.form1.sense3.value = sense[2];
		if(document.form1.enable_mon.checked)
		{
			if( document.form1.region1.value == "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
			{
				alert(areaError);
				return false;
			}
		}

//		StopSensitive();
	}
	else{
		if(document.form1.enable_mon.checked){
			document.form1.region1.value = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
		}
		else{
			document.form1.region1.value = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
		}
		document.form1.sense1.value = document.form1.sense.value;
		document.form1.region2.value = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
		document.form1.sense2.value = 0;
		document.form1.region3.value = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
		document.form1.sense3.value = 0;
	}
	
	if(document.form1.enable_mon.checked)
		document.form1.enable.value = 1;
	else
		document.form1.enable.value = 0;
	if(document.form1.pirBox.checked)
		document.form1.pirEnable.value = 1;
	else
		document.form1.pirEnable.value = 0;

	send_submit("form1");
}
function getMotionData(index){
	var dcscontrol1 = document.getElementById("dcscontrol1");
	region[index] = dcscontrol1.GetMotionDetectionData();
}

function setMotionData(index){
	var dcscontrol1 = document.getElementById("dcscontrol1");
	dcscontrol1.SetMotionDetectionData(region[index],index);
}

function checkSense(){
	var sense = document.form1.sense.value;
	if(isNaN(sense)){
		alert(numberError);
		return -1;
	}
	if(checkSenseRange(sense) == false)
	{
		alert(rangeError);
		return -1;
	}
	if(range(sense,0,100) == false){
		alert(rangeError);
		return -1;
	}
}

function clearMotion(){
	var dcscontrol1 = document.getElementById("dcscontrol1");
	dcscontrol1.ClearAllMDMatrix()
}

function SetState(){
	var dcscontrol1 = document.getElementById("dcscontrol1");

	if(document.form1.dwMode[0].checked)
		dcscontrol1.SetMDMouseState(0);
	else
		dcscontrol1.SetMDMouseState(1);
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var numberError = "<xsl:value-of select="root/lang/body/numberError" />";
var rangeError = "<xsl:value-of select="root/lang/body/rangeError" />";
var areaError = "<xsl:value-of select="root/lang/body/areaError" />"
var ieFlag = "<xsl:value-of select="root/config/ie " />";

function InitActiveX(){
	var dcscontrol1 = document.getElementById("dcscontrol1");
//	var sensor = document.getElementById("sensor");

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
	dcscontrol1.MDWidth = 640;
	dcscontrol1.MDHeight = 480;
	dcscontrol1.MBCX = 16;
	dcscontrol1.MBCY = 16;
	dcscontrol1.ShowMotionDetectionInput();
	dcscontrol1.play();	
	dcscontrol1.SetMotionDetectionData(region[0],0);
	dcscontrol1.StopLiveStreamIn(2);
//	sensor.SetRectangleColor(6);
}

function ReleaseActiveX()
{
  var dcscontrol1 = document.getElementById("dcscontrol1");
  dcscontrol1.Stop();
}
function initForm(){

	if ('<xsl:value-of select="root/common/peripheral/PIR " />' == '1'){
		if ('<xsl:value-of select="root/config/pir/enable " />' == '1')
			document.form1.pirBox.checked=true;
		document.getElementById("hiddenPIR").style.display="";
	}
	else
		document.getElementById("hiddenPIR").style.display="none";

	if ('<xsl:value-of select="root/config/display/system " />' == 'SXGA')
		document.form1.enable_mon.disabled=true;

	document.form1.hostname.value = "http://" + window.location.hostname;
	if ('<xsl:value-of select="root/config/motionDetection/enable" />' == '1')
		document.form1.enable_mon.checked=true;
		
	region[0] = "<xsl:value-of select="root/config/motionDetection/region1/bitmap" />";
	sense[0] = "<xsl:value-of select="root/config/motionDetection/region1/sense" />";
	region[1] = "<xsl:value-of select="root/config/motionDetection/region2/bitmap" />";
	sense[1] = "<xsl:value-of select="root/config/motionDetection/region2/sense" />";
	region[2] = "<xsl:value-of select="root/config/motionDetection/region3/bitmap" />";
	sense[2] = "<xsl:value-of select="root/config/motionDetection/region3/sense" />";
//alert(region[0])
//alert(region[1])
//alert(region[2])
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
		var activeXSize = document.getElementById("dcscontrol1");
		var width = parseInt('<xsl:value-of select="/root/config/profiles/profile[4]/width" />');
		var bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[4]/bps" />');
		var fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[4]/fps" />');
		activeXSize.ProfileID = 4;
		if('<xsl:value-of select="/root/config/profiles/profile[2]/codec" />' == 'mp4'){
			var num=parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/width" />');
			if (num==width ){
//compare bps
				var num=parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/bps" />');
				if (num==bps ){
//compare fps
					var num=parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/width" />')-fps;
					if (numcheck(num)==0){
						activeXSize.ProfileID = 2;
						width=parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/width" />');
						bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/bps" />');
						fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/fps" />');
						//alert("use 2 cz fps");
					}

				}else if (numcheck(num-bps)==0){
					activeXSize.ProfileID = 2;
					width=parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/width" />');
					bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/bps" />');
					fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/fps" />');
					//alert("use 2 cz bps");
				}

			} else if (numcheck(num-width)==0){
				activeXSize.ProfileID = 2;
				width=parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/width" />');
				fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/fps" />');
				bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[2]/bps" />');
				//alert("use 2 cz bps");
			}

		}
		if('<xsl:value-of select="/root/config/profiles/profile[1]/codec" />' == 'mp4'){
			var num=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />');
			if (num==width ){
//compare bps
				var num=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/bps" />');
				if (num==bps ){
//compare fps
					var num=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />')-fps;
					if (numcheck(num)==0){
						activeXSize.ProfileID = 1;
						width=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />');
						bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/bps" />');
						fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/fps" />');
					//	alert("use 1 cz fps");
					}

				}else if (numcheck(num-bps)==0){
					activeXSize.ProfileID = 1;
					width=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />');
					bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/bps" />');
					fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/fps" />');
			//		alert("use 1 cz bps");
				}

			} else if (numcheck(num-width)==0){
				activeXSize.ProfileID = 1;
				width=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />');
				fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/fps" />');
				bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/bps" />');
			//	alert("use 1 cz bps");
			}

		}
		InitActiveX();
//		StartSensitive();
	}
	else{
		document.getElementById("showApplet").style.display="none";
		document.getElementById("moText").style.display="none";
		document.getElementById("normal").style.display="none";
		document.getElementById("showUnselect").style.display="none";
//		document.getElementById("showInverse").style.display="none";
		document.getElementById("showButton").style.display="none";
		document.getElementById("showFirefoxText").style.display="";
	}
}

function releaseForm(){
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
//		StopSensitive();
		ReleaseActiveX();
	}
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
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();" onunload="releaseForm();">
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/motionDetection" /></div>
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
			  <form id="form1" name="form1" method="post" action="mot_detect.cgi" onsubmit="return send_request();">
			<td valign="top" id="maincontent_container" height="305" width="563">			  <div id="maincontent">
				  <!-- === BEGIN MAINCONTENT === -->
              <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/motionDetection" /></h1>
            	        <xsl:value-of select="root/lang/body/description1" /><br />
						<xsl:if test="root/config/display/system = 'SXGA'">
						<font color="#FF0000"><xsl:value-of select="root/lang/body/description2" /><br /><xsl:value-of select="root/lang/body/description3" /><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/body/description4" /></a><xsl:value-of select="root/lang/body/description5" /></font><br />
						</xsl:if>
						<br />
						<center>
					    <input name="button1" type="button" value="{root/lang/body/savebutton}" onclick="send_request()" />
				        <input name="button2" type="button" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='mot_detect.cgi'" />
						</center>
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						</font>
        			</xsl:if>
					<xsl:if test="/root/result/code = 'invalidParameter'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
					<xsl:if test="/root/result/code = 'updateFailed'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/updateFailed" />
						</font>
        			</xsl:if>
              </div>
                  <div class="box">
				  <h2><xsl:value-of select="root/lang/body/liveVideo" /></h2>
                    <table width="525" border="0" cellpadding="0" cellspacing="0">
			  	<tr id="showFirefoxText" style="display:none">
					<td colspan="2">
	                    <font color="#FF0000"><xsl:value-of select="root/lang/body/showFirefoxText" /></font>
					</td>
				</tr>
			  	<tr name="hiddenPIR" id="hiddenPIR" style="display:none" >
					<td colspan="2">
	                    <input type="checkbox" id="pirBox" name="pirBox" />
	                    <xsl:value-of select="root/lang/body/enablePIR" />
	                    <input name="pirEnable" id="pirEnable" type="hidden" size="3" value="0" />
					</td>
				</tr>
			  	<tr>
					<td><input type="checkbox" id="enable_mon" name="enable_mon" />
                      <xsl:value-of select="root/lang/body/enableMotion" />
                      <input name="enable" id="enable" type="hidden" size="3" value="0" /></td>
					<td>&nbsp;</td>
				</tr>
                <tr id="showApplet" name="showApplet">
                  <td width="363" rowspan="7">
<!--<xsl:if test="/root/config/ie = 'true'">-->
                              <object classid="clsid:721700FE-7F0E-49C5-BDED-CA92B7CB1245" codebase="/dcsclictrl.cab#version=1,0,0,3818" id="dcscontrol1" width="320" height="240">
                                <param name="RemoteHost" value="127.0.0.1" />
                                <param name="RemotePort" value="80" />
                              </object>
							  &nbsp;&nbsp;
							  <!--<OBJECT ID="sensor" CLASSID="CLSID:98EDD118-9973-4108-9B08-D94032306E14" style="display:none"></OBJECT>-->
<!--                            </xsl:if>-->
					<!--<img src="camctrl.JPG" alt="&lt;empty&gt;" width="362" height="272" />--></td>
                  <td height="50">&nbsp;</td>
                </tr>
                <tr>
                  <td >&nbsp;&nbsp;&nbsp;&nbsp;<strong><xsl:value-of select="root/lang/body/sense" /></strong></td>
                </tr>
                <tr>
                  <td><div align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="sense" id="sense" maxlength="3" size="3" value="{root/config/motionDetection/region1/sense}" />&nbsp;0~100%
                  </div></td>
                </tr>
                <tr id="moText" name="moText">
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;<strong><xsl:value-of select="root/lang/body/drawingMode" /></strong></td>
                </tr>
                <tr id="normal" name="normal">
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="0" name="dwMode" id="drawMotion" onclick="SetState();" checked="checked" />
                    <xsl:value-of select="root/lang/body/drawMotion" /></td>
                </tr>
                <tr id="showUnselect" name="showUnselect">
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="1" name="dwMode" id="unselectMode" onclick="SetState();" />
                    <xsl:value-of select="root/lang/body/eraseMotion" /></td>
                </tr>
<!--
                <tr id="showInverse" name="showInverse">
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="inverseMode" id="inverseMode" onclick="SetState();" />
				  <input type="radio" value="0" name="recycle" id="recycleStop" />
                    <xsl:value-of select="root/lang/body/inverse" /></td>
                </tr>
-->
                <tr id="showButton" name="showButton">
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit22" type="button" class="style1" value="{root/lang/body/clear}" onclick="clearMotion()" /></td>
                </tr>
                <tr>
                  <td >
				  <input name="hostname" id="hostname" type="hidden" size="30" value="hostname" />
				  <input name="region1" id="region1" type="hidden" value="hostname" />
				  <input name="sense1" id="sense1" type="hidden" value="hostname" />
				  <input name="region2" id="region2" type="hidden" size="15" value="hostname" />
				  <input name="sense2" id="sense2" type="hidden" size="15" value="hostname" />
				  <input name="region3" id="region3" type="hidden" size="15" value="hostname" />
				  <input name="sense3" id="sense3" type="hidden" size="15" value="hostname" />
				  </td>
                </tr>
              </table>
              </div><br />
						<center>
					    <input name="button1" type="button" value="{root/lang/body/savebutton}" onclick="send_request()" />
				        <input name="button2" type="button" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='mot_detect.cgi'" />
						</center>
            </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table width="125" border="0" 
      cellpadding="2" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#ffffff" bordercolordark="#ffffff" bgcolor="#ffffff">
                  <tbody>
                    <tr>
                      <td id="help_text"><strong><xsl:value-of select="root/lang/hint/helpfulHints" /></strong><br /><br />
<!--						  <xsl:value-of select="root/lang/hint/description1" /><br /><br />
						  <xsl:value-of select="root/lang/hint/description2" /><br /><br />-->
                          <strong><xsl:value-of select="root/lang/body/sense" /></strong><xsl:value-of select="root/lang/hint/description1" /><br />
                          <br />
						  <strong><xsl:value-of select="root/lang/body/unselectRange" /></strong><xsl:value-of select="root/lang/body/unselectRange1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/inverseRange" /></strong><xsl:value-of select="root/lang/body/inverseRange1" /><br /><br />
                           <!--  <xsl:value-of select="root/lang/hint/description1" />-->
                            </td>
                    </tr>
                  </tbody>
              </table></td></form>
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
