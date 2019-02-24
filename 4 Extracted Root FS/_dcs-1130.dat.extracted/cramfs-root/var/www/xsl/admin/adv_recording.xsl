<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="adv_recording.xml" --><!DOCTYPE xsl:stylesheet  [
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
<script language="JavaScript" src="../net.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
<![CDATA[

function send_request(){
	if(document.form1.recordCheckBox.checked){
		document.form1.recordEnable.value = "on";
		if(document.form1.continuousBox.checked || document.form1.scheduleBox.checked || document.form1.trigger.checked){
		}
		else{
			alert(methodError);
			return false;
		}
	}
	else
		document.form1.recordEnable.value = "off";

	if(document.form1.continuousBox.checked){
		document.form1.continuous.value = "on";
		document.form1.schedule.value = "off";
		document.form1.byMotion.value = "off";
		document.form1.byIn1.value = "off";
	}
	else
		document.form1.continuous.value = "off";
	
	if(document.form1.scheduleBox.checked){
		document.form1.schedule.value = "on";
		document.form1.continuous.value = "off";
	}
	else
		document.form1.schedule.value = "off";

	if(document.form1.trigger.checked){
		if(document.form1.byMotionBox.checked){
		
			document.form1.byMotion.value = "on";
			document.form1.continuous.value = "off";
		}
		else
			document.form1.byMotion.value = "off";

		if(document.form1.byIn1Box.checked){
			document.form1.byIn1.value = "on";
			document.form1.continuous.value = "off";
		}
		else
			document.form1.byIn1.value = "off";

		if(document.form1.byIn1Box2.checked){
			document.form1.byIn2.value = "on";
			document.form1.continuous.value = "off";
		}
		else
			document.form1.byIn2.value = "off";
	}
	else{
		document.form1.byMotion.value = "off";
		document.form1.byIn1.value = "off";
		document.form1.byIn2.value = "off";
	}

	if(document.form1.storage[1].checked)
		document.form1.toSamba.value = "1";
	else
		document.form1.toUSB.value = "1";

//if(document.form1.recordCheckBox.checked){

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
	
	if(document.form1.trigger.checked){
		if(document.form1.byMotionBox.checked || document.form1.byIn1Box.checked || document.form1.byIn1Box2.checked){
		}
		else{
			alert(triggerError);
			return false;
		}

		if(recordCheckSecs(document.form1.prerecord,recordSecError)==false)
			return false;
		if(recordCheckSecs(document.form1.postrecord,recordSecError)==false)
			return false;
	}
	
	if(document.form1.storage[1].checked){
		if(document.form1.anonymous[0].selected){
			if(document.form1.user.value == ""){
				alert(usernameError);
				document.form1.user.select();
				return false;
			}
			if(checkNameLimit("user")==false)
				return false;
			if(checkPasswordLimit("password")==false)
				return false;
				
			if(document.form1.password.value != document.form1.passwordConfim.value){
				alert(confimError);
				document.form1.passwordConfim.select();
				return false;
			}
		}
		if(checkServer("server",serverError)==false)
			return false;
		if(checkShareFolder("shareFolder",shareFolderError)==false)
			return false;
	//}
		
	if(spaceCheck(document.form1.keepSpace,spaceError)==false)
		return false;
}

	send_submit("form1");
}

function recordCheckSecs(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,0,15)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

function spaceCheck(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,32,1000000000)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

function changeMode1()
{
	
	if(document.form1.recordCheckBox.checked){
		document.form1.profileID.disabled=false;
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
		document.form1.trigger.disabled=false;
		document.form1.byMotionBox.disabled=false;
		document.form1.byIn1Box.disabled=false;
		document.form1.byIn1Box2.disabled=false;
		document.form1.prerecord.disabled=false;
		document.form1.postrecord.disabled=false;
		document.form1.samba.disabled=false;
		document.form1.anonymous.disabled=false;
		document.form1.user.disabled=false;
		document.form1.password.disabled=false;
		document.form1.passwordConfim.disabled=false;
		document.form1.server.disabled=false;
		document.form1.shareFolder.disabled=false;
		document.form1.sambaTest.disabled=false;
		document.form1.sambaStatusButton.disabled=false;
		document.form1.sdCardStatusButton.disabled=false;
		document.form1.sdCard.disabled=false;
		document.form1.keepSpace.disabled=false;
		document.form1.recycleStop.disabled=false;
		document.form1.recycleFiles.disabled=false;
		changeMode2();
		changeMode3();
		changeMode4();
		changeMode6();
		changeMode5();
		changeMode7();
	}
	else{
		document.form1.profileID.disabled=true;
		document.form1.continuousBox.disabled=true;
		document.form1.scheduleBox.disabled=true;
		document.form1.sun.disabled=true;
		document.form1.sunH1.disabled=true;
		document.form1.sunM1.disabled=true;
		document.form1.sunH2.disabled=true;
		document.form1.sunM2.disabled=true;
		document.form1.mon.disabled=true;
		document.form1.monH1.disabled=true;
		document.form1.monM1.disabled=true;
		document.form1.monH2.disabled=true;
		document.form1.monM2.disabled=true;
		document.form1.tue.disabled=true;
		document.form1.tueH1.disabled=true;
		document.form1.tueM1.disabled=true;
		document.form1.tueH2.disabled=true;
		document.form1.tueM2.disabled=true;
		document.form1.wed.disabled=true;
		document.form1.wedH1.disabled=true;
		document.form1.wedM1.disabled=true;
		document.form1.wedH2.disabled=true;
		document.form1.wedM2.disabled=true;
		document.form1.thu.disabled=true;
		document.form1.thuH1.disabled=true;
		document.form1.thuM1.disabled=true;
		document.form1.thuH2.disabled=true;
		document.form1.thuM2.disabled=true;
		document.form1.fri.disabled=true;
		document.form1.friH1.disabled=true;
		document.form1.friM1.disabled=true;
		document.form1.friH2.disabled=true;
		document.form1.friM2.disabled=true;
		document.form1.sat.disabled=true;
		document.form1.satH1.disabled=true;
		document.form1.satM1.disabled=true;
		document.form1.satH2.disabled=true;
		document.form1.satM2.disabled=true;
		document.form1.trigger.disabled=true;
		document.form1.byMotionBox.disabled=true;
		document.form1.byIn1Box.disabled=true;
		document.form1.byIn1Box2.disabled=true;
		document.form1.prerecord.disabled=true;
		document.form1.postrecord.disabled=true;
		document.form1.samba.disabled=true;
		document.form1.anonymous.disabled=true;
		document.form1.user.disabled=true;
		document.form1.password.disabled=true;
		document.form1.passwordConfim.disabled=true;
		document.form1.server.disabled=true;
		document.form1.shareFolder.disabled=true;
		document.form1.sambaTest.disabled=true;
		document.form1.sambaStatusButton.disabled=true;
		document.form1.sdCardStatusButton.disabled=true;
		document.form1.sdCard.disabled=true;
		document.form1.keepSpace.disabled=true;
		document.form1.recycleStop.disabled=true;
		document.form1.recycleFiles.disabled=true;
	}
}

function changeMode2(){
	if(document.form1.continuousBox.checked){
		document.form1.scheduleBox.disabled=true;
		document.form1.sun.disabled=true;
		document.form1.sunH1.disabled=true;
		document.form1.sunM1.disabled=true;
		document.form1.sunH2.disabled=true;
		document.form1.sunM2.disabled=true;
		document.form1.mon.disabled=true;
		document.form1.monH1.disabled=true;
		document.form1.monM1.disabled=true;
		document.form1.monH2.disabled=true;
		document.form1.monM2.disabled=true;
		document.form1.tue.disabled=true;
		document.form1.tueH1.disabled=true;
		document.form1.tueM1.disabled=true;
		document.form1.tueH2.disabled=true;
		document.form1.tueM2.disabled=true;
		document.form1.wed.disabled=true;
		document.form1.wedH1.disabled=true;
		document.form1.wedM1.disabled=true;
		document.form1.wedH2.disabled=true;
		document.form1.wedM2.disabled=true;
		document.form1.thu.disabled=true;
		document.form1.thuH1.disabled=true;
		document.form1.thuM1.disabled=true;
		document.form1.thuH2.disabled=true;
		document.form1.thuM2.disabled=true;
		document.form1.fri.disabled=true;
		document.form1.friH1.disabled=true;
		document.form1.friM1.disabled=true;
		document.form1.friH2.disabled=true;
		document.form1.friM2.disabled=true;
		document.form1.sat.disabled=true;
		document.form1.satH1.disabled=true;
		document.form1.satM1.disabled=true;
		document.form1.satH2.disabled=true;
		document.form1.satM2.disabled=true;
		document.form1.trigger.disabled=true;
		document.form1.byMotionBox.disabled=true;
		document.form1.byIn1Box.disabled=true;
		document.form1.byIn1Box2.disabled=true;
		document.form1.prerecord.disabled=true;
		document.form1.postrecord.disabled=true;
	}
	else{
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
		document.form1.trigger.disabled=false;
		document.form1.byMotionBox.disabled=false;
		document.form1.byIn1Box.disabled=false;
		document.form1.byIn1Box2.disabled=false;
		document.form1.prerecord.disabled=false;
		document.form1.postrecord.disabled=false;
		changeMode3();
		changeMode4();
	}
	changeMode7();
}

function changeMode3(){
	if(document.form1.scheduleBox.checked || document.form1.trigger.checked)
		document.form1.continuousBox.disabled=true;
	else
		document.form1.continuousBox.disabled=false;
	
	if(document.form1.scheduleBox.checked){
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
	}
	else{
		document.form1.sun.disabled=true;
		document.form1.sunH1.disabled=true;
		document.form1.sunM1.disabled=true;
		document.form1.sunH2.disabled=true;
		document.form1.sunM2.disabled=true;
		document.form1.mon.disabled=true;
		document.form1.monH1.disabled=true;
		document.form1.monM1.disabled=true;
		document.form1.monH2.disabled=true;
		document.form1.monM2.disabled=true;
		document.form1.tue.disabled=true;
		document.form1.tueH1.disabled=true;
		document.form1.tueM1.disabled=true;
		document.form1.tueH2.disabled=true;
		document.form1.tueM2.disabled=true;
		document.form1.wed.disabled=true;
		document.form1.wedH1.disabled=true;
		document.form1.wedM1.disabled=true;
		document.form1.wedH2.disabled=true;
		document.form1.wedM2.disabled=true;
		document.form1.thu.disabled=true;
		document.form1.thuH1.disabled=true;
		document.form1.thuM1.disabled=true;
		document.form1.thuH2.disabled=true;
		document.form1.thuM2.disabled=true;
		document.form1.fri.disabled=true;
		document.form1.friH1.disabled=true;
		document.form1.friM1.disabled=true;
		document.form1.friH2.disabled=true;
		document.form1.friM2.disabled=true;
		document.form1.sat.disabled=true;
		document.form1.satH1.disabled=true;
		document.form1.satM1.disabled=true;
		document.form1.satH2.disabled=true;
		document.form1.satM2.disabled=true;
	}
	changeMode7();
}

function changeMode4(){
	if(document.form1.scheduleBox.checked || document.form1.trigger.checked)
		document.form1.continuousBox.disabled=true;
	else
		document.form1.continuousBox.disabled=false;
		
	if(document.form1.trigger.checked){
		document.form1.byMotionBox.disabled=false;
		document.form1.byIn1Box.disabled=false;
		document.form1.byIn1Box2.disabled=false;
		document.form1.prerecord.disabled=false;
		document.form1.postrecord.disabled=false;
	}
	else{
		document.form1.byMotionBox.disabled=true;
		document.form1.byIn1Box.disabled=true;
		document.form1.byIn1Box2.disabled=true;
		document.form1.prerecord.disabled=true;
		document.form1.postrecord.disabled=true;
	}
	if(document.form1.storage[0].checked){
		document.form1.continuousBox.disabled=true;
		document.form1.scheduleBox.disabled=true;
	}
	changeMode7();
}

function changeMode5(){
	if(disableFlag == 1){
		if(document.form1.storage[0].checked){
			document.form1.anonymous.disabled=true;
			document.form1.user.disabled=true;
			document.form1.password.disabled=true;
			document.form1.passwordConfim.disabled=true;
			document.form1.server.disabled=true;
			document.form1.shareFolder.disabled=true;
//			document.form1.sambaTest.disabled=true;
//			document.form1.sambaStatusButton.disabled=true;
//			document.form1.sdCardStatusButton.disabled=false;
			document.form1.continuousBox.checked=false;
			document.form1.scheduleBox.checked=false;
			changeMode2();
		}
		else{
			document.form1.anonymous.disabled=false;
			document.form1.user.disabled=false;
			document.form1.password.disabled=false;
			document.form1.passwordConfim.disabled=false;
			document.form1.server.disabled=false;
			document.form1.shareFolder.disabled=false;
//			document.form1.sambaTest.disabled=false;
//			document.form1.sambaStatusButton.disabled=false;
//			document.form1.sdCardStatusButton.disabled=true;
			changeMode6();
		}
	}
	else{
		if(document.form1.storage[0].checked){
			document.form1.anonymous.disabled=true;
			document.form1.user.disabled=true;
			document.form1.password.disabled=true;
			document.form1.passwordConfim.disabled=true;
			document.form1.server.disabled=true;
			document.form1.shareFolder.disabled=true;
			document.form1.sambaTest.disabled=true;
			document.form1.sambaStatusButton.disabled=true;
			document.form1.sdCardStatusButton.disabled=false;
			document.form1.continuousBox.checked=false;
			document.form1.scheduleBox.checked=false;
			changeMode2();
			document.form1.continuousBox.disabled=true;
			document.form1.scheduleBox.disabled=true;
		}
		else{
			document.form1.anonymous.disabled=false;
			document.form1.user.disabled=false;
			document.form1.password.disabled=false;
			document.form1.passwordConfim.disabled=false;
			document.form1.server.disabled=false;
			document.form1.shareFolder.disabled=false;
			document.form1.sambaTest.disabled=false;
			document.form1.sambaStatusButton.disabled=false;
			document.form1.sdCardStatusButton.disabled=true;
			document.form1.continuousBox.disabled=false;
			document.form1.scheduleBox.disabled=false;
			changeMode6();
			if(document.form1.scheduleBox.checked || document.form1.trigger.checked)
				document.form1.continuousBox.disabled=true;
			else
				document.form1.continuousBox.disabled=false;
			if(document.form1.continuousBox.checked){
				document.form1.scheduleBox.disabled=true;
				document.form1.trigger.disabled=true;
			}
		}
	}
	changeMode7();
}

function changeMode6(){
	if(document.form1.anonymous[0].selected){
		document.form1.user.disabled=false;
		document.form1.password.disabled=false;
		document.form1.passwordConfim.disabled=false;
	}
	else{
		document.form1.user.disabled=true;
		document.form1.password.disabled=true;
		document.form1.passwordConfim.disabled=true;
	}
}

function changeMode7(){
	if (displaySystem == 'SXGA')
		document.form1.byMotionBox.disabled=true;
}

function disableButton(index){
	if(document.form1.recordCheckBox.checked){
		if (index == 1){
				disableFlag = 1;
				document.form1.sambaTest.disabled=true;
				document.form1.sambaStatusButton.disabled=true;
				document.form1.sdCardStatusButton.disabled=true;
		}
		else{
			if(document.form1.storage[1].checked){
				document.form1.sambaTest.disabled=false;
				document.form1.sambaStatusButton.disabled=false;
				document.form1.sdCardStatusButton.disabled=true;
			}
			else{
				document.form1.sambaTest.disabled=true;
				document.form1.sambaStatusButton.disabled=true;
				document.form1.sdCardStatusButton.disabled=false;
			}
		}
	}
	else{
		document.form1.sambaTest.disabled=true;
		document.form1.sambaStatusButton.disabled=true;
		document.form1.sdCardStatusButton.disabled=true;
	}
}

function sendStatus(){
	var urlXML = document.form1.hostname.value + ":" + window.location.port + "/cgi/admin/recorder_status.cgi";
	var urlXSL = 'adv_recording.xsl';

	statusFlag = 0;
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
	doXSLT();
}

function onXSLLoad(){
	xslDoc=this.req.responseXML;
	doXSLT();
}



//Samba Test
var xmlDocSambaTest;
var xslDocSambaTest;
function LoadXMLXSLTDocSambaTest(urlXMLSambaTest,urlXSLSambaTest){
	xmlDocSambaTest=null;
	xslDocSambaTest=null;
	new net.ContentLoader(urlXMLSambaTest,onXMLLoadSambaTest);
}

function onXMLLoadSambaTest(){
	xmlDocSambaTest=this.req.responseXML;
	doXSLTSambaTest();
}

function onXSLLoadSambaTest(){
	xslDocSambaTest=this.req.responseXML;
	doXSLTSambaTest();
}



]]>
</script>
<script language="JavaScript" type="text/javascript">
var methodError = "<xsl:value-of select="root/lang/body/methodError" />";
var scheduleError = "<xsl:value-of select="root/lang/body/scheduleError" />";
var triggerError = "<xsl:value-of select="root/lang/body/triggerError" />";
var hourError =  "<xsl:value-of select="root/lang/body/hourError" />";
var minuteError = "<xsl:value-of select="root/lang/body/minuteError" />";
var fullHourError = "<xsl:value-of select="root/lang/body/fullHourError" />";
var legalTimeError = "<xsl:value-of select="root/lang/body/legalTimeError" />";
var recordSecError = "<xsl:value-of select="root/lang/body/recordSecError" />";
var usernameError = "<xsl:value-of select="root/lang/body/usernameError" />";
var passwordError = "<xsl:value-of select="root/lang/body/passwordError" />";
var confimError = "<xsl:value-of select="root/lang/body/confimError" />";
var serverError = "<xsl:value-of select="root/lang/body/serverError" />";
var shareFolderError = "<xsl:value-of select="root/lang/body/shareFolderError" />";
var spaceError = "<xsl:value-of select="root/lang/body/spaceError" />";
var statusFlag = 0;
var disableFlag = 0;

var displaySystem = "<xsl:value-of select="root/config/display/system" />";
var diFlag = "<xsl:value-of select="root/common/peripheral/GPINs" />";
var Testing = "<xsl:value-of select="root/lang/message/testing" />";
var disable = "<xsl:value-of select="root/lang/message/disable" />";
var normal = "<xsl:value-of select="root/lang/message/normal" />";
var initing = "<xsl:value-of select="root/lang/message/initing" />";
var mntFailure = "<xsl:value-of select="root/lang/message/mntFailure" />";
var Failure = "<xsl:value-of select="root/lang/message/failure" />";
var count=-1;
var timeoutID;

function RecordingStatusMsg(ID,status)
{
	if(status == "Testing")
		document.getElementById(ID).innerHTML = Testing;
	else if(status == "Disabled")
		document.getElementById(ID).innerHTML = disable;
	else if(status == "Normal")
		document.getElementById(ID).innerHTML = normal;
	else if(status == "mntFailure")
		document.getElementById(ID).innerHTML = mntFailure;
	else if(status == "initing")
		document.getElementById(ID).innerHTML = initing;
	else if(status == "Failure")
		document.getElementById(ID).innerHTML = Failure;
	else
		document.getElementById(ID).innerHTML = status;
}
function doXSLTSambaTest(){
	if (xmlDocSambaTest==null){// alert("null"); 
	return false;
	}
	var status =  xmlDocSambaTest.getElementsByTagName('code')[0].firstChild.nodeValue;
	RecordingStatusMsg("sambaStatusResult",status);
	disableButton(0);
	disableFlag = 0;
}

function doXSLT(){
	if (xmlDoc==null){ //alert("null");
	return false; 
	}

	if(statusFlag == 1)
		RecordingStatusMsg("sambaStatus",xmlDoc.getElementsByTagName('samba')[0].firstChild.nodeValue);
		//document.getElementById("sambaStatus").innerHTML = xmlDoc.getElementsByTagName('samba')[0].firstChild.nodeValue;
	else if(statusFlag == 2)
		RecordingStatusMsg("sdCardStatus",xmlDoc.getElementsByTagName('usb')[0].firstChild.nodeValue);
		//document.getElementById("sdCardStatus").innerHTML = xmlDoc.getElementsByTagName('usb')[0].firstChild.nodeValue;
	else {
		RecordingStatusMsg("sambaStatus",xmlDoc.getElementsByTagName('samba')[0].firstChild.nodeValue);
		RecordingStatusMsg("sdCardStatus",xmlDoc.getElementsByTagName('usb')[0].firstChild.nodeValue);
		//document.getElementById("sambaStatus").innerHTML = xmlDoc.getElementsByTagName('samba')[0].firstChild.nodeValue;
		//document.getElementById("sdCardStatus").innerHTML = xmlDoc.getElementsByTagName('usb')[0].firstChild.nodeValue;
	}

	disableButton(0);
	disableFlag = 0;
}

function sambaStatusTest(){
	var urlXML = document.form1.hostname.value + ":" + window.location.port + "/cgi/admin/recorder_status.cgi";
	var urlXSL = 'adv_recording.xsl';

	statusFlag = 1;
	document.getElementById("sambaStatus").innerHTML = Testing;
	disableButton(1);
	LoadXMLXSLTDoc(urlXML,urlXSL);
}

function SDCardStatusTest(){
	var urlXML = document.form1.hostname.value + ":" + window.location.port + "/cgi/admin/recorder_status.cgi"+"?device=usb";
	var urlXSL = 'adv_recording.xsl';

	statusFlag = 2;
	document.getElementById("sdCardStatus").innerHTML = Testing;
	disableButton(1);
	LoadXMLXSLTDoc(urlXML,urlXSL);
}


var localStorage = "<xsl:value-of select="root/common/peripheral/localStorage" />";

function clickCheckBox()
{
	if(localStorage == '0')
		document.getElementById("samba").checked = document.getElementById("recordCheckBox").checked;
	if(diFlag == '0')
		document.getElementById("byMotionBox").checked = document.getElementById("trigger").checked;
}

function begin_count(){
	timeoutID = window.setInterval("ShowRealTime()", 1000)
}

function ShowRealTime(){
	if(count==-1){
		count = 6;
		sendStatus();
		window.clearInterval(timeoutID);
		begin_count();
	}
	if(count==0){
		if (document.getElementById("sambaStatus").innerHTML == "Initializing"){
//			alert(document.getElementById("sambaStatus").innerHTML)
			count = 6;
			sendStatus();
			window.clearInterval(timeoutID);
			begin_count();
		}
		else if (document.getElementById("sdCardStatus").innerHTML == "Initializing"){
//			alert(document.getElementById("sdCardStatus").innerHTML)
			count = 6;
			sendStatus();
			window.clearInterval(timeoutID);
			begin_count();
		}
		else{
//			alert(document.getElementById("sambaStatus").innerHTML)
			window.clearTimeout(timeoutID);
		}
	}
	count--;
}

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

	if ('<xsl:value-of select="root/common/peripheral/localStorage" />' == '0'){
		document.getElementById("hideSdCard1").style.display="none";
		document.getElementById("hideSdCard2").style.display="none";
		document.getElementById("textNoSdcard").style.display="";
	}
	else
		document.getElementById("textSdcard").style.display="";

	//checkbox
	if ('<xsl:value-of select="root/config/record/enable" />' == '1')
		document.form1.recordCheckBox.checked=true;
	if ('<xsl:value-of select="root/config/record/continuous" />' == '1')
		document.form1.continuousBox.checked=true;
	if ('<xsl:value-of select="root/config/record/schedule/enable" />' == '1')
		document.form1.scheduleBox.checked=true;
	if ('<xsl:value-of select="root/config/record/triggerBy/byMotion" />' == '1'){
		document.form1.byMotionBox.checked=true;
		document.form1.trigger.checked=true;
	}
	if ('<xsl:value-of select="root/config/record/triggerBy/byIn1" />' == '1'){
		document.form1.byIn1Box.checked=true;
		document.form1.trigger.checked=true;
	}

	if ('<xsl:value-of select="root/config/record/triggerBy/byIn2" />' == '1'){
		document.form1.byIn1Box2.checked=true;
		document.form1.trigger.checked=true;
	}                                                                          		

	//radio
	//storage
	if ('<xsl:value-of select="root/config/record/recordTo/toSamba/enable" />' == '1')
		document.form1.samba.checked=true;
	else if ('<xsl:value-of select="root/config/record/recordTo/toUSB/enable" />' == '1')
		document.form1.sdCard.checked=true;
	if ('<xsl:value-of select="root/common/peripheral/localStorage" />' == '0')
		document.form1.samba.checked=true;
	//storageFull
	if ('<xsl:value-of select="root/config/record/recycle" />' == '0')
		document.form1.recycleStop.checked=true;
	else if ('<xsl:value-of select="root/config/record/recycle" />' == '1')
		document.form1.recycleFiles.checked=true;

	//select
	//profileID
	if ('<xsl:value-of select="root/config/record/profileID" />' == '0')
		document.form1.profileID.value = '0';
	if ('<xsl:value-of select="root/config/record/profileID" />' == '1')
		document.form1.profileID.value = '1';
	if ('<xsl:value-of select="root/config/record/profileID" />' == '2')
		document.form1.profileID.value = '2';
	if ('<xsl:value-of select="root/config/record/profileID" />' == '3')
		document.form1.profileID.value = '3';
/*	if ('<xsl:value-of select="root/config/display/system" />' == 'SXGA'){
		if ('<xsl:value-of select="root/config/record/profileID" />' == '0')
			document.form1.profileID.value = '1';
	}*/
	//video
	if ('<xsl:value-of select="root/config/record/recordTo/toSamba/anonymous" />' == '0')
		document.form1.anonymous.value = '0';
	if ('<xsl:value-of select="root/config/record/recordTo/toSamba/anonymous" />' == '1')
		document.form1.anonymous.value = '1';

	var sizeOfItem = <xsl:value-of select="root/config/record/schedule/itemSize" />;
	var countItem = 0;
	var splitDate;
	var itemData;
	var day;
	var myForm = document.form1;

	//item01
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item01" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item02
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item02" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item03
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item03" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item04
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item04" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item05
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item05" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item06
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item06" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	//item07
	if(sizeOfItem != countItem){
		itemData = "<xsl:value-of select="root/config/record/schedule/item07" />";
		splitDate = itemData.split(",");
		formatNumber(splitDate);
		setItemDayAndTime(myForm, splitDate);
		countItem++ ;
	}
	if('<xsl:value-of select="root/common/peripheral/localStorage" />' == "1")
	{
			document.getElementById("trSamba").style.display="";
			document.getElementById("tdRecordTo1").style.display="";
	}
	else
			document.getElementById("tdRecordTo2").style.display="";
			

	document.form1.hostname.value = "http://" + window.location.hostname;
	initcheck();
	begin_count();
	sendStatus();
}

