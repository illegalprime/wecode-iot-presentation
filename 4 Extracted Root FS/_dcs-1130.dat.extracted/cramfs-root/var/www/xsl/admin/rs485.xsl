<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="rs485.xml" --><!DOCTYPE xsl:stylesheet  [
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="JavaScript" src="../public.js" type="text/javascript"></script>
<script language="JavaScript" src="../net.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">	
<![CDATA[
function delPreset(){	
	send_submit("form3");
}
    //This part is for PT
	function createXMLHttpRequest() {
		var theRequest = false;
        if (window.XMLHttpRequest) { // Mozilla, Safari,...
            theRequest = new XMLHttpRequest();
            if (theRequest.overrideMimeType) {
                theRequest.overrideMimeType('text/xml');
            }
			return theRequest;
        }
		if (window.ActiveXObject) { // IE
            try {
                theRequest = new ActiveXObject("Msxml3.XMLHTTP");
            } catch (e) {
                try {
                    theRequest = new ActiveXObject("Microsoft.XMLHTTP");
                } 
				catch (e) {
					alert("no MS XMLHTTP");
					return false;
                }
            }
			return theRequest;
        }
		alert("no XMLHTTP");
		return false;
	}

    function sendHomeRequest(hostname, request, onAlert) {
		var url = hostname + '/cgi/ptdc.cgi?command=go_home';
        request.onreadystatechange = onAlert;
		try {
        	request.open('GET', url, true);
        	request.send("");
		}
		catch(e) {
			alert(e);
		}
    }

    var theRequest = false;
    function onAlertRequest() {
        if (theRequest.readyState == 4) {
            if (theRequest.status == 200) {
				try {
                	var xmldoc = theRequest.responseXML;
					var node = xmldoc.getElementsByTagName('code').item(0);
					document.form1.resultCode.value = node.firstChild.data;
				}
				catch (e) {
					alert(e);
				}
            } else {
                alert('There was a problem with the getRequest.');
            }
        }
    }

	function move(x, y) {
		theRequest = createXMLHttpRequest();
		if (!theRequest) {
			return false;
		}
		x = document.form1.panSpeed.value * x;
		y = document.form1.tiltSpeed.value * y;
		var hostname = document.form1.hostname.value;
		sendMoveRequest(x, y, hostname, theRequest, onAlertRequest);
	}

/*
	function home() {
		theRequest = createXMLHttpRequest();
		if (!theRequest) {
			return false;
		}
		var hostname = document.form1.hostname.value;
		sendHomeRequest(hostname, theRequest, onAlertRequest);
	}
*/	
function homePos(){
	var urlXML = "http://" + window.location.hostname + ":" + window.location.port + '/cgi/ptdc.cgi?command=go_home';
	var urlXSL = 'cam_control.xsl';
	
	LoadXMLXSLTDoc(urlXML,urlXSL);
}

var xmlDoc;
var xslDoc;
function LoadXMLXSLTDoc(urlXML,urlXSL){
	xmlDoc=null;
	xslDoc=null;
	new net.ContentLoader(urlXML,onXMLLoad);
//	new net.ContentLoader(urlXSL,onXSLLoad);
}

function onXMLLoad(){
	xmlDoc=this.req.responseXML;
//	wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth);
}

function onXSLLoad(){
	xslDoc=this.req.responseXML;
//	wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth);
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
function change_range_message(){
	if(document.form1.protocol.value == '0')
		document.getElementById("idrangemessage").innerHTML = "<xsl:value-of select="root/lang/body/idrangemessage0" />";
	if(document.form1.protocol.value == '1')
		document.getElementById("idrangemessage").innerHTML = "<xsl:value-of select="root/lang/body/idrangemessage1" />";
	if(document.form1.protocol.value == '2')
		document.getElementById("idrangemessage").innerHTML = "<xsl:value-of select="root/lang/body/idrangemessage2" />";
	if(document.form1.protocol.value == '3')
		document.getElementById("idrangemessage").innerHTML = "<xsl:value-of select="root/lang/body/idrangemessage3" />";
}

var idRangeError="<xsl:value-of select="root/lang/body/idRangeError" />";
function send_request(){
	document.form1.id.value=parseInt(document.form1.id.value,10);
	if(check_ptz_id(document.form1.protocol.value, document.form1.id.value)==false){
		alert(idRangeError);
		return false;
	}
	send_submit("form1");
}
function addPreset(){
	var name = new Array();
	var i=0;
	var j=0;
	var flag=0;
	var theSamePresetName = "<xsl:value-of select="root/lang/body/theSamePresetName" />";
	var presetNameError = "<xsl:value-of select="root/lang/body/presetNameError" />";
//	var presetError = "<xsl:value-of select="root/lang/body/presetError" />";
	
	<xsl:for-each select="root/config/preset">
		name[i] = '<xsl:value-of select="presetName"/>';
		i++;
	</xsl:for-each>

    if (document.form2.presetName.value == ''){
		alertAndSelect(document.form2.presetName,presetNameError);
		return false;
	}
	else{
		if(checkPreset(presetNameError)==false)
			return false;
	}

	for(j=0;j!=i;j++){
		if (name[j] == document.form2.presetName.value){
			if(confirm(theSamePresetName)){
				flag = 1;
				send_submit("form2");
			}
			else
				return false;
		}
	}

	if(flag == 1){
	}
	else{
		if(i == 10){
			alert("<xsl:value-of select="root/lang/message/full" />");
			return false;
		}
	}

	send_submit("form2");
}
function InitActiveX()
{
	var dcscontrol1 = document.getElementById("dcscontrol1");
	dcscontrol1.RemoteHost=location.hostname;
	if (location.port)
		dcscontrol1.RemotePort=location.port;
	else 
		dcscontrol1.RemotePort=80;
	dcscontrol1.SetAuthentication('<xsl:value-of select="/root/config/pageContext" />');
	dcscontrol1.play();
}

function initForm() 
{
	if ('<xsl:value-of select="root/config/rs485/rs485Enable" />' == '1')
		document.form1.rs485CheckBox.checked=true;
	document.form1.protocol.value = "<xsl:value-of select="root/config/rs485/protocol" />";
	document.form1.id.value = "<xsl:value-of select="root/config/rs485/id" />";
	document.form1.baudrate.value = "<xsl:value-of select="root/config/rs485/baudrate" />";
	if ('<xsl:value-of select="root/config/rs485/databits1" />' == '7')
		document.form1.databits1.checked=true;
	if ('<xsl:value-of select="root/config/rs485/databits1" />' == '8')
		document.form1.databits2.checked=true;
	if ('<xsl:value-of select="root/config/rs485/stopbit1" />' == '1')
		document.form1.stopbit1.checked=true;
	if ('<xsl:value-of select="root/config/rs485/stopbit1" />' == '2')
		document.form1.stopbit2.checked=true;
	if ('<xsl:value-of select="root/config/rs485/paritybit1" />' == '0')
		document.form1.paritybit1.checked=true;
	if ('<xsl:value-of select="root/config/rs485/paritybit1" />' == '2')
		document.form1.paritybit2.checked=true;
	if ('<xsl:value-of select="root/config/rs485/paritybit1" />' == '1')
		document.form1.paritybit3.checked=true;
	changeMode1();
	change_range_message();
}

function changeMode1()
{
	if(document.form1.rs485CheckBox.checked){
		document.form1.rs485Enable.value="on";
		document.form1.protocol.disabled=false;
		document.form1.id.disabled=false;
		document.form1.baudrate.disabled=false;
		document.form1.databits1.disabled=false;
		document.form1.databits2.disabled=false;
		document.form1.stopbit.disabled=false;		
		document.form1.stopbit1.disabled=false;
		document.form1.stopbit2.disabled=false;	
		document.form1.paritybit.disabled=false;	
		document.form1.paritybit1.disabled=false;
		document.form1.paritybit2.disabled=false;
		document.form1.paritybit3.disabled=false;
	}
	else{
		document.form1.rs485Enable.value="off";
		document.form1.protocol.disabled=true;	
		document.form1.id.disabled=true;
		document.form1.baudrate.disabled=true;
		document.form1.databits.disabled=true;
		document.form1.databits1.disabled=true;
		document.form1.databits2.disabled=true;		
		document.form1.stopbit.disabled=true;
		document.form1.stopbit1.disabled=true;
		document.form1.stopbit2.disabled=true;		
		document.form1.paritybit.disabled=true;
		document.form1.paritybit1.disabled=true;
		document.form1.paritybit2.disabled=true;
		document.form1.paritybit3.disabled=true;
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

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%"><xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/product" /></td>
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
			<td id="sidenav_container" valign="top" width="125" align="left"><table cellspacing="0" cellpadding="0" border="0">
              <tbody>
                <tr>
                  <td id="sidenav_container"><div id="sidenav">
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
                        <li>
                          <div><a href="recorder.cgi"><xsl:value-of select="root/lang/leftPanel/recording" /></a></div>
                        </li>
                        <li>
                          <div><a href="adv_snapshot_cont.cgi"><xsl:value-of select="root/lang/leftPanel/snapshot" /></a></div>
                        </li>
                        <li>
                          <div><a href="adv_do.cgi"><xsl:value-of select="root/lang/leftPanel/digitalOutput" /></a></div>
                        </li>
                        <li>
                          <div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/rs485" /></div>
                        </li>
                        <li>
                          <div><a href="logout.cgi"><xsl:value-of select="root/lang/leftPanel/logout" /></a></div>
                        </li>
                      </ul>
                  </div></td>
                </tr>
              </tbody>
            </table></td>
			
				  <!-- === BEGIN MAINCONTENT === -->
	<form id="form1" name="form1" method="post" action="rs485.cgi"><td valign="top" id="maincontent_container"><div id="maincontent">
		<div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/rs485" /></h1>
            	        <xsl:value-of select="root/lang/body/description1" /><br />
						<br />
					<center> 
                      <input name="Submit" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()"/>
                      <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='rs485.cgi'" />
					  </center>
					<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />						</font>
					</xsl:if>
        			<xsl:if test="/root/result/code = 'failure'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/failure" />						</font>
			        </xsl:if>
        			<xsl:if test="/root/result/code = 'full'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/full" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'duplicate'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidParameters'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidParameters" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'oob'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/oob" />						</font>
   				    </xsl:if>
              </div>
              <div class="box">
                    <h2><xsl:value-of select="root/lang/body/rs485" /></h2>
					<table cellspacing="1" cellpadding="1" width="525" border="0">
						<tr>
                        	<td colspan="4" >
                            <input type="checkbox" name="rs485CheckBox" id="rs485CheckBox" onclick="changeMode1()"/>
							<input name="rs485Enable" id="rs485Enable" type="hidden" size="3" value="off" />
                            <xsl:value-of select="root/lang/body/enableRs485" />							</td>
                   		</tr>
						<tr>
						<td width="28" height="22"></td>
						 <td width="181" ><xsl:value-of select="root/lang/body/rs485Protocol" /></td>
                            <td width="153"><select name="protocol" id="protocol" onchange="change_range_message()">
                              <option value="0"><xsl:value-of select="root/lang/body/Pelco-D" /></option>
                              <option value="1"><xsl:value-of select="root/lang/body/Pelco-P" /></option>
                              <option value="2"><xsl:value-of select="root/lang/body/Dyna" /></option>
                              <option value="3"><xsl:value-of select="root/lang/body/LiLin" /></option>
                            </select></td>
                            <td width="153" ></td>
						  </tr>
						<tr>
					  <td width="28" height="22"></td>
                        <td width="181" ><xsl:value-of select="root/lang/body/rs485ID" /></td>
                        <td width="153"><input maxlength="20" size="20" value="{root/config/rs485/id}" name="id" id="id"  /></td>
												<td width="153" ><div align="left" class="red" id="idrangemessage"></div></td> 
                      </tr>
					  <tr>
					  <td height="22"></td>
                        <td width="181" ><xsl:value-of select="root/lang/body/rs485BuadRate" /></td>
                            <td width="306" colspan="6" > <select name="baudrate" id="baudrate" >
                            <option value="0">2400</option>
                            <option value="1">4800</option>
							<option value="2">9600</option>
							<option value="3">19200</option>
                          </select></td>
                  </tr>
					  <tr>
					  <td width="28" height="22"></td>
					  	<td width="181" ><xsl:value-of select="root/lang/body/rs485DataBits" /> </td>
				        <td width="306" colspan="3" > <input type="radio" value="7" name="databits" id="databits1" /> 7
				        	<input type="radio" value="8" name="databits" id="databits2" /> 8						</td>
					  </tr>
					  <tr>
					  <td width="28" height="22"></td>
                      	<td width="181" ><xsl:value-of select="root/lang/body/rs485StopBit" /> </td>
				        	<td width="306" colspan="3" ><input type="radio" value="1" name="stopbit" id="stopbit1" /> 1
						    <input type="radio" value="2" name="stopbit" id="stopbit2" /> 2						</td>
	     			  </tr>
					  <tr>
					  <td width="28" height="22"></td>
						 <td width="181" > <xsl:value-of select="root/lang/body/rs485ParityBit" /> </td>
				        	<td width="306" colspan="3" ><input type="radio" value="0" name="paritybit" id="paritybit1" /> No
				        	<input type="radio" value="2" name="paritybit" id="paritybit2" /> Even
							<input type="radio" value="1" name="paritybit" id="paritybit3" /> Odd					     </td>
					  </tr>
					</table>
						
              </div>
              <!-- === END MAINCONTENT === -->
          </div></td></form>
		  <td valign="top" width="150" id="sidehelp_container" align="left">
				<table width="125" border="0" 
      cellpadding="2" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#ffffff" bordercolordark="#ffffff" bgcolor="#ffffff">
                  <tbody>
                    <tr>
                      <td id="help_text"><strong><xsl:value-of select="root/lang/hint/helpfulHints" />
											</strong><br /><br />
											<xsl:value-of select="root/lang/hint/description3" /><br /><br />
					    <strong><xsl:value-of select="root/lang/body/protocol" /></strong><xsl:value-of select="root/lang/body/protocoll" /><br /><br />
						  <strong><xsl:value-of select="root/lang/body/id" /></strong><xsl:value-of select="root/lang/body/idl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/baudRate" /></strong><xsl:value-of select="root/lang/body/baudRatel" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/dataBits" /></strong><xsl:value-of select="root/lang/body/dataBitsl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/stopBit" /></strong><xsl:value-of select="root/lang/body/stopBitl" /><br /><br />
							<strong><xsl:value-of select="root/lang/body/parityBit" /></strong><xsl:value-of select="root/lang/body/parityBitl" /></td>
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
