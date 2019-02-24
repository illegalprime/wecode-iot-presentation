<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_wireless.xml" --><!DOCTYPE xsl:stylesheet  [
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
function send_request(){
	if(document.form1.wirelessBox.checked){
		var ssid = get_by_id("ssid").value;
		document.form1.wireless.value = "on";
		
		if (ssid == ""){
			alert(ssidError);
			document.form1.ssid.select();
			return false;
		}

		if (document.form1.mode[0].selected){
			document.form1.security.value = document.form1.security1.value;
			if (document.form1.security1[0].selected){
				if(document.form1.encryption1[1].selected){
					if(checkwepkey(keyError1,keyError2) == false)
						return false;
				}
				else{
					document.form1.key.disabled=false;
					document.form1.key.value="";
				}
			}

			//shared key
			if (document.form1.security1[1].selected){
				if(checkwepkey(keyError1,keyError2) ==false)
					return false;
			}

			if (document.form1.security1[2].selected || document.form1.security1[3].selected){
				if(checkpresharedkey(keyError3,keyError4,keyError5) == false)
					return false;
			}
			
			if (document.form1.security1[0].selected)
				document.form1.encryption.value = document.form1.encryption1.value;
			if (document.form1.security1[1].selected)
				document.form1.encryption.value = document.form1.encryption2.value;
			if (document.form1.security1[2].selected)
				document.form1.encryption.value = document.form1.encryption3.value;
			if (document.form1.security1[3].selected)
				document.form1.encryption.value = document.form1.encryption4.value;
		}
		else{
			document.form1.security.value = document.form1.security2.value;
			if (document.form1.security2[0].selected){
				if(document.form1.encryption1[1].selected){
					if(checkwepkey(keyError1,keyError2) == false)
						return false;
				}
				else{
					document.form1.key.disabled=false;
					document.form1.key.value="";
				}
			}

			//shared key
			if (document.form1.security2[1].selected){
				if(checkwepkey(keyError1,keyError2) ==false)
					return false;
			}
			
			if (document.form1.security2[0].selected)
				document.form1.encryption.value = document.form1.encryption1.value;
			if (document.form1.security2[1].selected)
				document.form1.encryption.value = document.form1.encryption2.value;
		}
	}
	else{
		document.form1.wireless.value = "off";
		document.form1.security.value = defaultSecurity;
	}

	send_submit("form1");
	return true;
} 
	
function changeMode1(){
/*	if (document.form1.security1[0].selected){
		if (document.form1.encryption[0].selected)
			document.form1.key.disabled=true;
		else if (document.form1.encryption[1].selected)
			document.form1.key.disabled=false;
	}
	else if (document.form1.security1[1].selected || document.form1.security1[2].selected || document.form1.security1[3].selected)
		document.form1.key.disabled=false;
*/
}

function changeMode2(){
/*	if (document.form1.security2[0].selected){
		if (document.form1.encryption[0].selected)
			document.form1.key.disabled=true;
		else if (document.form1.encryption[1].selected)
			document.form1.key.disabled=false;
	}
	else if (document.form1.security2[1].selected)
		document.form1.key.disabled=false;
*/
}

//for Channel
function changeMode3(){
	if(document.form1.mode[0].selected){
		document.form1.channel.disabled=true;
		document.getElementById("channel_infrastructure").style.display="";
		document.getElementById("channel_adhoc").style.display="none";
		document.getElementById("security1").style.display="";
		document.getElementById("security2").style.display="none";
//		setSecurity(document.form1.security1);
		changeMode1();
	}
	else if(document.form1.mode[1].selected){
		document.form1.channel.disabled=false;
		document.getElementById("channel_infrastructure").style.display="none";
		document.getElementById("channel_adhoc").style.display="";
		document.getElementById("security1").style.display="none";
		document.getElementById("security2").style.display="";
//		setSecurity(document.form1.security2);
		changeMode2();
	}

	document.form1.channel_auto.disabled=true;
	changeMode7();
}

function changeMode4(){
/*
	if (document.form1.encryption1.value == "Disable")
		document.form1.key.disabled=true;
	else
		document.form1.key.disabled=false;
*/
}