function initcheck(){
//	if ('<xsl:value-of select="root/config/record/enable" />' != '1')
		changeMode1();
}
</script>
<xsl:if test="root/common/peripheral/wireless = '0'">
<title><xsl:value-of select="root/lang/frame/title1" /><xsl:value-of select="root/lang/leftPanel/titleSetup" /></title>
</xsl:if>
<xsl:if test="root/common/peripheral/wireless = '1'">
<title><xsl:value-of select="root/lang/frame/title2" /><xsl:value-of select="root/lang/leftPanel/titleSetup" /></title>
</xsl:if>

</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%"><xsl:value-of select="root/lang/frame/productpage" /><xsl:value-of select="root/common/cameraName" /></td>
        <td align="right" nowrap="nowrap"></td>
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/recording" /></div>
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
			<form id="form1" name="form1" method="post" action="recorder.cgi">
			<td valign="top" id="maincontent_container" width="563">
				<div id="maincontent">
                  <div id="box_header">
                    <h1><xsl:value-of select="root/lang/body/recordingSettings" /></h1>
                    <xsl:value-of select="root/lang/body/description1" /><br />
						<xsl:if test="root/config/display/system = 'SXGA'">
						<font color="#FF0000"><xsl:value-of select="root/lang/body/description2" /><br /><xsl:value-of select="root/lang/body/description3" /><a href="adv_audiovideo.cgi"><xsl:value-of select="root/lang/body/description4" /></a><xsl:value-of select="root/lang/body/description5" /></font><br />
						</xsl:if>
						<br />
					<center>
                    <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
                    <input name="button2" type="reset" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='recorder.cgi'" />
					</center>
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'invalidParameter'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />						</font>
   				    </xsl:if>
        			<xsl:if test="/root/result/code = 'updateFailed'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/fail" />						</font>
   				    </xsl:if>
                  </div>
