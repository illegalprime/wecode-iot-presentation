<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_wizard.xml" --><!DOCTYPE xsl:stylesheet  [
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
]]>
</script>
<script language="JavaScript" type="text/javascript">
var displaySystem = "<xsl:value-of select="root/config/display/system" />";

function initForm(){
	if (displaySystem == 'SXGA'){
		document.form1.button12.disabled=true;
		document.form1.button22.disabled=true;
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/wizard" /></div>
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
                <form id="form1" name="form1" method="post" action="adv_snapshot_cont.cgi">
			<td valign="top" id="maincontent_container" height="338">
			  <div id="maincontent">
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/internetSettings" /></h1>
                    <xsl:if test="root/common/peripheral/wireless = '0'">
                    	 <xsl:value-of select="root/lang/body/description1" />
					</xsl:if>
                    <xsl:if test="root/common/peripheral/wireless = '1'">
                    	 <xsl:value-of select="root/lang/body/description1wireless" />
					</xsl:if>
                    <br />
                      <br />
					  <center>
                      <input name="button1" type="button" class="button_submit" value="{root/lang/body/internetButton}" onclick="window.location.href='netWizard.cgi'" />
                      <input name="button2" type="button" class="button_submit" value="{root/lang/body/internetSetup}"  onclick="window.location.href='adv_lan.cgi'" />
					  </center>
                </div>
                  <div id="box_header" style="display:none">
                    <h1><xsl:value-of select="root/lang/body/motionSettings" /></h1>
                    <xsl:value-of select="root/lang/body/description2" /><br />
                      <br />
                      <input name="button3" type="button" class="button_submit" value="{root/lang/body/motionButton}" onclick="window.location.href='mot_detect.cgi'" />
                      <input name="button4" type="button" class="button_submit" value="{root/lang/body/motionSetup}"  onclick="window.location.href='mot_detect.cgi'" />
					  <br />
                </div>
			  </div>
			  <div id="maincontent">
                <div id="box_header">
                  <h1><xsl:value-of select="root/lang/body/motionSettings" /></h1>
                  <xsl:value-of select="root/lang/body/description2" /><br />
						<xsl:if test="root/config/display/system = 'SXGA'">
						<font color="#FF0000"><xsl:value-of select="root/lang/body/description3" /><br /><xsl:value-of select="root/lang/body/description4" /><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/body/description5" /></a><xsl:value-of select="root/lang/body/description6" /></font><br />
						</xsl:if>
                  <br />
                  <center>
                    <input name="button12" type="button" class="button_submit" value="{root/lang/body/motionButton}" onclick="window.location.href='motWizard.cgi'" />
                    <input name="button22" type="button" class="button_submit" value="{root/lang/body/motionSetup}"  onclick="window.location.href='mot_detect.cgi'" />
                  </center>
                </div>
			    <div id="div2" style="display:none">
                  <h1><xsl:value-of select="root/lang/body/motionSettings" /></h1>
			      <xsl:value-of select="root/lang/body/description2" /><br />
                  <br />
                  <input name="button32" type="button" class="button_submit" value="{root/lang/body/motionButton}" onclick="window.location.href='mot_detect.cgi'" />
                  <input name="button42" type="button" class="button_submit" value="{root/lang/body/motionSetup}"  onclick="window.location.href='mot_detect.cgi'" />
                  <br />
                </div>
		      </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />
                          <xsl:value-of select="root/lang/hint/description1" /><br /><br />
                          <xsl:value-of select="root/lang/hint/description2" />
						  <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
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