//for wireless
function changeMode5(){
	if(document.form1.wirelessBox.checked){
		document.form1.listSSID.disabled=false;
		document.form1.rescanButton.disabled=false;
		document.form1.ssid.disabled=false;
		document.form1.mode.disabled=false;
//		document.form1.txrate.disabled=false;
		document.form1.security1.disabled=false;
		document.form1.security2.disabled=false;
//		document.form1.encryption.disabled=false;
		document.form1.encryption1.disabled=false;
		document.form1.encryption2.disabled=false;
		document.form1.encryption3.disabled=false;
		document.form1.encryption4.disabled=false;
		changeMode3();
	}
	else{
		document.form1.listSSID.disabled=true;
		document.form1.rescanButton.disabled=true;
		document.form1.ssid.disabled=true;
		document.form1.mode.disabled=true;
		document.form1.channel.disabled=true;
		document.form1.channel_auto.disabled=true;
//		document.form1.txrate.disabled=true;
		document.form1.security1.disabled=true;
		document.form1.security2.disabled=true;
//		document.form1.encryption.disabled=true;
		document.form1.encryption1.disabled=true;
		document.form1.encryption2.disabled=true;
		document.form1.encryption3.disabled=true;
		document.form1.encryption4.disabled=true;
		document.form1.key.disabled=true;
	}
}

function changeMode6(){
	if(document.form1.wirelessBox.checked){
	}
	else{
		document.form1.listSSID.disabled=true;
		document.form1.rescanButton.disabled=true;
		document.form1.ssid.disabled=true;
		document.form1.mode.disabled=true;
		document.form1.channel.disabled=true;
		document.form1.channel_auto.disabled=true;
//		document.form1.txrate.disabled=true;
		document.form1.security1.disabled=true;
		document.form1.security2.disabled=true;
//		document.form1.encryption.disabled=true;
		document.form1.encryption1.disabled=true;
		document.form1.encryption2.disabled=true;
		document.form1.encryption3.disabled=true;
		document.form1.encryption4.disabled=true;
		document.form1.key.disabled=true;
	}
}

function changeMode7(){
	if(document.form1.mode[0].selected){
		if (document.form1.security1[0].selected){
			document.getElementById("encryption1").style.display="";
			document.getElementById("encryption2").style.display="none";
			document.getElementById("encryption3").style.display="none";
			document.getElementById("encryption4").style.display="none";
			if (document.form1.encryption1[0].selected)
				document.form1.key.disabled=true;
			else if (document.form1.encryption1[1].selected)
				document.form1.key.disabled=false;
		}
		if (document.form1.security1[1].selected){
			document.getElementById("encryption1").style.display="none";
			document.getElementById("encryption2").style.display="";
			document.getElementById("encryption3").style.display="none";
			document.getElementById("encryption4").style.display="none";
			document.form1.key.disabled=false;
		}
		if (document.form1.security1[2].selected){
			document.getElementById("encryption1").style.display="none";
			document.getElementById("encryption2").style.display="none";
			document.getElementById("encryption3").style.display="";
			document.getElementById("encryption4").style.display="none";
			document.form1.key.disabled=false;
		}
		if (document.form1.security1[3].selected){
			document.getElementById("encryption1").style.display="none";
			document.getElementById("encryption2").style.display="none";
			document.getElementById("encryption3").style.display="none";
			document.getElementById("encryption4").style.display="";
			document.form1.key.disabled=false;
		}	
	}
	else if(document.form1.mode[1].selected){
		if (document.form1.security2[0].selected){
			document.getElementById("encryption1").style.display="";
			document.getElementById("encryption2").style.display="none";
			document.getElementById("encryption3").style.display="none";
			document.getElementById("encryption4").style.display="none";
			if (document.form1.encryption1[0].selected)
				document.form1.key.disabled=true;
			else if (document.form1.encryption1[1].selected)
				document.form1.key.disabled=false;
		}
		if (document.form1.security2[1].selected){
			document.getElementById("encryption1").style.display="none";
			document.getElementById("encryption2").style.display="";
			document.getElementById("encryption3").style.display="none";
			document.getElementById("encryption4").style.display="none";
			document.form1.key.disabled=false;
		}
	}
}

function siteSurvay(){
	var urlXML = "http://" + window.location.hostname + ":" + window.location.port + "/cgi/admin/siteSurvey.cgi";
	var urlXSL = 'adv_wireless.xsl';
	
	LoadXMLXSLTDoc(urlXML,urlXSL);
}

