<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="tools_firmware.xml" --><!DOCTYPE xsl:stylesheet  [
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
var updateConfirm = "<xsl:value-of select="root/lang/body/updateConfirm" />";
var updatingText = "<xsl:value-of select="root/lang/body/updatingText" />";
</script>

<script language="JavaScript" type="text/javascript">
flag=0;
function sendUpdate() {
	if(flag==1)
		return false;
		
	var filepath = document.getElementById("upload2");
	if(filepath.value == null || filepath.value == ""){
		document.getElementById("warning").style.display = "";
		return false;
	}else{
		document.getElementById("warning").style.display = "none";
		if(confirm(updateConfirm)){
			flag=1;
			var updateForm = document.updateForm;
			updateForm.submit();
			document.getElementById("uploadcodition").style.display="none";
			document.getElementById("updating").innerHTML = updatingText ;
			FirmwareUpdate();
		}
	}
}

var progress = 1;
function proceeding() {
	progress = progress+1;
	if (progress == 100)
		progress = 99;

	var percent = "" + progress + "%";
	document.getElementById("bar").width = percent;
	document.getElementById("progressText").innerHTML = percent;
}

function FirmwareUpdate(){
	document.updateForm.submit6.disabled=true;	
	document.updateForm.upload.disabled=true;
	document.getElementById("progressBar").style.display="";
	document.getElementById("progressText").style.display="";
	IntID=window.setInterval("proceeding()",2400);
}
</script>
<script language="JavaScript" type="text/javascript">
function cgiInit(){
	if ('<xsl:value-of select="/root/result/code" />' == 'updateOK')
		count_down();
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
function ShowRealTime2() {
	countdown--;
	document.getElementById("leavetime").innerHTML = countdown + " ";
	if(countdown==0)
	{
		countdown = 1;
		location.href='tools_firmware.cgi';
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
										<div><a href="tools_default.cgi"><xsl:value-of select="root/lang/leftPanel/backupAndRestore" /></a></div>
									</li>
									<li>
										<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/firmwareUpgrade" /></div>
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
						<h1><xsl:value-of select="root/lang/body/firmwareUpgrade" /></h1>
				        <div align="left"><xsl:value-of select="root/lang/body/description1" />
						<a href="http://support.dlink.com.tw/" target="_blank"><xsl:value-of select="root/lang/body/description2" /></a>
						<xsl:value-of select="root/lang/body/description3" /><br />
				          <br />
						<xsl:value-of select="root/lang/body/description4" /><br />
						<font color="#FF0000"><span id="updating"></span></font>
                        <span id ="uploadcodition"> <nobr></nobr>
							 <xsl:if test="/root/result/code = 'rebootFail'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/rebootFail" />								</font>
        					 </xsl:if>
                           
							 <xsl:if test="/root/result/code = 'rebootOK'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/rebootOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'resetFail'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/resetFail" />								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'resetOK'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/resetOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'calibrationOK'">
								<font color="#FF0000">
								<xsl:value-of select="root/lang/message/calibrationOK" />								</font>
        					 </xsl:if>
							 <xsl:if test="/root/result/code = 'updateOK'">
							 <font color="#FF0000">
							 <xsl:value-of select="root/lang/message/updateOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />							 </font>
        				 	 </xsl:if>
			    	   		 <xsl:if test="/root/result/code = 'uploadFail'">
								<font color="#FF0000">
							 <xsl:value-of select="root/lang/message/uploadFail" />								</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'examFail'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/examFail" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'infoFail'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/infoFail" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidImage'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidImage" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'importOK'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/importOK" />
								<br />
								<xsl:value-of select="root/lang/body/reboot1" />
								<span name="leavetime" id="leavetime"></span>
								<xsl:value-of select="root/lang/body/reboot2" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidDB'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidDB" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'noDB'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/noDB" />						</font>
   				    </xsl:if>
                    </span> 
	                </div>
			  </div>
				  <div class="box">
                      <h2><xsl:value-of select="root/lang/body/firmwareInfo" /></h2>
                
                      <table width="525" height="14" border="0" cellpadding="2" cellspacing="2">
                          <tr>
                            <td width="147">
                            <xsl:value-of select="root/lang/body/firmwareVersion" /><br /></td>
                            <td width="378" ><xsl:value-of select="root/common/version" />, <xsl:value-of select="/root/common/build" /></td>
                          </tr>
                          <tr>
                            <td >
                              <xsl:value-of select="root/lang/body/firmwareProduct" /><br /></td>
                            <td ><xsl:value-of select="root/common/product" /></td>
                          </tr>
						  <tr id="warning" style="display:none">
						  <td colspan="2"><font color="#FF0000"><xsl:value-of select="root/lang/message/noimage" /></font></td>
						  </tr>
              </table>
			  </div>
			  <div class="box">
                      <h2><xsl:value-of select="root/lang/body/firmwareUpgrade" /></h2>
                
                      <table width="525" height="14" border="0" cellpadding="2" cellspacing="2">
						<form enctype="multipart/form-data" method="post" action="update.cgi" name="updateForm">
                          <tr>
                            <td >
                              <xsl:value-of select="root/lang/body/filePath" />
                                <input name="upload" type="file" id="upload2" value="" />
                                &nbsp; 
                              <input name="submit6" value="{root/lang/body/upload}" type="button" onclick="return sendUpdate()" />
							  </td>
							  <td>
								<div id="progressBar" style="display:none">
								<table width="120" border="1" cellpadding="0" cellspacing="0" bordercolor="#2B7BA0"> 
									<tr>
								      <td id="bar" width="1%" background="../images/progress.jpg" valign="middle">&nbsp;</td>
								      <td>&nbsp;</td>
									</tr>
								</table>
							    </div>
							  </td>
							  <td valign="middle">
							 	 <span align="left" id="progressText" style="display:none">1%</span>
							  </td>
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
							<br /><xsl:value-of select="root/lang/hint/description1" />
							<a href="http://support.dlink.com.tw/" target="_blank"><xsl:value-of select="root/lang/hint/description2" /></a>
							<xsl:value-of select="root/lang/hint/description3" />
							<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
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
