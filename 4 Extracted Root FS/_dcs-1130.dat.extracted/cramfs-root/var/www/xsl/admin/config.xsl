<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" --><!DOCTYPE xsl:stylesheet  [
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><xsl:value-of select="root/lang/body/title" /></title>
</head>

<body>
<img src="../images/dlink.jpg" alt="Top" width="836" height="47" />
<h1><xsl:value-of select="root/lang/body/title" /></h1>
<p><xsl:value-of select="root/lang/body/goto" /><a href="../index.cgi"><xsl:value-of select="root/lang/body/here" /></a></p>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
