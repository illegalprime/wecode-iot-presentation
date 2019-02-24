<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_ddns.xml" --><!DOCTYPE xsl:stylesheet  [
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
function send_request()
{
	if(document.form1.ddnsBox.checked){
		document.form1.ddns.value = "on";
		if(document.form1.providerValue.value == "www.dlinkddns.com")
			document.form1.provider.value = "dlinkddns"
		if(document.form1.providerValue.value == "www.DynDNS.org")
			document.form1.provider.value = "dyndns"
/*		if(document.form1.providerDDNS[1].selected)
			document.form1.provider.value = "dlinkddns"
		if(document.form1.providerDDNS[2].selected)
			document.form1.provider.value = "dyndns"*/
		if(checkddns() == false)
			return false;
	}
	else{
		document.form1.ddns.value = "off";
		document.form1.provider.value = defaultProvider;
	}

	send_submit("form1");
} 
	
function checkddns(){
	var ddns_hostname = get_by_id("ddnsHostname").value;
	var ddns_username = get_by_id("ddnsUsername").value;
	var ddns_passwordword = get_by_id("ddnsPasswordword").value;
	var confim_Password = get_by_id("confimPassword").value;
	var ddns_timeout = get_by_id("ddnsTimeout").value;

	if(document.form1.providerValue.value == ""){
		alert(ddnsError6);
//		document.form1.providerDDNS.select();
		return false;
	}

	if(checkServer("ddnsHostname",ddnsError1)==false)
		return false;
			
	if (ddns_username == ""){
		alertAndSelect(document.form1.ddnsUsername,ddnsError2);
		return false;
	}
	if(checkName("ddnsUsername",ddnsError5)==false)
		return false;
		
	if (ddns_passwordword == ""){
		alertAndSelect(document.form1.ddnsPasswordword,ddnsError3);
		return false;
	}
	if(checkName("ddnsPasswordword",ddnsError5)==false)
		return false;
		
	if (ddns_passwordword != confim_Password){
		alertAndSelect(document.form1.confimPassword,ddnsError4);
		return false;
	}
	if (isNaN(ddns_timeout)) { 
		alertAndSelect(document.form1.ddnsTimeout,ddnsError7);
		return false;
	}
	if (numcheck(ddns_timeout - 239)==-1 || numcheck(ddns_timeout-65535)==0){
		alertAndSelect(document.form1.ddnsTimeout,ddnsError8);
		return false;
	}
	return true;
}
	
function initcheck(){
	//for DDNS
	changeMode4();
}
	
//for DDNS
function changeMode4(){
	if(document.form1.ddnsBox.checked){
		document.form1.providerValue.disabled=true;
		document.form1.providerDDNS.disabled=false;
		document.form1.ddnsHostname.disabled=false;
		document.form1.ddnsUsername.disabled=false;
		document.form1.ddnsPasswordword.disabled=false;
		document.form1.confimPassword.disabled=false;
		document.form1.ddnsTimeout.disabled=false;
	}
	else{
		document.form1.providerValue.disabled=true;
		document.form1.providerDDNS.disabled=true;
		document.form1.ddnsHostname.disabled=true;
		document.form1.ddnsUsername.disabled=true;
		document.form1.ddnsPasswordword.disabled=true;
		document.form1.confimPassword.disabled=true;
		document.form1.ddnsTimeout.disabled=true;
	}
}
]]>
</script>    
<script language="JavaScript" type="text/javascript">
var ddnsError1 = "<xsl:value-of select="root/lang/body/ddnsError1" />";
var ddnsError2 = "<xsl:value-of select="root/lang/body/ddnsError2" />";
var ddnsError3 = "<xsl:value-of select="root/lang/body/ddnsError3" />";
var ddnsError4 = "<xsl:value-of select="root/lang/body/ddnsError4" />";
var ddnsError5 = "<xsl:value-of select="root/lang/body/ddnsError5" />";
var ddnsError6 = "<xsl:value-of select="root/lang/body/ddnsError6" />";
var ddnsError7 = "<xsl:value-of select="root/lang/body/ddnsError7" />";
var ddnsError8 = "<xsl:value-of select="root/lang/body/ddnsError8" />";
var defaultProvider;

function initForm() 
{
	//checkbox
	if ('<xsl:value-of select="root/config/ddns/enable" />' == 'on')
		document.form1.ddnsBox.checked=true;

	//select
	//ddns
	if ('<xsl:value-of select="root/config/ddns/provider" />' == 'dlinkddns')
		document.form1.providerValue.value = "<xsl:value-of select="root/lang/body/ddns1" />";
	if ('<xsl:value-of select="root/config/ddns/provider" />' == 'dyndns')
		document.form1.providerValue.value = "<xsl:value-of select="root/lang/body/ddns2" />";
//	if ('<xsl:value-of select="root/config/ddns/provider" />' == 'dyns')
//		document.form1.provider.value = 'dyns';
	defaultProvider = '<xsl:value-of select="root/config/ddns/provider" />';
}

