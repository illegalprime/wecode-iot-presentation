<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="support_tools.xml" --><!DOCTYPE xsl:stylesheet  [
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
function init(){
	if ('<xsl:value-of select="root/common/peripheral/PT" />' == 0)
		document.getElementById("calibrate").style.display="none";
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

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="init();">
	<table border="1" cellpadding="2" cellspacing="0" width="60%" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td valign="top" id="maincontent_container">
			  <div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				  <div id="box_header"> 
						<h1><xsl:value-of select="root/lang/body/helpMenu" /></h1>
						<table border="0" cellspacing="0" cellpadding="0" width="750">
                          <tr>
                            <td>
								<xsl:value-of select="root/lang/body/deviceManagement" /><br />
								<xsl:value-of select="root/lang/body/backupAndRestore" /><br />
								<xsl:value-of select="root/lang/body/firmwareUpgrade" />
							</td>
                          </tr>
				    </table>
				  </div>
				<div class="box">
                      <h2><a name="adm" id="adm"><xsl:value-of select="root/lang/body/deviceManagement" /></a></h2>
					  <table border="0" cellspacing="0" cellpadding="0" width="750">
                        <tr>
                          <td>
						  	<strong><xsl:value-of select="root/lang/body/adminPassword" /></strong><xsl:value-of select="root/lang/body/adminPassword1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/addUser" /></strong><xsl:value-of select="root/lang/body/addUser1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/deleteUser" /></strong><xsl:value-of select="root/lang/body/deleteUser1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/cameraName" /></strong><xsl:value-of select="root/lang/body/cameraName1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/enableOSD" /></strong><xsl:value-of select="root/lang/body/enableOSDl" /><br />
                          <br />
							<strong><xsl:value-of select="root/lang/body/label" /></strong><xsl:value-of select="root/lang/body/label1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/timeStamp" /></strong><xsl:value-of select="root/lang/body/timeStamp1" />  <br />  <br />
                            <strong><xsl:value-of select="root/lang/body/led" /></strong><xsl:value-of select="root/lang/body/led1" />
                          </td>
					    </tr>
                      </table>
				</div>
				  <div class="box">
                    <h2><a name="bac" id="bac"><xsl:value-of select="root/lang/body/backupAndRestore" /></a></h2>
				    <table border="0" cellspacing="0" cellpadding="0" width="750">
						<tr>
                          <td>
						  	<strong><xsl:value-of select="root/lang/body/backup" /></strong><xsl:value-of select="root/lang/body/backup1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/restore" /></strong><xsl:value-of select="root/lang/body/restore1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/factoryDefaults" /></strong><xsl:value-of select="root/lang/body/factoryDefaults1" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/rebootSystem" /></strong><xsl:value-of select="root/lang/body/rebootSystem1" /><br />
						   <span id="calibrate" name="calibrate"><br /><strong><xsl:value-of select="root/lang/body/calibrate" /></strong><xsl:value-of select="root/lang/body/calibrate1" /></span></td>
						</tr>
                    </table>
			    </div>
				  <div class="box">
                    <h2><a name="fir" id="fir"><xsl:value-of select="root/lang/body/firmwareUpgrade" /></a></h2>
				    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td>
                            <strong><xsl:value-of select="root/lang/body/firmwareInformation" /></strong><xsl:value-of select="root/lang/body/firmwareInformation1" /><br />
                          <br />
                            <strong><xsl:value-of select="root/lang/body/firmwareUpdate" /></strong><xsl:value-of select="root/lang/body/firmwareUpdate1" /> </td>
                      </tr>
                    </table>
			    </div>
				  <!-- === END MAINCONTENT === -->
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
