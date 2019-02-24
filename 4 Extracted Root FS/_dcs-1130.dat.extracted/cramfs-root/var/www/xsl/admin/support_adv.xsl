<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="support_adv.xml" --><!DOCTYPE xsl:stylesheet  [
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
<script language="JavaScript" type="text/javascript">
var serial = "<xsl:value-of select="root/common/serial " />";

function initForm() 
{

	if ('<xsl:value-of select="root/common/peripheral/wireless" />' == '0'){
		//document.getElementById("wirelessShow").style.display="none";
		document.getElementById("wirelessShowBox").style.display="none";
	}

	if ('<xsl:value-of select="root/common/peripheral/PT" />' == '0'){
		//document.getElementById("camControlShow").style.display="none";
		document.getElementById("camControlShowBox").style.display="none";
	}

	if ('<xsl:value-of select="root/common/peripheral/RS485" />' == '0'){
		document.getElementById("rs485Show").style.display="none";
		document.getElementById("rs485ShowBox").style.display="none";
	}

	//dcs2121

	if (serial == 'DCS-2102' || serial == 'DCS-5230' || serial == 'DCS-1100')
		document.getElementById("DCS-2102").style.display="";
	//dcs6410
	if (serial == 'DCS-6410' || serial == 'DCS-7510')
		document.getElementById("DCS-6410").style.display="";
	//dcs7411
	if (serial == 'DCS-7411')
		document.getElementById("DCS-7411").style.display="";
	//dcs3410
	if (serial == 'DCS-3410')
		document.getElementById("DCS-3410").style.display="";
}
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleHelp" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleHelp" /></title>
</xsl:if>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();" >
	<table border="1" cellpadding="2" cellspacing="0" width="60%" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td valign="top" id="maincontent_container">
				<div id="maincontent">
				  <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/setup" /></h1>
				    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
							<xsl:value-of select="root/lang/body/wizard" /><br />
							<xsl:value-of select="root/lang/body/networkSetup" /><br />
                            <xsl:if test="root/common/peripheral/wireless='1'">
							<span id="wirelessShow" name="wirelessShow"><xsl:value-of select="root/lang/body/wirelessSetup" /></span><br />
                            </xsl:if>
                            <xsl:value-of select="root/lang/body/dynamicDNS" /><br />
                            <xsl:value-of select="root/lang/body/imageSetup" /><br />
							<xsl:value-of select="root/lang/body/audioVideo" /><br />
							<xsl:value-of select="root/lang/body/motionDetection" /><br />
							<xsl:value-of select="root/lang/body/timeAndDate" /><br />
                            <xsl:if test="root/common/peripheral/PT='1'">
                            <span id="camControlShow" name="camControlShow"><xsl:value-of select="root/lang/body/presetPosition" /></span><br />
                            </xsl:if>
							<xsl:value-of select="root/lang/body/recording" /><br />
                            <xsl:value-of select="root/lang/body/snapshot" /><br />
                            <xsl:if test="root/common/peripheral/GPOUTs='1'">
			    				<xsl:value-of select="root/lang/body/digitalOutput" /><br />
                            </xsl:if>
			   				<span id="rs485Show" name="rs485Show"><xsl:value-of select="root/lang/body/RS-485" /><br /></span>
							 <xsl:if test="root/common/peripheral/localStorage='1'">
							<xsl:value-of select="root/lang/body/playback" /><br />	
								</xsl:if>				</td>
                      </tr>
                    </table>
			      </div>
		 <div class="box">
                    <h2><a name="wizard" id="wizard"><xsl:value-of select="root/lang/body/wizard" /></a></h2>
				    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
				<strong><xsl:value-of select="root/lang/body/wizardInternetSettings" /></strong><xsl:value-of select="root/lang/body/wizardInternetSettings1" /><br /><br />
				<strong><xsl:value-of select="root/lang/body/wizardMotionSettings" /></strong><xsl:value-of select="root/lang/body/wizardMotionSettings1" /><br />			</td>
                      </tr>
                    </table>
	          </div>
				  <div class="box">
                    <h2><a name="net" id="net"><xsl:value-of select="root/lang/body/networkSetup" /></a></h2>
				    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>  
							<strong><xsl:value-of select="root/lang/body/lanSetting" /></strong><xsl:value-of select="root/lang/body/lanSetting1" /><br /><br />
							<xsl:value-of select="root/lang/body/lanSetting2" /><br />
							<br />
							<strong><xsl:value-of select="root/lang/body/lanSetting3" /></strong><xsl:value-of select="root/lang/body/lanSetting4" /><br />
							<br />
                            <xsl:if test="root/config/extras/device1_0='1'">
							<strong><xsl:value-of select="root/lang/body/lanSetting5" /></strong><xsl:value-of select="root/lang/body/lanSetting6" /><br />
							<br />
                            </xsl:if>
                            <strong><xsl:value-of select="root/lang/body/pppoeSetting" /></strong><xsl:value-of select="root/lang/body/pppoeSetting1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/portSetting" /></strong><xsl:value-of select="root/lang/body/portSetting1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/httpPort" /></strong><xsl:value-of select="root/lang/body/httpPort1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/rtspPort" /></strong><xsl:value-of select="root/lang/body/rtspPort1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/authrtsp" /></strong><xsl:value-of select="root/lang/body/authrtsp1" />						</td>
                      </tr>
                    </table>
			      </div>
			      <div class="box" id="wirelessShowBox" name="wirelessShowBox">
                    <h2><a name="wir" id="wir"><xsl:value-of select="root/lang/body/wirelessSetup" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><strong><xsl:value-of select="root/lang/body/siteSurvey" /></strong><xsl:value-of select="root/lang/body/siteSurvey1" /><br />
                            <br />
                            <strong><xsl:value-of select="root/lang/body/SSID" /></strong><xsl:value-of select="root/lang/body/SSID1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/wirelessMode" /></strong><xsl:value-of select="root/lang/body/wirelessMode1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/channel" /></strong><xsl:value-of select="root/lang/body/channel1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/authentication" /></strong><br />
                            <xsl:value-of select="root/lang/body/authentication1" /><br />
                            <xsl:value-of select="root/lang/body/authentication2" /><br />
                            <xsl:value-of select="root/lang/body/authentication3" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/encryption" /></strong><br />
                            <xsl:value-of select="root/lang/body/encryption1" /><br />
                            <xsl:value-of select="root/lang/body/encryption2" /><br />
                            <xsl:value-of select="root/lang/body/encryption3" /><br />
                            <xsl:value-of select="root/lang/body/encryption4" /><br />
                            <xsl:value-of select="root/lang/body/encryption5" />						</td>
                      </tr>
                    </table>
		          </div>
			      <div class="box">
                    <h2><a name="ddn" id="ddn"><xsl:value-of select="root/lang/body/dynamicDNS" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><strong><xsl:value-of select="root/lang/body/dynamicDNS" /></strong><xsl:value-of select="root/lang/body/dynamicDNS1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/ddnsServerAddr" /></strong><xsl:value-of select="root/lang/body/ddnsServerAddr1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/ddnsHostname" /></strong><xsl:value-of select="root/lang/body/ddnsHostname1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/ddnsUsername" /></strong><xsl:value-of select="root/lang/body/ddnsUsername1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/ddnsPassword" /></strong><xsl:value-of select="root/lang/body/ddnsPassword1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/checkPassword" /></strong><xsl:value-of select="root/lang/body/checkPassword1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/ddnsTimeout" /></strong><xsl:value-of select="root/lang/body/ddnsTimeout1" />						</td>
                      </tr>
                    </table>
		          </div>    
			      <div class="box">
                    <h2><a name="img" id="img"><xsl:value-of select="root/lang/body/imageSetup" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
						<div id="DCS-2102" style="display:none">
							<strong><xsl:value-of select="root/lang/body/brightness" /></strong><xsl:value-of select="root/lang/body/brightness1" /><br />
                            <br />
                            <strong><xsl:value-of select="root/lang/body/saturation" /></strong><xsl:value-of select="root/lang/body/saturation1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/contrast" /></strong><xsl:value-of select="root/lang/body/contrast1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/frequency" /></strong><xsl:value-of select="root/lang/body/frequency1" /><br />
                          <br />
                          <strong><xsl:value-of select="root/lang/body/whitebalance" /></strong><xsl:value-of select="root/lang/body/whitebalance1" /><br />
                          <br />
                          <strong><xsl:value-of select="root/lang/body/bw" /></strong><xsl:value-of select="root/lang/body/bw1" /><br />
                          <br />
                          <strong><xsl:value-of select="root/lang/body/flip" /></strong><xsl:value-of select="root/lang/body/flip1" /><br />
                          <br />
                          <strong><xsl:value-of select="root/lang/body/mirror" /></strong><xsl:value-of select="root/lang/body/mirror1" /><br />
                          <br />
						</div>
						<div id="DCS-6410" style="display:none">
							<strong><xsl:value-of select="root/lang/body/brightness" /></strong><xsl:value-of select="root/lang/body/brightness1" /><br />
                            <br />
                            <strong><xsl:value-of select="root/lang/body/saturation" /></strong><xsl:value-of select="root/lang/body/saturation1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/contrast" /></strong><xsl:value-of select="root/lang/body/contrast1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/hue" /></strong><xsl:value-of select="root/lang/body/hue1" /><br />
						</div>
						<div id="DCS-7411" style="display:none">
							<strong><xsl:value-of select="root/lang/body/brightness" /></strong><xsl:value-of select="root/lang/body/brightness1" /><br />
                            <br />
                            <strong><xsl:value-of select="root/lang/body/saturation" /></strong><xsl:value-of select="root/lang/body/saturation1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/contrast" /></strong><xsl:value-of select="root/lang/body/contrast1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/hue" /></strong><xsl:value-of select="root/lang/body/hue1" /><br />
						</div>
						<div id="DCS-3410" style="display:none">
							<strong><xsl:value-of select="root/lang/body/brightness" /></strong><xsl:value-of select="root/lang/body/brightness1" /><br />
                            <br />
                            <strong><xsl:value-of select="root/lang/body/saturation" /></strong><xsl:value-of select="root/lang/body/saturation1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/contrast" /></strong><xsl:value-of select="root/lang/body/contrast1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/hue" /></strong><xsl:value-of select="root/lang/body/hue1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/BLC" /></strong><xsl:value-of select="root/lang/body/BLC1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/AWB" /></strong><xsl:value-of select="root/lang/body/AWB1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/AGC" /></strong><xsl:value-of select="root/lang/body/AGC1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/AES" /></strong><xsl:value-of select="root/lang/body/AES1" />
                          <br />
						  </div></td>
                      </tr>
                    </table>
		          </div>
			      <div class="box">
                    <h2><a name="aud" id="aud"><xsl:value-of select="root/lang/body/audioVideo" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><strong><xsl:value-of select="root/lang/body/videoProfile" /></strong><xsl:value-of select="root/lang/body/videoProfile1" /><br />
                            <br />
                            <strong><xsl:value-of select="root/lang/body/encodeType" /></strong><xsl:value-of select="root/lang/body/encodeType1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/resolution" /></strong><xsl:value-of select="root/lang/body/resolution2" /><br />
                          <br />
                          <strong><xsl:value-of select="root/lang/body/fps" /></strong><xsl:value-of select="root/lang/body/fps1" /><br />
                          <br />
                          <strong><xsl:value-of select="root/lang/body/bps" /></strong><xsl:value-of select="root/lang/body/bps1" /><br />
                          <br />
             
                            <strong><xsl:value-of select="root/lang/body/jpegQuality" /></strong><xsl:value-of select="root/lang/body/jpegQuality1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/rtspUrl" /></strong><xsl:value-of select="root/lang/body/rtspUrl1" /><br />
                          <br />
						  <xsl:if test="root/common/peripheral/IR = '1'">
						  <strong><xsl:value-of select="root/lang/body/irled" /></strong><xsl:value-of select="root/lang/body/irled1" /><br />
                          <br />
						  </xsl:if>
						  							<strong><xsl:value-of select="root/lang/body/audioSetting" /></strong><xsl:value-of select="root/lang/body/audioSettingl" /><br />
                          <br />
                         <xsl:if test="root/common/peripheral/speaker='1'">
                            <strong><xsl:value-of select="root/lang/body/enableSpeaker" /></strong><xsl:value-of select="root/lang/body/enableSpeaker1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/speakerVolume" /></strong><xsl:value-of select="root/lang/body/speakerVolume1" /><br />
                          <br />
                          </xsl:if>
                            <strong><xsl:value-of select="root/lang/body/enableMicrophone" /></strong><xsl:value-of select="root/lang/body/enableMicrophone1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/microphoneVolume" /></strong><xsl:value-of select="root/lang/body/microphoneVolume1" />							</td>
                      </tr>
                    </table>
		          </div>
			      <div class="box">
                    <h2><a name="mot" id="mot"><xsl:value-of select="root/lang/body/motionDetection" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><strong><xsl:value-of select="root/lang/body/enableMotion" /></strong><xsl:value-of select="root/lang/body/enableMotion1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/sensitivity" /></strong><xsl:value-of select="root/lang/body/sensitivity1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/unselectRange" /></strong><xsl:value-of select="root/lang/body/unselectRange1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/inverseRange" /></strong><xsl:value-of select="root/lang/body/inverseRange1" /> <br /><br />
							<strong><xsl:value-of select="root/lang/body/clearMotion" /></strong><xsl:value-of select="root/lang/body/clearMotion1" /></td>
                      </tr>
                    </table>
		          </div>
			      <div class="box">
                    <h2><a name="tim" id="tim"><xsl:value-of select="root/lang/body/timeAndDate" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><strong><xsl:value-of select="root/lang/body/timeZone" /></strong><xsl:value-of select="root/lang/body/timeZone1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/daylightSavings" /></strong><xsl:value-of select="root/lang/body/daylightSavings1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/autoDaylightSavings" /></strong><xsl:value-of select="root/lang/body/autoDaylightSavings1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/offset" /></strong><xsl:value-of select="root/lang/body/offset1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/daylightSavingsDates" /></strong><xsl:value-of select="root/lang/body/daylightSavingsDates1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/SyncNTP" /></strong><xsl:value-of select="root/lang/body/SyncNTP1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/ntpServer" /></strong><xsl:value-of select="root/lang/body/ntpServer1" /> <br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/manual" /></strong><xsl:value-of select="root/lang/body/manual1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/syncTime" /></strong><xsl:value-of select="root/lang/body/syncTime1" /></td>
                      </tr>
                    </table>
		          </div>
			      <div class="box" id="camControlShowBox" name="camControlShowBox">
                    <h2><a name="pre" id="pre"><xsl:value-of select="root/lang/body/presetPosition" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
							<strong><xsl:value-of select="root/lang/body/panSpeed" /></strong><xsl:value-of select="root/lang/body/panSpeed1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/tiltSpeed" /></strong><xsl:value-of select="root/lang/body/tiltSpeed1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/currentPosition" /></strong><xsl:value-of select="root/lang/body/currentPosition1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/presetPosition" /></strong><xsl:value-of select="root/lang/body/presetPosition1" />						</td>
                      </tr>
                    </table>
		          </div>
			      <div class="box">
                    <h2><a name="rec" id="rec"><xsl:value-of select="root/lang/body/recording" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
							<strong><xsl:value-of select="root/lang/body/enableRecording" /></strong><xsl:value-of select="root/lang/body/enableRecordingl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/sambaAuth" /></strong><xsl:value-of select="root/lang/body/sambaAuth1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/userName" /></strong><xsl:value-of select="root/lang/body/userNamel" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/passWord" /></strong><xsl:value-of select="root/lang/body/passWordl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/checkpassWord" /></strong><xsl:value-of select="root/lang/body/checkpassWordl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/serverIP" /></strong><xsl:value-of select="root/lang/body/serverIPl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/sharedFolder" /></strong><xsl:value-of select="root/lang/body/sharedFolder1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/test" /></strong><xsl:value-of select="root/lang/body/testl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/getStatus" /></strong><xsl:value-of select="root/lang/body/getStatusl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/recResolution" /></strong><xsl:value-of select="root/lang/body/recResolution1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/keepSpace" /></strong><xsl:value-of select="root/lang/body/keepSpacel" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/stopRecord" /></strong><xsl:value-of select="root/lang/body/stopRecordl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/overwriteRecord" /></strong><xsl:value-of select="root/lang/body/overwriteRecordl" /><br /><br />
                            
							<strong><xsl:value-of select="root/lang/body/eventBased" /></strong><xsl:value-of select="root/lang/body/eventBasedl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/prerecordSeconds" /></strong><xsl:value-of select="root/lang/body/prerecordSecondsl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/postrecordSeconds" /></strong><xsl:value-of select="root/lang/body/postrecordSecondsl" /><br /><br />
							<strong>
							 <xsl:choose>
							 <xsl:when test = "root/common/peripheral/localStorage = '1'">
								<xsl:value-of select="root/lang/body/continuoussam" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="root/lang/body/continuous" />
                            </xsl:otherwise>
							</xsl:choose>
							</strong>
							
                            <xsl:value-of select="root/lang/body/continuoussam1" /><br /><br />
							<strong>
							 <xsl:choose>
							<xsl:when test = "root/common/peripheral/localStorage = '1'">
								<xsl:value-of select="root/lang/body/scheduledsam" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="root/lang/body/scheduled" />
                            </xsl:otherwise>
							</xsl:choose>
							</strong>
                            <xsl:value-of select="root/lang/body/scheduledRecording1" /><br /><br />						</td>
                      </tr>
                    </table>
		          </div>
			      <div class="box">
                    <h2><a name="sna" id="sna"><xsl:value-of select="root/lang/body/snapshot" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
							<strong><xsl:value-of select="root/lang/body/enableSnapshot" /></strong><xsl:value-of select="root/lang/body/enableSnapshotl" /><br /><br />

					<xsl:if test="root/common/peripheral/GPINs = '1' or root/common/peripheral/GPINs = '2'">
					<strong><xsl:value-of select="root/lang/body/eventbased" /></strong><xsl:value-of select="root/lang/body/eventbased1" /><br /><br />
                    </xsl:if>
                    <xsl:if test="root/common/peripheral/GPINs = '0'">
					<strong><xsl:value-of select="root/lang/body/triggerEvent" /></strong><xsl:value-of select="root/lang/body/triggerEventl" /><br /><br />
                    </xsl:if>
							<!-- <xsl:if test="root/common/peripheral/GPINs=''">
                           <strong><xsl:value-of select="root/lang/body/triggerEvent" /></strong><xsl:value-of select="root/lang/body/triggerEventl" /><br /><br />
                            </xsl:if>
							<xsl:if test="root/common/peripheral/GPINs='0'">
                            <strong><xsl:value-of select="root/lang/body/eventbased" /></strong><xsl:value-of select="root/lang/body/eventbased1" /><br /><br />
                            </xsl:if>
                            <xsl:if test="root/common/peripheral/GPINs='1'">
                            <strong><xsl:value-of select="root/lang/body/triggerEvent" /></strong><xsl:value-of select="root/lang/body/triggerEventl" /><br /><br />
                            </xsl:if> --> 
							
                            <strong><xsl:value-of select="root/lang/body/continuousftp" /></strong><xsl:value-of select="root/lang/body/continuousftp1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/scheduledftp" /></strong><xsl:value-of select="root/lang/body/scheduledftp1" /><br /><br />
							
							<strong><xsl:value-of select="root/lang/body/emailSetting" /></strong><br /><br />
							<strong><xsl:value-of select="root/lang/body/emailAddress" /></strong><xsl:value-of select="root/lang/body/emailAddressl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/userName" /></strong><xsl:value-of select="root/lang/body/userNameSnapl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/passWord" /></strong><xsl:value-of select="root/lang/body/passwordSnapl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/smtpMailServer" /></strong><xsl:value-of select="root/lang/body/smtpMailServerl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/senderAddress" /></strong><xsl:value-of select="root/lang/body/senderAddressl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/recipientAddress" /></strong><xsl:value-of select="root/lang/body/recipientAddressl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/mailPort" /></strong><xsl:value-of select="root/lang/body/mailPortl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/ftpSetting" /></strong><br /><br />
							<strong><xsl:value-of select="root/lang/body/ftpServer" /></strong><xsl:value-of select="root/lang/body/ftpServerl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/userName" /></strong><xsl:value-of select="root/lang/body/userNameFtpl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/passWord" /></strong><xsl:value-of select="root/lang/body/passwordFtpl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/hostName" /></strong><xsl:value-of select="root/lang/body/hostNamel" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/path" /></strong><xsl:value-of select="root/lang/body/path1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/prefixFilename" /></strong><xsl:value-of select="root/lang/body/prefixFilename1" /><br />
							<br />
							<strong><xsl:value-of select="root/lang/body/ftpPort" /></strong><xsl:value-of select="root/lang/body/ftpPort1" /><br /><br />
                            <strong><xsl:value-of select="root/lang/body/interval" /></strong><xsl:value-of select="root/lang/body/interval1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/passiveMode" /></strong><xsl:value-of select="root/lang/body/passiveMode1" />						</td>
                      </tr>
                    </table>
		          </div>
                  <xsl:if test="root/common/peripheral/GPOUTs='1'">
				  <div class="box">
                    <h2><a name="dig" id="dig"><xsl:value-of select="root/lang/body/digitalOutput" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
							<strong><xsl:value-of select="root/lang/body/enableSignal" /></strong><xsl:value-of select="root/lang/body/enableSignall" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/triggerEvent" /></strong><xsl:value-of select="root/lang/body/triggerEvent1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/motionDetection" /></strong><xsl:value-of select="root/lang/body/motionDetectionl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/dISignal1" /></strong><xsl:value-of select="root/lang/body/dISignal1l" /><br /><br />
						<strong><xsl:value-of select="root/lang/body/dISignal2" /></strong><xsl:value-of select="root/lang/body/dISignal2l" /></td>
                      </tr>
                    </table>
		          </div>
                   </xsl:if> 

				  <div class="box" id="rs485ShowBox" name="rs485ShowBox">
                    <h2><a name="rs4" id="rs4"><xsl:value-of select="root/lang/body/RS-485" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
							<strong><xsl:value-of select="root/lang/body/supporPAN" /></strong><xsl:value-of select="root/lang/body/supporPANl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/protocol" /></strong><xsl:value-of select="root/lang/body/protocoll" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/ID" /></strong><xsl:value-of select="root/lang/body/IDl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/baudRate" /></strong><xsl:value-of select="root/lang/body/baudRatel" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/dataBits" /></strong><xsl:value-of select="root/lang/body/dataBitsl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/stopBit" /></strong><xsl:value-of select="root/lang/body/stopBitl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/parityBit" /></strong><xsl:value-of select="root/lang/body/parityBitl" />						</td>
                      </tr>
                    </table>
		          </div>
				  <xsl:if test="root/common/peripheral/localStorage='1'">
                 <div class="box">
                    <h2><a name="sd" id="aud"><xsl:value-of select="root/lang/body/playback" /></a></h2>
			        <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
					  <td>
					     <strong><xsl:value-of select="root/lang/body/formatvalue" /></strong><xsl:value-of select="root/lang/body/formatvalue1" /><br /><br />
					     <strong><xsl:value-of select="root/lang/body/name" /></strong><xsl:value-of select="root/lang/body/name1" /><br /><br />
					     <strong><xsl:value-of select="root/lang/body/num" /></strong><xsl:value-of select="root/lang/body/num1" /><br /><br />
						 <strong><xsl:value-of select="root/lang/body/size" /></strong><xsl:value-of select="root/lang/body/size1" /><br /><br />
						 <strong><xsl:value-of select="root/lang/body/refresh" /></strong><xsl:value-of select="root/lang/body/refresh1" /><br /><br />
						 <strong><xsl:value-of select="root/lang/body/toplevel" /></strong><xsl:value-of select="root/lang/body/toplevel1" /><br /><br />
						 <strong><xsl:value-of select="root/lang/body/delete" /></strong><xsl:value-of select="root/lang/body/delete1" /><br /><br />
						 <strong><xsl:value-of select="root/lang/body/ok" /></strong><xsl:value-of select="root/lang/body/ok1" /><br /><br />					  </td>
					  </tr>
					</table>
				</div>
				</xsl:if> 
		      </div></td>
		</tr>
	</table>
	<br />
<div align="center"><xsl:value-of select="root/lang/frame/copyright1" /> &copy; <xsl:value-of select="root/lang/frame/copyright2" /></div>
<br />
</body>
</html>
</xsl:template>
</xsl:stylesheet>
