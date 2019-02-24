<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="motWizard.xml" --><!DOCTYPE xsl:stylesheet  [
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
<![CDATA[
var region = new Array();
var sense = new Array();
var oldRegion = 0;
var newRegion = 0;

function send_request(){
//	newRegion = document.form1.regions.value;
	newRegion = 0;

	if(ieFlag == "true"){
		getMotionData(newRegion);
		sense[newRegion] = document.form1.sense.value;
		document.form1.region1.value = region[0];
		document.form1.sense1.value = sense[0];
//		document.form1.region2.value = region[1];
//		document.form1.sense2.value = sense[1];
//		document.form1.region3.value = region[2];
//		document.form1.sense3.value = sense[2];
	}
	else{
		document.form1.region1.value = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
		document.form1.sense1.value = document.form1.sense.value;
//		document.form1.region2.value = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
//		document.form1.sense2.value = 0;
//		document.form1.region3.value = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
//		document.form1.sense3.value = 0;
	}
	
	if(document.form1.enable_mon.checked)
		document.form1.enable.value = 1;
	if(document.form1.pirBox.checked)
		document.form1.pirEnable.value = 1;
	if (document.form1.smtpEnable1Box.checked)
		document.form1.smtpEnable1.value = 1;
	if (document.form1.ftpEnable1Box.checked)
		document.form1.ftpEnable1.value = 1;
	if (document.form1.passive1Box.checked)
		document.form1.passive1.value = 1;

	send_submit("form1");
}

function backStep(index){
	if(index==1){
//		if(ieFlag=="true")
//			releaseForm();
		document.getElementById("step0").style.display="";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
	}
	if(index==2){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
//		if(ieFlag=="true"){
//			InitActiveX();
//		}
	}
	if(index==3){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="";
		document.getElementById("step3").style.display="none";
	}
}

var intervalID;
function nextStep(index){
	if(index==0){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		if(ieFlag=="true"){
			intervalID=window.setInterval("startActiveX()", 500)
		}
	}
	if(index==1){
		if(checkSense()==-1){
			document.form1.sense.select();
			return false;
		}
		if(ieFlag == "true")
		{
			if(document.form1.enable_mon.checked)
			{
				getMotionData(0);
				document.form1.region1.value = region[0];
				if( document.form1.region1.value == "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
				{	
					alert(areaError);
					return false;
				}
			}
		}
//		if(ieFlag=="true")
//			releaseForm();
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="";
		document.getElementById("step3").style.display="none";
	}
	if(index==2){
		if (notifyCheck() == false)
			return false;
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="";

		if (document.form1.enable_mon.checked)
			document.getElementById("result1").innerHTML = enable;
		else
			document.getElementById("result1").innerHTML = disable;

		if (document.form1.smtpEnable1Box.checked){
			if (document.form1.ftpEnable1Box.checked)
				document.getElementById("result2").innerHTML = doubleNotify;
			else
				document.getElementById("result2").innerHTML = emailNotify;
		}
		else{
			if (document.form1.ftpEnable1Box.checked)
				document.getElementById("result2").innerHTML = ftpNotify;
			else
				document.getElementById("result2").innerHTML = notNotify;
		}
	}
}

function startActiveX(){
	InitActiveX();
	clearInterval(intervalID);
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
		alert(numberError)
		return -1;
	}
	if(checkSenseRange(sense) == false)
	{
		alert(rangeError);
		return -1;
	}
	if(range(sense,0,100) == false){
		alert(rangeError)
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

function notifyCheck(){
	//SMTP(Mail) Server settings
	var smtpServer1 = get_by_id("smtpServer1").value
	var smtpUser1 = get_by_id("smtpUser1").value
	var smtpPass1 = get_by_id("smtpPass1").value
	var receiver1 = get_by_id("receiver1").value
	var sender1 = get_by_id("sender1").value
	//FTP Server settings
	var ftpServer1 = get_by_id("ftpServer1").value
	var ftpUser1 = get_by_id("ftpUser1").value
	var ftpPass1 = get_by_id("ftpPass1").value
	var fixFile1 = get_by_id("fixFile1").value

	//SMTP(Mail) Server settings
	if (document.form1.smtpEnable1Box.checked){
		if (smtpUser1 == ""){
			alert(firAccountError);
			document.form1.smtpUser1.select();
	   	        return false;
		}
		if(checkName("smtpUser1",mailNameError)==false)
			return false;
		if(checkName("smtpPass1",mailNameError)==false)
			return false;
		if(checkServer("smtpServer1",firSmtpError)==false)
			return false;
		if (sender1 == ""){
			alert(firSenderError);
			document.form1.sender1.select();
	   	        return false;
		}
		if(isEMailAddr(sender1)==false){
	        alert(firSenderMailError);
			document.form1.sender1.select();
			return false;
		}
		if (receiver1 == ""){
			alert(firRecipientError);
			document.form1.receiver1.select();
	   	        return false;
		}
		if(isEMailAddr(receiver1)==false){
	        alert(firRecipientMailError);
			document.form1.receiver1.select();
			return false;
		}
		if(checkport("smtpPort1",firSmtpName)==false){
			document.form1.smtpPort1.select();
			return false;
		}
	}
		
	//FTP Server settings
	if (document.form1.ftpEnable1Box.checked){
		if(checkName("ftpUser1",ftpNameError)==false)
			return false;
		if(checkName("ftpPass1",ftpNameError)==false)
			return false;
		if(checkServer("ftpServer1",firFtpServerError)==false)
			return false;
		if(checkFolder("folder1",firFolderError)==false)
			return false;
		if(fixFile1 != ""){
			if(checkFixFilename("fixFile1",firFixFilenameError)==false){
				return false;
			}
		}
		if(checkport("ftpPort1",firFtpError)==false){
			document.form1.ftpPort1.select();
			return false;
		}
		if(ftpIntervalCheck(document.form1.ftpInterval,intervalError)==false)//lulu 20090302
			return false;
	}
}

function checkport(which_port,num){
	var port=get_by_id(which_port).value;
	
	if (port == ""){
		alert(num + PortError1);
		return false;
	}
	if (isNaN(port)){
		alert(num + PortError2);
		return false;
	}
	if(isPosInt(port)==false || range(port,1,65535)==false){
		alert(num + PortError3);
		return false;
	}
	return true;
}

function changeMode1(){
	if (document.form1.smtpEnable1Box.checked){
		document.form1.smtpServer1.disabled=false;
		document.form1.smtpPort1.disabled=false;
		document.form1.smtpUser1.disabled=false;
		document.form1.smtpPass1.disabled=false;
		document.form1.receiver1.disabled=false;
		document.form1.sender1.disabled=false;
//		document.form1.test1.disabled=false;
	}
	else{
		document.form1.smtpServer1.disabled=true;
		document.form1.smtpPort1.disabled=true;
		document.form1.smtpUser1.disabled=true;
		document.form1.smtpPass1.disabled=true;
		document.form1.receiver1.disabled=true;
		document.form1.sender1.disabled=true;
//		document.form1.test1.disabled=true;
	}
}

function changeMode3(){
	if (document.form1.ftpEnable1Box.checked){
		document.form1.passive1Box.disabled=false;
		document.form1.ftpServer1.disabled=false;
		document.form1.ftpPort1.disabled=false;
		document.form1.ftpUser1.disabled=false;
		document.form1.ftpPass1.disabled=false;
		document.form1.folder1.disabled=false;
		document.form1.fixFile1.disabled=false;
		document.form1.ftpInterval.disabled=false;//lulu 20090302
	}
	else{
		document.form1.passive1Box.disabled=true;
		document.form1.ftpServer1.disabled=true;
		document.form1.ftpPort1.disabled=true;
		document.form1.ftpUser1.disabled=true;
		document.form1.ftpPass1.disabled=true;
		document.form1.folder1.disabled=true;
		document.form1.fixFile1.disabled=true;
		document.form1.ftpInterval.disabled=true;//lulu 20090302
	}
}

function isEMailAddr(str) {
//    var str = elem.value;
    var re = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (!str.match(re)) {
//        alert("Verify the email address format.");
        return false;
    } else {
        return true;
    }
}

]]>
</script>
<script language="JavaScript" type="text/javascript">
var numberError = "<xsl:value-of select="root/lang/body/numberError" />";
var rangeError = "<xsl:value-of select="root/lang/body/rangeError" />";
var areaError = "<xsl:value-of select="root/lang/body/areaError" />"
var ieFlag = "<xsl:value-of select="root/config/ie " />";

var mailNameError = "<xsl:value-of select="root/lang/body/mailNameError" />";
var ftpNameError = "<xsl:value-of select="root/lang/body/ftpNameError" />";
var firSmtpError = "<xsl:value-of select="root/lang/body/firSmtpError" />";
var firSmtpName = "<xsl:value-of select="root/lang/body/firSmtpName" />";
var PortError1 = "<xsl:value-of select="root/lang/body/PortError1" />";
var PortError2 = "<xsl:value-of select="root/lang/body/PortError2" />";
var PortError3 = "<xsl:value-of select="root/lang/body/PortError3" />";
var firAccountError = "<xsl:value-of select="root/lang/body/firAccountError" />";
var firRecipientMailError = "<xsl:value-of select="root/lang/body/firRecipientMailError" />";
var firRecipientError = "<xsl:value-of select="root/lang/body/firRecipientError" />";
var firSenderMailError = "<xsl:value-of select="root/lang/body/firSenderMailError" />";
var firSenderError = "<xsl:value-of select="root/lang/body/firSenderError" />";

var firFtpServerError = "<xsl:value-of select="root/lang/body/firFtpServerError" />";
var firFtpError = "<xsl:value-of select="root/lang/body/firFtpError" />";
var firFolderError = "<xsl:value-of select="root/lang/body/firFolderError" />";
var firFixFilenameError = "<xsl:value-of select="root/lang/body/firFixFilenameError" />";
var intervalError = "<xsl:value-of select="root/lang/body/intervalError" />";//lulu 20090302

var enable = "<xsl:value-of select="root/lang/body/enable" />";
var disable = "<xsl:value-of select="root/lang/body/disable" />";
var notNotify = "<xsl:value-of select="root/lang/body/notNotify" />";
var emailNotify = "<xsl:value-of select="root/lang/body/emailNotification" />";
var ftpNotify = "<xsl:value-of select="root/lang/body/ftpNotification" />";
var doubleNotify = "<xsl:value-of select="root/lang/body/doubleNotification" />";

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
	dcscontrol1.MDWidth = 640;
	dcscontrol1.MDHeight = 480;
	dcscontrol1.MBCX = 16;
	dcscontrol1.MBCY = 16;
	dcscontrol1.ShowMotionDetectionInput();
	dcscontrol1.play();	
	dcscontrol1.SetMotionDetectionData(region[0],0);
	dcscontrol1.StopLiveStreamIn(2);
}

function ReleaseActiveX()
{
  var dcscontrol1 = document.getElementById("dcscontrol1");
  dcscontrol1.Stop();
}
function initForm() 
{
	if ('<xsl:value-of select="/root/result/code" />' == 'ok'){
//		begin_count();
		window.location='adv_wizard.cgi';
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="";
		document.getElementById("hideResult").style.display="none";
	}

	if ('<xsl:value-of select="root/common/peripheral/PIR " />' == '1'){
		document.getElementById("hiddenPIR").style.display=""
		if ('<xsl:value-of select="root/config/pir/enable " />' == '1')
			document.form1.pirBox.checked=true;
	}
	
	document.form1.hostname.value = "http://" + window.location.hostname;
	if ('<xsl:value-of select="root/config/motionDetection/enable" />' == '1')
		document.form1.enable_mon.checked=true;
		
	region[0] = "<xsl:value-of select="root/config/motionDetection/region1/bitmap" />";
	sense[0] = "<xsl:value-of select="root/config/motionDetection/region1/sense" />";
	region[1] = "<xsl:value-of select="root/config/motionDetection/region2/bitmap" />";
	sense[1] = "<xsl:value-of select="root/config/motionDetection/region2/sense" />";
	region[2] = "<xsl:value-of select="root/config/motionDetection/region3/bitmap" />";
	sense[2] = "<xsl:value-of select="root/config/motionDetection/region3/sense" />";

	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
//		InitActiveX();
	}
	else{
		document.getElementById("showApplet").style.display="none";
		document.getElementById("moText").style.display="none";
		document.getElementById("normal").style.display="none";
		document.getElementById("showUnselect").style.display="none";
		document.getElementById("showButton").style.display="none";
		document.getElementById("showFirefoxText").style.display="";
	}

	//checkbox
	if ('<xsl:value-of select="root/config/mail/smtpEnable1" />' == 'on')
		document.form1.smtpEnable1Box.checked=true;
	if ('<xsl:value-of select="root/config/ftp/ftpEnable1" />' == 'on')
		document.form1.ftpEnable1Box.checked=true;
	if ('<xsl:value-of select="root/config/ftp/passive1" />' == 'on')
		document.form1.passive1Box.checked=true;

	if (ieFlag == 'true'){
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
						//alert("use 1 cz fps");
					}

				}else if (numcheck(num-bps)==0){
					activeXSize.ProfileID = 1;
					width=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />');
					bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/bps" />');
					fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/fps" />');
					//alert("use 1 cz bps");
				}

			} else if (numcheck(num-width)==0){
				activeXSize.ProfileID = 1;
				width=parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/width" />');
				fps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/fps" />');
				bps = parseInt('<xsl:value-of select="/root/config/profiles/profile[1]/bps" />');
				//alert("use 1 cz bps");
			}

		}
	}
	changeMode1();
	changeMode3();
}