<div class="box">
                    <h2><xsl:value-of select="root/lang/body/recording" /></h2>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                      <tr>
                        <td colspan="10" ><!--				  <input type="checkbox" name="recordEn" id="recordEn" onclick="changeMode()" />-->
                            <input type="checkbox" name="recordCheckBox" id="recordCheckBox" onclick="changeMode1();clickCheckBox()"/>
                            <xsl:value-of select="root/lang/body/enableRecording" />
                            <input name="recordEnable" id="recordEnable" type="hidden" size="3" value="off" />
							<input name="hostname" id="hostname" type="hidden" size="30" value="hostname" />
						</td>
                      </tr>
					</table>
					<table cellspacing="1" cellpadding="1" width="525" border="0">
                      <tr>
                        <td width="40">&nbsp;</td>
                        <td colspan="5" style="display:none" id="tdRecordTo1"><xsl:value-of select="root/lang/body/recordTo" />:</td>
                        <td colspan="5" style="display:none" id="tdRecordTo2"><xsl:value-of select="root/lang/body/recordTo" /> <xsl:value-of select="root/lang/body/sambaNetworkDrive" />:</td>
                      </tr>
                      <tr id="hideSdCard1" name="hideSdCard1">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="4"><input type="radio" value="1" name="storage" id="sdCard" onclick="changeMode5()" />
                            <xsl:value-of select="root/lang/body/sdCard" />
                            <input name="toUSB" id="toUSB" type="hidden" size="1" value="0" /></td>
                      </tr>
                      <tr id="hideSdCard2" name="hideSdCard2">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="3" ><xsl:value-of select="root/lang/body/sdCardStatus" /> <span id="sdCardStatus"></span>
							&nbsp;<input type="button" name="sdCardStatusButton" id="sdCardStatusButton" class="button_submit" value="{root/lang/body/getStatus}" onclick="SDCardStatusTest()" />						</td>
                      </tr>
          
                     <tr style="display:none" id="trSamba" >
                        <td>&nbsp;</td>
                        <td width="40">&nbsp;</td>
                        <td colspan="4"><input type="radio" value="0" name="storage" id="samba" onclick="changeMode5()" />
                        <xsl:value-of select="root/lang/body/sambaNetworkDrive" />
                        <input name="toSamba" id="toSamba" type="hidden" size="1" value="0" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td width="40">&nbsp;</td>
                        <td colspan="3" ><xsl:value-of select="root/lang/body/sambaAuth" />
                            <select name="anonymous" id="anonymous" onchange="changeMode6()" onclick="changeMode6()">
                              <option value="0"><xsl:value-of select="root/lang/body/account" /></option>
                              <option value="1"><xsl:value-of select="root/lang/body/anonymous" /></option>
                          </select></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td width="40">&nbsp;</td>
                        <td width="100" ><xsl:value-of select="root/lang/body/username" /></td>
                        <td width="265"><input maxlength="30" size="30" value="{root/config/record/recordTo/toSamba/user}" name="user" id="user" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td ><xsl:value-of select="root/lang/body/password" /></td>
                        <td><input type="password" maxlength="30" size="30" value="{root/config/record/recordTo/toSamba/password}" name="password" id="password" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td ><xsl:value-of select="root/lang/body/passwordConfim" /></td>
                        <td><input type="password" maxlength="30" size="30" value="{root/config/record/recordTo/toSamba/password}" name="passwordConfim" id="passwordConfim" /></td>
                      </tr>
					</table>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                      <tr>
                        <td width="40">&nbsp;</td>
                        <td width="40">&nbsp;</td>
                        <td width="40">&nbsp;</td>
                        <td width="80"><xsl:value-of select="root/lang/body/serverIp" /></td>
                        <td width="325"><input maxlength="30" size="30" value="{root/config/record/recordTo/toSamba/server}" name="server" id="server" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/sharedFolder" /></td>
                        <td><input maxlength="30" size="30" value="{root/config/record/recordTo/toSamba/shareFolder}" name="shareFolder" id="shareFolder" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="3" >
							<input type="button" name="sambaTest" id="sambaTest" class="button_submit" value="{root/lang/body/test}" onclick="sendSambaTest(usernameError,passwordError,confimError,Testing)" />&nbsp;<span id="sambaStatusResult"></span></td>
                     </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="3" ><xsl:value-of select="root/lang/body/sambaStatus" /> <span id="sambaStatus"></span>
							&nbsp;<input type="button" name="sambaStatusButton" id="sambaStatusButton" class="button_submit" value="{root/lang/body/getStatus}" onclick="sambaStatusTest()" />						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="5"><xsl:value-of select="root/lang/body/recordingOptions" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="4"><xsl:value-of select="root/lang/body/resolution" />&nbsp;
						<select name="profileID" id="profileID">
							<xsl:if test="root/config/display/system = 'SXGA'">
                            <option value="0"><xsl:value-of select="root/lang/body/large" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/medium" /></option>
                            <option value="2"><xsl:value-of select="root/lang/body/small" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/titan" /></option>
							</xsl:if>
							<xsl:if test="root/config/display/system = 'XGA'">
							<option value="0"><xsl:value-of select="root/lang/body/large" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/medium" /></option>
                            <option value="2"><xsl:value-of select="root/lang/body/small" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/titan" /></option>
							</xsl:if>
							<xsl:if test="root/config/display/system = 'VGA'">
							<option value="0"><xsl:value-of select="root/lang/body/large" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/medium" /></option>
                            <option value="2"><xsl:value-of select="root/lang/body/small" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/titan" /></option>
							</xsl:if>
							<xsl:if test="root/config/display/system = 'NTSC'">
							<option value="0"><xsl:value-of select="root/lang/body/large" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/medium" /></option>
                            <option value="2"><xsl:value-of select="root/lang/body/small" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/titan" /></option>
							</xsl:if>
							<xsl:if test="root/config/display/system = 'PAL'">
							<option value="0"><xsl:value-of select="root/lang/body/large" /></option>
                            <option value="1"><xsl:value-of select="root/lang/body/medium" /></option>
                            <option value="2"><xsl:value-of select="root/lang/body/small" /></option>
							<option value="3"><xsl:value-of select="root/lang/body/titan" /></option>
							</xsl:if>
                          </select>
						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="4"><xsl:value-of select="root/lang/body/recordUntil" />
                          <input maxlength="6" size="6" value="{root/config/record/keepSpace}" name="keepSpace" id="keepSpace" /> 
                          &nbsp;<xsl:value-of select="root/lang/body/spaceRange" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="4"><xsl:value-of select="root/lang/body/storageFull" />&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
						<td>&nbsp;</td>
                        <td colspan="3"><input type="radio" value="0" name="recycle" id="recycleStop" />
                            <xsl:value-of select="root/lang/body/stopRecording" />
                        <input name="recycleEnable" id="recycleEnable" type="hidden" size="2" value="" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
						<td>&nbsp;</td>
                        <td colspan="3"><input type="radio" value="1" name="recycle" id="recycleFiles" />
                        <xsl:value-of select="root/lang/body/overwriteRecordings" /></td>
                      </tr>
                </table>
