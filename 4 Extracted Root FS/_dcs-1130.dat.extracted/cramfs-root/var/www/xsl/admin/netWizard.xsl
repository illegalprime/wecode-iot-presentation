<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="netWizard.xml" --><!DOCTYPE xsl:stylesheet  [
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
function send_request(){
	if(document.form1.enableDSTBox.checked)
		document.form1.enableDST.value = "1";
	if(document.form1.pppoeEnableBox.checked)
		document.form1.pppoeEnable.value = "1";
	if(document.form1.ddnsBox.checked)
		document.form1.ddns.value = "1";

	if(document.form1.ddnsBox.checked){
		if(document.form1.providerValue.value == "www.dlinkddns.com")
			document.form1.provider.value = "dlinkddns"
		if(document.form1.providerValue.value == "www.DynDNS.org")
			document.form1.provider.value = "dyndns"
	}

	if(document.form1.autoDST[1].checked)
	{

			if(timeCheckHours(document.form1.startTimeHours,hourError)==false)
				return -1;
			if(timeCheckHours(document.form1.endTimeHours,hourError)==false)
				return -1;
			
			if(timeCheckMins(document.form1.startTimeMins,minuteError)==false)
				return -1;
			if(timeCheckMins(document.form1.endTimeMins,minuteError)==false)
				return -1;

			document.form1.startTime.value = "M" + document.form1.startTimeMon.value + "." + document.form1.startTimeWeek.value + "." + document.form1.startTimeDayOfWeek.value + "/" + document.form1.startTimeHours.value + ":" + document.form1.startTimeMins.value + ":0";

			document.form1.endTime.value = "M" + document.form1.endTimeMon.value + "." + document.form1.endTimeWeek.value + "." + document.form1.endTimeDayOfWeek.value + "/" + document.form1.endTimeHours.value + ":" + document.form1.endTimeMins.value + ":0";
	
	}

	if(document.form1.enableDSTBox.checked)
		document.form1.enableDST.value = "1";
	else
		document.form1.enableDST.value = "0";
	//document.getElementById("below").style.display="none";	
	send_submit("form1");
}

function backStep(index){
	if(index==1){
		document.getElementById("step0").style.display="";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==2){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==3){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==4){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==5){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==6){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="";
		document.getElementById("step6").style.display="none";
	}
}

function nextStep(index){
	if(index==0){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==1){
		if (networkCheck() == false)
			return false;
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==2){
		if (checkpppoe() == false)
			return false;
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==3){
		if(checkddns() == false)
			return false;
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="none";
	}
	if(index==4){
		if(checkDeviceName("cameraName") == false)
			return false;

	if(document.form1.cameraName.value == ""){
		alertAndSelect(document.form1.cameraName,cameraNameError);
		return false;
	}
	
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="";
		document.getElementById("step6").style.display="none";
	}
	if(index==5){
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="";
		getTimeZone();
		if(document.form1.policy[0].checked)
			document.getElementById("result1").innerHTML = "DHCP";
		else
			document.getElementById("result1").innerHTML = document.form1.ip.value;
		document.getElementById("result2").innerHTML = document.form1.cameraName.value;
		document.getElementById("result3").innerHTML = timeZoneData;
		if(document.form1.ddnsBox.checked)
			document.getElementById("result4").innerHTML = enable;
		else
			document.getElementById("result4").innerHTML = disable;
		if(document.form1.pppoeEnableBox.checked)
			document.getElementById("result5").innerHTML = enable;
		else
			document.getElementById("result5").innerHTML = disable;
		
		
		
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
//		document.form1.upnp.disabled=false;
//		document.form1.upnpPort.disabled=false;
	}else if(index==4){
		document.form1.dhcp.disabled=false;
		document.form1.static.disabled=false;
		document.form1.ip.disabled=false;
		document.form1.netmask.disabled=false;
		document.form1.router.disabled=false;
		document.form1.pridns.disabled=false;
		document.form1.secdns.disabled=false;
//		document.form1.upnp.disabled=false;
//		document.form1.upnpPort.disabled=false;
	}
	else if(index==5)
	{
		document.form1.auto.disabled=false;
		document.form1.manualDST.disabled=false;
		document.form1.offset.disabled=true;
//		document.form1.offsetHours.disabled=true;
//		document.form1.offsetMins.disabled=true;
		document.form1.startTimeMon.disabled=true;
		document.form1.startTimeWeek.disabled=true;
		document.form1.startTimeDayOfWeek.disabled=true;
		document.form1.startTimeHours.disabled=true;
		document.form1.startTimeMins.disabled=true;
//		document.form1.startTimeSecs.disabled=true;
		document.form1.endTimeMon.disabled=true;
		document.form1.endTimeWeek.disabled=true;
		document.form1.endTimeDayOfWeek.disabled=true;
		document.form1.endTimeHours.disabled=true;
		document.form1.endTimeMins.disabled=true;
	}
	else if(index==6)
	{
		document.form1.auto.disabled=false;
		document.form1.manualDST.disabled=false;
		document.form1.offset.disabled=false;
//		document.form1.offsetHours.disabled=false;
//		document.form1.offsetMins.disabled=false;
		document.form1.startTimeMon.disabled=false;
		document.form1.startTimeWeek.disabled=false;
		document.form1.startTimeDayOfWeek.disabled=false;
		document.form1.startTimeHours.disabled=false;
		document.form1.startTimeMins.disabled=false;
//		document.form1.startTimeSecs.disabled=false;
		document.form1.endTimeMon.disabled=false;
		document.form1.endTimeWeek.disabled=false;
		document.form1.endTimeDayOfWeek.disabled=false;
		document.form1.endTimeHours.disabled=false;
		document.form1.endTimeMins.disabled=false;
	}
	else if(index==7)
	{
		document.form1.auto.disabled=true;
		document.form1.manualDST.disabled=true;
		document.form1.offset.disabled=true;
//		document.form1.offsetHours.disabled=true;
//		document.form1.offsetMins.disabled=true;
		document.form1.startTimeMon.disabled=true;
		document.form1.startTimeWeek.disabled=true;
		document.form1.startTimeDayOfWeek.disabled=true;
		document.form1.startTimeHours.disabled=true;
		document.form1.startTimeMins.disabled=true;
//		document.form1.startTimeSecs.disabled=true;
		document.form1.endTimeMon.disabled=true;
		document.form1.endTimeWeek.disabled=true;
		document.form1.endTimeDayOfWeek.disabled=true;
		document.form1.endTimeHours.disabled=true;
		document.form1.endTimeMins.disabled=true;
	
	
	}
	else if(index==1)
	{
		if(document.form1.enableDSTBox.checked){
			if(document.form1.autoDST[0].checked)
				changeMode(5);
			else
				changeMode(6);
		}
		else
			changeMode(7);
	
	}
}

//for pppoe
function changeMode6(){
	if(document.form1.pppoeEnableBox.checked){
		document.form1.pppoeName.disabled=false;
		document.form1.pppoePass.disabled=false;
//		document.form1.pppoeConfirm.disabled=false;
	}
	else{
		document.form1.pppoeName.disabled=true;
		document.form1.pppoePass.disabled=true;
//		document.form1.pppoeConfirm.disabled=true;
	}
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

function networkCheck(){
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

	return true;
}

function checkip(){
	var ip = get_by_id("ip").value;
	var temp_ip_obj = new addr_obj(ip.split("."), ipMessage1, false, ipMessage2, ipMessage3, -1, false);
		
	if (ip == ""){
		alert(ipError1);
		return false;
	}
	else {
		if (!check_address(temp_ip_obj))
            return false;
	}

	var sepIP = ip.split(".");

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

	return true;
}

function checkmask(){
	var mask = get_by_id("netmask").value;
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
		
	return true;
}
	
function checkrouter(){
	var router = get_by_id("router").value;
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
		
	return true;
}
	
function checkpridns(){
	var pridns = get_by_id("pridns").value;
	var temp_pridns_obj = new addr_obj(pridns.split("."), priDnsMessage1, false, priDnsMessage2, priDnsMessage3, -1, false);
	
	if (pridns != ""){
		if (!check_address(temp_pridns_obj)){
            return false;
	       }
	}
	
	return true;
}
	
function checksecdns(){
	var secdns = get_by_id("secdns").value;
	var temp_secdns_obj = new addr_obj(secdns.split("."), secDnsMessage1, false, secDnsMessage2, secDnsMessage3, -1, false);
		
	if (secdns != ""){
		if (!check_address(temp_secdns_obj)){
            return false;
	       }
	}
	
	return true;
}

function checkpppoe(){
	if(document.form1.pppoeEnableBox.checked){
		var pppoe_name = get_by_id("pppoeName").value;
		var pppoe_pass = get_by_id("pppoePass").value;
//		var pppoe_confirm = get_by_id("pppoeConfirm").value;

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
//		if (pppoe_confirm == ""){
//			alertAndSelect(document.form1.pppoeConfirm,pppoeError3);
//			return false;
//		}
//		if (pppoe_pass != pppoe_confirm){
//			alertAndSelect(document.form1.pppoeConfirm,pppoeError4);
//			return false;
//		}
	}

	return true;
}

function checkddns(){
	if(document.form1.ddnsBox.checked){
		var ddns_hostname = get_by_id("ddnsHostname").value;
		var ddns_username = get_by_id("ddnsUsername").value;
		var ddns_passwordword = get_by_id("ddnsPasswordword").value;
		var confim_Password = get_by_id("confimPassword").value;
		var ddns_timeout = get_by_id("ddnsTimeout").value;

		if(document.form1.providerValue.value == ""){
			alert(ddnsError6);
//			document.form1.providerDDNS.select();
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
	}

	return true;
}


]]>
</script>
<script language="JavaScript" type="text/javascript">
var hourError =  "<xsl:value-of select="root/lang/body/hourError" />";
var minuteError = "<xsl:value-of select="root/lang/body/minuteError" />";
var secondError = "<xsl:value-of select="root/lang/body/secondError" />";
var ipError1 = "<xsl:value-of select="root/lang/body/ipError1" />";
var subnetMaskError1 = "<xsl:value-of select="root/lang/body/subnetMaskError1" />";
var routerError1 = "<xsl:value-of select="root/lang/body/routerError1" />";
var pppoeError1 = "<xsl:value-of select="root/lang/body/pppoeError1" />";
var pppoeError2 = "<xsl:value-of select="root/lang/body/pppoeError2" />";
var pppoeError3 = "<xsl:value-of select="root/lang/body/pppoeError3" />";
var pppoeError4 = "<xsl:value-of select="root/lang/body/pppoeError4" />";
var pppoeError5 = "<xsl:value-of select="root/lang/body/pppoeError5" />";
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
var ddnsError1 = "<xsl:value-of select="root/lang/body/ddnsError1" />";
var ddnsError2 = "<xsl:value-of select="root/lang/body/ddnsError2" />";
var ddnsError3 = "<xsl:value-of select="root/lang/body/ddnsError3" />";
var ddnsError4 = "<xsl:value-of select="root/lang/body/ddnsError4" />";
var ddnsError5 = "<xsl:value-of select="root/lang/body/ddnsError5" />";
var ddnsError6 = "<xsl:value-of select="root/lang/body/ddnsError6" />";
var ddnsError7 = "<xsl:value-of select="root/lang/body/ddnsError7" />";
var ddnsError8 = "<xsl:value-of select="root/lang/body/ddnsError8" />";
var enable = "<xsl:value-of select="root/lang/body/enable" />";
var disable = "<xsl:value-of select="root/lang/body/disable" />";
var cameraNameError = "<xsl:value-of select="root/lang/body/cameraNameError" />";

function initcheck(){
	//for network
	if(document.form1.policy[0].checked)
		changeMode(3);
	else
		changeMode(4);
	
	//for pppoe
	changeMode6();
	//for ddns
	changeMode4();
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

function initForm() 
{
	if ('<xsl:value-of select="/root/result/code" />' == 'ok'){
		begin_count();
		document.getElementById("below").style.display="none";	
		document.getElementById("step0").style.display="none";
		document.getElementById("step1").style.display="none";
		document.getElementById("step2").style.display="none";
		document.getElementById("step3").style.display="none";
		document.getElementById("step4").style.display="none";
		document.getElementById("step5").style.display="none";
		document.getElementById("step6").style.display="";
		document.getElementById("hideResult").style.display="none";
	}
		
	//checkbox
	if ('<xsl:value-of select="root/config/time/enableDST" />' == '1')
		document.form1.enableDSTBox.checked=true;
	if ('<xsl:value-of select="root/config/network/pppoe/enable" />' == '1')
		document.form1.pppoeEnableBox.checked=true;
	if ('<xsl:value-of select="root/config/network/ddns/enable" />' == '1')
		document.form1.ddnsBox.checked=true;
/*
	if ('<xsl:value-of select="root/config/network/lan/upnpPort" />' == 'on')
		document.form1.upnpPort.checked=true;
	if ('<xsl:value-of select="root/config/network/pppoe/enable" />' == '1')
		document.form1.pppoeEnableBox.checked=true;
	*/

	//radio
	if ('<xsl:value-of select="root/config/network/lan/policy" />' == '0')
		document.form1.dhcp.checked=true;
	if ('<xsl:value-of select="root/config/network/lan/policy" />' == '1')
		document.form1.static.checked=true;
//	if ('<xsl:value-of select="root/config/network/pppoe/enable" />' == '0')
//		document.form1.pppoe_disable.checked=true;
//	if ('<xsl:value-of select="root/config/network/pppoe/enable" />' == '1')
//		document.form1.pppoe_enable.checked=true;
//	if ('<xsl:value-of select="root/config/network/ddns/enable" />' == '0')
//		document.form1.ddns_disable.checked=true;
//	if ('<xsl:value-of select="root/config/network/ddns/enable" />' == '1')
//		document.form1.ddns_enable.checked=true;

	//select
	//ddns
	if ('<xsl:value-of select="root/config/network/ddns/provider" />' == 'dlinkddns')
		document.form1.providerValue.value = "<xsl:value-of select="root/lang/body/ddns1" />";
	if ('<xsl:value-of select="root/config/network/ddns/provider" />' == 'dyndns')
		document.form1.providerValue.value = "<xsl:value-of select="root/lang/body/ddns2" />";

	//timezone
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '1')
		document.form1.timeZoneIndex.value = '1';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '2')
		document.form1.timeZoneIndex.value = '2';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '3')
		document.form1.timeZoneIndex.value = '3';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '4')
		document.form1.timeZoneIndex.value = '4';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '5')
		document.form1.timeZoneIndex.value = '5';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '6')
		document.form1.timeZoneIndex.value = '6';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '7')
		document.form1.timeZoneIndex.value = '7';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '8')
		document.form1.timeZoneIndex.value = '8';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '9')
		document.form1.timeZoneIndex.value = '9';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '10')
		document.form1.timeZoneIndex.value = '10';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '11')
		document.form1.timeZoneIndex.value = '11';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '12')
		document.form1.timeZoneIndex.value = '12';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '13')
		document.form1.timeZoneIndex.value = '13';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '14')
		document.form1.timeZoneIndex.value = '14';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '15')
		document.form1.timeZoneIndex.value = '15';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '16')
		document.form1.timeZoneIndex.value = '16';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '17')
		document.form1.timeZoneIndex.value = '17';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '18')
		document.form1.timeZoneIndex.value = '18';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '19')
		document.form1.timeZoneIndex.value = '19';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '20')
		document.form1.timeZoneIndex.value = '20';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '21')
		document.form1.timeZoneIndex.value = '21';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '22')
		document.form1.timeZoneIndex.value = '22';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '23')
		document.form1.timeZoneIndex.value = '23';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '24')
		document.form1.timeZoneIndex.value = '24';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '25')
		document.form1.timeZoneIndex.value = '25';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '26')
		document.form1.timeZoneIndex.value = '26';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '27')
		document.form1.timeZoneIndex.value = '27';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '28')
		document.form1.timeZoneIndex.value = '28';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '29')
		document.form1.timeZoneIndex.value = '29';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '30')
		document.form1.timeZoneIndex.value = '30';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '31')
		document.form1.timeZoneIndex.value = '31';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '32')
		document.form1.timeZoneIndex.value = '32';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '33')
		document.form1.timeZoneIndex.value = '33';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '34')
		document.form1.timeZoneIndex.value = '34';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '35')
		document.form1.timeZoneIndex.value = '35';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '36')
		document.form1.timeZoneIndex.value = '36';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '37')
		document.form1.timeZoneIndex.value = '37';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '38')
		document.form1.timeZoneIndex.value = '38';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '39')
		document.form1.timeZoneIndex.value = '39';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '40')
		document.form1.timeZoneIndex.value = '40';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '41')
		document.form1.timeZoneIndex.value = '41';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '42')
		document.form1.timeZoneIndex.value = '42';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '43')
		document.form1.timeZoneIndex.value = '43';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '44')
		document.form1.timeZoneIndex.value = '44';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '45')
		document.form1.timeZoneIndex.value = '45';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '46')
		document.form1.timeZoneIndex.value = '46';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '47')
		document.form1.timeZoneIndex.value = '47';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '48')
		document.form1.timeZoneIndex.value = '48';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '49')
		document.form1.timeZoneIndex.value = '49';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '50')
		document.form1.timeZoneIndex.value = '50';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '51')
		document.form1.timeZoneIndex.value = '51';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '52')
		document.form1.timeZoneIndex.value = '52';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '53')
		document.form1.timeZoneIndex.value = '53';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '54')
		document.form1.timeZoneIndex.value = '54';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '55')
		document.form1.timeZoneIndex.value = '55';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '56')
		document.form1.timeZoneIndex.value = '56';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '57')
		document.form1.timeZoneIndex.value = '57';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '58')
		document.form1.timeZoneIndex.value = '58';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '59')
		document.form1.timeZoneIndex.value = '59';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '60')
		document.form1.timeZoneIndex.value = '60';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '61')
		document.form1.timeZoneIndex.value = '61';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '62')
		document.form1.timeZoneIndex.value = '62';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '63')
		document.form1.timeZoneIndex.value = '63';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '64')
		document.form1.timeZoneIndex.value = '64';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '65')
		document.form1.timeZoneIndex.value = '65';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '66')
		document.form1.timeZoneIndex.value = '66';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '67')
		document.form1.timeZoneIndex.value = '67';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '68')
		document.form1.timeZoneIndex.value = '68';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '69')
		document.form1.timeZoneIndex.value = '69';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '70')
		document.form1.timeZoneIndex.value = '70';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '71')
		document.form1.timeZoneIndex.value = '71';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '72')
		document.form1.timeZoneIndex.value = '72';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '73')
		document.form1.timeZoneIndex.value = '73';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '74')
		document.form1.timeZoneIndex.value = '74';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '75')
		document.form1.timeZoneIndex.value = '75';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '76')
		document.form1.timeZoneIndex.value = '76';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '77')
		document.form1.timeZoneIndex.value = '77';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '78')
		document.form1.timeZoneIndex.value = '78';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '79')
		document.form1.timeZoneIndex.value = '79';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '80')
		document.form1.timeZoneIndex.value = '80';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '81')
		document.form1.timeZoneIndex.value = '81';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '82')
		document.form1.timeZoneIndex.value = '82';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '83')
		document.form1.timeZoneIndex.value = '83';
	var startTime = "<xsl:value-of select="root/config/time/startTime" />";
	var endTime = "<xsl:value-of select="root/config/time/endTime" />";	
	document.form1.startTime.value = startTime;
	document.form1.endTime.value = endTime;
	sepDatAndTime(startTime,endTime);
	setZoneIndexAndOffset();
	if(document.form1.enableDSTBox.checked){
		if(document.form1.autoDST[0].checked)
		{
			changeMode(5);	
		}
		else
		{
			changeMode(6);
		}
	}
	else
		changeMode(7);
	

	

}
function sepDatAndTime(startTimeValue,endTimeValue){
	var splitOffset;
	var splitStartTime;
	var splitStartTimeA;
	var splitStartTimeB;
	var splitEndTime;
	var splitEndTimeA;
	var splitEndTimeB;
//	splitOffset = offsetValue.split(":");
//	document.form1.offsetHours.value = splitOffset[0];
//	document.form1.offsetMins.value = splitOffset[1];
	
	//part1
	splitStartTime = startTimeValue.split("/");
	splitStartTimeA = splitStartTime[0].split(".");
	if(splitStartTimeA[0].length == 2)
		document.form1.startTimeMon.value = splitStartTimeA[0].substring(1,2);
	else
		document.form1.startTimeMon.value = splitStartTimeA[0].substring(1,3);
	document.form1.startTimeWeek.value = splitStartTimeA[1];
	document.form1.startTimeDayOfWeek.value = splitStartTimeA[2];
	//part2
	splitStartTimeB = splitStartTime[1].split(":");
	document.form1.startTimeHours.value = splitStartTimeB[0];
	document.form1.startTimeMins.value = splitStartTimeB[1];
//	document.form1.startTimeSecs.value = splitStartTimeB[2];
	
	//part1
	splitEndTime = endTimeValue.split("/");
	splitEndTimeA = splitEndTime[0].split(".");
	if(splitEndTimeA[0].length == 2)
		document.form1.endTimeMon.value = splitEndTimeA[0].substring(1,2);
	else
		document.form1.endTimeMon.value = splitEndTimeA[0].substring(1,3);
	document.form1.endTimeWeek.value = splitEndTimeA[1];
	document.form1.endTimeDayOfWeek.value = splitEndTimeA[2];
	//part2
	splitEndTimeB = splitEndTime[1].split(":");
	document.form1.endTimeHours.value = splitEndTimeB[0];
	document.form1.endTimeMins.value = splitEndTimeB[1];
//	document.form1.endTimeSecs.value = splitEndTimeB[2];
}
function setZoneIndexAndOffset()
{
	if ('<xsl:value-of select="root/config/time/autoDST" />' == '0')
		document.form1.manualDST.checked=true;
	if ('<xsl:value-of select="root/config/time/autoDST" />' == '1')
		document.form1.auto.checked=true;

	//select
	//timezone
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '1')
		document.form1.timeZoneIndex.value = '1';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '2')
		document.form1.timeZoneIndex.value = '2';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '3')
		document.form1.timeZoneIndex.value = '3';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '4')
		document.form1.timeZoneIndex.value = '4';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '5')
		document.form1.timeZoneIndex.value = '5';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '6')
		document.form1.timeZoneIndex.value = '6';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '7')
		document.form1.timeZoneIndex.value = '7';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '8')
		document.form1.timeZoneIndex.value = '8';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '9')
		document.form1.timeZoneIndex.value = '9';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '10')
		document.form1.timeZoneIndex.value = '10';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '11')
		document.form1.timeZoneIndex.value = '11';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '12')
		document.form1.timeZoneIndex.value = '12';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '13')
		document.form1.timeZoneIndex.value = '13';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '14')
		document.form1.timeZoneIndex.value = '14';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '15')
		document.form1.timeZoneIndex.value = '15';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '16')
		document.form1.timeZoneIndex.value = '16';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '17')
		document.form1.timeZoneIndex.value = '17';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '18')
		document.form1.timeZoneIndex.value = '18';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '19')
		document.form1.timeZoneIndex.value = '19';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '20')
		document.form1.timeZoneIndex.value = '20';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '21')
		document.form1.timeZoneIndex.value = '21';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '22')
		document.form1.timeZoneIndex.value = '22';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '23')
		document.form1.timeZoneIndex.value = '23';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '24')
		document.form1.timeZoneIndex.value = '24';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '25')
		document.form1.timeZoneIndex.value = '25';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '26')
		document.form1.timeZoneIndex.value = '26';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '27')
		document.form1.timeZoneIndex.value = '27';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '28')
		document.form1.timeZoneIndex.value = '28';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '29')
		document.form1.timeZoneIndex.value = '29';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '30')
		document.form1.timeZoneIndex.value = '30';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '31')
		document.form1.timeZoneIndex.value = '31';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '32')
		document.form1.timeZoneIndex.value = '32';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '33')
		document.form1.timeZoneIndex.value = '33';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '34')
		document.form1.timeZoneIndex.value = '34';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '35')
		document.form1.timeZoneIndex.value = '35';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '36')
		document.form1.timeZoneIndex.value = '36';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '37')
		document.form1.timeZoneIndex.value = '37';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '38')
		document.form1.timeZoneIndex.value = '38';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '39')
		document.form1.timeZoneIndex.value = '39';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '40')
		document.form1.timeZoneIndex.value = '40';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '41')
		document.form1.timeZoneIndex.value = '41';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '42')
		document.form1.timeZoneIndex.value = '42';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '43')
		document.form1.timeZoneIndex.value = '43';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '44')
		document.form1.timeZoneIndex.value = '44';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '45')
		document.form1.timeZoneIndex.value = '45';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '46')
		document.form1.timeZoneIndex.value = '46';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '47')
		document.form1.timeZoneIndex.value = '47';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '48')
		document.form1.timeZoneIndex.value = '48';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '49')
		document.form1.timeZoneIndex.value = '49';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '50')
		document.form1.timeZoneIndex.value = '50';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '51')
		document.form1.timeZoneIndex.value = '51';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '52')
		document.form1.timeZoneIndex.value = '52';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '53')
		document.form1.timeZoneIndex.value = '53';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '54')
		document.form1.timeZoneIndex.value = '54';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '55')
		document.form1.timeZoneIndex.value = '55';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '56')
		document.form1.timeZoneIndex.value = '56';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '57')
		document.form1.timeZoneIndex.value = '57';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '58')
		document.form1.timeZoneIndex.value = '58';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '59')
		document.form1.timeZoneIndex.value = '59';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '60')
		document.form1.timeZoneIndex.value = '60';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '61')
		document.form1.timeZoneIndex.value = '61';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '62')
		document.form1.timeZoneIndex.value = '62';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '63')
		document.form1.timeZoneIndex.value = '63';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '64')
		document.form1.timeZoneIndex.value = '64';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '65')
		document.form1.timeZoneIndex.value = '65';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '66')
		document.form1.timeZoneIndex.value = '66';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '67')
		document.form1.timeZoneIndex.value = '67';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '68')
		document.form1.timeZoneIndex.value = '68';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '69')
		document.form1.timeZoneIndex.value = '69';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '70')
		document.form1.timeZoneIndex.value = '70';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '71')
		document.form1.timeZoneIndex.value = '71';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '72')
		document.form1.timeZoneIndex.value = '72';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '73')
		document.form1.timeZoneIndex.value = '73';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '74')
		document.form1.timeZoneIndex.value = '74';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '75')
		document.form1.timeZoneIndex.value = '75';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '76')
		document.form1.timeZoneIndex.value = '76';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '77')
		document.form1.timeZoneIndex.value = '77';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '78')
		document.form1.timeZoneIndex.value = '78';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '79')
		document.form1.timeZoneIndex.value = '79';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '80')
		document.form1.timeZoneIndex.value = '80';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '81')
		document.form1.timeZoneIndex.value = '81';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '82')
		document.form1.timeZoneIndex.value = '82';
	if ('<xsl:value-of select="root/config/time/timeZoneIndex" />' == '83')
		document.form1.timeZoneIndex.value = '83';
		
	//offset
	if ('<xsl:value-of select="root/config/time/offset" />' == '2:00')
		document.form1.offset.value = '2:00';
	if ('<xsl:value-of select="root/config/time/offset" />' == '1:30')
		document.form1.offset.value = '1:30';
	if ('<xsl:value-of select="root/config/time/offset" />' == '1:00')
		document.form1.offset.value = '1:00';
	if ('<xsl:value-of select="root/config/time/offset" />' == '0:30')
		document.form1.offset.value = '0:30';
	if ('<xsl:value-of select="root/config/time/offset" />' == '0:00')
		document.form1.offset.value = '0:00';
	if ('<xsl:value-of select="root/config/time/offset" />' == '-0:30')
		document.form1.offset.value = '-0:30';
	if ('<xsl:value-of select="root/config/time/offset" />' == '-1:00')
		document.form1.offset.value = '-1:00';
	if ('<xsl:value-of select="root/config/time/offset" />' == '-1:30')
		document.form1.offset.value = '-1:30';
	if ('<xsl:value-of select="root/config/time/offset" />' == '-2:00')
		document.form1.offset.value = '-2:00';

}
var timeZoneData;
function getTimeZone(){
	if (document.form1.timeZoneIndex.value == '1')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone1" />';
	if (document.form1.timeZoneIndex.value == '2')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone2" />';
	if (document.form1.timeZoneIndex.value == '3')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone3" />';
	if (document.form1.timeZoneIndex.value == '4')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone4" />';
	if (document.form1.timeZoneIndex.value == '5')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone5" />';
	if (document.form1.timeZoneIndex.value == '6')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone6" />';
	if (document.form1.timeZoneIndex.value == '7')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone7" />';
	if (document.form1.timeZoneIndex.value == '8')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone8" />';
	if (document.form1.timeZoneIndex.value == '9')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone9" />';
	if (document.form1.timeZoneIndex.value == '10')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone10" />';
	if (document.form1.timeZoneIndex.value == '11')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone11" />';
	if (document.form1.timeZoneIndex.value == '12')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone12" />';
	if (document.form1.timeZoneIndex.value == '13')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone13" />';
	if (document.form1.timeZoneIndex.value == '14')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone14" />';
	if (document.form1.timeZoneIndex.value == '15')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone15" />';
	if (document.form1.timeZoneIndex.value == '16')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone16" />';
	if (document.form1.timeZoneIndex.value == '17')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone17" />';
	if (document.form1.timeZoneIndex.value == '18')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone18" />';
	if (document.form1.timeZoneIndex.value == '19')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone19" />';
	if (document.form1.timeZoneIndex.value == '20')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone20" />';
	if (document.form1.timeZoneIndex.value == '21')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone21" />';
	if (document.form1.timeZoneIndex.value == '22')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone22" />';
	if (document.form1.timeZoneIndex.value == '23')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone23" />';
	if (document.form1.timeZoneIndex.value == '24')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone24" />';
	if (document.form1.timeZoneIndex.value == '25')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone25" />';
	if (document.form1.timeZoneIndex.value == '26')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone26" />';
	if (document.form1.timeZoneIndex.value == '27')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone27" />';
	if (document.form1.timeZoneIndex.value == '28')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone28" />';
	if (document.form1.timeZoneIndex.value == '29')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone29" />';
	if (document.form1.timeZoneIndex.value == '30')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone30" />';
	if (document.form1.timeZoneIndex.value == '31')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone31" />';
	if (document.form1.timeZoneIndex.value == '32')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone32" />';
	if (document.form1.timeZoneIndex.value == '33')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone33" />';
	if (document.form1.timeZoneIndex.value == '34')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone34" />';
	if (document.form1.timeZoneIndex.value == '35')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone35" />';
	if (document.form1.timeZoneIndex.value == '36')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone36" />';
	if (document.form1.timeZoneIndex.value == '37')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone37" />';
	if (document.form1.timeZoneIndex.value == '38')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone38" />';
	if (document.form1.timeZoneIndex.value == '39')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone39" />';
	if (document.form1.timeZoneIndex.value == '40')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone40" />';
	if (document.form1.timeZoneIndex.value == '41')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone41" />';
	if (document.form1.timeZoneIndex.value == '42')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone42" />';
	if (document.form1.timeZoneIndex.value == '43')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone43" />';
	if (document.form1.timeZoneIndex.value == '44')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone44" />';
	if (document.form1.timeZoneIndex.value == '45')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone45" />';
	if (document.form1.timeZoneIndex.value == '46')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone46" />';
	if (document.form1.timeZoneIndex.value == '47')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone47" />';
	if (document.form1.timeZoneIndex.value == '48')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone48" />';
	if (document.form1.timeZoneIndex.value == '49')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone49" />';
	if (document.form1.timeZoneIndex.value == '50')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone50" />';
	if (document.form1.timeZoneIndex.value == '51')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone51" />';
	if (document.form1.timeZoneIndex.value == '52')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone52" />';
	if (document.form1.timeZoneIndex.value == '53')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone53" />';
	if (document.form1.timeZoneIndex.value == '54')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone54" />';
	if (document.form1.timeZoneIndex.value == '55')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone55" />';
	if (document.form1.timeZoneIndex.value == '56')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone56" />';
	if (document.form1.timeZoneIndex.value == '57')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone57" />';
	if (document.form1.timeZoneIndex.value == '58')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone58" />';
	if (document.form1.timeZoneIndex.value == '59')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone59" />';
	if (document.form1.timeZoneIndex.value == '60')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone60" />';
	if (document.form1.timeZoneIndex.value == '61')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone61" />';
	if (document.form1.timeZoneIndex.value == '62')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone62" />';
	if (document.form1.timeZoneIndex.value == '63')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone63" />';
	if (document.form1.timeZoneIndex.value == '64')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone64" />';
	if (document.form1.timeZoneIndex.value == '65')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone65" />';
	if (document.form1.timeZoneIndex.value == '66')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone66" />';
	if (document.form1.timeZoneIndex.value == '67')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone67" />';
	if (document.form1.timeZoneIndex.value == '68')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone68" />';
	if (document.form1.timeZoneIndex.value == '69')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone69" />';
	if (document.form1.timeZoneIndex.value == '70')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone70" />';
	if (document.form1.timeZoneIndex.value == '71')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone71" />';
	if (document.form1.timeZoneIndex.value == '72')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone72" />';
	if (document.form1.timeZoneIndex.value == '73')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone73" />';
	if (document.form1.timeZoneIndex.value == '74')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone74" />';
	if (document.form1.timeZoneIndex.value == '75')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone75" />';
	if (document.form1.timeZoneIndex.value == '76')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone76" />';
	if (document.form1.timeZoneIndex.value == '77')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone77" />';
	if (document.form1.timeZoneIndex.value == '78')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone78" />';
	if (document.form1.timeZoneIndex.value == '79')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone79" />';
	if (document.form1.timeZoneIndex.value == '80')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone80" />';
	if (document.form1.timeZoneIndex.value == '81')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone81" />';
	if (document.form1.timeZoneIndex.value == '82')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone82" />';
	if (document.form1.timeZoneIndex.value == '83')
		timeZoneData = '<xsl:value-of select="root/lang/body/timeZone83" />';
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

var count=45;
var timeoutID;
function begin_count()
{
	timeoutID = window.setInterval("ShowRealTime()", 1000)
	document.getElementById("leavetime").innerHTML = count + " ";
	document.form1.button19.disabled=true;
	document.form1.button20.disabled=true;
	document.form1.button21.disabled=true;
}

function ShowRealTime() {
	count--;
	document.getElementById("leavetime").innerHTML = count + " ";
	if(count==0)
	{
		count = 1;
//		var port = <xsl:value-of select="root/config/http/httpPort" />;
//		var lang = readCookie('language');
//		location.href = "http://" + window.location.hostname + "/" + lang + "/admin/netWizard.cgi";
		location.href='adv_wizard.cgi';
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
	<table id="toppic_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="../images/dlink.gif" width="836" height="92" /></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF" style="display:none">
		<tr id="topnav_container">
			<td><img src="../images/dcs_2102.gif" width="129" height="28" /></td>
			<td id="topnavoff"><a href="../index.cgi"><xsl:value-of select="root/lang/frame/home" /></a></td>
			<td id="topnavon"><a href="adv_lan.cgi"><xsl:value-of select="root/lang/frame/advanced" /></a></td>
			<td id="topnavoff"><a href="tools_admin.cgi"><xsl:value-of select="root/lang/frame/tools" /></a></td>
			<td id="topnavoff"><a href="st_device.cgi"><xsl:value-of select="root/lang/frame/status" /></a></td>
			<td id="topnavoff"><a href="support_men.cgi"><xsl:value-of select="root/lang/frame/support" /></a></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
	<tr><td>
	<table border="0" cellpadding="2" cellspacing="0" width="830" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
		  <td id="" valign="top" width="125" align="left">
				<table cellspacing="0" cellpadding="0" border="0" style="display:none">
                  <tbody>
                    <tr>
                      <td id="sidenav_container">
                        <div id="sidenav">
                          <ul>
							<li>
                              <div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/wizard" /></div>
                            </li>
                            <li>
                              <div><a href="adv_lan.cgi"><xsl:value-of select="root/lang/leftPanel/networkSettings" /></a></div>
                            </li>
						    <li>
                              <div><a href="adv_ddns.cgi"><xsl:value-of select="root/lang/leftPanel/ddns" /></a></div>
                            </li>
						    <li id="wirelessShow" name="wirelessShow">
                              <div><a href="adv_wireless.cgi"><xsl:value-of select="root/lang/leftPanel/sitesurvey" /></a></div>
                            </li>
                            <li>
                              <div><a href="adv_mail_ftp.cgi"><xsl:value-of select="root/lang/leftPanel/mailFtp" /></a></div>
                            </li>
						    <li>
                              <div><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/leftPanel/audioVideo" /></a></div>
                            </li>
						    <li>
                              <div><a href="adv_image.cgi"><xsl:value-of select="root/lang/leftPanel/imageSettings" /></a></div>
                            </li>
							<li>
                              <div><a href="mot_detect.cgi"><xsl:value-of select="root/lang/leftPanel/motionDetection" /></a></div>
                            </li>
							<li id="camControlShow" name="camControlShow">
                              <div><a href="cam_control.cgi"><xsl:value-of select="root/lang/leftPanel/cameraControl" /></a></div>
                            </li>
							<li>
                              <div><a href="recorder.cgi"><xsl:value-of select="root/lang/leftPanel/recording" /></a></div>
                            </li>
							<li>
                              <div><a href="adv_snapshot_cont.cgi"><xsl:value-of select="root/lang/leftPanel/snapshot" /></a></div>
                            </li>
							<li>
                              <div><a href="tools_system.cgi"><xsl:value-of select="root/lang/leftPanel/system" /></a></div>
                            </li>
                          </ul>
                      </div></td>
                    </tr>
                  </tbody>
              </table></td>
                <form id="form1" name="form1" method="post" action="netWizard.cgi">
			<td valign="top" id="maincontent_container" height="500">
			<p>&nbsp;</p>
			  <div id="maincontent">
			  	<div id="step0">
                <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/welcome" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /><br /><br />
					<table cellspacing="1" cellpadding="1" width="200" border="0" align="center">
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step1" /><xsl:value-of select="root/lang/body/note1" /></li></td>
					  </tr>
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step2" /><xsl:value-of select="root/lang/body/note2" /></li>					</td>
					  </tr>
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step3" /><xsl:value-of select="root/lang/body/note3" /></li></td>
					  </tr>
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step4" /><xsl:value-of select="root/lang/body/note4" /></li></td>
					  </tr>
					<tr>
						<td><li><xsl:value-of select="root/lang/body/step5" /><xsl:value-of select="root/lang/body/note5" /></li></td>
					  </tr>
					</table>
					<br />
					<div align="center">
					<input name="button1" type="button" class="button_submit" value="{root/lang/body/back}" onclick="window.location.href='adv_wizard.cgi'" />
					<input name="button2" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(0)" />
					<input name="button3" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                </div>
				</div>
			  	<div id="step1" style="display:none">
                  <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step1" /><xsl:value-of select="root/lang/body/note1" /></h1>
                    <xsl:value-of select="root/lang/body/description2" /><br /><br />
					<table cellspacing="1" cellpadding="1" width="300" border="0" align="center">
					<tr>
						<td width="150"><input onclick="changeMode(3)" type="radio" value="0" name="policy" id="dhcp"/>
						<xsl:value-of select="root/lang/body/dhcp" /></td>
						<td width="150">&nbsp;</td>
					</tr>
					<tr>
						<td><input onclick="changeMode(4)" type="radio" value="1" name="policy" id="static" />
						<xsl:value-of select="root/lang/body/static" /></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/ip" /></td>
						<td><input maxlength="15" size="15" value="{root/config/network/lan/static/ip}" name="ip" id="ip" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/mask" /></td>
						<td><input maxlength="15" size="15" value="{root/config/network/lan/static/netmask}" name="netmask" id="netmask" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/gateway" /></td>
						<td><input maxlength="15" size="15" value="{root/config/network/lan/static/router}" name="router" id="router" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/priDns" /></td>
						<td><input maxlength="15" size="15" value="{root/config/network/lan/static/pridns}" name="pridns" id="pridns" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/secDns" /></td>
						<td><input maxlength="15" size="15" value="{root/config/network/lan/static/secdns}" name="secdns" id="secdns" /></td>
					</tr>
					</table>
					<br />
					<div align="center">
						<input name="button4" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(1)" />
						<input name="button5" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(1)" />
						<input name="button6" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                </div>
				</div>
			  	<div id="step2" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step2" /><xsl:value-of select="root/lang/body/note2" /></h1>
			        <xsl:value-of select="root/lang/body/description3" /><br /><br />
					<table cellspacing="1" cellpadding="1" width="400" border="0" align="center">
					<tr>
					  <td width="70">
						<input type="checkbox" name="pppoeEnableBox" id="pppoeEnableBox" onclick="changeMode6()" />
                        <input name="pppoeEnable" id="pppoeEnable" type="hidden" size="1" value="0" />
                        <xsl:value-of select="root/lang/body/enabled" /></td>
						<td width="330">&nbsp;</td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/username" /></td>
					  <td><input maxlength="60" size="30" value="{root/config/network/pppoe/pppoeName}" name="pppoeName" id="pppoeName" /></td>
					</tr>
					<tr>
						<td></td><td><xsl:value-of select="root/lang/body/eq" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/password" /></td>
						<td><input type="password" maxlength="60" size="30" value="{root/config/network/pppoe/pppoePass}" name="pppoePass" id="pppoePass" /></td>
					</tr>
<!--					<tr>
						<td><xsl:value-of select="root/lang/body/password" /></td>
						<td><input type="password" maxlength="60" size="30" value="{root/config/network/pppoe/pppoeConfirm}" name="pppoeConfirm" id="pppoeConfirm" /></td>
					</tr>
-->
					</table>
                    <br />
					<div align="center">
						<input name="button7" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(2)" />
						<input name="button8" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(2)" />
						<input name="button9" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
			  	<div id="step3" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step3" /><xsl:value-of select="root/lang/body/note3" /></h1>
                    
			        <xsl:value-of select="root/lang/body/description4" /><br /><br />
                    <xsl:value-of select="root/lang/body/signupMsg" />
                    <a href="http://www.dlinkddns.com/" target="_blank">www.DlinkDDNS.com</a>.<br /><br />
					<table cellspacing="1" cellpadding="1" width="500" border="0" align="center">
                    
					<tr>
						<td width="150"><input type="checkbox" name="ddnsBox" id="ddnsBox" onclick="changeMode4()"/>
						<input name="ddns" id="ddns" type="hidden" size="3" value="off" />
						<xsl:value-of select="root/lang/body/enable" /></td>
						<td width="350">&nbsp;</td>
					</tr>
                    <tr>
						<td><xsl:value-of select="root/lang/body/serverAddress" /></td>
						<td><input maxlength="60" size="20" name="providerValue" id="providerValue" value="" /> &lt;&lt; 
							<select name="providerDDNS" id="providerDDNS" onclick="changeMode3()" onchange="changeMode3()">
                              <option value="0"><xsl:value-of select="root/lang/body/selectDDNS" /></option>
							  <option value="1"><xsl:value-of select="root/lang/body/ddns1" /></option>
							  <option value="2"><xsl:value-of select="root/lang/body/ddns2" /></option>
							</select>
							<input name="provider" id="provider" type="hidden" size="10" value="" />
							  </td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/hostName" /></td>
						<td><input maxlength="60" size="20" name="ddnsHostname" id="ddnsHostname" value="{root/config/network/ddns/ddnsHostname}" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/usernameOrKey" /></td>
						<td><input maxlength="60" size="20" name="ddnsUsername" id="ddnsUsername" value="{root/config/network/ddns/ddnsUsername}" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/passwordOrKey" /></td>
						<td><input type="password" maxlength="60" size="20" name="ddnsPassword" id="ddnsPasswordword" value="{root/config/network/ddns/ddnsPassword}" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/verifyPassword" /></td>
						<td><input type="password" maxlength="60" size="20" name="confimPassword" id="confimPassword" value="{root/config/network/ddns/ddnsPassword}" /></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/timeout" /></td>
						<td><input maxlength="60" size="20" name="ddnsTimeout" id="ddnsTimeout" value="{root/config/network/ddns/ddnsTimeout}" />
						<xsl:value-of select="root/lang/body/hours" /></td>
					</tr>
					</table>
                    <br />
					<div align="center">
						<input name="button10" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(3)" />
						<input name="button11" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(3)" />
						<input name="button12" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
			  	<div id="step4" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step4" /><xsl:value-of select="root/lang/body/note4" /></h1>
			        <xsl:value-of select="root/lang/body/description5" /><br /><br />
					<table cellspacing="1" cellpadding="1" width="270" border="0" align="center">
					<tr>
						<td width="120"><xsl:value-of select="root/lang/body/cameraName" /></td>
						<td width="150"><input maxlength="36" size="30" value="{root/common/cameraName}" name="cameraName" id="cameraName" />
						</td>
					</tr>
					</table>
                    <br />
					<div align="center">
						<input name="button13" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(4)" />
						<input name="button14" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(4)" />
						<input name="button15" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
				<div id="step5" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step5" /><xsl:value-of select="root/lang/body/note5" /></h1>
			        <xsl:value-of select="root/lang/body/description6" /><br /><br />
					<table cellspacing="1" cellpadding="1" width="500" border="0" align="center">
					<tr>
						<td colspan="9"><xsl:value-of select="root/lang/body/timeZone" />&nbsp;
						  <select name="timeZoneIndex" id="timeZoneIndex">
                            <option value="1"><xsl:value-of select="root/lang/body/timeZone1" /></option>
                            <option value="2"><xsl:value-of select="root/lang/body/timeZone2" /></option>
                            <option value="3"><xsl:value-of select="root/lang/body/timeZone3" /></option>
                            <option value="4"><xsl:value-of select="root/lang/body/timeZone4" /></option>
                            <option value="5"><xsl:value-of select="root/lang/body/timeZone5" /></option>
                            <option value="6"><xsl:value-of select="root/lang/body/timeZone6" /></option>
                            <option value="7"><xsl:value-of select="root/lang/body/timeZone7" /></option>
                            <option value="8"><xsl:value-of select="root/lang/body/timeZone8" /></option>
                            <option value="9"><xsl:value-of select="root/lang/body/timeZone9" /></option>
                            <option value="10"><xsl:value-of select="root/lang/body/timeZone10" /></option>
                            <option value="11"><xsl:value-of select="root/lang/body/timeZone11" /></option>
                            <option value="12"><xsl:value-of select="root/lang/body/timeZone12" /></option>
                            <option value="13"><xsl:value-of select="root/lang/body/timeZone13" /></option>
                            <option value="14"><xsl:value-of select="root/lang/body/timeZone14" /></option>
                            <option value="15"><xsl:value-of select="root/lang/body/timeZone15" /></option>
                            <option value="16"><xsl:value-of select="root/lang/body/timeZone16" /></option>
                            <option value="17"><xsl:value-of select="root/lang/body/timeZone17" /></option>
                            <option value="18"><xsl:value-of select="root/lang/body/timeZone18" /></option>
                            <option value="19"><xsl:value-of select="root/lang/body/timeZone19" /></option>
                            <option value="20"><xsl:value-of select="root/lang/body/timeZone20" /></option>
                            <option value="21"><xsl:value-of select="root/lang/body/timeZone21" /></option>
                            <option value="22"><xsl:value-of select="root/lang/body/timeZone22" /></option>
                            <option value="23"><xsl:value-of select="root/lang/body/timeZone23" /></option>
                            <option value="24"><xsl:value-of select="root/lang/body/timeZone24" /></option>
                            <option value="25"><xsl:value-of select="root/lang/body/timeZone25" /></option>
                            <option value="26"><xsl:value-of select="root/lang/body/timeZone26" /></option>
                            <option value="27"><xsl:value-of select="root/lang/body/timeZone27" /></option>
                            <option value="28"><xsl:value-of select="root/lang/body/timeZone28" /></option>
                            <option value="29"><xsl:value-of select="root/lang/body/timeZone29" /></option>
                            <option value="30"><xsl:value-of select="root/lang/body/timeZone30" /></option>
                            <option value="31"><xsl:value-of select="root/lang/body/timeZone31" /></option>
                            <option value="32"><xsl:value-of select="root/lang/body/timeZone32" /></option>
                            <option value="33"><xsl:value-of select="root/lang/body/timeZone33" /></option>
                            <option value="34"><xsl:value-of select="root/lang/body/timeZone34" /></option>
                            <option value="35"><xsl:value-of select="root/lang/body/timeZone35" /></option>
                            <option value="36"><xsl:value-of select="root/lang/body/timeZone36" /></option>
                            <option value="37"><xsl:value-of select="root/lang/body/timeZone37" /></option>
                            <option value="38"><xsl:value-of select="root/lang/body/timeZone38" /></option>
                            <option value="39"><xsl:value-of select="root/lang/body/timeZone39" /></option>
                            <option value="40"><xsl:value-of select="root/lang/body/timeZone40" /></option>
                            <option value="41"><xsl:value-of select="root/lang/body/timeZone41" /></option>
                            <option value="42"><xsl:value-of select="root/lang/body/timeZone42" /></option>
                            <option value="43"><xsl:value-of select="root/lang/body/timeZone43" /></option>
                            <option value="44"><xsl:value-of select="root/lang/body/timeZone44" /></option>
                            <option value="45"><xsl:value-of select="root/lang/body/timeZone45" /></option>
                            <option value="46"><xsl:value-of select="root/lang/body/timeZone46" /></option>
                            <option value="47"><xsl:value-of select="root/lang/body/timeZone47" /></option>
                            <option value="48"><xsl:value-of select="root/lang/body/timeZone48" /></option>
                            <option value="49"><xsl:value-of select="root/lang/body/timeZone49" /></option>
                            <option value="50"><xsl:value-of select="root/lang/body/timeZone50" /></option>
                            <option value="51"><xsl:value-of select="root/lang/body/timeZone51" /></option>
                            <option value="52"><xsl:value-of select="root/lang/body/timeZone52" /></option>
                            <option value="53"><xsl:value-of select="root/lang/body/timeZone53" /></option>
                            <option value="54"><xsl:value-of select="root/lang/body/timeZone54" /></option>
                            <option value="55"><xsl:value-of select="root/lang/body/timeZone55" /></option>
                            <option value="56"><xsl:value-of select="root/lang/body/timeZone56" /></option>
                            <option value="57"><xsl:value-of select="root/lang/body/timeZone57" /></option>
                            <option value="58"><xsl:value-of select="root/lang/body/timeZone58" /></option>
                            <option value="59"><xsl:value-of select="root/lang/body/timeZone59" /></option>
                            <option value="60"><xsl:value-of select="root/lang/body/timeZone60" /></option>
                            <option value="61"><xsl:value-of select="root/lang/body/timeZone61" /></option>
                            <option value="62"><xsl:value-of select="root/lang/body/timeZone62" /></option>
                            <option value="63"><xsl:value-of select="root/lang/body/timeZone63" /></option>
                            <option value="64"><xsl:value-of select="root/lang/body/timeZone64" /></option>
                            <option value="65"><xsl:value-of select="root/lang/body/timeZone65" /></option>
                            <option value="66"><xsl:value-of select="root/lang/body/timeZone66" /></option>
                            <option value="67"><xsl:value-of select="root/lang/body/timeZone67" /></option>
                            <option value="68"><xsl:value-of select="root/lang/body/timeZone68" /></option>
                            <option value="69"><xsl:value-of select="root/lang/body/timeZone69" /></option>
                            <option value="70"><xsl:value-of select="root/lang/body/timeZone70" /></option>
                            <option value="71"><xsl:value-of select="root/lang/body/timeZone71" /></option>
                            <option value="72"><xsl:value-of select="root/lang/body/timeZone72" /></option>
                            <option value="73"><xsl:value-of select="root/lang/body/timeZone73" /></option>
                            <option value="74"><xsl:value-of select="root/lang/body/timeZone74" /></option>
                            <option value="75"><xsl:value-of select="root/lang/body/timeZone75" /></option>
                            <option value="76"><xsl:value-of select="root/lang/body/timeZone76" /></option>
                            <option value="77"><xsl:value-of select="root/lang/body/timeZone77" /></option>
                            <option value="78"><xsl:value-of select="root/lang/body/timeZone78" /></option>
                            <option value="79"><xsl:value-of select="root/lang/body/timeZone79" /></option>
                            <option value="80"><xsl:value-of select="root/lang/body/timeZone80" /></option>
                            <option value="81"><xsl:value-of select="root/lang/body/timeZone81" /></option>
                            <option value="82"><xsl:value-of select="root/lang/body/timeZone82" /></option>
                            <option value="83"><xsl:value-of select="root/lang/body/timeZone83" /></option>
                          </select></td>
					</tr>
					<tr>
					  <td colspan="9"><input type="checkbox" name="enableDSTBox" id="enableDSTBox" onclick="changeMode(1)"/>
					    &nbsp;					    <xsl:value-of select="root/lang/body/daylightSaving" />
					   
					    <input type="hidden" maxlength="1" size="1" value="0" name="enableDST" id="enableDST" /></td>
					</tr>
                                            <tr>
                          <td width="30">&nbsp;</td>
                          <td colspan="8"><input type="radio"  value="1" id="auto" name="autoDST" onclick="changeMode(5)" />
                          <xsl:value-of select="root/lang/body/autoDST" /></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td colspan="8"><input type="radio"  value="0" id="manualDST" name="autoDST" onclick="changeMode(6)" />
                          <xsl:value-of select="root/lang/body/manual" /></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td width="30">&nbsp;</td>
                          <td width="100"><xsl:value-of select="root/lang/body/offset" /></td>
						  <td colspan="6"><select name="offset" id="offset">
                            <option value="2:00">+2:00</option>
                            <option value="1:30">+1:30</option>
                            <option value="1:00">+1:00</option>
                            <option value="0:30">+0:30</option>
                            <!--<option value="0:00">0:00</option>-->
                            <option value="-0:30">-0:30</option>
                            <option value="-1:00">-1:00</option>
                            <option value="-1:30">-1:30</option>
                            <option value="-2:00">-2:00</option>
                          </select>

                          <!--<input type="hidden" maxlength="5" size="5" value="" name="offset" id="offset" />-->
                          <input type="hidden" maxlength="15" size="15" value="" name="startTime" id="startTime" />
                          <input type="hidden" maxlength="15" size="15" value="" name="endTime" id="endTime" /></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
							<td><xsl:value-of select="root/lang/body/month" /></td>
							<td><xsl:value-of select="root/lang/body/week" /></td>
							<td><xsl:value-of select="root/lang/body/dayOfWeek" /></td>
							<td><xsl:value-of select="root/lang/body/hours2" /></td>
							<td><xsl:value-of select="root/lang/body/minutes" /></td>
							<td width="120"><!--<xsl:value-of select="root/lang/body/seconds" />--></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td>&nbsp;</td>
                          <td><xsl:value-of select="root/lang/body/startTime" /></td>
							<td><select name="startTimeMon" id="startTimeMon">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                            </select></td>
						  <td><select name="startTimeWeek" id="startTimeWeek">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                          </select></td>
						  <td><select name="startTimeDayOfWeek" id="startTimeDayOfWeek">
                              <option value="0"><xsl:value-of select="root/lang/body/sun" /></option>
                              <option value="1"><xsl:value-of select="root/lang/body/mon" /></option>
                              <option value="2"><xsl:value-of select="root/lang/body/tue" /></option>
                              <option value="3"><xsl:value-of select="root/lang/body/wed" /></option>
                              <option value="4"><xsl:value-of select="root/lang/body/thu" /></option>
                              <option value="5"><xsl:value-of select="root/lang/body/fri" /></option>
                              <option value="6"><xsl:value-of select="root/lang/body/sat" /></option>
                          </select></td>
						  <td><input maxlength="2" size="2" value="" name="startTimeHours" id="startTimeHours"/></td>
						  <td><input maxlength="2" size="2" value="" name="startTimeMins" id="startTimeMins"/></td>
						  <td><!--<input maxlength="2" size="2" value="{root/config/system/offset}" name="startTimeSecs" id="startTimeSecs"/>--></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td>&nbsp;</td>
                          <td><xsl:value-of select="root/lang/body/endTime" /></td>
                          <td><select name="endTimeMon" id="endTimeMon">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                          </select></td>
						  <td><select name="endTimeWeek" id="endTimeWeek">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                          </select></td>
						  <td><select name="endTimeDayOfWeek" id="endTimeDayOfWeek">
                              <option value="0"><xsl:value-of select="root/lang/body/sun" /></option>
                              <option value="1"><xsl:value-of select="root/lang/body/mon" /></option>
                              <option value="2"><xsl:value-of select="root/lang/body/tue" /></option>
                              <option value="3"><xsl:value-of select="root/lang/body/wed" /></option>
                              <option value="4"><xsl:value-of select="root/lang/body/thu" /></option>
                              <option value="5"><xsl:value-of select="root/lang/body/fri" /></option>
                              <option value="6"><xsl:value-of select="root/lang/body/sat" /></option>
                          </select></td>
						  <td><input maxlength="2" size="2" value="" name="endTimeHours" id="endTimeHours"/></td>
						  <td><input maxlength="2" size="2" value="" name="endTimeMins" id="endTimeMins"/></td>
						  <td><!--<input maxlength="2" size="2" value="{root/config/system/offset}" name="endTimeSecs" id="endTimeSecs"/>--></td>
                        </tr>
					</table>
                    <br />
					<div align="center">
						<input name="button16" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(5)" />
						<input name="button17" type="button" class="button_submit" value="{root/lang/body/next}" onclick="nextStep(5)" />
						<input name="button18" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
			  	<div id="step6" style="display:none">
			      <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/step6" /><xsl:value-of select="root/lang/body/note6" /></h1>
			        <span id="below"><xsl:value-of select="root/lang/body/description8" /><xsl:value-of select="root/lang/body/description7" /></span><br /><br />
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />
						<br />
						<xsl:value-of select="root/lang/body/reboot1" />
						<span name="leavetime" id="leavetime"></span>
						<xsl:value-of select="root/lang/body/reboot2" />
						</font>
						<br /><br />
   				    </xsl:if>
					<table cellspacing="1" cellpadding="1" width="500" border="0" align="center" id="hideResult">
					<tr>
						<td width="120"><xsl:value-of select="root/lang/body/ip" /></td>
						<td><span name="result1" id="result1"></span></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/ipCameraName" /></td>
						<td><span name="result2" id="result2"></span></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/timeZone" /></td>
						<td><span name="result3" id="result3"></span></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/ddns" /></td>
						<td><span name="result4" id="result4"></span></td>
					</tr>
					<tr>
						<td><xsl:value-of select="root/lang/body/pppoe" /></td>
						<td><span name="result5" id="result5"></span></td>
					</tr>
					</table>
                    <br />
					<div align="center">
						<input name="button19" type="button" class="button_submit" value="{root/lang/body/back}" onclick="backStep(6)" />
						<input name="button20" type="button" class="button_submit" value="{root/lang/body/apply}" onclick="send_request()" />
						<input name="button21" type="button" class="button_submit" value="{root/lang/body/cancel}" onclick="window.location.href='adv_wizard.cgi'" />
					</div>
                    <br />
                  </div>
				  </div>
			  </div></td></form>
		  <td valign="top" width="125" id="" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0" style="display:none">
                  <tbody>
                    <tr>
                      <td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                          <br />
                          <span class="style1"><li></li><xsl:value-of select="root/lang/hint/description1" /></span><br />
                          <span class="style1"><li></li><xsl:value-of select="root/lang/hint/description2" /></span>
					  </td>
                    </tr>
                  </tbody>
              </table></td>
		</tr>
	</table></td></tr></table>
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
