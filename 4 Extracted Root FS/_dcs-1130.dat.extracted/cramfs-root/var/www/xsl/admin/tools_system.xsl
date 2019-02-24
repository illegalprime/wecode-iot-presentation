<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="tools_system.xml" --><!DOCTYPE xsl:stylesheet  [
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
function send_request()
{
/*
	var today=new Date();
	var day1=today.getUTCDay();
	var year1=today.getUTCFullYear();
	var month1=today.getUTCMonth()+1;
	var date1=today.getUTCDate();
	var hour1=today.getUTCHours();
	var min1=today.getUTCMinutes();
	var sec1=today.getUTCSeconds();

	if (document.form1.ntpEnable[1].checked){
		document.form1.date.value = year1 + "/" + month1 + "/" + date1 ;
		document.form1.time.value = hour1 + ":" + min1 + ":" + sec1 ;
		document.form1.isUTC.value = 1;
	}
	if (document.form1.ntpEnable[2].checked){
		if (manualDateCheck(parameterError,yearError,monError,dayError1,dayError2,dayError3,dayError4)== false){
			document.form1.webDate.select();
			return false;
		}
		if (manualTimeCheck(parameterError,hourError,minuteError,secondError)== false){
			document.form1.webTime.select();
			return false;
		}
		document.form1.date.value = document.form1.webDate.value;
		document.form1.time.value = document.form1.webTime.value;
	}

	if(document.form1.enableOSDBox.checked){
		osdText = document.getElementById("osdText");
	    if (osdText.value != ''){
			if(checkASCII(asciiError)==-1)
				return -1;
		}
	}
*/
	if(document.form1.autoDST[1].checked){
//		if(timeCheckHours(document.form1.offsetHours,hourError)==false)
//			return -1;
		if(timeCheckHours(document.form1.startTimeHours,hourError)==false)
			return -1;
		if(timeCheckHours(document.form1.endTimeHours,hourError)==false)
			return -1;
//		if(timeCheckMins(document.form1.offsetMins,minuteError)==false)
//			return -1;
		if(timeCheckMins(document.form1.startTimeMins,minuteError)==false)
			return -1;
		if(timeCheckMins(document.form1.endTimeMins,minuteError)==false)
			return -1;
//		if(timeCheckSecs(document.form1.startTimeSecs,secondError)==false)
//			return -1;
//		if(timeCheckSecs(document.form1.endTimeSecs,secondError)==false)
//			return -1;
			
//		document.form1.offset.value = document.form1.offsetHours.value + ":" + document.form1.offsetMins.value;

//		document.form1.startTime.value = "M" + document.form1.startTimeMon.value + "." + document.form1.startTimeWeek.value + "." + document.form1.startTimeDayOfWeek.value + "/" + document.form1.startTimeHours.value + ":" + document.form1.startTimeMins.value + ":" + document.form1.startTimeSecs.value;
		document.form1.startTime.value = "M" + document.form1.startTimeMon.value + "." + document.form1.startTimeWeek.value + "." + document.form1.startTimeDayOfWeek.value + "/" + document.form1.startTimeHours.value + ":" + document.form1.startTimeMins.value + ":0";

//		document.form1.endTime.value = "M" + document.form1.endTimeMon.value + "." + document.form1.endTimeWeek.value + "." + document.form1.endTimeDayOfWeek.value + "/" + document.form1.endTimeHours.value + ":" + document.form1.endTimeMins.value + ":" + document.form1.endTimeSecs.value;
		document.form1.endTime.value = "M" + document.form1.endTimeMon.value + "." + document.form1.endTimeWeek.value + "." + document.form1.endTimeDayOfWeek.value + "/" + document.form1.endTimeHours.value + ":" + document.form1.endTimeMins.value + ":0";
	}

	if(document.form1.enableDSTBox.checked)
		document.form1.enableDST.value = "1";
	else
		document.form1.enableDST.value = "0";
	
//Do not use '!' signal for logic determination.
	if(document.form1.ntpServerBox.checked){
		document.form1.ntpEnable.value = 1;
		if(checkServer("ntpServer",ntpError1) == false){
			return false;
		}
		if(checkNTP("ntpServer",ntpError2) == false){
			return false;
		}
	}
	else{
		document.form1.ntpEnable.value = 0;
		if(document.form1.ntpEnableRadio.checked){
//		if(document.form1.ntpEnableRadio[1].checked){
			document.form1.date.value = document.form1.computerYear.value + "/" + document.form1.computerMonth.value + "/" + document.form1.computerDay.value ;
			document.form1.time.value = document.form1.computerHour.value + ":" + document.form1.computerMinute.value + ":" + document.form1.computerSecond.value ;
		}
//		document.form1.isUTC.value = 1;
	}

	send_submit("form1");
}

//function sepDatAndTime(offsetValue,startTimeValue,endTimeValue){
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

function sepNowDatAndTime(nowDateValue,nowTimeValue){
	var splitNowDate;
	var splitNowTime;

	splitNowDate = nowDateValue.split("/");
	splitNowTime = nowTimeValue.split(":");
//	alert(splitNowDate)
//	alert(splitNowTime)
	var year1 = splitNowDate[0];
	var mon1 = splitNowDate[1];
	var day1 = splitNowDate[2];
	var hour1 = splitNowTime[0];
	var mins1 = splitNowTime[1];
	var sec1 = splitNowTime[2];
	if (mon1 == "01")	mon1 = 1;	if (mon1 == "02")	mon1 = 2;	if (mon1 == "03")	mon1 = 3;
	if (mon1 == "04")	mon1 = 4;	if (mon1 == "05")	mon1 = 5;	if (mon1 == "06")	mon1 = 6;
	if (mon1 == "07")	mon1 = 7;	if (mon1 == "08")	mon1 = 8;	if (mon1 == "09")	mon1 = 9;
	if (day1 == "01")	day1 = 1;	if (day1 == "02")	day1 = 2;	if (day1 == "03")	day1 = 3;
	if (day1 == "04")	day1 = 4;	if (day1 == "05")	day1 = 5;	if (day1 == "06")	day1 = 6;
	if (day1 == "07")	day1 = 7;	if (day1 == "08")	day1 = 8;	if (day1 == "09")	day1 = 9;
	if (hour1 == "00")	hour1 = 0;	if (hour1 == "01")	hour1 = 1;	if (hour1 == "02")	hour1 = 2;	if (hour1 == "03")	hour1 = 3;
	if (hour1 == "04")	hour1 = 4;	if (hour1 == "05")	hour1 = 5;	if (hour1 == "06")	hour1 = 6;
	if (hour1 == "07")	hour1 = 7;	if (hour1 == "08")	hour1 = 8;	if (hour1 == "09")	hour1 = 9;
	if (mins1 == "00")	mins1 = 0;	if (mins1 == "01")	mins1 = 1;	if (mins1 == "02")	mins1 = 2;	if (mins1 == "03")	mins1 = 3;
	if (mins1 == "04")	mins1 = 4;	if (mins1 == "05")	mins1 = 5;	if (mins1 == "06")	mins1 = 6;
	if (mins1 == "07")	mins1 = 7;	if (mins1 == "08")	mins1 = 8;	if (mins1 == "09")	mins1 = 9;
	if (sec1 == "00")	sec1 = 0;	if (sec1 == "01")	sec1 = 1;	if (sec1 == "02")	sec1 = 2;	if (sec1 == "03")	sec1 = 3;
	if (sec1 == "04")	sec1 = 4;	if (sec1 == "05")	sec1 = 5;	if (sec1 == "06")	sec1 = 6;
	if (sec1 == "07")	sec1 = 7;	if (sec1 == "08")	sec1 = 8;	if (sec1 == "09")	sec1 = 9;
	document.form1.computerYear.value = year1;
	document.form1.computerMonth.value = mon1;
	document.form1.computerDay.value = day1;
	document.form1.computerHour.value = hour1;
	document.form1.computerMinute.value = mins1;
	document.form1.computerSecond.value = sec1;
}

function computerTime(){
	var today=new Date();
	var day1=today.getUTCDay();
	var year1=today.getUTCFullYear();
	var month1=today.getUTCMonth()+1;
	var date1=today.getUTCDate();
	var hour1=today.getUTCHours();
	var min1=today.getUTCMinutes();
	var sec1=today.getUTCSeconds();

	if(navigator.appName == "Microsoft Internet Explorer")
		document.form1.computerYear.value = today.getYear();
	else
		document.form1.computerYear.value = today.getYear()+1900;
	document.form1.computerMonth.value = today.getMonth()+1;
	document.form1.computerDay.value = today.getDate();
	document.form1.computerHour.value = today.getHours();
	document.form1.computerMinute.value = today.getMinutes();
	document.form1.computerSecond.value = today.getSeconds();

//	document.form1.date.value = year1 + "/" + month1 + "/" + date1 ;
//	document.form1.time.value = hour1 + ":" + min1 + ":" + sec1 ;
}

function changeMode(index)
{
	if(index == 1){
		if(document.form1.enableDSTBox.checked){
			if(document.form1.autoDST[0].checked)
				changeMode(3);
			else
				changeMode(4);
		}
		else
			changeMode(2);
	}
	else if(index==2){
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
//		document.form1.endTimeSecs.disabled=true;
	}
	else if(index==3){
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
//		document.form1.endTimeSecs.disabled=true;
	}
	else if(index==4){
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
//		document.form1.endTimeSecs.disabled=false;
	}
/*
	if(document.form1.enableOSDBox.checked){
		document.form1.osdText.disabled=false;
		document.form1.timeStampBox.disabled=false;
	}
	else{
		document.form1.osdText.disabled=true;
		document.form1.timeStampBox.disabled=true;
	}
*/
}
/*
function changeModeTime(index){
	if(index==1 || index==2){
		document.form1.webDate.disabled=true;
		document.form1.webTime.disabled=true;
		document.form1.ntpServer.disabled=true;
	}
	else if(index==3){
		document.form1.webDate.disabled=false;
		document.form1.webTime.disabled=false;
		document.form1.ntpServer.disabled=true;
	}
	else if(index==4){
		document.form1.webDate.disabled=true;
		document.form1.webTime.disabled=true;
		document.form1.ntpServer.disabled=false;
	}
}

*/
function changeModeTimeNew(index){
	if(index==1){
		if(document.form1.ntpServerBox.checked){
			document.form1.ntpServer.disabled=false;
			document.form1.providerNTP.disabled=false;
			document.form1.ntpEnableRadio.disabled=true;
//			document.form1.current.disabled=true;
//			document.form1.manual.disabled=true;
			document.form1.computerYear.disabled=true;
			document.form1.computerMonth.disabled=true;
			document.form1.computerDay.disabled=true;
			document.form1.computerHour.disabled=true;
			document.form1.computerMinute.disabled=true;
			document.form1.computerSecond.disabled=true;
			document.form1.computerTimeButton.disabled=true;
		}
		else{
			document.form1.ntpServer.disabled=true;
			document.form1.providerNTP.disabled=true;
			document.form1.ntpEnableRadio.disabled=false;
//			document.form1.current.disabled=false;
//			document.form1.manual.disabled=false;
			if(document.form1.ntpEnableRadio.checked){
//			if(document.form1.ntpEnableRadio[0].checked){
				document.form1.computerYear.disabled=false;
				document.form1.computerMonth.disabled=false;
				document.form1.computerDay.disabled=false;
				document.form1.computerHour.disabled=false;
				document.form1.computerMinute.disabled=false;
				document.form1.computerSecond.disabled=false;
				document.form1.computerTimeButton.disabled=false;
			}
			else{
//			else if(document.form1.ntpEnableRadio[1].checked){
				document.form1.computerYear.disabled=true;
				document.form1.computerMonth.disabled=true;
				document.form1.computerDay.disabled=true;
				document.form1.computerHour.disabled=true;
				document.form1.computerMinute.disabled=true;
				document.form1.computerSecond.disabled=true;
				document.form1.computerTimeButton.disabled=true;
			}
		}
	}
	else if(index==2 || index==3){
	if(document.form1.ntpEnableRadio.checked){
//	if(document.form1.ntpEnableRadio[0].checked){
		document.form1.computerYear.disabled=false;
		document.form1.computerMonth.disabled=false;
		document.form1.computerDay.disabled=false;
		document.form1.computerHour.disabled=false;
		document.form1.computerMinute.disabled=false;
		document.form1.computerSecond.disabled=false;
		document.form1.computerTimeButton.disabled=false;
	}
	else{
//	else if(document.form1.ntpEnableRadio[1].checked){
		document.form1.computerYear.disabled=true;
		document.form1.computerMonth.disabled=true;
		document.form1.computerDay.disabled=true;
		document.form1.computerHour.disabled=true;
		document.form1.computerMinute.disabled=true;
		document.form1.computerSecond.disabled=true;
		document.form1.computerTimeButton.disabled=true;
	}
	}
}

]]>
</script>
<script language="JavaScript" type="text/javascript">
var asciiError = "<xsl:value-of select="root/lang/body/asciiError" />";
var hourError =  "<xsl:value-of select="root/lang/body/hourError" />";
var minuteError = "<xsl:value-of select="root/lang/body/minuteError" />";
var secondError = "<xsl:value-of select="root/lang/body/secondError" />";
//var cameraNameError = "<xsl:value-of select="root/lang/body/cameraNameError" />";
var ntpError1 = "<xsl:value-of select="root/lang/body/ntpError1" />";
var ntpError2 = "<xsl:value-of select="root/lang/body/ntpError2" />";
var parameterError = "<xsl:value-of select="root/lang/body/parameterError" />";
var yearError =  "<xsl:value-of select="root/lang/body/yearError" />";
var monError = "<xsl:value-of select="root/lang/body/monError" />";
var dayError1 = "<xsl:value-of select="root/lang/body/dayError1" />";
var dayError2 = "<xsl:value-of select="root/lang/body/dayError2" />";
var dayError3 = "<xsl:value-of select="root/lang/body/dayError3" />";
var dayError4 = "<xsl:value-of select="root/lang/body/dayError4" />";

