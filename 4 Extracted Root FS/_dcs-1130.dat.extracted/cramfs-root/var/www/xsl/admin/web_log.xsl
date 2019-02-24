<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="web_log.xml" --><!DOCTYPE xsl:stylesheet  [
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
<script language="JavaScript" src="../public.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
function send_request_clean(){
	var tform = document.form1;
	tform.action = "web_log.cgi";
}
function send_request_download(){
	var tform = document.form1;
	tform.action = "export_log.cgi";
}
function initForm() 
{
	//checkbox
	if ('<xsl:value-of select="root/config/setting/log" />' == 'on')
		document.form1.log.checked=true;
}	
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleStatus" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleStatus" /></title>
</xsl:if>

<style type="text/css">
<xsl:comment>
.style3 {font-size: 12px}
.style4 {
	font-size: 11px;
	font-weight: bold;
}
.style5 {font-size: 11px}
</xsl:comment>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			<td id="topnavoff"><a href="adv_wizard.cgi"><xsl:value-of select="root/lang/frame/advanced" /></a></td>
			<td id="topnavoff"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavon"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
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
										<div><a href="st_device.cgi"><xsl:value-of select="root/lang/leftPanel/deviceInfo" /></a></div>
									</li>
									<li>
										<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/log" /></div>
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
						<h1><xsl:value-of select="root/lang/body/systemLog" /></h1>
						
				        <div align="left"><xsl:value-of select="root/lang/body/description1" /><br />
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" /></font>
        			</xsl:if>
			        <!-- insert name=ver_date -->
				    </div>
			      </div>
			      <div class="box"> 
						<h2><xsl:value-of select="root/lang/body/currentLog" /></h2>
						<table cellpadding="1" cellspacing="1" border="0" width="525">
						<tr><td >
                        <xsl:for-each select="root/config/log/line">
                      	<xsl:value-of select="datetime"/>&nbsp;&nbsp;<xsl:value-of select="message"/>
						<br />
                        </xsl:for-each>
						<form id="form1" name="form1" method="post" action="">
                			<input type="submit" value="{root/lang/body/clear}" name="submit2" onclick="send_request_clean()" />
						    <input type="hidden" value="clean" name="command" />&nbsp;
                			<input type="submit" value="{root/lang/body/download}" name="submit" onclick="send_request_download()" />
						    <input type="hidden" value="true" name="export" />
						</form>
						</td></tr>
					</table>
<!--							<img src="log2.JPG" width="519" height="400" />--></div>
					<!-- === END MAINCONTENT === -->

                </div>
		        </td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />
                          <xsl:value-of select="root/lang/hint/description1" />
						  <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p></p>
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
