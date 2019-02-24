<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="tools_default.xml" --><!DOCTYPE xsl:stylesheet  [
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css_router.css" />
<script language="JavaScript" src="../public.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
<![CDATA[
function restore(){
	if(confirm(restoreConfirm)){
		var importForm = document.importForm;
		importForm.submit();
	}
	else
		return;
}

function sendReboot(){
	if(confirm(rebootConfirm)){
		var rebootForm = document.rebootForm;
		rebootForm.submit();
	}
	else
		return;
}
function sendFactory(){
	if(confirm(factoryConfirm)){
		var resetForm = document.resetForm;
		resetForm.submit();
	}
	else
		return;
}

function buttonDisable(){
	document.getElementById("submit1").disabled = true;
	document.getElementById("submit2").disabled = true;
	document.getElementById("submit3").disabled = true;
	document.getElementById("submit4").disabled = true;
	document.getElementById("upload").disabled = true;
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var restoreConfirm = "<xsl:value-of select="root/lang/body/restoreConfirm" />";
var rebootConfirm = "<xsl:value-of select="root/lang/body/rebootConfirm" />";
var factoryConfirm = "<xsl:value-of select="root/lang/body/factoryConfirm" />";

function cgiInit(){

	if ('<xsl:value-of select="/root/result/code" />' == 'rebootOK'){
		buttonDisable();
		begin_count();
	}
	if ('<xsl:value-of select="/root/result/code" />' == 'resetOK'){
		buttonDisable();
		count_down();
	}
	if ('<xsl:value-of select="/root/result/code" />' == 'importOK'){
		buttonDisable();
		begin_count();
	}
}

var count=60;
var countdown=60;
function begin_count()
{
	window.setInterval("ShowRealTime()", 1000)
	document.getElementById("leavetime").innerHTML = count + " ";
}
function count_down()
{
	window.setInterval("ShowRealTime2()", 1000)
	document.getElementById("leavetime").innerHTML = countdown + " ";
}

function ShowRealTime() {
	count--;
	document.getElementById("leavetime").innerHTML = count + " ";
	if(count==0)
	{
		count = 1;
		location.href='tools_default.cgi';
	}
}

function ShowRealTime2() {
	countdown--;
	document.getElementById("leavetime").innerHTML = countdown + " ";
	if(countdown==0)
	{
		countdown = 1;
		location.href='tools_default.cgi';
	}
}
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleMaintenance" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleMaintenance" /></title>
</xsl:if>

<style type="text/css">
<xsl:comment>
.style2 {font-size: 11px}
.style3 {color: #333333}
</xsl:comment>
</style>

</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="cgiInit();">
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
			<td id="topnavon"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavoff"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
			<td id="topnavoff"><a href="support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
		  <td id="sidenav_container" valign="top" width="125" align="left"><table border="0" cellpadding="0" cellspacing="0">
            <tr>
						<td id="sidenav_container">
							<div id="sidenav">
								<ul>
									<li>
										<div><a href="tools_admin.cgi"><xsl:value-of select="root/lang/leftPanel/deviceManagement" /></a></div>
									</li>
									<li>
										<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/backupAndRestore" /></div>
									</li>
									<li>
										<div><a href="tools_firmware.cgi"><xsl:value-of select="root/lang/leftPanel/firmwareUpgrade" /></a></div>
									</li>
									<li>
										<div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
									</li>
								</ul>
							</div></td>	
            </tr>
          </table></td>
		  <td valign="top" id="maincontent_container">
			<div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				  <div id="box_header"> 
						<h1><xsl:value-of select="root/lang/body/maintenance" /></h1>
				        <div align="left"><xsl:value-of select="root/lang/body/description1" /><br />
							 <xsl:if test="/root/result/code = 'rebootFail'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/rebootFail" />
								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'rebootOK'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/rebootOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />
								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'resetFail'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/resetFail" />
								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'resetOK'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/resetOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />
								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'updateOK'">
							 <font color="#FF0000">
							 <xsl:value-of select="root/lang/message/updateOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />
							 </font>
        				 	 </xsl:if>
			    	   		 <xsl:if test="/root/result/code = 'uploadFail'">
								<font color="#FF0000">
							 <xsl:value-of select="root/lang/message/uploadFail" />
								</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'examFail'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/examFail" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'infoFail'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/infoFail" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidImage'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidImage" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'importOK'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/importOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidDB'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidDB" />
						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'noDB'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/noDB" />
						</font>
   				    </xsl:if>
	                </div>
			  </div>
				<div class="box">
                      <h2><xsl:value-of select="root/lang/body/system" /></h2>
                      <table width="525" border="0" cellpadding="2" cellspacing="2">
					  	<form id="export" name="export" method="post" action="export.cgi" >
                          <tr>
                            <td width="200" valign="top">
							  <xsl:value-of select="root/lang/body/backupText" />						    </td>
							<td >
							  <input type="submit" id="submit1" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{root/lang/body/saveConfiguration}&nbsp;&nbsp;&nbsp;&nbsp;" name="submit1" width="350" />
							  <input type="hidden" value="true" name="export" />
							</td>
                          </tr>
						  <tr>
						  	<td valign="top">&nbsp;</td>
						  	<td></td>
						  </tr>
						 </form>
					  	<form enctype="multipart/form-data" method="post" action="import.cgi" name="importForm">
                          <tr>
                            <td width="200" valign="top"><xsl:value-of select="root/lang/body/restoreText" /><br />
                              &nbsp;
							</td>
							<td>
							  <input name="upload" type="file" id="upload" value="" />
							  <br /><br />
						      <input name="submit2" id="submit2" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{root/lang/body/restoreConfiguration}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" type="button" onclick="return restore()" width="250" />
					          </td>
                          </tr>
						  <tr>
						  	<td valign="top">&nbsp;</td>
						  	<td></td>
						  </tr>
						 </form>
					  	<form name="resetForm" method="post" action="reset.cgi">
                          <tr>
                            <td width="200" valign="top"><xsl:value-of select="root/lang/body/factory" /></td>
							<td><input type="button" value="{root/lang/body/factoryDefault}" name="submit4" id="submit4" onclick="return sendFactory()" width="250" />
						    <input type="hidden" value="true" name="reset" />
							</td>
                          </tr>
						  <tr>
						  	<td valign="top">&nbsp;</td>
						  	<td></td>
						  </tr>
						 </form>
					  	<form name="rebootForm" method="post" action="reboot.cgi">
                          <tr>
                            <td width="200" valign="top"><xsl:value-of select="root/lang/body/rebootText" /></td>
							<td><input type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{root/lang/body/rebootDevice}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" name="submit3" id="submit3" onclick="return sendReboot()" width="250" />
							<input type="hidden" value="true" name="reboot" /></td>
                          </tr>
					    </form>

                </table>
			  </div>
			</div>
			</td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td width="111" id="help_text">
							<strong><xsl:value-of select="root/lang/hint/helpfulHints" /></strong><br />
							<br /><xsl:value-of select="root/lang/hint/description1" /><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
					  </td>
					</tr>
				</table>			</td>
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