function initForm(){
	//checkbox
	if ('<xsl:value-of select="root/config/time/enableDST" />' == '1')
		document.form1.enableDSTBox.checked=true;
//	if ('<xsl:value-of select="root/config/osd/enable" />' == '1')
//		document.form1.enableOSDBox.checked=true;
//	if ('<xsl:value-of select="root/config/osd/timeStamp" />' == '1')
//		document.form1.timeStampBox.checked=true;
	if ('<xsl:value-of select="root/config/time/ntpEnable" />' == '1')
		document.form1.ntpServerBox.checked=true;

	//radio
	//type

//	if ('<xsl:value-of select="root/config/time/ntpEnable" />' == '0'){
//		document.form1.current.checked=true;
//		changeModeTimeNew(2);
//	}
/*
	if ('<xsl:value-of select="root/config/time/ntpEnable" />' == '1'){
		document.form1.automatic.checked=true;
		changeModeTime(4);
	}
*/
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

//	var offset = "<xsl:value-of select="root/config/time/offset" />";
	var startTime = "<xsl:value-of select="root/config/time/startTime" />";
	var endTime = "<xsl:value-of select="root/config/time/endTime" />";	
	document.form1.startTime.value = startTime;
	document.form1.endTime.value = endTime;
//	sepDatAndTime(offset,startTime,endTime);
	sepDatAndTime(startTime,endTime);

	if(document.form1.enableDSTBox.checked){
		if(document.form1.autoDST[0].checked)
			changeMode(3);
		else
			changeMode(4);
	}
	else
		changeMode(2);

	var nowDate = "<xsl:value-of select="root/config/time/now/date" />";
	var nowTime = "<xsl:value-of select="root/config/time/now/time" />";
	sepNowDatAndTime(nowDate,nowTime);

	changeModeTimeNew(1);
}