function releaseForm(){
	if ('<xsl:value-of select="root/config/ie " />' == 'true'){
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
	<table id="toppic_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="../images/dlink.gif" width="836" height="92" /></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF" style="display:none">
		<tr id="topnav_container">
			<td><img src="../images/dcs_2102.gif" width="129" height="28" /></td>
			<td id="topnavoff"><a href="../index.cgi"><xsl:value-of select="root/lang/frame/home" /></a></td>
			<td id="topnavon"><a href="adv_lan.cgi"><xsl:value-of select="root/lang/frame/advanced" /></a></td>
			<td id="topnavoff"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavoff"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
			<td id="topnavoff"><a href="support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
	<tr><td>
	<table border="0" cellpadding="2" cellspacing="0" width="830" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
		  <td id="" valign="top" width="125" align="left">
				<table cellspacing="0" cellpadding="0" border="0" style="display:none">
                  <tbody>
                    <tr>
                      <td id="sidenav_container">
                        <div id="sidenav">
                          <ul>
							<li>
                              <div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/wizard" /></div>
                            </li>
                            <li>
                              <div><a href="adv_lan.cgi"><xsl:value-of select="root/lang/leftPanel/networkSettings" /></a></div>
                            </li>
						    <li>
                              <div><a href="adv_ddns.cgi"><xsl:value-of select="root/lang/leftPanel/ddns" /></a></div>
                            </li>
						    <li id="wirelessShow" name="wirelessShow">
                              <div><a href="adv_wireless.cgi"><xsl:value-of select="root/lang/leftPanel/sitesurvey" /></a></div>
                            </li>
                            <li>
                              <div><a href="adv_mail_ftp.cgi"><xsl:value-of select="root/lang/leftPanel/mailFtp" /></a></div>
                            </li>
						    <li>
                              <div><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/leftPanel/audioVideo" /></a></div>
                            </li>
						    <li>
                              <div><a href="adv_image.cgi"><xsl:value-of select="root/lang/leftPanel/imageSettings" /></a></div>
                            </li>
							<li>
                              <div><a href="mot_detect.cgi"><xsl:value-of select="root/lang/leftPanel/motionDetection" /></a></div>
                            </li>
							<li id="camControlShow" name="camControlShow">
                              <div><a href="cam_control.cgi"><xsl:value-of select="root/lang/leftPanel/cameraControl" /></a></div>
                            </li>
							<li>
                              <div><a href="recorder.cgi"><xsl:value-of select="root/lang/leftPanel/recording" /></a></div>
                            </li>
							<li>
                              <div><a href="adv_snapshot_cont.cgi"><xsl:value-of select="root/lang/leftPanel/snapshot" /></a></div>
                            </li>
							<li>
                              <div><a href="tools_system.cgi"><xsl:value-of select="root/lang/leftPanel/system" /></a></div>
                            </li>
                          </ul>
                      </div></td>
                    </tr>
                  </tbody>
              </table></td>
                <form id="form1" name="form1" method="post" action="motWizard.cgi">
			<td valign="top" id="maincontent_container" height="500">
			<p>&nbsp;</p>
			  <div id="maincontent">
			  	<div id="step0">
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/welcome" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /><br /><br />
					<table cellspacing="1" cellpadding="1" width="300" border="0" align="center">
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step1" /><xsl:value-of select="root/lang/body/note1" /></li></td>
					  </tr>
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step2" /><xsl:value-of select="root/lang/body/note2" /></li>					</td>
					  </tr>
					</table>
					<br />
					<div align="center">
					<input name="button1" type="button" class="button_submit" value="{root/lang/body/back}" onclick="window.location.href='adv_wizard.cgi'" />
					<input name="button2" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(0)" />
					<input name="button3" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                </div>
				</div>
			  	<div id="step1" style="display:none">
                  <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step1" /><xsl:value-of select="root/lang/body/note1" /></h1>
                    <xsl:value-of select="root/lang/body/description2" /><br /><br />
					<table width="500" border="0" cellpadding="0" cellspacing="0" align="center">
			  	<tr>
					<tr id="showFirefoxText" style="display:none">
					<td colspan="2">
	                    <font color="#FF0000"><xsl:value-of select="root/lang/body/showFirefoxText" /></font>
					</td>
				</tr>
					<td colspan="2">
					<div name="hiddenPIR" id="hiddenPIR" style="display:none">
	                    <input type="checkbox" id="pirBox" name="pirBox" />
	                    <xsl:value-of select="root/lang/body/enablePIR" />
	                    <input name="pirEnable" id="pirEnable" type="hidden" size="3" value="0" />
					</div>					</td>
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
							  <OBJECT id="sensor" CLASSID="CLSID:98EDD118-9973-4108-9B08-D94032306E14" style="display:none"></OBJECT>
<!--                            </xsl:if>-->
					<!--<img src="camctrl.JPG" alt="&lt;empty&gt;" width="362" height="272" />--></td>
                  <td height="50">&nbsp;</td>
                </tr>
<!--
                <tr>
                  <td height="26" colspan="2"><xsl:value-of select="root/lang/body/region" /></td>
                </tr>
                <tr>
                  <td height="21" colspan="2">
				  		<select name="regions" id="regions" onchange="return changeRegion()" >
                              <option value="0" selected="selected"><xsl:value-of select="root/lang/body/region1" /></option>
                              <option value="1"><xsl:value-of select="root/lang/body/region2" /></option>
                              <option value="2"><xsl:value-of select="root/lang/body/region3" /></option>
                        </select>
				  </td>
                </tr>
-->
                <tr>
                  <td ><strong><xsl:value-of select="root/lang/body/sense" /></strong></td>
                </tr>
                <tr>
                  <td><div align="left">
                    <input type="text" name="sense" id="sense" maxlength="3" size="3" value="{root/config/motionDetection/region1/sense}" />&nbsp;0~100%
                  </div></td>
                </tr>
                <tr id="moText" name="moText">
                  <td><strong><xsl:value-of select="root/lang/body/drawingMode" /></strong></td>
                </tr>
                <tr id="normal" name="normal">
                  <td>&nbsp;&nbsp;<input type="radio" value="0" name="dwMode" id="drawMotion" onclick="SetState();" checked="checked" />
                    <xsl:value-of select="root/lang/body/drawMotion" /></td>
                </tr>
                <tr id="showUnselect" name="showUnselect">
                  <td>&nbsp;&nbsp;<input type="radio" value="1" name="dwMode" id="unselectMode" onclick="SetState();" />
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
                  <td><input name="Submit22" type="button" class="style1" value="{root/lang/body/clear}" onclick="clearMotion()" /></td>
                </tr>
                <tr>
                  <td >
				  <input name="hostname" id="hostname" type="hidden" size="30" value="hostname" />
				  <input name="region1" id="region1" type="hidden" value="hostname" />
				  <input name="sense1" id="sense1" type="hidden" value="hostname" />				  </td>
                </tr>
              </table>
					<br />
					<div align="center">
						<input name="button4" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(1)" />
						<input name="button5" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(1)" />
						<input name="button6" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                </div>
				</div>
			  	<div id="step2" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step2" /><xsl:value-of select="root/lang/body/note2" /></h1>
			        <xsl:value-of select="root/lang/body/description3" /><br /><br />
					<table cellspacing="1" cellpadding="2" width="380" border="0" align="center">
                      <tbody>
                        <tr>
                          <td width="180"><xsl:value-of select="root/lang/body/mailEnable" /></td>
                          <td width="200"><label>
                          <input type="checkbox" name="smtpEnable1Box" id="smtpEnable1Box" onclick="changeMode1()" />
						  <input name="smtpEnable1" id="smtpEnable1" type="hidden" size="1" value="0" />
                          </label></td>
                        </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/userName" /></td>
                          <td><input type="text" maxlength="60" size="40" value="{root/config/mail/smtpUser1}" name="smtpUser1" id="smtpUser1" /></td>
                        </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/password" /></td>
                          <td><input type="password" maxlength="60" size="40" value="{root/config/mail/smtpPass1}" name="smtpPass1" id="smtpPass1" /></td>
                        </tr>
                        <tr>
                          <td width="180"><xsl:value-of select="root/lang/body/mailServer" /></td>
                          <td width="334"><label>
							<input type="text" maxlength="60" size="40" value="{root/config/mail/smtpServer1}" name="smtpServer1" id="smtpServer1" />
                          </label></td>
                        </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/senderAddress" /></td>
                          <td><input type="text" maxlength="60" size="40" value="{root/config/mail/sender1}" name="sender1" id="sender1" /></td>
                        </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/recipientAddress" /></td>
                          <td><input type="text" maxlength="60" size="40" value="{root/config/mail/receiver1}" name="receiver1" id="receiver1" /></td>
                        </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/port" /></td>
                          <td><input maxlength="5" size="5" value="{root/config/mail/smtpPort1}" name="smtpPort1" id="smtpPort1" />
						  &nbsp;<xsl:value-of select="root/lang/body/portRange" />
						  </td>
                        </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/ftpEnable" /></td>
                        <td><input type="checkbox" name="ftpEnable1Box" id="ftpEnable1Box" onclick="changeMode3()" />
						<input name="ftpEnable1" id="ftpEnable1" type="hidden" size="1" value="0" /></td>
                      </tr>
                        <tr>
                          <td><xsl:value-of select="root/lang/body/userName" /></td>
                        <td><input type="text" maxlength="30" size="40" value="{root/config/ftp/ftpUser1}" name="ftpUser1" id="ftpUser1" /></td>
                      </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/password" /></td>
                        <td><input type="password" maxlength="30" size="40" value="{root/config/ftp/ftpPass1}" name="ftpPass1" id="ftpPass1" /></td>
                      </tr>
                      <tr>
                        <td width="180"><xsl:value-of select="root/lang/body/hostName" /></td>
                        <td width="334"><input type="text" maxlength="60" size="40" value="{root/config/ftp/ftpServer1}" name="ftpServer1" id="ftpServer1" /></td>
                      </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/path" /></td>
                        <td><input type="text" maxlength="30" size="40" value="{root/config/ftp/folder1}" name="folder1" id="folder1" /></td>
                      </tr>

                      <tr>
                        <td><xsl:value-of select="root/lang/body/prefixFileName" /></td>
                        <td><input type="text" maxlength="30" size="40" value="{root/config/ftp/fixFile1}" name="fixFile1" id="fixFile1" /></td>
                      </tr>
                      <tr>
                        <td><xsl:value-of select="root/lang/body/port" /></td>
                        <td>
						<input maxlength="5" size="5" value="{root/config/ftp/ftpPort1}" name="ftpPort1" id="ftpPort1" />
						&nbsp;<xsl:value-of select="root/lang/body/portRange" />
						</td>
                      </tr>
					  <tr>
                        <td><xsl:value-of select="root/lang/body/interval" /></td>
                        <td><input maxlength="5" size="5" value="{root/config/ftp/ftpInterval}" name="ftpInterval" id="ftpInterval" /> &nbsp;<xsl:value-of select="root/lang/body/second" />
					&nbsp;<xsl:value-of select="root/lang/body/range" /></td>
                      </tr> 
                      <tr>
                        <td><xsl:value-of select="root/lang/body/passiveMode" /></td>
                        <td><label>
                          <input type="checkbox" name="passive1Box" id="passive1Box" />
						  <input name="passive1" id="passive1" type="hidden" size="1" value="0" />
                        </label></td>
                      </tr>
                      </tbody>
                    </table>
                    <br />
					<div align="center">
						<input name="button7" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(2)" />
						<input name="button8" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(2)" />
						<input name="button9" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
			  	<div id="step3" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step3" /><xsl:value-of select="root/lang/body/note3" /></h1>
			        <xsl:value-of select="root/lang/body/description4" /><br /><br />
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						<br />
						<xsl:value-of select="root/lang/body/reboot1" />
						<span name="leavetime" id="leavetime"></span>
						<xsl:value-of select="root/lang/body/reboot2" />
						</font>
						<br /><br />
   				    </xsl:if>
					<table cellspacing="1" cellpadding="1" width="300" border="0" align="center" id="hideResult">
					<tr>
						<td width="130"><xsl:value-of select="root/lang/body/motionDetection" /></td>
						<td><span name="result1" id="result1"></span></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/alertsAndNotification" /></td>
						<td><span name="result2" id="result2"></span></td>
					</tr>
					</table>
                    <br />
					<div align="center">
						<input name="button19" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(3)" />
						<input name="button20" type="button" class="button_submit" value="{root/lang/body/apply}" onclick="send_request()" />
						<input name="button21" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
			  </div></td></form>
		  <td valign="top" width="125" id="" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0" style="display:none">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />
                          <span class="style1"><li></li><xsl:value-of select="root/lang/hint/description1" /></span><br />
                          <span class="style1"><li></li><xsl:value-of select="root/lang/hint/description2" /></span>
					  </td>
                    </tr>
                  </tbody>
              </table></td>
		</tr>
	</table></td></tr></table>
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