function changeMode3(){
	if(document.form1.providerDDNS[1].selected)
		document.form1.providerValue.value = "<xsl:value-of select="root/lang/body/ddns1" />";
	else if(document.form1.providerDDNS[2].selected)
		document.form1.providerValue.value = "<xsl:value-of select="root/lang/body/ddns2" />";
//	else if(document.form1.providerDDNS[3].selected)
//		document.form1.provider.value = "<xsl:value-of select="root/lang/body/ddns3" />";
//	else if(document.form1.providerDDNS[4].selected)
//		document.form1.provider.value = "<xsl:value-of select="root/lang/body/ddns4" />";
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

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();initcheck();">
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
								<div><a href="adv_wizard.cgi"><xsl:value-of select="root/lang/leftPanel/wizard" /></a></div>
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/ddns" /></div>
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
                 <form id="form1" name="form1" method="post" action="adv_ddns.cgi" >
			<td valign="top" id="maincontent_container">
			  <div id="maincontent">
				  
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/ddnsSettings" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /><br /><br />
					<a href="http://www.dlinkddns.com/" target="_blank"><xsl:value-of select="root/lang/body/description2" /></a><br />
                  <br />
					  <center>
                      <input name="button1" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
                      <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_ddns.cgi'" />
					  </center>
			        <xsl:if test="/root/result/code = 'invalidHttpPort'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
        			</xsl:if>
			        <xsl:if test="/root/result/code = 'invalidRTPPort'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidtype'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidpolicy'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidMode'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidChannel'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
			        <xsl:if test="/root/result/code = 'invalidTXRate'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />
						</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						</font>
   				    </xsl:if>
				</div>				
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/dynamicDns" /></h2>
					<table width="525" border="0">
  <tr>
    <td width="150"><xsl:value-of select="root/lang/body/enableDdns" /></td>
    <td width="375"><input type="checkbox" name="ddnsBox" id="ddnsBox" onclick="changeMode4()"/>
      <input name="ddns" id="ddns" type="hidden" size="3" value="off" /></td>
  </tr>
  <tr>
    <td><xsl:value-of select="root/lang/body/provider" /></td>
    <td>                  <input maxlength="60" size="30" name="providerValue" id="providerValue" value="" /> 
      &lt;&lt; 
      <select name="providerDDNS" id="providerDDNS" onclick="changeMode3()" onchange="changeMode3()">
                              <option value="0"><xsl:value-of select="root/lang/body/selectDDNS" /></option>
							  <option value="1"><xsl:value-of select="root/lang/body/ddns1" /></option>
							  <option value="2"><xsl:value-of select="root/lang/body/ddns2" /></option>
                    </select>	
					<input name="provider" id="provider" type="hidden" size="10" value="" />			</td>
  </tr>
  <tr>
    <td><xsl:value-of select="root/lang/body/hostName" /></td>
    <td><input maxlength="60" size="30" name="ddnsHostname" id="ddnsHostname" value="{root/config/ddns/ddnsHostname}" /></td>
  </tr>
  <tr>
    <td><xsl:value-of select="root/lang/body/usernameEmail" /></td>
    <td>
      <input maxlength="60" size="30" name="ddnsUsername" id="ddnsUsername" value="{root/config/ddns/ddnsUsername}" />    </td>
  </tr>
  <tr>    <td><xsl:value-of select="root/lang/body/passwordKey" /></td>

    <td>
    <input type="password" maxlength="60" size="30" name="ddnsPassword" id="ddnsPasswordword" value="{root/config/ddns/ddnsPassword}" />    </td>
  </tr>
  <tr>    <td><xsl:value-of select="root/lang/body/passwordConfirm" /></td>

    <td>
    <input type="password" maxlength="60" size="30" name="confimPassword" id="confimPassword" value="{root/config/ddns/ddnsPassword}" />    </td>
  </tr>
  <tr>    <td><xsl:value-of select="root/lang/body/timeout" /></td>
    <td>
    <input maxlength="60" size="30" name="ddnsTimeout" id="ddnsTimeout" value="{root/config/ddns/ddnsTimeout}" />
    <xsl:value-of select="root/lang/body/hours" /></td>
  </tr>
  <tr>    <td><div align="left"><xsl:value-of select="root/lang/body/status" /></div></td>

    <td><xsl:if test="root/config/ddns/ddnsStatus = 'OK'">
		<xsl:value-of select="root/lang/body/OK" />
	</xsl:if>
        <xsl:if test="root/config/ddns/ddnsStatus = 'Disabled'">
		<xsl:value-of select="root/lang/body/Disabled" />
	</xsl:if>
        <xsl:if test="root/config/ddns/ddnsStatus = 'Failure'">
		<xsl:value-of select="root/lang/body/Failure" />
	</xsl:if>
	<xsl:if test="root/config/ddns/ddnsStatus = 'Initializing'">
		<xsl:value-of select="root/lang/body/Initializing" />
	</xsl:if>    </td>
  </tr>
</table>
</div><br />
					  <center>
                      <input name="button1" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
                      <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_ddns.cgi'" />
					  </center>
			  </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />                          
                          <xsl:value-of select="root/lang/hint/description1" /><br /></td>
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
