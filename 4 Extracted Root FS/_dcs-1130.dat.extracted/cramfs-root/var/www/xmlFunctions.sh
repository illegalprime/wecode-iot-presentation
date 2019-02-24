beginTag() {
	echo "<$1>"
}

endTag() {
	echo "</$1>"
}

tag() {
	echo "<$1>$2</$1>"
}

dumpPeripheral() {
	eval $(pibinfo Peripheral)
	beginTag 'peripheral'
	tag 'GPINs' "$GPINs"
	tag 'GPOUTs' "$GPOUTs"
	tag 'speaker' "$Speaker"
	tag 'microphone' "$Microphone"
	tag 'PT' "$PT"
	tag 'Z' "$Z"
	tag 'privacy' "$privacy"
	tag 'RS485' "$RS485"
	tag 'IR' "$IR"
	tag 'videoServer' "$VideoServer"
	tag 'localStorage' "$LocalStorage"
	tag 'frontLED' "$FrontLED"
	tag 'PIR' "$PIR"
	tag 'wireless' "$Wireless"
	endTag 'peripheral'
}

xmlBegin() {
	echo -ne "\
Expires: Mon, 26 Jul 1997 05:00:00 GMT\r
Connection: close\r
Last-Modified: $(/bin/date -u -R)\r
Cache-Control: no-cache, no-store, must-revalidate\r
Pragma: no-cache\r
Content-Type: text/xml\r
\r
<?xml version=\"1.0\" encoding=\"utf-8\"?>
<?xml-stylesheet type=\"text/xsl\" href=\"$1\"?>
<root>
"
	beginTag 'lang'
	[ -f frame.lang ] && cat frame.lang
	[ -f "$2" ] && cat $2
	[ -f "$3" ] && cat $3
	endTag 'lang'
	beginTag 'common'
	dumpPeripheral
	eval $(dumpSystemKeys | tdb get System) || return 1
	CameraName_ms=$(tdb get Host CameraName_ms)
	tag version "$OEMVersion_ss"
	tag 'build' "$(tdb get System Version_ss | cut -d'-' -f2)"
	[ "$Wireless" -eq 1 ] && tag product "$ProdNumberW_ss" || tag product "$ProdNumber_ss"
	tag serial "$Model_ss"
	tag oem "$OEM_ms"
	tag cameraName "$(xmlEncode "$CameraName_ms")"
	tag 'sensor' "$(pibinfo Sensor)"
	endTag 'common'
}
xmlEnd() {
	echo '</root>'
}

dumpSystemKeys() {
	echo -n "\
Version_ss
OEMVersion_ss
Vendor_ms
OEM_ms
Model_ss
ProdNumber_ss
ModelW_ss
ProdNumberW_ss
"
}

configBegin() {
	beginTag 'config'
}
configEnd() {
	endTag 'config'
}

resultTag() {
	[ "$1" != "" ] || return
	beginTag 'result'
		tag 'code' "$1"
	endTag 'result'
}
