<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_network.xml" --><!DOCTYPE xsl:stylesheet  [
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
	if(document.form1.policy[1].checked){
		if(checkip() == false){
			document.form1.ip.select();
			return false;
		}
		if(checkmask() == false){
			document.form1.netmask.select();
			return false;
		}
		if(checkrouter() == false){
			document.form1.router.select();
			return false;
		}
		if(checkpridns()== false){
			document.form1.pridns.select();
			return false;
		}
		if(checksecdns() == false){
			document.form1.secdns.select();
			return false;
		}
		if(checkmask_gateway_ip()== false){
			return false;
		}
	}

	if (document.form1.upnpPortBox) {
		if (document.form1.upnpPortBox.checked) {
			document.form1.upnpPort.value = '1';
			if (checkport("httpExtPort", httpExtPortError1, httpExtPortError2, httpExtPortError3) == false)
				return false;
			if (document.form1.httpExtPort.value == document.form1.rtspExtPort.value) {
				alertAndSelect(get_by_id("httpExtPort"), httpExtPortError4);
				return false;
			}
			if (checkport("rtspExtPort", rtspExtPortError1, rtspExtPortError2, rtspExtPortError3) == false)
				return false;
		}
		else
			document.form1.upnpPort.value = '0';
	}
	
	if (checkport("httpPort", httpPortError1, httpPortError2, httpPortError3) == false)
		return false;
	if (document.form1.httpPort.value == document.form1.rtspPort.value) {
		alertAndSelect(get_by_id("httpPort"), httpPortError4);
		return false;
	}
	if (checkport("rtspPort", rtstPortError1, rtstPortError2, rtstPortError3) == false)
		return false;
	
	if (document.form1.pppoeEnableBox.checked){
		if(checkpppoe() == false)
			return false;
		document.form1.pppoeEnable.value = '1';
	}
	else
		document.form1.pppoeEnable.value = '0';
	
	if (document.form1.upnpBox.checked)
		document.form1.upnp.value = '1';
	else
		document.form1.upnp.value = '0';
	
	if (document.form1.upnpPortBox) {
		if (document.form1.upnpPortBox.checked)
			document.form1.upnpPort.value = '1';
		else
			document.form1.upnpPort.value = '0';
	}

	if (document.form1.rtspAuthBox.checked)
		document.form1.rtspAuth.value = '1';
	else
		document.form1.rtspAuth.value = '0';
	
	send_submit("form1");
} 
function checkmask_gateway_ip()
{
	var mask = get_by_id("netmask").value.split(".");
	var ip = get_by_id("ip").value.split(".");
	var router = get_by_id("router").value.split(".");
	
	if(IpAndMask(ip,mask,router) == false)
	{
		alert(ipErrormsg);
		return false;
	}
	return true;
	
}
function checkip(){
	var ip = get_by_id("ip").value;
	ip = handle_address(ip);
	var sepIP = ip.split(".");
//	var temp_ip_obj = new addr_obj(ip.split("."), IP_ADDRESS_DESC, false, INVALID_IP_ADDRESS, ZERO_IP_ADDRESS, -1, false);
//	var temp_ip_obj = new addr_obj(ip.split("."), "IP Address", false, "The IP Address entered is invalid", "The IP Address cannot be zero.", -1, false);
	var temp_ip_obj = new addr_obj(ip.split("."), ipMessage1, false, ipMessage2, ipMessage3, -1, false);
	if (ip == ""){
		alert(ipError1);
		return false;
	}
	else {
		if (!check_address(temp_ip_obj))
    		return false;
	}
	
	if( sepIP[0] == 127 ){
		if ( sepIP[1] == 0 ){
			if ( sepIP[2] == 0 ){
				if ( sepIP[3] == 1 ){
					alert(ipMessage2);
					document.form1.ip.select();
					return false;
				}
			}
		}
	}
	document.form1.ip.value = ip;
	return true;
}
	
function checkmask(){
	var mask = get_by_id("netmask").value;
	mask = handle_address(mask);
//	var temp_mask_obj = new addr_obj(mask.split("."), MASK_ADDRESS_DESC, false, INVALID_MASK_ADDRESS, ZERO_MASK_ADDRESS, -1, true);
	var temp_mask_obj = new addr_obj(mask.split("."), maskMessage1, false, maskMessage2, maskMessage3, -1, true);
	
	if (mask == ""){
		alert(subnetMaskError1);
		return false;
	}
	else {
		if (!check_mask(temp_mask_obj)){
            return false;
	       }
	}
	
	if (checkSubnetMask(maskMessage2) == false){
		return false;
	}
	document.form1.netmask.value = mask;
	return true;
}
	