var xmlDoc;
var xslDoc;
function LoadXMLXSLTDoc(urlXML,urlXSL){
	xmlDoc=null;
	xslDoc=null;
	new net.ContentLoader(urlXML,onXMLLoad);
//	new net.ContentLoader(urlXSL,onXSLLoad);
}

function onXMLLoad(){
	xmlDoc=this.req.responseXML;
	wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth);
}

function onXSLLoad(){
	xslDoc=this.req.responseXML;
	wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth);
}

function rescan(){
	siteSurvay();
}
]]>
</script>    
<script language="JavaScript" type="text/javascript">
var ssidError = "<xsl:value-of select="root/lang/body/ssidError" />";
var keyError1 = "<xsl:value-of select="root/lang/body/keyError1" />";
var keyError2 = "<xsl:value-of select="root/lang/body/keyError2" />";
var keyError3 = "<xsl:value-of select="root/lang/body/keyError3" />";
var keyError4 = "<xsl:value-of select="root/lang/body/keyError4" />";
var keyError5 = "<xsl:value-of select="root/lang/body/keyError5" />";
var ssid = new Array();
var bssid = new Array();
var signal = new Array();
var type = new Array();
var channel = new Array();
var encrypt = new Array();
var auth = new Array();
var defaultSecurity;
/*
var countSurvey=0;
var secondsSurvey=0;
var reload_flag=0;
var timeoutIDSurvey;
function begin_count_survey(){
	timeoutIDSurvey = window.setInterval("ShowRealTime_Survey()", 1000)
}

function ShowRealTime_Survey(){
	if(countSurvey==0)
	{
		countSurvey = 31;
		siteSurvay();
		window.clearInterval(timeoutIDSurvey);
		begin_count_survey();
		if (reload_flag==1){
			location.href='adv_wireless.cgi';
			secondsSurvey = 0;
			reload_flag = 0;
		}
	}
	countSurvey--;
	secondsSurvey++;
	if(secondsSurvey==900)
		reload_flag = 1;
}
*/
function initForm(){
	if ('<xsl:value-of select="/root/result/code" />' == 'ok')
		begin_count();
		
	//checkbox
	if ('<xsl:value-of select="root/config/wireless/enable" />' == 'on')
		document.form1.wirelessBox.checked=true;

	//select
	//mode
	if ('<xsl:value-of select="root/config/wireless/mode" />' == '0'){
		document.form1.mode.value = '0';
		document.getElementById("channel_adhoc").style.display="none";
	}
	if ('<xsl:value-of select="root/config/wireless/mode" />' == '1'){
		document.form1.mode.value = '1';
		document.getElementById("channel_infrastructure").style.display="none";
	}
	//channel
//	if ('<xsl:value-of select="root/config/wireless/channel" />' == '0')
//		document.form1.channel.value = '0';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '1')
		document.form1.channel.value = '1';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '2')
		document.form1.channel.value = '2';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '3')
		document.form1.channel.value = '3';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '4')
		document.form1.channel.value = '4';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '5')
		document.form1.channel.value = '5';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '6')
		document.form1.channel.value = '6';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '7')
		document.form1.channel.value = '7';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '8')
		document.form1.channel.value = '8';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '9')
		document.form1.channel.value = '9';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '10')
		document.form1.channel.value = '10';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '11')
		document.form1.channel.value = '11';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '12')
		document.form1.channel.value = '12';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '13')
		document.form1.channel.value = '13';
	if ('<xsl:value-of select="root/config/wireless/channel" />' == '14')
		document.form1.channel.value = '14';
	//txrate
/*	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '0')
		document.form1.txrate.value = '0';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '1')
		document.form1.txrate.value = '1';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '2')
		document.form1.txrate.value = '2';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '3')
		document.form1.txrate.value = '3';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '4')
		document.form1.txrate.value = '4';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '5')
		document.form1.txrate.value = '5';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '6')
		document.form1.txrate.value = '6';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '7')
		document.form1.txrate.value = '7';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '8')
		document.form1.txrate.value = '8';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '9')
		document.form1.txrate.value = '9';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '10')
		document.form1.txrate.value = '10';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '11')
		document.form1.txrate.value = '11';
	if ('<xsl:value-of select="root/config/wireless/txrate" />' == '12')
		document.form1.txrate.value = '12';
*/
	var encryption='<xsl:value-of select="root/config/wireless/encryption" />';
	//security
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'Open'){
		document.form1.security1.value = 'Open';
		document.form1.encryption1.value = encryption;
	}
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'Shared'){
		document.form1.security1.value = 'Shared';
		document.form1.encryption2.value = encryption;
	}
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'WPA-PSK'){
		document.form1.security1.value = 'WPA-PSK';
		document.form1.encryption3.value = encryption;
	}
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'WPA2-PSK'){
		document.form1.security1.value = 'WPA2-PSK';
		document.form1.encryption4.value = encryption;
	}
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'WPA(2)-PSK'){
		document.form1.security1.value = 'WPA2-PSK';
		document.form1.encryption4.value = encryption;
	}
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'Open')
		document.form1.security2.value = 'Open';
	if ('<xsl:value-of select="root/config/wireless/security" />' == 'Shared')
		document.form1.security2.value = 'Shared';

	defaultSecurity = document.form1.security1.value;