function changeMode3(){
	if(document.form1.providerNTP[1].selected)
		document.form1.ntpServer.value = "<xsl:value-of select="root/lang/body/ntp2" />";
	else if(document.form1.providerNTP[2].selected)
		document.form1.ntpServer.value = "<xsl:value-of select="root/lang/body/ntp1" />";
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
.style2 {font-size: 11px}
</xsl:comment>
</style>
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575" onload="initForm();">
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
		  <td id="sidenav_container" valign="top" width="125" align="left"><table border="0" cellpadding="0" cellspacing="0">
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
								<div id="sidenavoff"><xsl:value-of select="root/lang/leftPanel/timeAndDate" /></div>
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
          </table></td>
          <form id="form1" name="form1" method="post" action="tools_system.cgi">
		  <td valign="top" id="maincontent_container" width="563">
			<div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				  <div id="box_header"> 
						<h1><xsl:value-of select="root/lang/body/systemSettings" /></h1>
				            <xsl:value-of select="root/lang/body/description1" /><br />				    
				<br />
				  <center>
				  <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
				  <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='tools_system.cgi'" />
				  </center>
				  	<xsl:if test="/root/result/code = 'invalidParameter'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/invalidParameter" />						</font>
        			</xsl:if>
				  	<xsl:if test="/root/result/code = 'updateFailed'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/updateFailed" />						</font>
        			</xsl:if>
        			<xsl:if test="/root/result/code = 'ok'">
						<font color="#FF0000">
						<xsl:value-of select="root/lang/message/ok" />						</font>
   				    </xsl:if>
				  </div>
					<div class="box">
                      <h2><xsl:value-of select="root/lang/body/timeZoneSetting" /></h2>
                      <table width="525" height="70" border="0" cellpadding="2" cellspacing="2">
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
                            </select>						  </td>
                        </tr>
                        <tr>
                          <td colspan="9"><input type="checkbox" name="enableDSTBox" id="enableDSTBox" onclick="changeMode(1)" />
                            <xsl:value-of select="root/lang/body/enableDST" />
							<input type="hidden" maxlength="1" size="1" value="0" name="enableDST" id="enableDST" /></td>
                        </tr>
                        <tr>
                          <td width="30">&nbsp;</td>
                          <td colspan="8"><input type="radio"  value="1" id="auto" name="autoDST" onclick="changeMode(3)" />
                          <xsl:value-of select="root/lang/body/autoDST" /></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td colspan="8"><input type="radio"  value="0" id="manualDST" name="autoDST" onclick="changeMode(4)" />
                          <xsl:value-of select="root/lang/body/manual" /></td>
                        </tr>
                        <tr>
                          <td >&nbsp;</td>
                          <td width="30">&nbsp;</td>
                          <td><xsl:value-of select="root/lang/body/offset" /></td>
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
							<td><xsl:value-of select="root/lang/body/hours" /></td>
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
</div>

			  <div class="box">
                  <h2><xsl:value-of select="root/lang/body/automaticTime" /></h2>
				  <table width="525" border="0" cellpadding="2" cellspacing="2">
                    <tr>
                      <td colspan="2"><input type="checkbox" name="ntpServerBox" id="ntpServerBox" onclick="changeModeTimeNew(1)"/>
					  <xsl:value-of select="root/lang/body/synchronizeNTPServer" /></td>
                    </tr>
                    <tr>
                      <td width="140"><xsl:value-of select="root/lang/body/ntpServerUsed" /></td>
                      <td><input maxlength="60" size="30" name="ntpServer" id="ntpServer" value="{root/config/time/ntpServer}" />
&lt;&lt;
<select name="providerNTP" id="providerNTP" onclick="changeMode3()" onchange="changeMode3()">
  <option value="0"><xsl:value-of select="root/lang/body/selectNTP" /></option>
  <option value="2"><xsl:value-of select="root/lang/body/ntp2" /></option>
  <option value="1"><xsl:value-of select="root/lang/body/ntp1" /></option>
</select>
<input name="ntpEnable" id="ntpEnable" type="hidden" size="1" value="" />
<input type="hidden" maxlength="10" size="10" value="" name="date" id="date" />
<input type="hidden" maxlength="8" size="8" value="" name="time" id="time" />
<input type="hidden" maxlength="1" size="1" value="0" name="isUTC" id="isUTC" /></td>
                    </tr>
                  </table>
			  </div>
			  <div class="box">
                  <h2><xsl:value-of select="root/lang/body/setDateManually" /></h2>
			      <table width="525" border="0" cellpadding="2" cellspacing="2">
				  	<tr>
					  <td colspan="6">
					  <input type="checkbox" name="ntpEnableRadio" id="ntpEnableRadio" onclick="changeModeTimeNew(2)"/>
				      <xsl:value-of select="root/lang/body/manual" /></td>
					</tr>
                    <tr>
                      <td><xsl:value-of select="root/lang/body/year" /></td>
                      <td><select name="computerYear" id="computerYear" >
                        <!--  <option value="1969">1969</option>
                          <option value="1970">1970</option>
                          <option value="2006">2006</option>
                          <option value="2007">2007</option> 
                          <option value="2008">2008</option>
                          <option value="2009">2009</option>-->
                          <option value="2010">2010</option>
                          <option value="2011">2011</option>
                          <option value="2012">2012</option>
                          <option value="2013">2013</option>
                          <option value="2014">2014</option>
                          <option value="2015">2015</option>
                          <option value="2016">2016</option>
                          <option value="2017">2017</option>
                          <option value="2018">2018</option>
                          <option value="2019">2019</option>
                      </select></td>
                      <td><xsl:value-of select="root/lang/body/month" /></td>
                      <td><select name="computerMonth" id="computerMonth" >
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
                      <td><xsl:value-of select="root/lang/body/day" /></td>
                      <td><select name="computerDay" id="computerDay" >
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
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                          <option value="31">31</option>
                      </select></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td><xsl:value-of select="root/lang/body/hour" /></td>
                      <td><select name="computerHour" id="computerHour" >
                          <option value="0">0</option>
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
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                      </select></td>
                      <td><xsl:value-of select="root/lang/body/minute" /></td>
                      <td><select name="computerMinute" id="computerMinute" >
                          <option value="0">0</option>
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
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                          <option value="31">31</option>
                          <option value="32">32</option>
                          <option value="33">33</option>
                          <option value="34">34</option>
                          <option value="35">35</option>
                          <option value="36">36</option>
                          <option value="37">37</option>
                          <option value="38">38</option>
                          <option value="39">39</option>
                          <option value="40">40</option>
                          <option value="41">41</option>
                          <option value="42">42</option>
                          <option value="43">43</option>
                          <option value="44">44</option>
                          <option value="45">45</option>
                          <option value="46">46</option>
                          <option value="47">47</option>
                          <option value="48">48</option>
                          <option value="49">49</option>
                          <option value="50">50</option>
                          <option value="51">51</option>
                          <option value="52">52</option>
                          <option value="53">53</option>
                          <option value="54">54</option>
                          <option value="55">55</option>
                          <option value="56">56</option>
                          <option value="57">57</option>
                          <option value="58">58</option>
                          <option value="59">59</option>
                      </select></td>
                      <td><xsl:value-of select="root/lang/body/second" /></td>
                      <td><select name="computerSecond" id="computerSecond" >
                          <option value="0">0</option>
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
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                          <option value="31">31</option>
                          <option value="32">32</option>
                          <option value="33">33</option>
                          <option value="34">34</option>
                          <option value="35">35</option>
                          <option value="36">36</option>
                          <option value="37">37</option>
                          <option value="38">38</option>
                          <option value="39">39</option>
                          <option value="40">40</option>
                          <option value="41">41</option>
                          <option value="42">42</option>
                          <option value="43">43</option>
                          <option value="44">44</option>
                          <option value="45">45</option>
                          <option value="46">46</option>
                          <option value="47">47</option>
                          <option value="48">48</option>
                          <option value="49">49</option>
                          <option value="50">50</option>
                          <option value="51">51</option>
                          <option value="52">52</option>
                          <option value="53">53</option>
                          <option value="54">54</option>
                          <option value="55">55</option>
                          <option value="56">56</option>
                          <option value="57">57</option>
                          <option value="58">58</option>
                          <option value="59">59</option>
                      </select></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="6" ><center>
                        <input name="computerTimeButton" id="computerTimeButton" type="button" class="button_submit" value="{root/lang/body/computerTime}" onclick="computerTime()" />
                      </center></td>
                      <td></td>
                    </tr>
                  </table>
			  </div>
				<br />
				  <center>
				  <input name="button" type="button" class="button_submit" value="{root/lang/body/savebutton}" onclick="send_request()" />
				  <input name="button2" type="button" class="button_submit" value="{root/lang/body/notsavebutton}"  onclick="window.location.href='tools_system.cgi'" />
				  </center>
			</div>
		  </td>                        </form>
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