function checkrouter(){
	var router = get_by_id("router").value;
	router = handle_address(router);
//	var temp_router_obj = new addr_obj(router.split("."), ROUTER_ADDRESS_DESC, false, INVALID_ROUTER_ADDRESS, ZERO_ROUTER_ADDRESS, -1, false);
	var temp_router_obj = new addr_obj(router.split("."), routerMessage1, false, routerMessage2, routerMessage3, -1, false);
		
	if (router == ""){
		alert(routerError1);
		return false;
	}
	else {
		if (!check_address(temp_router_obj)){
            return false;
	       }
	}
	document.form1.router.value = router;	
	return true;
}
	
function checkpridns(){
	var pridns = get_by_id("pridns").value;
	if(pridns != "")
	{
		pridns = handle_address(pridns);
//	var temp_pridns_obj = new addr_obj(pridns.split("."), DNS_ADDRESS_DESC, false, INVALID_DNS_ADDRESS, ZERO_DNS_ADDRESS, -1, false);
	  var temp_pridns_obj = new addr_obj(pridns.split("."), priDnsMessage1, false, priDnsMessage2, priDnsMessage3, -1, false);
		
		if(!check_address(temp_pridns_obj))
		{
    	return false;
	  }
		document.form1.pridns.value = pridns;
	}
	return true;
}
	
function checksecdns(){
	var secdns = get_by_id("secdns").value;
	if(secdns != "")
	{
		secdns = handle_address(secdns);
//	var temp_secdns_obj = new addr_obj(secdns.split("."), SEC_DNS_ADDRESS_DESC, false, INVALID_SEC_DNS_ADDRESS, ZERO_SEC_DNS_ADDRESS, -1, false);
		var temp_secdns_obj = new addr_obj(secdns.split("."), secDnsMessage1, false, secDnsMessage2, secDnsMessage3, -1, false);
		if (!check_address(temp_secdns_obj))
		{
    	return false;
		}
		document.form1.secdns.value = secdns;
	}	
	return true;
}

function checkpppoe(){
	var pppoe_name = get_by_id("pppoeName").value;
	var pppoe_pass = get_by_id("pppoePass").value;
	var pppoe_confirm = get_by_id("pppoeConfirm").value;

	if (pppoe_name == ""){
		alertAndSelect(document.form1.pppoeName,pppoeError1);
		return false;
	}
	if(checkName("pppoeName",pppoeError5)==false)
		return false;
	
	if (pppoe_pass == ""){
		alertAndSelect(document.form1.pppoePass,pppoeError2);
		return false;
	}
	if(checkName("pppoePass",pppoeError5)==false)
		return false;
	
	if (pppoe_confirm == ""){
		alertAndSelect(document.form1.pppoeConfirm,pppoeError3);
		return false;
	}
	if (pppoe_pass != pppoe_confirm){
		alertAndSelect(document.form1.pppoeConfirm,pppoeError4);
		return false;
	}
			
	return true;
}

function checkport(objID, Error1, Error2, Error3){
	var Obj = get_by_id(objID);
	var Port = Obj.value;
	if (Port != "") {
		if (!isNaN(Port)) {
			if (range(Port, 1, 65535))
				return true;
			else
				alertAndSelect(Obj, Error3);
		}
		else
			alertAndSelect(Obj, Error2);
	}
	else
		alertAndSelect(Obj, Error1);
	return false;
}

function initcheck(){
	//for network
	if(document.form1.policy[0].checked)
		changeMode(3);
	else
		changeMode(4);
	CheckupnpPortBox();
	//for pppoe
	changeMode6();
}

function CheckupnpPortBox(){
	if (document.form1.upnpPortBox) {
		if(document.form1.upnpPortBox.checked) {
			document.form1.httpExtPort.disabled=false;
			document.form1.rtspExtPort.disabled=false;
		}
		else {
			document.form1.httpExtPort.disabled=true;
			document.form1.rtspExtPort.disabled=true;
		}
	}
}

function changeMode(index){
	if(index==3){
		document.form1.dhcp.disabled=false;
		document.form1.static.disabled=false;
		document.form1.ip.disabled=true;
		document.form1.netmask.disabled=true;
		document.form1.router.disabled=true;
		document.form1.pridns.disabled=true;
		document.form1.secdns.disabled=true;
		document.form1.upnpBox.disabled=false;
		if (document.form1.upnpPortBox)
			document.form1.upnpPortBox.disabled=false;
	}else if(index==4){
		document.form1.dhcp.disabled=false;
		document.form1.static.disabled=false;
		document.form1.ip.disabled=false;
		document.form1.netmask.disabled=false;
		document.form1.router.disabled=false;
		document.form1.pridns.disabled=false;
		document.form1.secdns.disabled=false;
		document.form1.upnpBox.disabled=false;
		if (document.form1.upnpPortBox)
			document.form1.upnpPortBox.disabled=false;
	}
}

