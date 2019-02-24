<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="support_status.xml" --><!DOCTYPE xsl:stylesheet  [
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

<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleHelp" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleHelp" /></title>
</xsl:if>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
	<table border="1" cellpadding="2" cellspacing="0" width="60%" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td valign="top" id="maincontent_container">
			  <div id="maincontent">
				  <div id="box_header"> 
						<h1><xsl:value-of select="root/lang/body/helpMenu" /></h1>
						<table border="0" cellspacing="0" cellpadding="0" width="750">
                          <tr>
                            <td>
								<xsl:value-of select="root/lang/body/deviceInfo" /><br />
								<xsl:value-of select="root/lang/body/log" />
							</td>
                          </tr>
						 </table>
				  </div>
                  <div class="box">
                    <h2><a name="dev" id="dev"><xsl:value-of select="root/lang/body/deviceInfo" /></a></h2>
                    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><xsl:value-of select="root/lang/body/deviceInfo1" />
                        </td>
                      </tr>
                    </table>
                  </div>
				  <div class="box">
                    <h2><a name="log" id="log"><xsl:value-of select="root/lang/body/log" /></a></h2>
				    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>
                        <td><xsl:value-of select="root/lang/body/log1" />
                        </td>
                      </tr>
                    </table>
			    </div>
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
