<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="tools_admin.xml" --><!DOCTYPE xsl:stylesheet  [
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
function submit_privacy()
{
	var myForm = document.formPrivacy;

	if (myForm.privacyScheduled.checked)
	{
		if (myForm.sun.checked || myForm.mon.checked
			|| myForm.tue.checked || myForm.wed.checked
			|| myForm.thu.checked || myForm.fri.checked
			|| myForm.sat.checked)
		{
		}
		else{
			alert(scheduleError);
			return false;
		}
		
		var items = new Array()
		var itemSize = 0;

		if(myForm.sun.checked){
			if(timeCheckHours(myForm.sunH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.sunM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.sunH2,myForm.sunM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.sunM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.sunH1,myForm.sunM1,myForm.sunH2,myForm.sunM2,legalTimeError)==false)
				return false;
	
			itemSize = itemSize + 1;
			if(myForm.sunH2.value == 24)
				items[itemSize] = "0" + "," + myForm.sunH1.value + "," + myForm.sunM1.value + "," + "1" + "," + "0" + "," + myForm.sunM2.value ;
			else
				items[itemSize] = "0" + "," + myForm.sunH1.value + "," + myForm.sunM1.value + "," + "0" + "," + myForm.sunH2.value + "," + myForm.sunM2.value ;
		}
	
		if(myForm.mon.checked){
			if(timeCheckHours(myForm.monH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.monM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.monH2,myForm.monM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.monM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.monH1,myForm.monM1,myForm.monH2,myForm.monM2,legalTimeError)==false)
				return false;
			
			itemSize = itemSize + 1;
			if(myForm.monH2.value == 24)
				items[itemSize] = "1" + "," + myForm.monH1.value + "," + myForm.monM1.value + "," + "2" + "," + "0" + "," + myForm.monM2.value ;
			else
				items[itemSize] = "1" + "," + myForm.monH1.value + "," + myForm.monM1.value + "," + "1" + "," + myForm.monH2.value + "," + myForm.monM2.value ;
		}
	
		if(myForm.tue.checked){
			if(timeCheckHours(myForm.tueH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.tueM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.tueH2,myForm.tueM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.tueM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.tueH1,myForm.tueM1,myForm.tueH2,myForm.tueM2,legalTimeError)==false)
				return false;
			
			itemSize = itemSize + 1;
			if(myForm.tueH2.value == 24)
				items[itemSize] = "2" + "," + myForm.tueH1.value + "," + myForm.tueM1.value + "," + "3" + "," + "0" + "," + myForm.tueM2.value ;
			else
				items[itemSize] = "2" + "," + myForm.tueH1.value + "," + myForm.tueM1.value + "," + "2" + "," + myForm.tueH2.value + "," + myForm.tueM2.value ;
		}
	
		if(myForm.wed.checked){
			if(timeCheckHours(myForm.wedH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.wedM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.wedH2,myForm.wedM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.wedM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.wedH1,myForm.wedM1,myForm.wedH2,myForm.wedM2,legalTimeError)==false)
				return false;
			
			itemSize = itemSize + 1;
			if(myForm.wedH2.value == 24)
				items[itemSize] = "3" + "," + myForm.wedH1.value + "," + myForm.wedM1.value + "," + "4" + "," + "0" + "," + myForm.wedM2.value ;
			else
				items[itemSize] = "3" + "," + myForm.wedH1.value + "," + myForm.wedM1.value + "," + "3" + "," + myForm.wedH2.value + "," + myForm.wedM2.value ;

		}
	
		if(myForm.thu.checked){
			if(timeCheckHours(myForm.thuH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.thuM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.thuH2,myForm.thuM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.thuM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.thuH1,myForm.thuM1,myForm.thuH2,myForm.thuM2,legalTimeError)==false)
				return false;
			
			itemSize = itemSize + 1;
			if(myForm.thuH2.value == 24)
				items[itemSize] = "4" + "," + myForm.thuH1.value + "," + myForm.thuM1.value + "," + "5" + "," + "0" + "," + myForm.thuM2.value ;
			else
				items[itemSize] = "4" + "," + myForm.thuH1.value + "," + myForm.thuM1.value + "," + "4" + "," + myForm.thuH2.value + "," + myForm.thuM2.value ;
		}
	
		if(myForm.fri.checked){
			if(timeCheckHours(myForm.friH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.friM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.friH2,myForm.friM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.friM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.friH1,myForm.friM1,myForm.friH2,myForm.friM2,legalTimeError)==false)
				return false;
			
			itemSize = itemSize + 1;
			if(myForm.friH2.value == 24)
				items[itemSize] = "5" + "," + myForm.friH1.value + "," + myForm.friM1.value + "," + "6" + "," + "0" + "," + myForm.friM2.value ;
			else
				items[itemSize] = "5" + "," + myForm.friH1.value + "," + myForm.friM1.value + "," + "5" + "," + myForm.friH2.value + "," + myForm.friM2.value ;
		}
	
		if(myForm.sat.checked){
			if(timeCheckHours(myForm.satH1,hourError)==false)
				return false;
			if(timeCheckMins(myForm.satM1,minuteError)==false)
				return false;
			if(timeCheckHoursFull(myForm.satH2,myForm.satM2,hourError,fullHourError)==false)
				return false;
			if(timeCheckMins(myForm.satM2,minuteError)==false)
				return false;
			if(legalTimeCheck(myForm.satH1,myForm.satM1,myForm.satH2,myForm.satM2,legalTimeError)==false)
				return false;
			
			itemSize = itemSize + 1;
			if(myForm.satH2.value == 24)
				items[itemSize] = "6" + "," + myForm.satH1.value + "," + myForm.satM1.value + "," + "0" + "," + "0" + "," + myForm.satM2.value ;
			else
				items[itemSize] = "6" + "," + myForm.satH1.value + "," + myForm.satM1.value + "," + "6" + "," + myForm.satH2.value + "," + myForm.satM2.value ;
		}
	
		myForm.itemSize.value = itemSize;
	
		sendRecordItems(items,itemSize);
		if (items[1] != "")
			myForm.item01.value = items[1];
		if (items[2] != "")
			myForm.item02.value = items[2];
		if (items[3] != "")
			myForm.item03.value = items[3];
		if (items[4] != "")
			myForm.item04.value = items[4];
		if (items[5] != "")
			myForm.item05.value = items[5];
		if (items[6] != "")
			myForm.item06.value = items[6];
		if (items[7] != "")
			myForm.item07.value = items[7];	
	}

	send_submit("formPrivacy");
}

function changeMode(){
	if(document.form4.enableOSDBox.checked){
		document.form4.osdText.disabled=false;
		document.form4.timeStampBox.disabled=false;
	}
	else{
		document.form4.osdText.disabled=true;
		document.form4.timeStampBox.disabled=true;
	}
}

function changePrivacyMode()
{
	var myForm = document.formPrivacy;

	if (myForm.privacyScheduled.checked)
	{
		myForm.sun.disabled=false;
		myForm.sunH1.disabled=false;
		myForm.sunM1.disabled=false;
		myForm.sunH2.disabled=false;
		myForm.sunM2.disabled=false;
		myForm.mon.disabled=false;
		myForm.monH1.disabled=false;
		myForm.monM1.disabled=false;
		myForm.monH2.disabled=false;
		myForm.monM2.disabled=false;
		myForm.tue.disabled=false;
		myForm.tueH1.disabled=false;
		myForm.tueM1.disabled=false;
		myForm.tueH2.disabled=false;
		myForm.tueM2.disabled=false;
		myForm.wed.disabled=false;
		myForm.wedH1.disabled=false;
		myForm.wedM1.disabled=false;
		myForm.wedH2.disabled=false;
		myForm.wedM2.disabled=false;
		myForm.thu.disabled=false;
		myForm.thuH1.disabled=false;
		myForm.thuM1.disabled=false;
		myForm.thuH2.disabled=false;
		myForm.thuM2.disabled=false;
		myForm.fri.disabled=false;
		myForm.friH1.disabled=false;
		myForm.friM1.disabled=false;
		myForm.friH2.disabled=false;
		myForm.friM2.disabled=false;
		myForm.sat.disabled=false;
		myForm.satH1.disabled=false;
		myForm.satM1.disabled=false;
		myForm.satH2.disabled=false;
		myForm.satM2.disabled=false;
	}
	else{
		myForm.sun.disabled=true;
		myForm.sunH1.disabled=true;
		myForm.sunM1.disabled=true;
		myForm.sunH2.disabled=true;
		myForm.sunM2.disabled=true;
		myForm.mon.disabled=true;
		myForm.monH1.disabled=true;
		myForm.monM1.disabled=true;
		myForm.monH2.disabled=true;
		myForm.monM2.disabled=true;
		myForm.tue.disabled=true;
		myForm.tueH1.disabled=true;
		myForm.tueM1.disabled=true;
		myForm.tueH2.disabled=true;
		myForm.tueM2.disabled=true;
		myForm.wed.disabled=true;
		myForm.wedH1.disabled=true;
		myForm.wedM1.disabled=true;
		myForm.wedH2.disabled=true;
		myForm.wedM2.disabled=true;
		myForm.thu.disabled=true;
		myForm.thuH1.disabled=true;
		myForm.thuM1.disabled=true;
		myForm.thuH2.disabled=true;
		myForm.thuM2.disabled=true;
		myForm.fri.disabled=true;
		myForm.friH1.disabled=true;
		myForm.friM1.disabled=true;
		myForm.friH2.disabled=true;
		myForm.friM2.disabled=true;
		myForm.sat.disabled=true;
		myForm.satH1.disabled=true;
		myForm.satM1.disabled=true;
		myForm.satH2.disabled=true;
		myForm.satM2.disabled=true;
	}
}

function adminPassword(){
	var password = document.form1.password.value;
	var admConfirm = document.form1.admConfirm.value;
	
	if (checkAdminPass(adminPassError2)==false)
		return false;
	
	if (password != admConfirm){
		alert(adminPassError1);
		document.form1.admConfirm.select();
		return false;
	}
	
	if(count!=10)
		return false;

	send_submit("form1");
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var scheduleError = "<xsl:value-of select="root/lang/body/scheduleError" />";
var hourError =  "<xsl:value-of select="root/lang/body/hourError" />";
var minuteError = "<xsl:value-of select="root/lang/body/minuteError" />";
var fullHourError = "<xsl:value-of select="root/lang/body/fullHourError" />";
var legalTimeError = "<xsl:value-of select="root/lang/body/legalTimeError" />";
var adminPassError1 = "<xsl:value-of select="root/lang/body/adminPassError1" />";
var adminPassError2 = "<xsl:value-of select="root/lang/body/adminPassError2" />";
var maxUserError = "<xsl:value-of select="root/lang/body/maxUserError" />";
var userNameError1 = "<xsl:value-of select="root/lang/body/userNameError1" />";
var userNameError2 = "<xsl:value-of select="root/lang/body/userNameError2" />";
var userNameError3 = "<xsl:value-of select="root/lang/body/userNameError3" />";
var userNameError4 = "<xsl:value-of select="root/lang/body/userNameError4" />";
var userPassError1 = "<xsl:value-of select="root/lang/body/userPassError1" />";
var userPassError2 = "<xsl:value-of select="root/lang/body/userPassError2" />";
var PasswordMsg = "<xsl:value-of select="root/lang/body/PasswordMsg" />";

var userlist = new Array();
var i=0;
<xsl:for-each select="root/config/Users/user">
	userlist[i] = '<xsl:value-of select="name"/>';
	i++;
</xsl:for-each>

var maxUser=0;
function cgiInit(){
	if ('<xsl:value-of select="/root/config/Users/size" />' == '20')
		maxUser=20;
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == '0')
	{
		document.getElementById("calibrate").style.display="none";
	}

	if ('<xsl:value-of select="root/common/peripheral/privacy" />' != '0')
		document.getElementById("divPrivacy").style.display="";

	if ('<xsl:value-of select="/root/config/restart" />' != '')
		begin_count();
}
var count=10;
function begin_count(){
	window.setInterval("ShowRealTime()", 1000)
	document.getElementById("leavetime").innerHTML = count + " ";
}

function ShowRealTime(){
	count--;
	document.getElementById("leavetime").innerHTML = count + " ";
	if(count==0){
		count = 1;
		location.href='tools_admin.cgi';
	}
}

function addUser(){
	var password = document.form2.password.value;
	var confimPassword = document.form2.confimPassword.value;
	var user = document.form2.user.value;

	if (maxUser==20){
		alert(maxUserError);
		return false;
	}

	if (user == ""){
		alert(userNameError1);
		document.form2.user.select();
		return false;
	}

	if (checkAddUser(userNameError2,userPassError2)==false)
		return false;

	if (password != confimPassword){
		alert(userPassError1);
		document.form2.confimPassword.select();
		return false;
	}

	if(checkAddUsername(userlist,i,user,userNameError3,userNameError4) == false){
		document.form2.user.select();
		return false;
	}
	
	if(count!=10)
		return false;

	send_submit("form2");
}

function delUser(){
	if(count!=10)
		return false;

	send_submit("form3");
}
</script>
<script language="JavaScript" type="text/javascript">
var asciiError = "<xsl:value-of select="root/lang/body/asciiError" />";
var cameraNameError = "<xsl:value-of select="root/lang/body/cameraNameError" />";
var cameraNameError2 = "<xsl:value-of select="root/lang/body/cameraNameError2" />";

function initForm() 
{
	//checkbox
	if ('<xsl:value-of select="root/config/osd/enable" />' == '1')
		document.form4.enableOSDBox.checked=true;
	if ('<xsl:value-of select="root/config/osd/timeStamp" />' == '1')
		document.form4.timeStampBox.checked=true;

	//radio
	//type
	if ('<xsl:value-of select="root/config/system/silentLED" />' == '0')
		document.form4.ledNormal.checked=true;
	if ('<xsl:value-of select="root/config/system/silentLED" />' == '1')
		document.form4.ledOff.checked=true;

	changeMode();

	// init privacy
	var mode = '<xsl:value-of select="root/config/privacy/privacyMode" />';

	if (mode == "scheduled")
		document.formPrivacy.privacyScheduled.checked = true;
	else if (mode == "on")
		document.formPrivacy.privacyOn.checked = true;
	else
		document.formPrivacy.privacyOff.checked = true;

	changePrivacyMode();

	var countItem = 0;
	var splitDate;
	var itemData;
	var day;
	var sizeOfItem = '<xsl:value-of select="root/config/privacy/schedule/itemSize" />';
	var myForm = document.formPrivacy;
	//item01
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item01" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item02
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item02" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item03
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item03" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item04
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item04" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item05
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item05" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item06
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item06" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item07
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/privacy/schedule/item07" />";
		splitDate = itemData.split(",");
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
}	
function send_request(){
	
	if(document.form4.enableOSDBox.checked){
		osdText = document.getElementById("osdText");
	    if (osdText.value != ''){
			if(checkASCII(asciiError)==-1)
				return -1;
		}
	}
	
	if(checkDeviceName("cameraName",cameraNameError2) == false)
		return false;
		
	if(document.form4.cameraName.value == ""){
		alertAndSelect(document.form4.cameraName,cameraNameError);
		return false;
	}
	
	if(document.form4.enableOSDBox.checked)
		document.form4.enableOSD.value = "1";
	else
		document.form4.enableOSD.value = "0";

	if(document.form4.timeStampBox.checked)
		document.form4.timeStamp.value = "1";
	else
		document.form4.timeStamp.value = "0";

	send_submit("form4");
}
function sendCalibration(){
	var urlXML =  "http://" + window.location.hostname+ ":" + window.location.port +"/cgi/admin/calibration.cgi?calibration=true";
	var urlXSL = 'calibration.xsl';
	LoadXMLXSLTDoc(urlXML,urlXSL);
}
var xmlDoc;
var xslDoc;
function LoadXMLXSLTDoc(urlXML,urlXSL){
	xmlDoc=null;
	xslDoc=null;
	new net.ContentLoader(urlXML,onXMLLoad);
}
function onXMLLoad(){
	xmlDoc=this.req.responseXML;
	if(xmlDoc.getElementsByTagName('code')[0].firstChild.nodeValue == "calibrationOK")
		document.getElementById("calibrationMsg").style.display = "";
	else
	{
		document.getElementById("calibrationMsg").style.display = "none";
		alert("Calibration fail");
	}
}
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleMaintenance" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleMaintenance" /></title>
</xsl:if>

<style type="text/css">
<xsl:comment>
.style1 {font-size: 11px}
</xsl:comment>
</style>
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="cgiInit();initForm();">
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
			<td id="topnavoff"><a href="adv_wizard.cgi"><xsl:value-of select="root/lang/frame/advanced" /></a></td>
			<td id="topnavon"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavoff"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
			<td id="topnavoff"><a href="support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
		  <td id="sidenav_container" valign="top" width="125" align="left">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="sidenav_container">
							<div id="sidenav">
								<ul>
									<li>
										<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/deviceManagement" /></div>
									</li>
									<li>
										<div><a href="tools_default.cgi"><xsl:value-of select="root/lang/leftPanel/backupAndRestore" /></a></div>
									</li>
									<li>
										<div><a href="tools_firmware.cgi"><xsl:value-of select="root/lang/leftPanel/firmwareUpgrade" /></a></div>
									</li>
									<li>
										<div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
									</li>
								</ul>
							</div></td>			
					</tr>
				</table>			</td>

			<td valign="top" id="maincontent_container">			  <div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
			<div id="box_header"> 
						<h1><xsl:value-of select="root/lang/body/administratorSettings" /></h1>
            			<div align="left"><xsl:value-of select="root/lang/body/description1" />
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						<xsl:if test="/root/config/restart != ''">
							<br />
							<xsl:value-of select="root/lang/body/reboot1" />
							<span name="leavetime" id="leavetime"></span>
							<xsl:value-of select="root/lang/body/reboot2" />
        				</xsl:if>
						</font>
        			</xsl:if>
					<span id="calibrationMsg" style="display:none">
							<font color="#FF0000">
								<xsl:value-of select="root/lang/message/calibrationOK" />
							</font>
        		    </span>
                    <xsl:if test="/root/result/code = 'goSleepOK'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/goSleepOK" />
								</font>
        			</xsl:if>
			        <xsl:if test="/root/result/code = 'invalidParameters'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidParameters" />
						</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'exceedMaxUsers'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/exceedMaxUsers" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'userNotExist'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/userNotExist" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'tinydbError'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/tinydbError" />
						</font>
   				    </xsl:if>
                     </div>
			</div>
			<div class="box"> 
						<h2><xsl:value-of select="root/lang/body/administrator" /></h2>
						<form id="form1" name="form1" method="post" action="tools_admin.cgi">
							<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
									<td width="135"><xsl:value-of select="root/lang/body/newPassword" /></td>
									<td colspan="2" width="390">
									  <input type="hidden" id="action" name="action" value="set" />
									  <input type="hidden" id="user" name="user" value="admin" />
									  <input type="password" id="password" name="password" size="30" maxlength="30" />&nbsp;
									  <font color="#FF0000"><xsl:value-of select="root/lang/body/PasswordMsg" /></font>
</td>
								</tr>
								<tr>
									<td><xsl:value-of select="root/lang/body/confirmPassword" /></td>
									<td colspan="2">
									  <input type="password" id="admConfirm" name="admConfirm" size="30" maxlength="30" />
									  <input name="button22" type="button" onclick="adminPassword()" value="{root/lang/body/save}" />
								  </td>
								</tr>														
					  </table>
					  </form>
			  </div>
			  <div class="box"> 
						<h2><xsl:value-of select="root/lang/body/addUser" /></h2>
						<form id="form2" name="form2" method="post" action="tools_admin.cgi">
						<table cellpadding="1" cellspacing="1" border="0" width="525">
						      <tr>
                                <td width="135"><xsl:value-of select="root/lang/body/userName" /></td>
                                <td colspan="2">
								 <input type="hidden" id="action" name="action" value="set" />
                                  <input type="text" id="user" name="user" size="30" maxlength="30" />&nbsp;                                  <font color="#FF0000"><xsl:value-of select="root/lang/body/PasswordMsg" /></font></td>
				          </tr>
						      <tr>
                                <td><xsl:value-of select="root/lang/body/newPassword" /></td>
						        <td colspan="2">
						          <input type="password" id="password" name="password" size="30" maxlength="30" />&nbsp;
								  <font color="#FF0000"><xsl:value-of select="root/lang/body/PasswordMsg" /></font>						        </td>
					      </tr>
						      <tr>
                                <td><xsl:value-of select="root/lang/body/confirmPassword" /></td>
						        <td width="126">
						          <input type="password" id="confimPassword" name="confimPassword" size="30" maxlength="30" />						        </td>
				                <td width="255">&nbsp;</td>
					      </tr>
						      <tr>
                                <td align="right">							    </td>
						        <td width="146"><font face="Arial" size="2">
<!--						          <input onclick="addUser()" type="button" value="Add" name="Submit" />-->
								  <input type="button" value="{root/lang/body/add}" name="Submit" onclick="addUser()" />
						        </font><font color="#FF0000"><xsl:value-of select="root/lang/body/maxUser" /></font></td>
				                <td width="235">&nbsp;</td>
					      </tr>
                </table>
				</form>
			  </div>
					<div class="box"> 
						<h2><strong><xsl:value-of select="root/lang/body/managerUser" /></strong></h2>
						<form id="form3" name="form3" method="post" action="tools_admin.cgi">
						<table cellpadding="1" cellspacing="1" border="0" width="525">
                          <tr>
                            <td width="135"><xsl:value-of select="root/lang/body/userName" /></td>
                            <td width="125">
                              <select name="user" id="user">
                                <option value="0" ><xsl:value-of select="root/lang/body/userList" /></option>
								<xsl:for-each select="root/config/Users/user">
								<option value="{name}"><xsl:value-of select="name"/></option>
								</xsl:for-each>
                              </select>
                            </td>
                            <td width="265" align="right"><div align="left">
							  <input type="hidden" id="action" name="action" value="del" />
                              <input type="button" onclick="delUser()" value="{root/lang/body/delete}" name="btnDelete" />
							  <!--<input onclick="deleteUser()" type="button" value="{root/lang/body/edit}" name="btnDelete" />-->
                            </div></td>
                          </tr>
                      </table>
					  </form>
			  </div>
                 
                      <div class="box">
                        <h2><xsl:value-of select="root/lang/body/devideSetting" /></h2>
                        <table width="525" border="0" cellpadding="2" cellspacing="2">
                           <form id="form4" name="form4" method="post" action="tools_admin.cgi">
                          <tr>
                            <td  colspan="2"><xsl:value-of select="root/lang/body/cameraName" /></td>
                            <td><input maxlength="36" size="30" value="{root/config/system/cameraName}" name="cameraName" id="cameraName"/>&nbsp;
							<font color="#FF0000"><xsl:value-of select="root/lang/body/cameraMsg" /></font></td>
                          </tr>
                          <tr>
                            <td colspan="3"><input type="checkbox" name="enableOSDBox" id="enableOSDBox" onclick="changeMode()" />
                                <xsl:value-of select="root/lang/body/enableOSD" />
                                <input type="hidden" maxlength="1" size="1" value="0" name="enableOSD" id="enableOSD" /></td>
                          </tr>
                          <tr>
                            <td width="50">&nbsp;</td>
                            <td width="75"><xsl:value-of select="root/lang/body/label" /></td>
                            <td width="400"><input maxlength="30" size="30" value="{root/config/osd/osdText}" name="osdText" id="osdText"/>
                              &nbsp;<font color="#FF0000"><xsl:value-of select="root/lang/body/PasswordMsg" /></font></td>
                          </tr>
                          <tr>
                            <td >&nbsp;</td>
                            <td><xsl:value-of select="root/lang/body/timeStamp" /></td>
                            <td><input type="checkbox" name="timeStampBox" id="timeStampBox" />
                                <input type="hidden" maxlength="1" size="1" value="0" name="timeStamp" id="timeStamp" /></td>
                          </tr>
                          <tr>
                            <td  colspan="2"><xsl:value-of select="root/lang/body/ledControl" /></td>
                            <td><input type="radio" value="0" name="silentLED" id="ledNormal"/>
                                <xsl:value-of select="root/lang/body/ledOn" />
                                <input type="radio" value="1" name="silentLED" id="ledOff" />
                                <xsl:value-of select="root/lang/body/ledOff" /></td>
                          </tr>
                          <tr>
                            <td  colspan="2">&nbsp;</td>
                            <td><input name="button" type="button" class="button_submit" value="{root/lang/body/save}" onclick="send_request()" />
                                <input type="hidden" id="action" name="action" value="system" />
                            </td>
                          </tr>

						 </form>
                          <tr id="calibrate" name="calibrate">
                            <td colspan="2"><xsl:value-of select="root/lang/body/calibrateText" /></td>
							<td><input type="submit" value="{root/lang/body/calibrate}" name="submit5" onclick="sendCalibration()" />
							</td>
                          </tr>
                        </table>
                      </div>

			<div class="box" id="divPrivacy" style="display:none">
			  <h2><strong><xsl:value-of select="root/lang/body/privacyText" /></strong></h2>
			  <form id="formPrivacy" name="formPrivacy" method="post" action="tools_admin.cgi">
			    <input type="hidden" id="action" name="action" value="privacy" />
			    <input name="itemSize" id="itemSize" type="hidden" size="1" value="0" />
			    <input name="item01" id="item01" type="hidden" size="11" value="" />
			    <input name="item02" id="item02" type="hidden" size="11" value="" />
			    <input name="item03" id="item03" type="hidden" size="11" value="" />
			    <input name="item04" id="item04" type="hidden" size="11" value="" />
			    <input name="item05" id="item05" type="hidden" size="11" value="" />
			    <input name="item06" id="item06" type="hidden" size="11" value="" />
			    <input name="item07" id="item07" type="hidden" size="11" value="" />
			    <table cellpadding="1" cellspacing="1" border="0" width="525">
			      <tr>
				<td width="100"> <input type="radio" value="on" name="privacyMode" id="privacyOn" onclick="changePrivacyMode()" />
				
				<xsl:value-of select="root/lang/body/privacyOn" /></td>
				<td width="100">&nbsp; </td>
				<td width="50">&nbsp; </td>
				<td width="50">&nbsp; </td>
				<td width="50">&nbsp; </td>
				<td width="50">&nbsp; </td>
				<td width="50">&nbsp; </td>
				<td width="100">&nbsp; </td>
				<td width="50">&nbsp; </td>
			      </tr>
			      <tr>
				<td> <input type="radio" value="off" name="privacyMode" id="privacyOff" onclick="changePrivacyMode()" />
				<xsl:value-of select="root/lang/body/privacyOff" /></td>
				<td> </td>
				<td align="right"> </td>
			      </tr>
			      <tr>
				<td> <input type="radio" value="scheduled" name="privacyMode" id="privacyScheduled" onclick="changePrivacyMode()" />
				<xsl:value-of select="root/lang/body/scheduled" /></td>
				<td> </td>
				<td align="right"> </td>
			      </tr>
			      <tr id="recHide3">
				<td >&nbsp;</td>
				<td width="55" ></td>
				<td width="25" ></td>
				<td width="40" ><xsl:value-of select="root/lang/body/hour" /></td>
				<td width="45" ><xsl:value-of select="root/lang/body/min" /></td>
				<td width="25" >&nbsp;</td>
				<td width="42" ><xsl:value-of select="root/lang/body/hour" /></td>
				<td width="120" ><xsl:value-of select="root/lang/body/min" /></td>
			      </tr>
			      <tr id="recHide4">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="sun" id="sun" />
				    <xsl:value-of select="root/lang/body/sun" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="sunH1" id="sunH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="sunM1" id="sunM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="sunH2" id="sunH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="sunM2" id="sunM2" /></td>
			      </tr>
			      <tr id="recHide5">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="mon" id="mon" />
				    <xsl:value-of select="root/lang/body/mon" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="monH1" id="monH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="monM1" id="monM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="monH2" id="monH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="monM2" id="monM2" /></td>
			      </tr>
			      <tr id="recHide6">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="tue" id="tue" />
				    <xsl:value-of select="root/lang/body/tue" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="tueH1" id="tueH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="tueM1" id="tueM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="tueH2" id="tueH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="tueM2" id="tueM2" /></td>
			      </tr>
			      <tr id="recHide7">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="wed" id="wed" />
				    <xsl:value-of select="root/lang/body/wed" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="wedH1" id="wedH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="wedM1" id="wedM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="wedH2" id="wedH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="wedM2" id="wedM2" /></td>
			      </tr>
			      <tr id="recHide8">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="thu" id="thu" />
				    <xsl:value-of select="root/lang/body/thu" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="thuH1" id="thuH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="thuM1" id="thuM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="thuH2" id="thuH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="thuM2" id="thuM2" /></td>
			      </tr>
			      <tr id="recHide9">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="fri" id="fri" />
				    <xsl:value-of select="root/lang/body/fri" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="friH1" id="friH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="friM1" id="friM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="friH2" id="friH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="friM2" id="friM2" /></td>
			      </tr>
			      <tr id="recHide10">
				<td >&nbsp;</td>
				<td ><input type="checkbox" name="sat" id="sat" />
				    <xsl:value-of select="root/lang/body/sat" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="satH1" id="satH1" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="satM1" id="satM1" /></td>
				<td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="satH2" id="satH2" />
				  :</td>
				<td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="satM2" id="satM2" /></td>
			      </tr>
			      <tr><td colspan="9">&nbsp; </td> </tr>
			      <tr><td colspan="9" align="center">
				<input name="button" type="button" class="button_submit" value="{root/lang/body/save}" onclick="submit_privacy()" />
				    </td> </tr>
			    </table>
			  </form>
			</div>
                  
                   <table cellpadding="1" cellspacing="1" border="0" width="525">

                   </table>
					</div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
							<strong><xsl:value-of select="root/lang/hint/helpfulHints" /></strong><br />
							<br />
					        <xsl:value-of select="root/lang/hint/description1" /><br /><br />
							<xsl:value-of select="root/lang/hint/description2" />
					  </td>
					</tr>
				</table>			</td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="../images/wireless_bottom.gif" width="114" height="35" /></td>
			<td width="10">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
<br />
<div align="center"><xsl:value-of select="root/lang/frame/copyright1" /> &copy; <xsl:value-of select="root/lang/frame/copyright2" /></div>
<br />
</body>
</html>
</xsl:template>
</xsl:stylesheet>
