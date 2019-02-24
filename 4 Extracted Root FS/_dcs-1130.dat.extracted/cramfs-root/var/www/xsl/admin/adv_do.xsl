<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_do.xml" --><!DOCTYPE xsl:stylesheet  [
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
function send_request(){
	if(document.form1.toOutBox1.checked)
		document.form1.toOut1.value = "1";
	else
		document.form1.toOut1.value = "0";

	if(document.form1.motionBox1.checked)
		document.form1.out1ByMotion.value = "1";
	else
		document.form1.out1ByMotion.value = "0";

	if(document.form1.byIn1Box1.checked)
		document.form1.out1ByIn1.value = "1";
	else
		document.form1.out1ByIn1.value = "0";

	if(document.form1.byIn2Box2.checked)
		document.form1.out2ByIn2.value = "1";
	else
		document.form1.out2ByIn2.value = "0";

	send_submit("form1");
}
function changeMode(){
	if(document.form1.toOutBox1.checked){
		document.form1.motionBox1.disabled = false;
		document.form1.byIn1Box1.disabled = false;
		document.form1.byIn2Box2.disabled = false;
	}
	else{
		document.form1.motionBox1.disabled = true;
		document.form1.byIn1Box1.disabled = true;
		document.form1.byIn2Box2.disabled = true;
	}

	if (displaySystem == 'SXGA')
		document.form1.motionBox1.disabled=true;
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var displaySystem = "<xsl:value-of select="root/config/display/system" />";
var diFlag = "<xsl:value-of select="root/common/peripheral/GPINs" />";

function initForm(){
	if (diFlag==1)
		document.getElementById("digitIn1").style.display="";
	else if (diFlag==2){
		document.getElementById("digitIn1").style.display="";
		document.getElementById("digitIn2").style.display="";
	}
	else if (diFlag==3){
		document.getElementById("digitIn1").style.display="";
		document.getElementById("digitIn2").style.display="";
		document.getElementById("digitIn3").style.display="";
	}
	else if (diFlag==4){
		document.getElementById("digitIn1").style.display="";
		document.getElementById("digitIn2").style.display="";
		document.getElementById("digitIn3").style.display="";
		document.getElementById("digitIn4").style.display="";
	}

	//checkbox
	if ('<xsl:value-of select="root/config/digitalOutput/toOut1/enable" />' == '1')
		document.form1.toOutBox1.checked=true;
	if ('<xsl:value-of select="root/config/digitalOutput/toOut1/triggerBy/byMotion" />' == '1')
		document.form1.motionBox1.checked=true;
	if ('<xsl:value-of select="root/config/digitalOutput/toOut1/triggerBy/byIn1" />' == '1')
		document.form1.byIn1Box1.checked=true;
	if ('<xsl:value-of select="root/config/digitalOutput/toOut1/triggerBy/byIn2" />' == '1')
		document.form1.byIn2Box2.checked=true;

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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/digitalOutput" /></div>
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
                <form id="form1" name="form1" method="post" action="adv_do.cgi">
			<td valign="top" id="maincontent_container" width="563" height="388">
			  <div id="maincontent">
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/digitalOutput" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /><br />
						<xsl:if test="root/config/display/system = 'SXGA'">
						<font color="#FF0000"><xsl:value-of select="root/lang/body/description2" /><br /><xsl:value-of select="root/lang/body/description3" /><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/body/description4" /></a><xsl:value-of select="root/lang/body/description5" /></font><br />
						</xsl:if>
					<br />
					  <center>
                      <input name="Submit" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()"/>
                      <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_do.cgi'" />
					  </center>
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						</font>
   				    </xsl:if>
					<xsl:if test="/root/result/code = 'updateFailed'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
        			<xsl:if test="/root/result/code = 'invalidParameter'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
   				    </xsl:if>
                </div>
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/trigger" /></h2>
                    <table cellspacing="1" cellpadding="2" width="525" border="0">
                      <tbody>
                        <tr>
                          <td colspan="3"><input type="checkbox" name="toOutBox1" id="toOutBox1" onclick="changeMode()" />
                            <xsl:value-of select="root/lang/body/enable" />
                            <input name="toOut1" id="toOut1" type="hidden" size="1" value="0" /></td>
                        </tr>
                        <tr>
                          <td width="50">&nbsp;</td>
                          <td colspan="2"><xsl:value-of select="root/lang/body/triggerEvent" /></td>

                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td width="50"><label></label></td>
						  <td><input type="checkbox" name="motionBox1" id="motionBox1" />
                            <xsl:value-of select="root/lang/body/motionDetection" />
                          <input name="out1ByMotion" id="out1ByMotion" type="hidden" size="1" value="0" /></td>
                        </tr>
                        <tr>
                          <td id="digitIn1" style="display:none">&nbsp;</td>
                          <td width="50"><label></label></td>
						  <td><input type="checkbox" name="byIn1Box1" id="byIn1Box1" />
                            <xsl:value-of select="root/lang/body/di1" />
                          <input name="out1ByIn1" id="out1ByIn1" type="hidden" size="1" value="0" /></td>
                        </tr>
						<tr id="digitIn2" style="display:none">
                          <td >&nbsp;</td>
                          <td width="50"><label></label></td>
						  <td><input type="checkbox" name="byIn2Box2" id="byIn2Box2" />
                            <xsl:value-of select="root/lang/body/di2" />
                          <input name="out2ByIn2" id="out2ByIn2" type="hidden" size="1" value="0" /></td>
                        </tr>
						<tr id="digitIn3" style="display:none">
                          <td >&nbsp;</td>
                          <td width="50"><label></label></td>
						  <td><input type="checkbox" name="byIn3Box3" id="byIn3Box3" />
                            <xsl:value-of select="root/lang/body/di3" />
                          <input name="out3ByIn3" id="out3ByIn3" type="hidden" size="1" value="0" /></td>
                        </tr>
						<tr id="digitIn4" style="display:none">
                          <td >&nbsp;</td>
                          <td width="50"><label></label></td>
						  <td><input type="checkbox" name="byIn4Box4" id="byIn4Box4" />
                            <xsl:value-of select="root/lang/body/di4" />
                          <input name="out4ByIn4" id="out4ByIn4" type="hidden" size="1" value="0" /></td>
                        </tr>
                      </tbody>
                    </table>
                </div><br />
					  <center>
                      <input name="Submit" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()"/>
                      <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_do.cgi'" />
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
						  <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
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
