<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_snapshot.xml" --><!DOCTYPE xsl:stylesheet  [
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
function send_request(index){
	if(document.form1.enableAction.checked)
		document.form1.enable.value = "1";
	else
		document.form1.enable.value = "0";

	if(document.form1.enableAction.checked){
		//check trigger
		if(document.form1.continuousBox.checked || document.form1.scheduleBox.checked || document.form1.trigger.checked){
		}
		else{
			alert(methodError);
			return false;
		}
		if(document.form1.trigger.checked){
			if(document.form1.byMotionBox.checked || document.form1.byIn1Box.checked || document.form1.byIn1Box2.checked){                }
			else{
				alert(triggerError);
				return false;
			}
		}
		if(document.form1.trigger.checked){
			if(document.form1.smtpEnableBox1.checked || document.form1.ftpEnableBox1.checked){
			}
			else{
				alert(ftpMailError);
				return false;
			}
		}
		if(document.form1.continuousBox.checked || document.form1.scheduleBox.checked){
			if(document.form1.ftpEnableBox1.checked){
			}
			else{
				alert(ftpScheduleError);
				return false;
			}
		}
		
		//SMTP(Mail) Server settings
		var smtpServer1 = get_by_id("smtpServer1").value
		var smtpUser1 = get_by_id("smtpUser1").value
		var smtpPass1 = get_by_id("smtpPass1").value
		var receiver1 = get_by_id("receiver1").value
		var sender1 = get_by_id("sender1").value

		//FTP Server settings
		var ftpServer1 = get_by_id("ftpServer1").value
		var ftpUser1 = get_by_id("ftpUser1").value
		var ftpPass1 = get_by_id("ftpPass1").value
		var fixFile1 = get_by_id("fixFile1").value
		
		//check SMTP field
		//SMTP(Mail) Server settings
		if (index == 0 || index == 1){
			if (document.form1.smtpEnableBox1.checked){
				if (smtpUser1 == ""){
					alert(firAccountError);
					document.form1.smtpUser1.select();
			   	        return false;
				}
				if(checkName("smtpUser1",mailNameError)==false)
					return false;
				if(checkName("smtpPass1",mailNameError)==false)
					return false;
				if(checkServer("smtpServer1",firSmtpError)==false)
					return false;
				if (sender1 == ""){
					alert(firSenderError);
					document.form1.sender1.select();
			   	        return false;
				}
				if(isEMailAddr(sender1)==false){
				        alert(firSenderMailError);
					document.form1.sender1.select();
					return false;
				}
				if (receiver1 == ""){
					alert(firRecipientError);
					document.form1.receiver1.select();
			   	        return false;
				}
				if(isEMailAddr(receiver1)==false){
				        alert(firRecipientMailError);
					document.form1.receiver1.select();
					return false;
				}
				if(checkport("smtpPort1",firSmtpName)==false){
					document.form1.smtpPort1.select();
					return false;
				}
			}
		}

		//check FTP field
		//FTP Server settings
		if (index == 0 || index == 2){
			if (document.form1.ftpEnableBox1.checked){
				if(checkName("ftpUser1",ftpNameError)==false)
					return false;
				if(checkName("ftpPass1",ftpNameError)==false)
					return false;
				if(checkServer("ftpServer1",firFtpServerError)==false)
					return false;
				if(checkFolder("folder1",firFolderError)==false)
					return false;
				if(fixFile1 != ""){
					if(checkFixFilename("fixFile1",firFixFilenameError)==false){
						return false;
					}
				}
				if(checkport("ftpPort1",firFtpError)==false){
					document.form1.ftpPort1.select();
					return false;
				}
				if(ftpIntervalCheck(document.form1.ftpInterval,intervalError)==false)
					return false;
			}
		}
		if (index == 1)
			document.form1.smtpTestMail.value = 1;
		if (index == 2)
			document.form1.ftpTest.value = 1;
		
		//set trigger
		if(document.form1.trigger.checked){
			if(document.form1.byMotionBox.checked)
				document.form1.byMotion.value = "1";
			else
				document.form1.byMotion.value = "0";
			if(document.form1.byIn1Box.checked)
				document.form1.byIn1.value = "1";
			else
				document.form1.byIn1.value = "0";
			if(document.form1.byIn1Box2.checked)
				document.form1.byIn2.value = "1";
			else
				document.form1.byIn2.value = "0";
		}
		else{
			document.form1.byMotion.value = "0";
			document.form1.byIn1.value = "0";
			document.form1.byIn2.value = "0";
		}
		
		//set continuous
		if(document.form1.continuousBox.checked){
			document.form1.continuous.value = "1";
			document.form1.schedule.value = "0";
			document.form1.byMotion.value = "0";
			document.form1.byIn1.value = "0";
			document.form1.byIn2.value = "0";
		}
		else
			document.form1.continuous.value = "0";
		
		//set schedule
		if(document.form1.scheduleBox.checked){
			document.form1.schedule.value = "1";
			document.form1.continuous.value = "0";
		}
		else
			document.form1.schedule.value = "0";
		
		//check week, hour and minute
		if(document.form1.scheduleBox.checked){
			if(document.form1.sun.checked || document.form1.mon.checked || document.form1.tue.checked || document.form1.wed.checked || document.form1.thu.checked || document.form1.fri.checked || document.form1.sat.checked){
			}
			else{
				alert(scheduleError);
				return false;
			}
			
			var items = new Array()
			var itemSize = 0;
			
			if(document.form1.sun.checked){
				if(timeCheckHours(document.form1.sunH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.sunM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.sunH2,document.form1.sunM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.sunM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.sunH1,document.form1.sunM1,document.form1.sunH2,document.form1.sunM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.sunH2.value == 24)
					items[itemSize] = "0" + "," + document.form1.sunH1.value + "," + document.form1.sunM1.value + "," + "1" + "," + "0" + "," + document.form1.sunM2.value ;
				else
					items[itemSize] = "0" + "," + document.form1.sunH1.value + "," + document.form1.sunM1.value + "," + "0" + "," + document.form1.sunH2.value + "," + document.form1.sunM2.value ;
			}
			if(document.form1.mon.checked){
			
				if(timeCheckHours(document.form1.monH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.monM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.monH2,document.form1.monM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.monM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.monH1,document.form1.monM1,document.form1.monH2,document.form1.monM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.monH2.value == 24)
					items[itemSize] = "1" + "," + document.form1.monH1.value + "," + document.form1.monM1.value + "," + "2" + "," + "0" + "," + document.form1.monM2.value ;
				else
					items[itemSize] = "1" + "," + document.form1.monH1.value + "," + document.form1.monM1.value + "," + "1" + "," + document.form1.monH2.value + "," + document.form1.monM2.value ;
			}
			if(document.form1.tue.checked){
				if(timeCheckHours(document.form1.tueH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.tueM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.tueH2,document.form1.tueM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.tueM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.tueH1,document.form1.tueM1,document.form1.tueH2,document.form1.tueM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.tueH2.value == 24)
					items[itemSize] = "2" + "," + document.form1.tueH1.value + "," + document.form1.tueM1.value + "," + "3" + "," + "0" + "," + document.form1.tueM2.value ;
				else
					items[itemSize] = "2" + "," + document.form1.tueH1.value + "," + document.form1.tueM1.value + "," + "2" + "," + document.form1.tueH2.value + "," + document.form1.tueM2.value ;
			}
			if(document.form1.wed.checked){
				if(timeCheckHours(document.form1.wedH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.wedM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.wedH2,document.form1.wedM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.wedM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.wedH1,document.form1.wedM1,document.form1.wedH2,document.form1.wedM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.wedH2.value == 24)
					items[itemSize] = "3" + "," + document.form1.wedH1.value + "," + document.form1.wedM1.value + "," + "4" + "," + "0" + "," + document.form1.wedM2.value ;
				else
					items[itemSize] = "3" + "," + document.form1.wedH1.value + "," + document.form1.wedM1.value + "," + "3" + "," + document.form1.wedH2.value + "," + document.form1.wedM2.value ;
			}
			if(document.form1.thu.checked){
				if(timeCheckHours(document.form1.thuH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.thuM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.thuH2,document.form1.thuM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.thuM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.thuH1,document.form1.thuM1,document.form1.thuH2,document.form1.thuM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.thuH2.value == 24)
					items[itemSize] = "4" + "," + document.form1.thuH1.value + "," + document.form1.thuM1.value + "," + "5" + "," + "0" + "," + document.form1.thuM2.value ;
				else
					items[itemSize] = "4" + "," + document.form1.thuH1.value + "," + document.form1.thuM1.value + "," + "4" + "," + document.form1.thuH2.value + "," + document.form1.thuM2.value ;
			}
			if(document.form1.fri.checked){
				if(timeCheckHours(document.form1.friH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.friM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.friH2,document.form1.friM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.friM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.friH1,document.form1.friM1,document.form1.friH2,document.form1.friM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.friH2.value == 24)
					items[itemSize] = "5" + "," + document.form1.friH1.value + "," + document.form1.friM1.value + "," + "6" + "," + "0" + "," + document.form1.friM2.value ;
				else
					items[itemSize] = "5" + "," + document.form1.friH1.value + "," + document.form1.friM1.value + "," + "5" + "," + document.form1.friH2.value + "," + document.form1.friM2.value ;
			}
			if(document.form1.sat.checked){
				if(timeCheckHours(document.form1.satH1,hourError)==false)
					return false;
				if(timeCheckMins(document.form1.satM1,minuteError)==false)
					return false;
				if(timeCheckHoursFull(document.form1.satH2,document.form1.satM2,hourError,fullHourError)==false)
					return false;
				if(timeCheckMins(document.form1.satM2,minuteError)==false)
					return false;
				if(legalTimeCheck(document.form1.satH1,document.form1.satM1,document.form1.satH2,document.form1.satM2,legalTimeError)==false)
					return false;
				itemSize = itemSize + 1;
				if(document.form1.satH2.value == 24)
					items[itemSize] = "6" + "," + document.form1.satH1.value + "," + document.form1.satM1.value + "," + "0" + "," + "0" + "," + document.form1.satM2.value ;
				else
					items[itemSize] = "6" + "," + document.form1.satH1.value + "," + document.form1.satM1.value + "," + "6" + "," + document.form1.satH2.value + "," + document.form1.satM2.value ;
			}
			document.form1.itemSize.value = itemSize;

			sendRecordItems(items,itemSize);
			if (items[1] != "")
				document.form1.item01.value = items[1];
			if (items[2] != "")
				document.form1.item02.value = items[2];
			if (items[3] != "")
				document.form1.item03.value = items[3];
			if (items[4] != "")
				document.form1.item04.value = items[4];
			if (items[5] != "")
				document.form1.item05.value = items[5];
			if (items[6] != "")
				document.form1.item06.value = items[6];
			if (items[7] != "")
				document.form1.item07.value = items[7];
		}
		
		//set SMTP
		if(document.form1.smtpEnableBox1.checked){
			document.form1.smtpEnable1.value = "1";
			document.form1.toSmtp.value = "1";
		}
		else{
			document.form1.smtpEnable1.value = "0";
			document.form1.toSmtp.value = "0";
		}

		//set FTP
		if(document.form1.ftpEnableBox1.checked){
			document.form1.ftpEnable1.value = "1";
			document.form1.toFtp.value = "1";
		}
		else{
			document.form1.ftpEnable1.value = "0";
			document.form1.toFtp.value = "0";
		}
		
	}
	if(document.form1.passiveBox1.checked)
			document.form1.passive1.value = "1";
		else
			document.form1.passive1.value = "0";

	send_submit("form1");
}

function changeMode(){
	if(document.form1.enableAction.checked){
		/*
		document.form1.byMotionBox.disabled = false;
		document.form1.byIn1Box.disabled = false;
		document.form1.byIn1Box2.disabled = false;
//		document.form1.ftp.disabled = false;
//		document.form1.smtp.disabled = false;
		document.form1.smtpEnableBox1.disabled=false;
		document.form1.smtpServer1.disabled=false;
		document.form1.smtpPort1.disabled=false;
		document.form1.smtpUser1.disabled=false;
		document.form1.smtpPass1.disabled=false;
		document.form1.receiver1.disabled=false;
		document.form1.sender1.disabled=false;
		document.form1.test1.disabled=false;
		document.form1.ftpEnableBox1.disabled=false;
		document.form1.ftpInterval.disabled=false;
		document.form1.passiveBox1.disabled=false;
		document.form1.ftpServer1.disabled=false;
		document.form1.ftpPort1.disabled=false;
		document.form1.ftpUser1.disabled=false;
		document.form1.ftpPass1.disabled=false;
		document.form1.folder1.disabled=false;
		document.form1.fixFile1.disabled=false;
		//document.form1.test2.disabled=false;
		document.form1.trigger.disabled=false;
		document.form1.continuousBox.disabled=false;
		document.form1.scheduleBox.disabled=false;
		document.form1.sun.disabled=false;
		document.form1.sunH1.disabled=false;
		document.form1.sunM1.disabled=false;
		document.form1.sunH2.disabled=false;
		document.form1.sunM2.disabled=false;
		document.form1.mon.disabled=false;
		document.form1.monH1.disabled=false;
		document.form1.monM1.disabled=false;
		document.form1.monH2.disabled=false;
		document.form1.monM2.disabled=false;
		document.form1.tue.disabled=false;
		document.form1.tueH1.disabled=false;
		document.form1.tueM1.disabled=false;
		document.form1.tueH2.disabled=false;
		document.form1.tueM2.disabled=false;
		document.form1.wed.disabled=false;
		document.form1.wedH1.disabled=false;
		document.form1.wedM1.disabled=false;
		document.form1.wedH2.disabled=false;
		document.form1.wedM2.disabled=false;
		document.form1.thu.disabled=false;
		document.form1.thuH1.disabled=false;
		document.form1.thuM1.disabled=false;
		document.form1.thuH2.disabled=false;
		document.form1.thuM2.disabled=false;
		document.form1.fri.disabled=false;
		document.form1.friH1.disabled=false;
		document.form1.friM1.disabled=false;
		document.form1.friH2.disabled=false;
		document.form1.friM2.disabled=false;
		document.form1.sat.disabled=false;
		document.form1.satH1.disabled=false;
		document.form1.satM1.disabled=false;
		document.form1.satH2.disabled=false;
		document.form1.satM2.disabled=false;
		*/
		disableObj(false, "trigger continuousBox scheduleBox smtpEnableBox1 ftpEnableBox1");
		changeMode1();
		changeMode5();
		changeMode2();
		changeMode3();
		changeMode4();
	}
	else{
		/*
		document.form1.motion.disabled = true;
		document.form1.byIn1Box.disabled = true;
		document.form1.byIn1Box2.disabled = true;
//		document.form1.ftp.disabled = true;
//		document.form1.smtp.disabled = true;
		document.form1.smtpEnableBox1.disabled=true;
		document.form1.smtpServer1.disabled=true;
		document.form1.smtpPort1.disabled=true;
		document.form1.smtpUser1.disabled=true;
		document.form1.smtpPass1.disabled=true;
		document.form1.receiver1.disabled=true;
		document.form1.sender1.disabled=true;
		document.form1.test1.disabled=true;
		document.form1.ftpEnableBox1.disabled=true;
		document.form1.passiveBox1.disabled=true;
		document.form1.ftpServer1.disabled=true;
		document.form1.ftpPort1.disabled=true;
		document.form1.ftpUser1.disabled=true;
		document.form1.ftpPass1.disabled=true;
		document.form1.folder1.disabled=true;
		document.form1.fixFile1.disabled=true;
		document.form1.test2.disabled=true;
		*/
		disableObj(true, "trigger continuousBox scheduleBox smtpEnableBox1 ftpEnableBox1");
		disableObj(true, "byMotionBox byIn1Box byIn1Box2");
		disableObj(true, "sun sunH1 sunM1 sunH2 sunM2 mon monH1 monM1 monH2 monM2 tue tueH1 tueM1 tueH2 tueM2 wed wedH1 wedM1 wedH2 wedM2 thu thuH1 thuM1 thuH2 thuM2 fri friH1 friM1 friH2 friM2 sat satH1 satM1 satH2 satM2");
		disableObj(true, "smtpEnableBox1 smtpUser1 smtpPass1 smtpServer1 sender1 receiver1 smtpPort1 test1");
		disableObj(true, "ftpEnableBox1 ftpUser1 ftpPass1 ftpServer1 folder1 fixFile1 ftpPort1 ftpInterval passiveBox1 test2");
	}
}

function checkport(which_port,num){
	var port=get_by_id(which_port).value;
	
	if (port == ""){
		alert(num + PortError1);
		return false;
	}
	if (isNaN(port)){
		alert(num + PortError2);
		return false;
	}
	if ( numcheck(port) !=0 ){
		alert(num + PortError3);
		return false;
	}
	if (range(port,1,65535)==false){
		alert(num + PortError3);
		return false;
	}
	return true;
}

function changeMode1(){
	checksmtpEnableBox1("smtpEnableBox1");
	/*
	if (document.form1.smtpEnableBox1.checked){
		document.form1.smtpServer1.disabled=false;
		document.form1.smtpPort1.disabled=false;
		document.form1.smtpUser1.disabled=false;
		document.form1.smtpPass1.disabled=false;
		document.form1.receiver1.disabled=false;
		document.form1.sender1.disabled=false;
		document.form1.test1.disabled=false;
	}
	else{
		document.form1.smtpServer1.disabled=true;
		document.form1.smtpPort1.disabled=true;
		document.form1.smtpUser1.disabled=true;
		document.form1.smtpPass1.disabled=true;
		document.form1.receiver1.disabled=true;
		document.form1.sender1.disabled=true;
		document.form1.test1.disabled=true;
	}*/
}

function changeMode2(){
	//check continuous
	checkContinuous("trigger", "continuousBox", "scheduleBox");
}

function changeMode3(){
	//check schedule
	checkSchedule("trigger", "continuousBox", "scheduleBox");
}

function changeMode4(){
	//check trigger
	checkTrigger("trigger", "continuousBox", "scheduleBox");
}
function changeMode5(){
	checkftpEnableBox1("ftpEnableBox1");
	/*
	if (document.form1.ftpEnableBox1.checked){
		document.form1.ftpInterval.disabled=false;
		document.form1.passiveBox1.disabled=false;
		document.form1.ftpServer1.disabled=false;
		document.form1.ftpPort1.disabled=false;
		document.form1.ftpUser1.disabled=false;
		document.form1.ftpPass1.disabled=false;
		document.form1.folder1.disabled=false;
		document.form1.fixFile1.disabled=false;
	}
	else{
		document.form1.ftpInterval.disabled=true;
		document.form1.passiveBox1.disabled=true;
		document.form1.ftpServer1.disabled=true;
		document.form1.ftpPort1.disabled=true;
		document.form1.ftpUser1.disabled=true;
		document.form1.ftpPass1.disabled=true;
		document.form1.folder1.disabled=true;
		document.form1.fixFile1.disabled=true;
	}*/
}

function checkTrigger(triggerID, continuousID, scheduledID){
	var triggerObj = get_by_id(triggerID);
	var continuousObj = get_by_id(continuousID);
	var scheduledObj = get_by_id(scheduledID);

	if (triggerObj.checked || scheduledObj.checked)
		continuousObj.disabled = true;
	else {
		if (document.form1.enableAction.checked)
			continuousObj.disabled = false;
		else
			continuousObj.disabled = true;
	}
	if (triggerObj.checked)
		disableObj(false, "byMotionBox byIn1Box byIn1Box2");
	else
		disableObj(true, "byMotionBox byIn1Box byIn1Box2");
}

function checkContinuous(triggerID, continuousID, scheduledID){
	var triggerObj = get_by_id(triggerID);
	var continuousObj = get_by_id(continuousID);
	var scheduledObj = get_by_id(scheduledID);
	
	if (continuousObj.checked) {
		disableObj(true, "trigger scheduleBox");
		disableObj(true, "byMotionBox byIn1Box byIn1Box2");
	}
	else
		disableObj(false, "trigger scheduleBox");
}

function checkSchedule(triggerID, continuousID, scheduledID){
	var triggerObj = get_by_id(triggerID);
	var continuousObj = get_by_id(continuousID);
	var scheduledObj = get_by_id(scheduledID);
	var ObjList = "sun sunH1 sunM1 sunH2 sunM2 mon monH1 monM1 monH2 monM2 tue tueH1 tueM1 tueH2 tueM2 wed wedH1 wedM1 wedH2 wedM2 thu thuH1 thuM1 thuH2 thuM2 fri friH1 friM1 friH2 friM2 sat satH1 satM1 satH2 satM2";

	if (triggerObj.checked || scheduledObj.checked)
		continuousObj.disabled = true;
	else
		continuousObj.disabled = false;
	if (scheduledObj.checked)
		disableObj(false, "sun sunH1 sunM1 sunH2 sunM2 mon monH1 monM1 monH2 monM2 tue tueH1 tueM1 tueH2 tueM2 wed wedH1 wedM1 wedH2 wedM2 thu thuH1 thuM1 thuH2 thuM2 fri friH1 friM1 friH2 friM2 sat satH1 satM1 satH2 satM2");
	else
		disableObj(true, ObjList);
}

function checksmtpEnableBox1(smtpEnableBox1ID){
	var smtpEnableBox1Obj = get_by_id(smtpEnableBox1ID);

	if (smtpEnableBox1Obj.checked)
		disableObj(false, "smtpUser1 smtpPass1 smtpServer1 sender1 receiver1 smtpPort1 test1");
	else
		disableObj(true, "smtpUser1 smtpPass1 smtpServer1 sender1 receiver1 smtpPort1 test1");
}

function checkftpEnableBox1(ftpEnableBox1ID){
	var ftpEnableBox1Obj = get_by_id(ftpEnableBox1ID);

	if (ftpEnableBox1Obj.checked)
		disableObj(false, "ftpUser1 ftpPass1 ftpServer1 folder1 fixFile1 ftpPort1 ftpInterval passiveBox1 test2");
	else
		disableObj(true, "ftpUser1 ftpPass1 ftpServer1 folder1 fixFile1 ftpPort1 ftpInterval passiveBox1 test2");
}

function isEMailAddr(str) {
//    var str = elem.value;
    var re = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (!str.match(re)) {
//        alert("Verify the email address format.");
        return false;
    } else {
        return true;
    }
}
]]>
</script>
<script language="JavaScript" type="text/javascript">
var mailNameError = "<xsl:value-of select="root/lang/body/mailNameError" />";
var ftpNameError = "<xsl:value-of select="root/lang/body/ftpNameError" />";
var firSmtpError = "<xsl:value-of select="root/lang/body/firSmtpError" />";
var firSmtpName = "<xsl:value-of select="root/lang/body/firSmtpName" />";
var PortError1 = "<xsl:value-of select="root/lang/body/PortError1" />";
var PortError2 = "<xsl:value-of select="root/lang/body/PortError2" />";
var PortError3 = "<xsl:value-of select="root/lang/body/PortError3" />";
var firAccountError = "<xsl:value-of select="root/lang/body/firAccountError" />";
var firRecipientMailError = "<xsl:value-of select="root/lang/body/firRecipientMailError" />";
var firRecipientError = "<xsl:value-of select="root/lang/body/firRecipientError" />";
var firSenderMailError = "<xsl:value-of select="root/lang/body/firSenderMailError" />";
var firSenderError = "<xsl:value-of select="root/lang/body/firSenderError" />";

var firFtpServerError = "<xsl:value-of select="root/lang/body/firFtpServerError" />";
var firFtpError = "<xsl:value-of select="root/lang/body/firFtpError" />";
var firFolderError = "<xsl:value-of select="root/lang/body/firFolderError" />";
var firFixFilenameError = "<xsl:value-of select="root/lang/body/firFixFilenameError" />";

var methodError = "<xsl:value-of select="root/lang/body/methodError" />";
var scheduleError = "<xsl:value-of select="root/lang/body/scheduleError" />";
var triggerError = "<xsl:value-of select="root/lang/body/triggerError" />";
var hourError =  "<xsl:value-of select="root/lang/body/hourError" />";
var minuteError = "<xsl:value-of select="root/lang/body/minuteError" />";
var fullHourError = "<xsl:value-of select="root/lang/body/fullHourError" />";
var legalTimeError = "<xsl:value-of select="root/lang/body/legalTimeError" />";
var intervalError = "<xsl:value-of select="root/lang/body/intervalError" />";
var ftpMailError = "<xsl:value-of select="root/lang/body/ftpMailError" />";
var ftpScheduleError = "<xsl:value-of select="root/lang/body/ftpScheduleError" />";

var displaySystem = "<xsl:value-of select="root/config/display/system" />";
var diFlag = "<xsl:value-of select="root/common/peripheral/GPINs" />";

function initForm(){
	if (diFlag==1)
		document.getElementById("digitIn1").style.display="";
	else if (diFlag==2){
		document.getElementById("digitIn1").style.display="";
		document.getElementById("digitIn2").style.display="";
	}
	else if (diFlag==3){
		document.getElementById("digitIn1").style.display="";
		document.getElementById("digitIn2").style.display="";
		document.getElementById("digitIn3").style.display="";
	}
	else if (diFlag==4){
		document.getElementById("digitIn1").style.display="";
		document.getElementById("digitIn2").style.display="";
		document.getElementById("digitIn3").style.display="";
		document.getElementById("digitIn4").style.display="";
	}

	//checkbox
	if ('<xsl:value-of select="root/config/snapshot/enable" />' == '1')
		document.form1.enableAction.checked=true;
	
	if ('<xsl:value-of select="root/config/snapshot/triggerBy/byMotion" />' == '1')
		document.form1.byMotionBox.checked=true;
	if ('<xsl:value-of select="root/config/snapshot/triggerBy/byIn1" />' == '1')
		document.form1.byIn1Box.checked=true;
	if ('<xsl:value-of select="root/config/snapshot/triggerBy/byIn2" />' == '1')
		document.form1.byIn1Box2.checked=true;
	if ((document.form1.byMotionBox.checked) || (document.form1.byIn1Box.checked) || (document.form1.byIn1Box2.checked))
		document.form1.trigger.checked = true;
	
	if ('<xsl:value-of select="root/config/snapshot/continuous" />' == '1')
		document.form1.continuousBox.checked=true;
	if ('<xsl:value-of select="root/config/snapshot/schedule/enable" />' == '1')
		document.form1.scheduleBox.checked=true;

	if ('<xsl:value-of select="root/config/mail/smtpEnable1" />' == '1')
		document.form1.smtpEnableBox1.checked=true;
	
	if ('<xsl:value-of select="root/config/ftp/ftpEnable1" />' == '1')
		document.form1.ftpEnableBox1.checked=true;
	if ('<xsl:value-of select="root/config/ftp/passive1" />' == '1')
		document.form1.passiveBox1.checked=true;
	
	//set week, hour and minute field
	var sizeOfItem = <xsl:value-of select="root/config/snapshot/schedule/itemSize" />;
	var countItem = 0;
	var splitDate;
	var itemData;
	var day;
	var myForm = document.form1;

	//item01
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item01" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item02
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item02" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item03
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item03" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item04
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item04" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item05
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item05" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item06
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item06" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item07
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/snapshot/schedule/item07" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	
	changeMode();
}	
function clickMotion()
{
	if(diFlag == '0')
	document.getElementById("byMotionBox").checked = document.getElementById("trigger").checked;
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
	<td width="100%">
		<xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/cameraName" />
	</td>
        <td align="right" nowrap="nowrap">&nbsp;</td>
        <td align="right" nowrap="nowrap">
		<xsl:value-of select="root/lang/frame/version" />
		<xsl:value-of select="root/common/version" />
	</td>
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
<table border="0" cellpadding="2" cellspacing="2" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
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
						<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/snapshot" /></div>
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
			</div>
			</td>
		</tr>
                </tbody>
		</table>
	</td>
	<form id="form1" name="form1" method="post" action="adv_snapshot_cont.cgi">
	<td valign="top" id="maincontent_container">
		<div id="maincontent">
			<div id="box_header">
			<h1><xsl:value-of select="root/lang/body/snapshot" /></h1>
			<xsl:value-of select="root/lang/body/description1" /><br />
			<xsl:if test="root/config/display/system = 'SXGA'">
				<font color="#FF0000"><xsl:value-of select="root/lang/body/description2" /><br /><xsl:value-of select="root/lang/body/description3" /><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/body/description4" /></a><xsl:value-of select="root/lang/body/description5" /></font><br />
			</xsl:if>
            <font color="#FF0000"><xsl:value-of select="root/lang/body/description6" /><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/body/description7" /></a><xsl:value-of select="root/lang/body/description8" /></font>
			<br />
            <br />
			<center>
			<input name="Submit" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request(0)"/>
			<input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_snapshot_cont.cgi'" />
			</center>
        		<xsl:if test="/root/result/code = 'ok'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/ok" />
				</font>
   			</xsl:if>
        		<xsl:if test="/root/result/code = 'testMailOk'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/testMailOk" />
				</font>
   			</xsl:if>
        		<xsl:if test="/root/result/code = 'testMailFault'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/testMailFault" />
				</font>
   			</xsl:if>
        		<xsl:if test="/root/result/code = 'getFrameFault'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/getFrameFault" />
				</font>
   			</xsl:if>
        		<xsl:if test="/root/result/code = 'invalidPort'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/invalidPort" />
				</font>
   			</xsl:if>
        		<xsl:if test="/root/result/code = 'testFTPFault'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/testFTPFault" />
				</font>
   			</xsl:if>
        		<xsl:if test="/root/result/code = 'testFTPOk'">
				<font color="#FF0000">
				<xsl:value-of select="root/lang/message/testFTPOk" />
				</font>
   			</xsl:if>
			</div>
			<div class="box">
		        <h2><xsl:value-of select="root/lang/body/snapshot" /></h2>
			<table width="525" cellspacing="1" cellpadding="1">
			<tbody>
			<tr>
				<td colspan="10">
					<input type="checkbox" name="enableAction" id="enableAction" onclick="changeMode()" />
					<xsl:value-of select="root/lang/body/enable" />
					<input name="enable" id="enable" type="hidden" size="1" value="0" />
				</td>
			</tr>
                        <tr>
				<td>&nbsp;</td>
				<td colspan="9"><xsl:value-of select="root/lang/body/scheduling" /></td>
                        </tr>
			<tr>
				<td width="30">&nbsp;</td>
				<td width="30">&nbsp;</td>
				<td colspan="8">
					<input type="checkbox" name="trigger" id="trigger" onclick="changeMode4();clickMotion();" />
					<xsl:if test="root/common/peripheral/GPINs = '1' or root/common/peripheral/GPINs = '2'">
					<xsl:value-of select="root/lang/body/eventBased" />
                    </xsl:if>
                    <xsl:if test="root/common/peripheral/GPINs = '0'">
					<xsl:value-of select="root/lang/body/eventBased" /> (<xsl:value-of select="root/lang/body/motionDetection" />)
                    </xsl:if>
				</td>
			</tr>
            <tr id="trmotion">
				<td width="30">&nbsp;</td>
				<td width="30">&nbsp;</td>
				<td width="30">&nbsp;</td>
				<td colspan="7">
					<input type="checkbox" name="byMotionBox" id="byMotionBox" />
					<xsl:value-of select="root/lang/body/motionDetection" />
					<input name="byMotion" id="byMotion" type="hidden" size="1" value="0" />
				</td>
                        </tr>
                        <tr id="digitIn1" name="digitIn1" style="display:none">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="7">
					<input type="checkbox" name="byIn1Box" id="byIn1Box" />
					<xsl:value-of select="root/lang/body/di" />
					<input name="byIn1" id="byIn1" type="hidden" size="1" value="0" />
				</td>
                        </tr>
			<tr id="digitIn2" name="digitIn2" style="display:none">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="7">
					<input type="checkbox" name="byIn1Box2" id="byIn1Box2" />
					<xsl:value-of select="root/lang/body/di2" />
					<input name="byIn2" id="byIn2" type="hidden" size="1" value="0" />
				</td>
                        </tr>
			<tr id="digitIn3" name="digitIn3" style="display:none">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="7">
					<input type="checkbox" name="byIn1Box3" id="byIn1Box3" />
					<xsl:value-of select="root/lang/body/di3" />
					<input name="byIn3" id="byIn3" type="hidden" size="1" value="0" />
				</td>
                        </tr>
			<tr id="digitIn4" name="digitIn4" style="display:none">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="7">
					<input type="checkbox" name="byIn1Box4" id="byIn1Box4" />
					<xsl:value-of select="root/lang/body/di4" />
					<input name="byIn4" id="byIn4" type="hidden" size="1" value="0" />
				</td>
                        </tr>
			<tr id="recHide1">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="8">
					<input type="checkbox" name="continuousBox" id="continuousBox" onclick="changeMode2()" />
					<xsl:value-of select="root/lang/body/continousRecording" />
					<input name="continuous" id="continuous" type="hidden" size="3" value="off" />
				</td>
			</tr>
			<tr id="recHide2">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="8">
					<input type="checkbox" name="scheduleBox" id="scheduleBox" onclick="changeMode3()" />
					<xsl:value-of select="root/lang/body/scheduledRecording" />
					<input name="schedule" id="schedule" type="hidden" size="3" value="off" />
				</td>
			</tr>
			<tr id="recHide3">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td width="40">&nbsp;</td>
				<td width="60">
					<input name="itemSize" id="itemSize" type="hidden" size="1" value="0" />
					<input name="item01" id="item01" type="hidden" size="11" value="" />
					<input name="item02" id="item02" type="hidden" size="11" value="" />
					<input name="item03" id="item03" type="hidden" size="11" value="" />
					<input name="item04" id="item04" type="hidden" size="11" value="" />
					<input name="item05" id="item05" type="hidden" size="11" value="" />
					<input name="item06" id="item06" type="hidden" size="11" value="" />
					<input name="item07" id="item07" type="hidden" size="11" value="" />
				</td>
				<td width="25">&nbsp;</td>
				<td width="42"><xsl:value-of select="root/lang/body/hour" /></td>
				<td width="45"><xsl:value-of select="root/lang/body/min" /></td>
				<td width="25">&nbsp;</td>
				<td width="42"><xsl:value-of select="root/lang/body/hour" /></td>
				<td width="115" ><xsl:value-of select="root/lang/body/min" /></td>
			</tr>
			<tr id="recHide4" style="border:0px">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="sun" id="sun" />
					<xsl:value-of select="root/lang/body/sun" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="sunH1" id="sunH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="sunM1" id="sunM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="sunH2" id="sunH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="sunM2" id="sunM2" />
				</td>
			</tr>
			<tr id="recHide5">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="mon" id="mon" />
					<xsl:value-of select="root/lang/body/mon" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="monH1" id="monH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="monM1" id="monM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="monH2" id="monH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="monM2" id="monM2" />
				</td>
			</tr>
			<tr id="recHide6">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="tue" id="tue" />
					<xsl:value-of select="root/lang/body/tue" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="tueH1" id="tueH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="tueM1" id="tueM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="tueH2" id="tueH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="tueM2" id="tueM2" />
				</td>
			</tr>
			<tr id="recHide7">
                        	<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="wed" id="wed" />
					<xsl:value-of select="root/lang/body/wed" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="wedH1" id="wedH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="wedM1" id="wedM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="wedH2" id="wedH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="wedM2" id="wedM2" />
				</td>
			</tr>
			<tr id="recHide8">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="thu" id="thu" />
					<xsl:value-of select="root/lang/body/thu" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="thuH1" id="thuH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="thuM1" id="thuM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="thuH2" id="thuH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="thuM2" id="thuM2" />
				</td>
			</tr>
			<tr id="recHide9">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="fri" id="fri" />
					<xsl:value-of select="root/lang/body/fri" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="friH1" id="friH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="friM1" id="friM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="friH2" id="friH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="friM2" id="friM2" />
				</td>
			</tr>
			<tr id="recHide10">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input type="checkbox" name="sat" id="sat" />
					<xsl:value-of select="root/lang/body/sat" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="satH1" id="satH1" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="satM1" id="satM1" />
				</td>
				<td><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startHour}" name="satH2" id="satH2" />&nbsp;:
				</td>
				<td>
					<input maxlength="2" size="2" value="{root/config/samba/startMin}" name="satM2" id="satM2" />
				</td>
			</tr>
			</tbody>
			</table>
			<table width="525" cellpadding="1" cellspacing="1">
			<tbody>
			<tr>
				<td>&nbsp;</td>
				<td colspan="4"><xsl:value-of select="root/lang/body/sendVideoClipBy" /></td>
			</tr>
			<tr>
				<td width="30">&nbsp;</td>
				<td width="30">&nbsp;</td>
				<td colspan="3">
					<input type="checkbox" name="smtpEnableBox1" id="smtpEnableBox1" onclick="changeMode1()" />
					<xsl:value-of select="root/lang/body/emailAddress" />
					<input name="smtpEnable1" id="smtpEnable1" type="hidden" size="1" value="0" />
					<input name="toSmtp" id="toSmtp" type="hidden" size="1" value="0" />
				</td>
                        </tr>
                        <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td width="30">&nbsp;</td>
				<td width="150"><xsl:value-of select="root/lang/body/userName" /></td>
				<td width="255"><input type="text" maxlength="60" size="30" value="{root/config/mail/smtpUser1}" name="smtpUser1" id="smtpUser1" /></td>
                        </tr>
                        <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/password" /></td>
				<td><input type="password" maxlength="60" size="30" value="{root/config/mail/smtpPass1}" name="smtpPass1" id="smtpPass1" /></td>
                        </tr>
                        <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/mailServer" /></td>
				<td>
					<label>
					<input type="text" maxlength="60" size="30" value="{root/config/mail/smtpServer1}" name="smtpServer1" id="smtpServer1" />
					</label>
				</td>
                        </tr>
                        <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/senderAddress" /></td>
				<td>
					<input type="text" maxlength="60" size="30" value="{root/config/mail/sender1}" name="sender1" id="sender1" />
				</td>
                        </tr>
                        <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/recipientAddress" /></td>
				<td><input type="text" maxlength="60" size="30" value="{root/config/mail/receiver1}" name="receiver1" id="receiver1" /></td>
                        </tr>
                        <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/port" /></td>
				<td>
					<input maxlength="5" size="5" value="{root/config/mail/smtpPort1}" name="smtpPort1" id="smtpPort1" />
					&nbsp;<xsl:value-of select="root/lang/body/portRange" />
				</td>
                        </tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input name="test1" id="test1" type="button" class="button_submit" value="{root/lang/body/test}" onclick="send_request(1)"/>
					<input type="hidden" maxlength="1" size="1" value="0" name="smtpTestMail" id="smtpTestMail" />
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="3">
					<input type="checkbox" name="ftpEnableBox1" id="ftpEnableBox1" onclick="changeMode5()" />
					<xsl:value-of select="root/lang/body/ftpServer" />
					<input name="ftpEnable1" id="ftpEnable1" type="hidden" size="1" value="0" />
					<input name="toFtp" id="toFtp" type="hidden" size="1" value="0" />
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/userName" /></td>
				<td><input type="text" maxlength="30" size="30" value="{root/config/ftp/ftpUser1}" name="ftpUser1" id="ftpUser1" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/password" /></td>
				<td><input type="password" maxlength="30" size="30" value="{root/config/ftp/ftpPass1}" name="ftpPass1" id="ftpPass1" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/hostName" /></td>
				<td><input type="text" maxlength="60" size="30" value="{root/config/ftp/ftpServer1}" name="ftpServer1" id="ftpServer1" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/path" /></td>
				<td><input type="text" maxlength="30" size="30" value="{root/config/ftp/folder1}" name="folder1" id="folder1" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/prefixFileName" /></td>
				<td><input type="text" maxlength="30" size="30" value="{root/config/ftp/fixFile1}" name="fixFile1" id="fixFile1" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/port" /></td>
				<td>
					<input maxlength="5" size="5" value="{root/config/ftp/ftpPort1}" name="ftpPort1" id="ftpPort1" />
					&nbsp;<xsl:value-of select="root/lang/body/portRange" />
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/interval" /></td>
				<td>
					<input maxlength="5" size="5" value="{root/config/ftp/ftpInterval}" name="ftpInterval" id="ftpInterval" />
					&nbsp;<xsl:value-of select="root/lang/body/second" />
					&nbsp;<xsl:value-of select="root/lang/body/range" />
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><xsl:value-of select="root/lang/body/passiveMode" /></td>
				<td>
					<label>
					<input type="checkbox" name="passiveBox1" id="passiveBox1" />
					<input name="passive1" id="passive1" type="hidden" size="1" value="0" />
					</label>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>
					<input name="test2" id="test2" type="button" class="button_submit" value="{root/lang/body/test}" onclick="send_request(2)"/>
					<input type="hidden" maxlength="1" size="1" value="0" name="ftpTest" id="ftpTest" />
				</td>
			</tr>
			</tbody>
			</table>
			</div><br/>
			<center>
				<input name="Submit" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request(0)"/>
				<input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='adv_snapshot_cont.cgi'" />
			</center>
		</div>
	</td>
	</form>
	<td valign="top" width="150" id="sidehelp_container" align="left">
		<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
		<tbody>
                <tr>
			<td id="help_text"><b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br />
                        <br />
                        <xsl:value-of select="root/lang/hint/description1" />
				<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
			</td>
		</tr>
		</tbody>
		</table>
	</td>
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
