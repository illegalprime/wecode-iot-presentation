<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="st_device.xml" --><!DOCTYPE xsl:stylesheet  [
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
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<form id="form1" name="form1" method="post" action="st_device.cgi">
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
										<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/deviceInfo" /></div>
									</li>
									<li>
										<div><a href="web_log.cgi"><xsl:value-of select="root/lang/leftPanel/log" /></a></div>
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
						<h1><xsl:value-of select="root/lang/body/deviceInformation" /> </h1>
				    <div align="left"><xsl:value-of select="root/lang/body/description1" /></div>
			      </div>
					<div class="box"> 
						<h2><xsl:value-of select="root/lang/body/Information" /></h2>
							<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
                                  <td width="125"><xsl:value-of select="root/lang/body/cameraName" /></td>
                                  <td width="400" style="white-space:pre"><xsl:value-of select="root/common/cameraName" /></td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/timeAndDate" /></td>
				  <td>
        	                          <xsl:if test="root/config/week= '1'">
						  <xsl:value-of select="root/lang/body/Mon" />
					  </xsl:if>
        	                          <xsl:if test="root/config/week= '2'">
						  <xsl:value-of select="root/lang/body/Tue" />
					  </xsl:if>
        	                          <xsl:if test="root/config/week= '3'">
						  <xsl:value-of select="root/lang/body/Wed" />
					  </xsl:if>
        	                          <xsl:if test="root/config/week= '4'">
						  <xsl:value-of select="root/lang/body/Thu" />
					  </xsl:if>
        	                          <xsl:if test="root/config/week= '5'">
						  <xsl:value-of select="root/lang/body/Fri" />
					  </xsl:if>
        	                          <xsl:if test="root/config/week= '6'">
						  <xsl:value-of select="root/lang/body/Sat" />
					  </xsl:if>
        	                          <xsl:if test="root/config/week= '7'">
						  <xsl:value-of select="root/lang/body/Sun" />
					  </xsl:if>

        	                          <xsl:if test="root/config/month= '1'">
						  <xsl:value-of select="root/lang/body/Jan" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '2'">
						  <xsl:value-of select="root/lang/body/Feb" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '3'">
						  <xsl:value-of select="root/lang/body/Mar" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '4'">
						  <xsl:value-of select="root/lang/body/Apr" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '5'">
						  <xsl:value-of select="root/lang/body/May" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '6'">
						  <xsl:value-of select="root/lang/body/Jun" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '7'">
						  <xsl:value-of select="root/lang/body/Jul" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '8'">
						  <xsl:value-of select="root/lang/body/Aug" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '9'">
						  <xsl:value-of select="root/lang/body/Sep" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '10'">
						  <xsl:value-of select="root/lang/body/Oct" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '11'">
						  <xsl:value-of select="root/lang/body/Nov" />
					  </xsl:if>
        	                          <xsl:if test="root/config/month= '12'">
						  <xsl:value-of select="root/lang/body/Dec" />
					  </xsl:if>

        	                          <xsl:if test="root/config/day= '1'">
						  <xsl:value-of select="root/lang/body/day1" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '2'">
						  <xsl:value-of select="root/lang/body/day2" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '3'">
						  <xsl:value-of select="root/lang/body/day3" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '4'">
						  <xsl:value-of select="root/lang/body/day4" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '5'">
						  <xsl:value-of select="root/lang/body/day5" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '6'">
						  <xsl:value-of select="root/lang/body/day6" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '7'">
						  <xsl:value-of select="root/lang/body/day7" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '8'">
						  <xsl:value-of select="root/lang/body/day8" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '9'">
						  <xsl:value-of select="root/lang/body/day9" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '10'">
						  <xsl:value-of select="root/lang/body/day10" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '11'">
						  <xsl:value-of select="root/lang/body/day11" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '12'">
						  <xsl:value-of select="root/lang/body/day12" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '13'">
						  <xsl:value-of select="root/lang/body/day13" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '14'">
						  <xsl:value-of select="root/lang/body/day14" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '15'">
						  <xsl:value-of select="root/lang/body/day15" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '16'">
						  <xsl:value-of select="root/lang/body/day16" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '17'">
						  <xsl:value-of select="root/lang/body/day17" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '18'">
						  <xsl:value-of select="root/lang/body/day18" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '19'">
						  <xsl:value-of select="root/lang/body/day19" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '20'">
						  <xsl:value-of select="root/lang/body/day20" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '21'">
						  <xsl:value-of select="root/lang/body/day21" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '22'">
						  <xsl:value-of select="root/lang/body/day22" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '23'">
						  <xsl:value-of select="root/lang/body/day23" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '24'">
						  <xsl:value-of select="root/lang/body/day24" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '25'">
						  <xsl:value-of select="root/lang/body/day25" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '26'">
						  <xsl:value-of select="root/lang/body/day26" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '27'">
						  <xsl:value-of select="root/lang/body/day27" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '28'">
						  <xsl:value-of select="root/lang/body/day28" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '29'">
						  <xsl:value-of select="root/lang/body/day29" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '30'">
						  <xsl:value-of select="root/lang/body/day30" />
					  </xsl:if>
        	                          <xsl:if test="root/config/day= '31'">
						  <xsl:value-of select="root/lang/body/day31" />
					  </xsl:if>

					  <xsl:value-of select="root/config/time_year" />
				  </td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/firmwareVersion" /></td>
                                  <td><xsl:value-of select="root/common/version" />, <xsl:value-of select="/root/common/build" /></td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/macAddress" /></td>
                                  <td><xsl:value-of select="root/config/mac" /></td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/ipAddress" /></td>
                                  <td><!-- insert name=lan_mask --><xsl:value-of select="root/config/address" /></td>
							  </tr>
								<tr>
								  <td><xsl:value-of select="root/lang/body/subnetMask" /></td>
								  <td><xsl:value-of select="root/config/netmask" /></td>
							  </tr>
								<tr>
								  <td><xsl:value-of select="root/lang/body/defaultRouter" /></td>
								  <td><xsl:value-of select="root/config/gateway" /></td>
							  </tr>
								<tr>
								  <td><xsl:value-of select="root/lang/body/primaryDns" /></td>
								  <td><xsl:value-of select="root/config/dns1" /></td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/secondaryDns" /></td>
                                  <td><xsl:value-of select="root/config/dns2" /></td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/pppoe" /></td>
				  <td>
                                  <xsl:if test="root/config/pppoe/status = 'OK'">
				  	<xsl:value-of select="root/lang/body/OK" />
				  	<xsl:value-of select="root/config/pppoe/pppoe_ip" />
				  </xsl:if>
                                  <xsl:if test="root/config/pppoe/status = 'Disabled'">
					  <xsl:value-of select="root/lang/body/Disabled" />
				  </xsl:if>
                                  <xsl:if test="root/config/pppoe/status = 'Failure'">
					  <xsl:value-of select="root/lang/body/Failure" />
				  </xsl:if>
				  </td>
							  </tr>
								<tr>
                                  <td><xsl:value-of select="root/lang/body/ddns" /></td>
				  <td>
                                  <xsl:if test="root/config/ddns/status = 'OK'">
					  <xsl:value-of select="root/lang/body/OK" />
				  </xsl:if>
                                  <xsl:if test="root/config/ddns/status = 'Disabled'">
					  <xsl:value-of select="root/lang/body/Disabled" />
				  </xsl:if>
                                  <xsl:if test="root/config/ddns/status = 'Failure'">
					  <xsl:value-of select="root/lang/body/Failure" />
				  </xsl:if>
				  <xsl:if test="root/config/ddns/status = 'Initializing'">
				  	<xsl:value-of select="root/lang/body/Initializing" />
				  </xsl:if>
				  </td>
							  </tr>
							</table>
					</div>
					<!-- === END MAINCONTENT === -->
                </div></td>
			<td width="150" align="left" valign="top" id="sidehelp_container"><table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                <tbody>
                  <tr>
                    <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                        <br />
                        <xsl:value-of select="root/lang/hint/description1" />
						<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p></p>
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
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