//for pppoe
function changeMode6(){
	if(document.form1.pppoeEnableBox.checked){
		document.form1.pppoeName.disabled=false;
		document.form1.pppoePass.disabled=false;
		document.form1.pppoeConfirm.disabled=false;
	}
	else{
		document.form1.pppoeName.disabled=true;
		document.form1.pppoePass.disabled=true;
		document.form1.pppoeConfirm.disabled=true;
	}
}
]]>
</script>    
<script language="JavaScript" type="text/javascript">
var ipError1 = "<xsl:value-of select="root/lang/body/ipError1" />";
var subnetMaskError1 = "<xsl:value-of select="root/lang/body/subnetMaskError1" />";
var routerError1 = "<xsl:value-of select="root/lang/body/routerError1" />";
var pppoeError1 = "<xsl:value-of select="root/lang/body/pppoeError1" />";
var pppoeError2 = "<xsl:value-of select="root/lang/body/pppoeError2" />";
var pppoeError3 = "<xsl:value-of select="root/lang/body/pppoeError3" />";
var pppoeError4 = "<xsl:value-of select="root/lang/body/pppoeError4" />";
var pppoeError5 = "<xsl:value-of select="root/lang/body/pppoeError5" />";
var httpPortError1 = "<xsl:value-of select="root/lang/body/httpPortError1" />";
var httpPortError2 = "<xsl:value-of select="root/lang/body/httpPortError2" />";
var httpPortError3 = "<xsl:value-of select="root/lang/body/httpPortError3" />";
var httpPortError4 = "<xsl:value-of select="root/lang/body/httpPortError4" />";
var rtstPortError1 = "<xsl:value-of select="root/lang/body/rtstPortError1" />";
var rtstPortError2 = "<xsl:value-of select="root/lang/body/rtstPortError2" />";
var rtstPortError3 = "<xsl:value-of select="root/lang/body/rtstPortError3" />";
var httpExtPortError1 = "<xsl:value-of select="root/lang/body/httpExtPortError1" />";
var httpExtPortError2 = "<xsl:value-of select="root/lang/body/httpExtPortError2" />";
var httpExtPortError3 = "<xsl:value-of select="root/lang/body/httpExtPortError3" />";
var httpExtPortError4 = "<xsl:value-of select="root/lang/body/httpExtPortError4" />";
var rtspExtPortError1 = "<xsl:value-of select="root/lang/body/rtspExtPortError1" />";
var rtspExtPortError2 = "<xsl:value-of select="root/lang/body/rtspExtPortError2" />";
var rtspExtPortError3 = "<xsl:value-of select="root/lang/body/rtspExtPortError3" />";
var netErrorMessage1 = "<xsl:value-of select="root/lang/body/netErrorMessage1" />";
var netErrorMessage2 = "<xsl:value-of select="root/lang/body/netErrorMessage2" />";
var netErrorMessage3 = "<xsl:value-of select="root/lang/body/netErrorMessage3" />";
var netErrorMessage4 = "<xsl:value-of select="root/lang/body/netErrorMessage4" />";
var netErrorMessage5 = "<xsl:value-of select="root/lang/body/netErrorMessage5" />";
var netErrorMessage6 = "<xsl:value-of select="root/lang/body/netErrorMessage6" />";
var ipErrormsg = "<xsl:value-of select="root/lang/body/netError" />";
var ipMessage1 = "<xsl:value-of select="root/lang/body/ipMessage1" />";
var ipMessage2 = "<xsl:value-of select="root/lang/body/ipMessage2" />";
var ipMessage3 = "<xsl:value-of select="root/lang/body/ipMessage3" />";
var maskMessage1 = "<xsl:value-of select="root/lang/body/maskMessage1" />";
var maskMessage2 = "<xsl:value-of select="root/lang/body/maskMessage2" />";
var maskMessage3 = "<xsl:value-of select="root/lang/body/maskMessage3" />";
var routerMessage1 = "<xsl:value-of select="root/lang/body/routerMessage1" />";
var routerMessage2 = "<xsl:value-of select="root/lang/body/routerMessage2" />";
var routerMessage3 = "<xsl:value-of select="root/lang/body/routerMessage3" />";
var priDnsMessage1 = "<xsl:value-of select="root/lang/body/priDnsMessage1" />";
var priDnsMessage2 = "<xsl:value-of select="root/lang/body/priDnsMessage2" />";
var priDnsMessage3 = "<xsl:value-of select="root/lang/body/priDnsMessage3" />";
var secDnsMessage1 = "<xsl:value-of select="root/lang/body/secDnsMessage1" />";
var secDnsMessage2 = "<xsl:value-of select="root/lang/body/secDnsMessage2" />";
var secDnsMessage3 = "<xsl:value-of select="root/lang/body/secDnsMessage3" />";