//	begin_count_survey();
//	siteSurvay();
	
	var security='<xsl:value-of select="root/config/wireless/security" />';
	if ('<xsl:value-of select="root/config/wireless/mode" />' == '0'){
//		initSecurity(document.form1.security1,security,encryption);
		document.getElementById("security2").style.display="none";
	}
	if ('<xsl:value-of select="root/config/wireless/mode" />' == '1'){
//		initSecurity(document.form1.security2,security,encryption);
		document.getElementById("security1").style.display="none";
	}

	//this is for fixing space bug
	var keyValue = document.form1.key.value;
	var ssidValue = document.form1.ssid.value;
	keyValue = keyValue.substring(0,keyValue.length-1)
	ssidValue = ssidValue.substring(0,ssidValue.length-1)
//	alert(keyValue + " + " + ssidValue)
	document.form1.key.value = keyValue;
	document.form1.ssid.value = ssidValue;

	changeMode3();
	changeMode5();
//	document.form1.encryption.value = encryption;
	if ('<xsl:value-of select="root/config/wireless/mode" />' == '0')
		changeMode1();
	if ('<xsl:value-of select="root/config/wireless/mode" />' == '1')
		changeMode2();
	changeMode6();
	var pressMsg = '<xsl:value-of select="root/lang/body/pressScan" />';
	var varItem = new Option(pressMsg, pressMsg); 
	document.getElementById("listSSID").options.length = 0;
	document.getElementById("listSSID").options.add(varItem);
	document.form1.listSSID.disabled=true;
}

function changeSSID(){
	var i = document.form1.listSSID.value;
	var security;
	var encryption;
	if(i==0){
		document.getElementById("bssid").innerHTML = "None";
		document.getElementById("signal").innerHTML = "None";
		document.getElementById("hiddenSignal").style.display="none";
		return false;
	}
	else{
		document.form1.ssid.value = ssid[i];
		document.form1.key.value="";
		document.getElementById("bssid").innerHTML = bssid[i];
		document.getElementById("signal").innerHTML = signal[i];
		document.getElementById("hiddenSignal").style.display="";
		if(type[i] == "Infra")
			document.form1.mode.value = 0;
		else
			document.form1.mode.value = 1;
		document.form1.channel.value = channel[i];

		if(auth[i] == "WPA(2)-PSK")
			document.form1.security1.value = "WPA2-PSK";
		else if(auth[i] == "OPEN")
			document.form1.security1.value = "Open";
		else if(auth[i] == "WEPNONE")
			document.form1.security1.value = "Open";
		else
			document.form1.security1.value = auth[i];

		if(auth[i] == "Shared")
			document.form1.security2.value = "Shared";
		else if(auth[i] == "WPANONE")
			document.form1.security2.value = "Open";
		else
			document.form1.security2.value = "Open";

		if(encrypt[i] == "NONE")
			encryption = "Disable";
		else
			encryption = encrypt[i];
		//special case, needs to check "WPANONE"
		if(auth[i] == "WPANONE")
			encryption = "Disable";

		if(type[i] == "Infra"){
			security=document.form1.security1.value;
		}
		else{
			security=document.form1.security2.value;
		}
	}
	
	if (auth[i] == "OPEN" || auth[i] == "WEPNONE")
	{
		if (encrypt[i] == "NONE")
			document.form1.encryption1.value="Disable";
		else
			document.form1.encryption1.value=encrypt[i];
	}
	else if (auth[i] == "Shared")
	{
		document.form1.encryption2.value=encrypt[i];
	}
	else if (auth[i] == "WPA-PSK")
	{
		document.form1.encryption3.value=encrypt[i];
	}
	else if (auth[i] == "WPA2-PSK")
	{
		document.form1.encryption4.value=encrypt[i];
	}
	
	
	
//	alert("i="+i+" ssid[i]="+ssid[i]+" bssid[i]="+bssid[i]+" signal[i]="+signal[i]+" type[i]"+type[i]+" channel[i]="+channel[i]+" auth[i]="+auth[i]+" encrypt[i]="+encrypt[i])
//	alert("type[i]="+type[i]+" auth[i]="+auth[i]+" encrypt[i]="+encrypt[i])
//	alert("Mode = " + type[i] + " Authentication = " + auth[i] + " Encryption = " + encryption)
//	if(type[i] == "Infra"){
//		initSecurity(document.form1.security1,security,encryption);
//		changeMode1();
//	}
//	else{
//		initSecurity(document.form1.security2,security,encryption);
//		changeMode2();
//	}
	changeMode3();
//	document.form1.encryption.value = encryption;
	if(type[i] == "Infra")
		changeMode1();
	else
		changeMode2();
}