<table cellspacing="1" cellpadding="1" width="525" border="0">
                      <tr>
                        <td width="40">&nbsp;</td>
                        <td colspan="9"><xsl:value-of select="root/lang/body/scheduling" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="1">&nbsp;</td>
                        <td colspan="8"><input type="checkbox" name="trigger" id="trigger" onclick="changeMode4();clickCheckBox()" />
                          <!--				  <input type="checkbox" name="recordEvent" id="recordEvent" />-->
                          <xsl:if test="root/common/peripheral/GPINs = '1' or root/common/peripheral/GPINs = '2'">
                            <xsl:value-of select="root/lang/body/eventBased" />
							</xsl:if>
                            <xsl:if test="root/common/peripheral/GPINs = '0'">
                            <xsl:value-of select="root/lang/body/eventBased" /> (<xsl:value-of select="root/lang/body/motionDetection" />)
							</xsl:if>                            </td>
                  </tr>
                     <tr id="trMotion">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="7"><input type="checkbox" name="byMotionBox" id="byMotionBox" />
                            <xsl:value-of select="root/lang/body/motionDetection" />
                            <input name="byMotion" id="byMotion" type="hidden" size="3" value="off" /></td>
                      </tr>
                      <tr id="digitIn1" name="digitIn1" style="display:none">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="7" ><input type="checkbox" name="byIn1Box" id="byIn1Box" />
                            <xsl:value-of select="root/lang/body/digitalInput" />
                            <input name="byIn1" id="byIn1" type="hidden" size="3" value="off" /></td>
                      </tr>
					  <tr id="digitIn2" name="digitIn2" style="display:none">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
						<td>&nbsp;</td>
                        <td colspan="7" ><input type="checkbox" name="byIn1Box2" id="byIn1Box2" />
                            <xsl:value-of select="root/lang/body/digitalInput2" />
                            <input name="byIn2" id="byIn2" type="hidden" size="3" value="off" /></td>
                      </tr>
					  <tr id="digitIn3" name="digitIn3" style="display:none">
					    <td>&nbsp;</td>
                        <td>&nbsp;</td>
						<td>&nbsp;</td>
                        <td colspan="7" ><input type="checkbox" name="byIn1Box3" id="byIn1Box3" />
                            <xsl:value-of select="root/lang/body/digitalInput3" />
                            <input name="byIn3" id="byIn3" type="hidden" size="3" value="off" /></td>
                      </tr>
					  <tr id="digitIn4" name="digitIn4" style="display:none">
					    <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="7" ><input type="checkbox" name="byIn1Box4" id="byIn1Box4" />
                            <xsl:value-of select="root/lang/body/digitalInput4" />
                            <input name="byIn4" id="byIn4" type="hidden" size="3" value="off" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/prerecord" /></td>
                        <td colspan="6" ><input maxlength="2" size="2" value="{root/config/record/prerecord}" name="prerecord" id="prerecord" />
                            <xsl:value-of select="root/lang/body/second" /> <xsl:value-of select="root/lang/body/range" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><xsl:value-of select="root/lang/body/postrecord" /></td>
                        <td colspan="6"><input maxlength="2" size="2" value="{root/config/record/postrecord}" name="postrecord" id="postrecord" />
                            <xsl:value-of select="root/lang/body/second" /> <xsl:value-of select="root/lang/body/range" /></td>
                      </tr>
                      <tr id="recHide1">
                        <td>&nbsp;</td>
                        <td width="40" colspan="1">&nbsp;</td>
                        <td colspan="8"><input type="checkbox" name="continuousBox" id="continuousBox" onclick="changeMode2()" />
                            <!--				  <input type="checkbox" name="recordCon" id="recordCon" />-->
                            <xsl:choose>
                            <xsl:when test = "root/common/peripheral/localStorage = '1'">
								<xsl:value-of select="root/lang/body/continousRecording" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="root/lang/body/continousRecordingOnlySamba" />
                            </xsl:otherwise>
                            </xsl:choose> 
                            <input name="continuous" id="continuous" type="hidden" size="3" value="off" /></td>
                      </tr>
                      <tr id="recHide2">
                        <td>&nbsp;</td>
                        <td colspan="1">&nbsp;</td>
                        <td colspan="8"><input type="checkbox" name="scheduleBox" id="scheduleBox" onclick="changeMode3()" />
                            <!--				  <input type="checkbox" name="schedule" id="schedule" />-->
                            <xsl:choose>
                            <xsl:when test = "root/common/peripheral/localStorage = '1'">
								<xsl:value-of select="root/lang/body/scheduledRecording" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="root/lang/body/scheduledRecordingOnlySamba" />
                            </xsl:otherwise>
                            <!--<xsl:if test="root/common/peripheral/localStorage = '1'">-->
                         
                           <!-- </xsl:if>-->
                            </xsl:choose> 

                            
                            
                            <input name="schedule" id="schedule" type="hidden" size="3" value="off" /></td>
                      </tr>
                      <tr id="recHide3">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="40" >&nbsp;</td>
                        <td width="55" ><input name="itemSize" id="itemSize" type="hidden" size="1" value="0" />
                            <input name="item01" id="item01" type="hidden" size="11" value="" />
                            <input name="item02" id="item02" type="hidden" size="11" value="" />
                            <input name="item03" id="item03" type="hidden" size="11" value="" />
                            <input name="item04" id="item04" type="hidden" size="11" value="" />
                            <input name="item05" id="item05" type="hidden" size="11" value="" />
                            <input name="item06" id="item06" type="hidden" size="11" value="" />
                            <input name="item07" id="item07" type="hidden" size="11" value="" /></td>
                        <td width="25" ></td>
                        <td width="42" ><xsl:value-of select="root/lang/body/hour" /></td>
                        <td width="45" ><xsl:value-of select="root/lang/body/min" /></td>
                        <td width="25" >&nbsp;</td>
                        <td width="42" ><xsl:value-of select="root/lang/body/hour" /></td>
                        <td width="120" ><xsl:value-of select="root/lang/body/min" /></td>
                      </tr>
                      <tr id="recHide4">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="sun" id="sun" />
                            <xsl:value-of select="root/lang/body/sun" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="sunH1" id="sunH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="sunM1" id="sunM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="sunH2" id="sunH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="sunM2" id="sunM2" /></td>
                      </tr>
                      <tr id="recHide5">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="mon" id="mon" />
                            <xsl:value-of select="root/lang/body/mon" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="monH1" id="monH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="monM1" id="monM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="monH2" id="monH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="monM2" id="monM2" /></td>
                      </tr>
                      <tr id="recHide6">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="tue" id="tue" />
                            <xsl:value-of select="root/lang/body/tue" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="tueH1" id="tueH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="tueM1" id="tueM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="tueH2" id="tueH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="tueM2" id="tueM2" /></td>
                      </tr>
                      <tr id="recHide7">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="wed" id="wed" />
                            <xsl:value-of select="root/lang/body/wed" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="wedH1" id="wedH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="wedM1" id="wedM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="wedH2" id="wedH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="wedM2" id="wedM2" /></td>
                      </tr>
                      <tr id="recHide8">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="thu" id="thu" />
                            <xsl:value-of select="root/lang/body/thu" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="thuH1" id="thuH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="thuM1" id="thuM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="thuH2" id="thuH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="thuM2" id="thuM2" /></td>
                      </tr>
                      <tr id="recHide9">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="fri" id="fri" />
                            <xsl:value-of select="root/lang/body/fri" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="friH1" id="friH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="friM1" id="friM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="friH2" id="friH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="friM2" id="friM2" /></td>
                      </tr>
                      <tr id="recHide10">
                        <td ></td>
                        <td >&nbsp;</td>
                        <td width="30" >&nbsp;</td>
                        <td ><input type="checkbox" name="sat" id="sat" />
                            <xsl:value-of select="root/lang/body/sat" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/from" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="satH1" id="satH1" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="satM1" id="satM1" /></td>
                        <td ><div align="center"><xsl:value-of select="root/lang/body/to" /></div></td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startHour}" name="satH2" id="satH2" />
                          :</td>
                        <td ><input maxlength="2" size="2" value="{root/config/samba/startMin}" name="satM2" id="satM2" /></td>
                      </tr>
                      <!--
                <tr>
                  <td ><a href="schedule_profile_manager.cgi"></a></td>
                  <td >&nbsp;</td>
                  <td width="40" >&nbsp;</td>
                  <td colspan="3" ><xsl:value-of select="root/lang/body/scheduleProfile" />
                    <select name="schTime" id="schTime">
                      <option value="0"><xsl:value-of select="root/lang/body/workTime" /></option>
                      <option value="1"><xsl:value-of select="root/lang/body/sleepTime" /></option>
                      <option value="2"><xsl:value-of select="root/lang/body/weekend" /></option>
                    </select></td>
                  </tr>