function initForm() 
{
	if ('<xsl:value-of select="/root/result/code" />' == 'ok')
		begin_count();
		
	//checkbox
	if ('<xsl:value-of select="root/config/network/lan/upnp" />' == '1')
		document.form1.upnpBox.checked=true;
	if ('<xsl:value-of select="root/config/network/lan/upnpPort" />' == '1')
		if (document.form1.upnpPortBox)
			document.form1.upnpPortBox.checked=true;
	if ('<xsl:value-of select="root/config/network/pppoe/enable" />' == '1')
		document.form1.pppoeEnableBox.checked=true;
	if ('<xsl:value-of select="root/config/rtsp/rtspAuth" />' == '1')
		document.form1.rtspAuthBox.checked=true;

	//radio
	if ('<xsl:value-of select="root/config/network/lan/policy" />' == '0')
		document.form1.dhcp.checked=true;
	if ('<xsl:value-of select="root/config/network/lan/policy" />' == '1')
		document.form1.static.checked=true;
}	
var count=45;
var timeoutID;
function begin_count()
{
	timeoutID = window.setInterval("ShowRealTime()", 1000)
	document.getElementById("leavetime").innerHTML = count + " ";
	document.form1.button_save.disabled=true;
	document.form1.button_cancel.disabled=true;
	document.form1.button.disabled=true;
	document.form1.button2.disabled=true;
}