var count=45;
var timeoutID;
function begin_count()
{
	timeoutID = window.setInterval("ShowRealTime()", 1000)
	document.getElementById("leavetime").innerHTML = count + " ";
}

function ShowRealTime() {
	count--;
	document.getElementById("leavetime").innerHTML = count + " ";
	if(count==0)
	{
		count = 1;
		location.href='adv_wireless.cgi';
		window.clearInterval(timeoutID);
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/wireless" /></div>
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
                 <form id="form1" name="form1" method="post" action="adv_wireless.cgi" onsubmit="return send_request();">
			<td valign="top" id="maincontent_container" width="563" height="400">
			  <div id="maincontent">
				  
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/wirelessSettings" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /> <br />
                    <br />
				  <center>
				  <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
				  <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_wireless.cgi'" />
				  </center>
			        <xsl:if test="/root/result/code = 'invalidHttpPort'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
			        <xsl:if test="/root/result/code = 'invalidRTPPort'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidtype'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidpolicy'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidMode'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidChannel'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidTXRate'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						<br />
						<xsl:value-of select="root/lang/body/reboot1" />
						<span name="leavetime" id="leavetime"></span>
						<xsl:value-of select="root/lang/body/reboot2" />
						</font>
   				    </xsl:if>
				</div>				
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/wirelessConfiguration" /></h2>
				    <table width="525" border="0">
                      <tr>
                        <td width="90"><xsl:value-of select="root/lang/body/enableWireless" /></td>
                        <td width="435"><label>
                          <input type="checkbox" name="wirelessBox" id="wirelessBox" onclick="changeMode5()"/>
                          <input name="wireless" id="wireless" type="hidden" size="3" value="off" />
                        </label></td>
					  </tr>
                      <tr>
                        <td width="179"><xsl:value-of select="root/lang/body/survey" /></td>
                        <td width="248"><label>
                        <select name="listSSID" id="listSSID" onchange="changeSSID()" onclick="changeSSID()" >
                        </select>
                        <input name="rescanButton" type="button" value="{root/lang/body/rescan}" onclick="rescan()" />
                        </label></td>
					  </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/ssid" /></td>
                        <td><label>
                          <input type="text" name="ssid" id="ssid" maxlength="32" size="30" value="{root/config/wireless/ssid}" />
                        </label></td>
					  </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/wirelessMode" /></td>
                        <td><label>
                          <select name="mode" id="mode" onclick="changeMode3()" onchange="changeMode3()">
                            <option value="0"><xsl:value-of select="root/lang/body/infrastructure" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/adhoc" /></option>
                          </select>
                        </label></td>
					  </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/channel" /></td>
                        <td><label>
                          <span id="channel_adhoc" name="channel_adhoc">
						  <select name="channel" id="channel">
						  <xsl:if test="root/config/wireless/region = '0'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
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
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '1'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
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
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '2'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
                            <option value="10">10</option>
                            <option value="11">11</option>
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '3'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
                            <option value="10">10</option>
                            <option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '4'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
                            <option value="14">14</option>
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '5'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
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
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '6'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
						  </xsl:if>
						  <xsl:if test="root/config/wireless/region = '7'">
                            <!--<option value="0"><xsl:value-of select="root/lang/body/auto" /></option>-->
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
						  </xsl:if>
                          </select>
						  </span>
                          <span id="channel_infrastructure" name="channel_infrastructure">
                          <select name="channel_auto" id="channel_auto">
                            <option value="0"><xsl:value-of select="root/lang/body/auto" /></option>
                          </select>
						  </span>
                        </label></td>
					  </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/authentication" /></td>
                        <td>
						<!--
                          <select name="security1" id="security1" onchange="setSecurity(document.form1.security1);changeMode1();changeMode7()" onclick="changeMode1()" >
                            <option value="Open">Open</option>
                            <option value="Shared">Shared</option>
                            <option value="WPA-PSK">WPA-PSK</option>
                            <option value="WPA2-PSK">WPA2-PSK</option>
                        </select>
						<select name="security2" id="security2" onchange="setSecurity(document.form1.security2);changeMode2()" onclick="changeMode2()" >
                            <option value="Open">Open</option>
                            <option value="Shared">Shared</option>
                        </select>
						-->
                          <select name="security1" id="security1" onchange="changeMode1();changeMode7()" onclick="changeMode1();changeMode7()" >
                            <option value="Open">Open</option>
                            <option value="Shared">Shared</option>
                            <option value="WPA-PSK">WPA-PSK</option>
                            <option value="WPA2-PSK">WPA2-PSK</option>
                        </select>
						<select name="security2" id="security2" onchange="changeMode2();changeMode7()" onclick="changeMode2();changeMode7()" >
                            <option value="Open">Open</option>
                            <option value="Shared">Shared</option>
                        </select>
						<input name="security" id="security" type="hidden" size="1" value="" />
                        </td>
					  </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/encryption" /></td>
                        <td>
						<!--
						<select name="encryption" id="encryption" onchange="changeMode4()" onclick="changeMode4()" >
						</select>
						-->
						<select name="encryption1" id="encryption1" onchange="changeMode7()" onclick="changeMode7()" >
							<option value="Disable">Disable</option>
							<option value="WEP">WEP</option>
						</select>
						<select name="encryption2" id="encryption2" onchange="changeMode7()" onclick="changeMode7()" >
							<option value="WEP">WEP</option>
						</select>
						<select name="encryption3" id="encryption3" onchange="changeMode7()" onclick="changeMode7()" >
							<option value="TKIP">TKIP</option>
							<option value="AES">AES</option>
						</select>
						<select name="encryption4" id="encryption4" onchange="changeMode7()" onclick="changeMode7()" >
							<option value="AES">AES</option>
                            <option value="TKIP">TKIP</option>	
						</select>
						<input name="encryption" id="encryption" type="hidden" size="1" value="" />
                        </td>
					  </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/key" /></td>
                        <td><label><input type="password" name="key" id="key" size="30" maxlength="64" value="{root/config/wireless/key}" /></label></td>
					  </tr>
                      <tr style="display:none">
                        <td height="21"><xsl:value-of select="root/lang/body/bssid" /></td>
                        <td><label><span name="bssid" id="bssid">None</span></label></td>
					  </tr>
                      <tr id="hiddenSignal" name="hiddenSignal" style="display:none">
                        <td height="21"><xsl:value-of select="root/lang/body/signal" /></td>
                        <td><label><span name="signal" id="signal">None</span></label></td>
					  </tr>
                    </table>
		        </div>
				<br />
				  <center>
				  <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
				  <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_wireless.cgi'" />
				  </center>
			  </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
					  	<br />
						<xsl:value-of select="root/lang/hint/description1" />
						<xsl:value-of select="root/lang/hint/description2" />
						<xsl:value-of select="root/lang/hint/description3" />
						<br /><br />
						<strong><xsl:value-of select="root/lang/hint/description4" /></strong>
						<xsl:value-of select="root/lang/hint/description5" /><br />
						<br />
						<strong><xsl:value-of select="root/lang/hint/description6" /></strong><br />
						<strong><xsl:value-of select="root/lang/hint/description7" /></strong>
						<xsl:value-of select="root/lang/hint/description8" />
						<br />
						<strong><xsl:value-of select="root/lang/hint/description9" /></strong>
						<xsl:value-of select="root/lang/hint/description10" />
						<br />
						<strong><xsl:value-of select="root/lang/hint/description11" /></strong>
						<xsl:value-of select="root/lang/hint/description12" />
						<xsl:value-of select="root/lang/hint/description13" />
						<xsl:value-of select="root/lang/hint/description14" />
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
