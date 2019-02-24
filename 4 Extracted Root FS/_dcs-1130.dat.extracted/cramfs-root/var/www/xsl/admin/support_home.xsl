<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="support_home.xml" --><!DOCTYPE xsl:stylesheet  [
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
								<xsl:value-of select="root/lang/body/camera" />
							</td>
                          </tr>
						 </table>
				  </div>
                  <div class="box">
                    <h2><a name="001" id="001"><xsl:value-of select="root/lang/body/camera" /></a></h2>
                    <table border="0" cellspacing="0" cellpadding="0" width="750">
                      <tr>   
                        <td><strong><img  src="../images/profile1_off_n.gif" width="23em" height="22em"/><img  src="../images/profile2_off_n.gif" width="23em" height="22em"/><img  src="../images/profile3_off_n.gif" width="23em" height="22em"/><img  src="../images/profile4_off_n.gif" width="23em" height="22em"/>&nbsp;<xsl:value-of select="root/lang/body/videoProfile" /></strong><xsl:value-of select="root/lang/body/videoProfile1" /><strong></strong><br />
                          <br />
                            <strong><img  src="../images/full_screen_n.gif" width="23em" height="22em"/> &nbsp;<xsl:value-of select="root/lang/body/fullScreen" /></strong><xsl:value-of select="root/lang/body/fullScreen1" /><br />
                            <br />
                            <strong><img  src="../images/snapshot_n.gif" width="23em" height="22em"/> &nbsp;<xsl:value-of select="root/lang/body/snapshot" /></strong><xsl:value-of select="root/lang/body/snapshot1" /><br />
                        <br />
                            <strong><img  src="../images/recorde_off_n.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/recording" /></strong><xsl:value-of select="root/lang/body/recording1" /><br />
                        <br />
                            <strong><img  src="../images/path_setting_n.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/setPath" /></strong><xsl:value-of select="root/lang/body/setPath1" /><br />
                        <br />
                            <strong><img  src="../images/listen_off_n.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/listen" /></strong><xsl:value-of select="root/lang/body/listen1" /><br />
                       <br />
                             <xsl:if test="root/common/peripheral/speaker='1'">
                            <strong><img  src="../images/talk_off_n.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/talk" /></strong><xsl:value-of select="root/lang/body/talk1" /><br />
                            <br />  
                            </xsl:if> 
	  				<xsl:if test="root/common/peripheral/GPOUTs !='0'">
                            <strong><img  src="../images/digital_output_off_p.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/digitalOut" /></strong>				   							<xsl:value-of select="root/lang/body/digitalOut1" /><br /> <br />
           	 		</xsl:if> 
					<xsl:if test="root/common/peripheral/IR = '1'">
					 <strong><img  src="../images/ir_off_p.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/irled" /></strong>				   							<xsl:value-of select="root/lang/body/irled1" /><br /> <br />
					</xsl:if>
 					<xsl:if test="root/common/peripheral/GPINs !='0'">
                            <strong><img  src="../images/digital_input_off.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/digitalInputTrigger" /></strong>	    						<xsl:value-of select="root/lang/body/digitalInputTrigger1" /><br /> <br />
       				</xsl:if> 

                            <strong><img  src="../images/motion_notification_on.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/motionTrigger" /></strong><xsl:value-of select="root/lang/body/motionTrigger1" /><br /> <br />
                            <strong><img  src="../images/server_recorde_on.gif" width="23em" height="22em"/>&nbsp; <xsl:value-of select="root/lang/body/recordingTrigger" /></strong><xsl:value-of select="root/lang/body/recordingTrigger1" /><br /> <br />
					    <strong><xsl:value-of select="root/lang/body/language" /></strong><xsl:value-of select="root/lang/body/language1" />                        </td>
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