function ShowRealTime() {
	count--;
	document.getElementById("leavetime").innerHTML = count + " ";
	if(count==0)
	{
		count = 1;
		var port = <xsl:value-of select="root/config/http/httpPort" />;
		var ip = "<xsl:value-of select="root/config/network/lan/static/ip" />";
		var lang = readCookie('language');
		if (lang == "eng"){}
		else if( lang == "cht" ){}
		else{
			if( navigator.userLanguage == "zh-tw" || navigator.language =="zh-TW" || navigator.language =="zh-tw")
				lang = "cht"
			else
				lang = "eng"
		}
		if ('<xsl:value-of select="root/config/network/lan/policy" />' == 0)
			location.href = "http://" + window.location.hostname + ":" + port + "/" + lang + "/admin/adv_lan.cgi";
		else
			location.href = "http://" + ip + ":" + port + "/" + lang + "/admin/adv_lan.cgi";
		window.clearInterval(timeoutID);
	}
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/networkSettings" /></div>
							</li>
							<xsl:if test="root/common/peripheral/wireless = '1'">
							<li>
								<div><a href="adv_wireless.cgi"><xsl:value-of select="root/lang/leftPanel/wireless" /></a></div>
							</li>
							</xsl:if>
							<li>
								<div><a href="adv_ddns.cgi"><xsl:value-of select="root/lang/leftPanel/ddns" /></a></div>
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
                 <form id="form1" name="form1" method="post" action="adv_lan.cgi" >
			<td valign="top" id="maincontent_container" width="563">
			  <div id="maincontent">
				  
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/networkSettings" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /> <br />
                  <br />
				  <center>
				  <input name="button_save" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
				  <input name="button_cancel" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_lan.cgi'" />
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
						<br />
						<xsl:value-of select="root/lang/body/reboot1" />
						<span name="leavetime" id="leavetime"></span>
						<xsl:value-of select="root/lang/body/reboot2" />
						</font>
   				    </xsl:if>
				</div>				
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/general" /></h2>
                  <table width="525" border="0">
                      <tr>
                        <td width="100"><xsl:value-of select="root/lang/body/lan" /></td>
                        <td colspan="2"><label></label></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
							<td colspan="2"><input onclick="changeMode(3)" type="radio" value="0" name="policy" id="dhcp"/> 
                        <xsl:value-of select="root/lang/body/dhcp" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input onclick="changeMode(4)" type="radio" value="1" name="policy" id="static" />
						<xsl:value-of select="root/lang/body/static" /></td>
                      </tr>
                      <tr>
                        <td >&nbsp;</td>
                        <td width="114"><xsl:value-of select="root/lang/body/ip" /></td>
                        <td width="295">
						<input maxlength="15" size="15" value="{root/config/network/lan/static/ip}" name="ip" id="ip" />
						<!--<input disabled="disabled" maxlength="15" size="16" value="192.168.0.101" name="network_ipaddress" />-->						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/subnetMask" /></td>
                        <td>
						<input maxlength="15" size="15" value="{root/config/network/lan/static/netmask}" name="netmask" id="netmask" />						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/defaultRouter" /></td>
                        <td>
						<input maxlength="15" size="15" value="{root/config/network/lan/static/router}" name="router" id="router" />						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/primaryDns" /></td>
                        <td>
						<input maxlength="15" size="15" value="{root/config/network/lan/static/pridns}" name="pridns" id="pridns" />						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/secondaryDns" /></td>
                        <td>
						<input maxlength="15" size="15" value="{root/config/network/lan/static/secdns}" name="secdns" id="secdns" />						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                        <input type="checkbox" name="upnpBox" id="upnpBox" />
						<input name="upnp" id="upnp" type="hidden" size="1" value="0" />
						<xsl:value-of select="root/lang/body/enableUpnp" /></td>
                      </tr>
<xsl:if test="/root/config/extras/device1_0 = '1'">            
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                          <input type="checkbox" name="upnpPortBox" id="upnpPortBox" onclick="CheckupnpPortBox()" value="0" />
						  <input name="upnpPort" id="upnpPort" type="hidden" size="1" value="0" />
						  <xsl:value-of select="root/lang/body/upnpPort" /></td>
                      </tr>
		      <tr>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/httpExtPort" /></td>
				<td>
					<input maxlength="5" size="5" value="{root/config/network/lan/httpExtPort}" name="httpExtPort" id="httpExtPort" />
				</td>
		      </tr>
		      <tr>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/rtspExtPort" /></td>
				<td>
					<input maxlength="5" size="5" value="{root/config/network/lan/rtspExtPort}" name="rtspExtPort" id="rtspExtPort" />
				</td>
		      </tr>
</xsl:if>
                      <tr>
                        <td><input type="checkbox" name="pppoeEnableBox" id="pppoeEnableBox" onclick="changeMode6()" />
                        <input name="pppoeEnable" id="pppoeEnable" type="hidden" size="1" value="0" />
                        <xsl:value-of select="root/lang/body/pppoe" /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/userName" /></td>
                        <td><input maxlength="60" size="30" value="{root/config/network/pppoe/pppoeName}" name="pppoeName" id="pppoeName" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/password" /></td>
                        <td><input type="password" maxlength="60" size="30" value="{root/config/network/pppoe/pppoePass}" name="pppoePass" id="pppoePass" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/confirmPassword" /></td>
                        <td><input type="password" maxlength="60" size="30" value="{root/config/network/pppoe/pppoeConfirm}" name="pppoeConfirm" id="pppoeConfirm" /></td>
                      </tr>
                    </table>
                </div>
                  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/httpAndRtspPort" /></h2>
					<table width="525" border="0">
						<tr>
							<td width="100"><xsl:value-of select="root/lang/body/httpPort" /></td>
							<td width="425"><input name="httpPort" id="httpPort" type="text" value="{root/config/http/httpPort}" size="5" maxlength="5" /></td>
						</tr>
<!--  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Access name</td>
    <td><input name="rtsp_path" value="{root/config/rtsp/path}" maxlength="20" /></td>
  </tr>
-->
						<tr>
							<td><xsl:value-of select="root/lang/body/rtspPort" /></td>
							<td><label><input name="rtspPort" id="rtspPort" value="{root/config/rtsp/rtspPort}" size="5" maxlength="5" /></label></td>
						</tr>
                        <tr>
						<td>&nbsp;</td>
                        <td><input type="checkbox" name="rtspAuthBox" id="rtspAuthBox" onclick="changeMode6()" />
                        <input name="rtspAuth" id="rtspAuth" type="hidden" size="1" value="0" />
                        <xsl:value-of select="root/lang/body/rtspAuth" /></td>
                        </tr>
					</table>
				</div>
				<br />
				  <center>
				  <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
				  <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_lan.cgi'" />
				  </center>
	          </div></td>
			  </form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />                          
                          <xsl:value-of select="root/lang/hint/description1" /><br />
                        <br />
                        <xsl:value-of select="root/lang/hint/description2" /><br />                        
                        <br />
                        <xsl:value-of select="root/lang/hint/description3" /><br />
                        <br />
                        <xsl:value-of select="root/lang/hint/description4" /><br />
						<br />
                        <xsl:value-of select="root/lang/hint/description5" /></td>
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
