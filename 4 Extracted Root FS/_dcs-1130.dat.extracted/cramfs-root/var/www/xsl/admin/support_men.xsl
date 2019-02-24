<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="support_men.xml" --><!DOCTYPE xsl:stylesheet  [
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
function initForm() 
{
	//if ('<xsl:value-of select="root/common/peripheral/wireless" />' == '0')
	//	document.getElementById("wirelessShow").style.display="none";
	//if ('<xsl:value-of select="root/common/peripheral/PT" />' == '0')
	//	document.getElementById("camControlShow").style.display="none";
	//if ('<xsl:value-of select="root/common/peripheral/RS485" />' == '0')
	//	document.getElementById("rs485Show").style.display="none";
}
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleHelp" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleHelp" /></title>
</xsl:if>

<style type="text/css">
<xsl:comment>
.style6 {
	font-size: 14px;
	font-weight: bold;
}
</xsl:comment>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();" >
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%"><xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/cameraName" /></td>
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
			<td id="topnavoff"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavoff"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
			<td id="topnavon"><a href="support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
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
										<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/menu" /></div>
									</li>
									<li>
										<div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
									</li>
								</ul>
							</div>						</td>
					</tr>
				</table>			</td>
			<td valign="top" id="maincontent_container">
			  <div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				  <div id="box_header"> 
						<h1><xsl:value-of select="root/lang/body/helpMenu" /></h1>
						<xsl:value-of select="root/lang/body/liveVideo" /><br />
						<xsl:value-of select="root/lang/body/setup" /><br />
						<xsl:value-of select="root/lang/body/maintenance" /><br />
						<xsl:value-of select="root/lang/body/status" />
				  </div>
				  <div class="box">
						<h2><xsl:value-of select="root/lang/body/liveVideo" /></h2>
						<table width="100%" border="0">
                          <tr>
                            <td>
                                <a href="support_home.cgi#001" target="_blank"><font color="#000000">
								<xsl:value-of select="root/lang/body/camera" /></font></a>
                           	</td>
                          </tr>
						 </table>
				  </div>
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/setup" /></h2>
                    <table width="100%" border="0">
                      <tr>
                        <td>
			  <a href="support_adv.cgi#wizard" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/wizard" /></font></a><br />
			  <a href="support_adv.cgi#net" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/networkSetup" /></font></a><br />
              <xsl:if test="root/common/peripheral/wireless='1'">
                          <span id="wirelessShow" name="wirelessShow"><a href="support_adv.cgi#wir" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/wirelessSetup" /></font></a></span><br />
              </xsl:if> 
                          <a href="support_adv.cgi#ddn" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/dynamicDNS" /></font></a><br />
                          <a href="support_adv.cgi#img" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/imageSetup" /></font></a><br />
                          <a href="support_adv.cgi#aud" target="_blank"><font color="#000000"><xsl:value-of select="root/lang/body/audioVideo" /></font></a><br />
                          <a href="support_adv.cgi#mot" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/motionDetection" /></font></a><br />
                          <a href="support_adv.cgi#tim" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/timeAndDate" /></font></a><br />
                          <xsl:if test="root/common/peripheral/PT='1'">
                          <span id="camControlShow" name="camControlShow"><a href="support_adv.cgi#pre" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/presetPosition" /></font></a></span><br />
                           </xsl:if> 
                          <a href="support_adv.cgi#rec" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/recording" /></font></a><br />
                          <a href="support_adv.cgi#sna" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/snapshot" /></font></a><br />
                          <xsl:if test="root/common/peripheral/GPOUTs='1'">
						  <a href="support_adv.cgi#dig" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/digitalOutput" /></font></a><br />
                          </xsl:if> 
                           <xsl:if test="root/common/peripheral/RS485='1'">
						  <span id="rs485Show" name="rs485Show"><a href="support_adv.cgi#rs4" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/RS-485" /></font></a></span>
                           </xsl:if> 
                          </td>
                      </tr>
                    </table>
                  </div>
				  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/maintenance" /></h2>
				    <table width="100%" border="0">
					  <tr>
                        <td>
                          <a href="support_tools.cgi#adm" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/deviceManagement" /></font></a><br />
						  <a href="support_tools.cgi#bac" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/backupAndRestore" /></font></a><br />
                          <a href="support_tools.cgi#fir" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/firmwareUpgrade" /></font></a>
                        </td>
                      </tr>
                    </table>
			    </div>
			      <div class="box">
                    <h2><xsl:value-of select="root/lang/body/status" /></h2>
			        <table width="100%" border="0">
                      <tr>
                        <td>
                          <a href="support_status.cgi#dev" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/deviceInfo" /></font></a><br />
                          <a href="support_status.cgi#log" target="_blank"><font color="#000000"> <xsl:value-of select="root/lang/body/log" /></font></a>
                        </td>
                      </tr>
                    </table>
		        </div>
			  </div></td>

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