-->
                      <!--
                <tr>
                  <td>&nbsp;</td>
                  <td><a href="adv_schedule.cgi"></a></td>
                  <td><a href="adv_schedule.cgi"></a></td>
                  <td ><a href="adv_schedule.cgi"><xsl:value-of select="root/lang/body/configureSchedule" /></a></td>
                  <td >&nbsp;</td>
                </tr>
-->
                    </table>
</div>
<!--				  
				  <div class="box">
                    <h2><xsl:value-of select="root/lang/body/storage" /></h2>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                <tr>
                  <td colspan="2">
				  <input onclick="changeMode4(0)" type="radio" value="0" name="storage" id="windowsServer" />
				  <input type="radio" value="0" name="storage" id="windowsServer" />
                  <xsl:value-of select="root/lang/body/windowsServer" />
				  <input name="sambaEnable" id="sambaEnable" type="hidden" size="2" value="" />
				  </td> 
                  <td width="3" >&nbsp;</td>
                  </tr>
                <tr>
                  <td width="165" align="right">&nbsp;</td> 
                  <td >&nbsp;</td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td> 
                  <td >&nbsp;</td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td> 
                  <td >&nbsp;</td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td> 
                  <td >&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2">
				  <input onclick="changeMode4(1)" type="radio" value="1" name="storage" id="usbFlashDisk" />
				  <input type="radio" value="1" name="storage" id="usbFlashDisk" />
				  <input name="usbEnable" id="usbEnable" type="hidden" size="2" value="" />
				  </td> 
                  <td >&nbsp;</td>
                  </tr>
                <tr>
                  <td>&nbsp;</td> 
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td >&nbsp;</td> 
                  <td>&nbsp;</td>
                </tr>
              </table>
                  </div>

<div class="box">
                    <h2><xsl:value-of select="root/lang/body/videoAudio" /></h2>
                    <table cellspacing="1" cellpadding="1" width="525" border="0">
                <tr>
                  <td colspan="2"><xsl:value-of select="root/lang/body/videoSudioSettings" /></td>
                </tr>
                <tr>
                  <td width="165" ><xsl:value-of select="root/lang/body/video" /></td> 
                  <td width="353" ><select name="video" id="video">
                    <option value="0"><xsl:value-of select="root/lang/body/mpeg4" /></option>
                    <option value="1"><xsl:value-of select="root/lang/body/jpeg" /></option>
                  </select></td>
                  </tr>
                <tr>
                  <td width="165" ><xsl:value-of select="root/lang/body/audio" /></td> 
                  <td ><select name="audio" id="audio">
                    <option value="0"><xsl:value-of select="root/lang/body/pcm" /></option>
                  </select></td>
                  </tr>
              </table>
                  </div>
-->
					<br />
					<center>
                    <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
                    <input name="button2" type="reset" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='recorder.cgi'" />
					</center>
			  </div></td>
		  </form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table bordercolor="#ffffff" cellspacing="0" bordercolordark="#ffffff" 
      cellpadding="2" bgcolor="#ffffff" bordercolorlight="#ffffff" border="0">
                  <tbody>
                    <tr>
                      <td id="help_text">
					  	<div id="textSdcard" style="display:none;font-size:11px">
					  		<b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br /><br />
                            <xsl:value-of select="root/lang/hint/description3" /><br />
							<!--<xsl:value-of select="root/lang/hint/description1" /><br /><br />-->
							<!--<xsl:value-of select="root/lang/hint/description2" /><br />-->
						</div>
					  	<div id="textNoSdcard" style="display:none;font-size:11px">
					  		<b><xsl:value-of select="root/lang/hint/helpfulHints" /></b><br /><br />
							<xsl:value-of select="root/lang/hint/descriptionNoSdcard" /><br /><br />
						</div>
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
</body>
<!--
<script>
<xsl:text disable-output-escaping="yes">
<![CDATA[
//	change_tx();
]]>
</xsl:text>
</script>
-->
</html>
</xsl:template>
</xsl:stylesheet>
