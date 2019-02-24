var subnet_mask = new Array(0, 128, 192, 224, 240, 248, 252, 254, 255);

var msg = new Array("The IP Address entered is invalid",	//INVALID_IP_ADDRESS
					"The IP Address cannot be zero.",	//ZERO_IP_ADDRESS
					"IP Address",	//IP_ADDRESS_DESC
					"The Subnet Mask entered is invalid",	//INVALID_MASK_ADDRESS
					"The Subnet Mask cannot be zero",	//ZERO_MASK_ADDRESS
					"Subnet Mask",	//MASK_ADDRESS_DESC
					"The Gateway IP Address entered is invalid",	//INVALID_GATEWAY_ADDRESS
					"The Gateway IP Address cannot be zero",	//ZERO_GATEWAY_ADDRESS
					"Gateway IP Address",	//GATEWAY_ADDRESS_DESC
					"The IP Address and the Gateway IP Address are not in the same subnet",	//NOT_SAME_DOMAIN
					"The Starting IP Address entered is invalid (IP Range: 1~254)",	//INVALID_START_IP
					"Please enter another Starting IP Address",	//ZERO_START_IP
					"Starting IP Address",	//START_IP_DESC
					"The LAN IP Address and the Start IP Address are not in the same subnet",	//START_INVALID_DOMAIN
					"The Ending IP Address entered is invalid (IP Range: 1~254)",	//INVALID_END_IP
					"Please enter another Ending IP Address",	//ZERO_END_IP
					"Ending IP Address",	//END_IP_DESC
					"The LAN IP Address and the End IP Address are not in the same subnet",	//END_INVALID_DOMAIN
					"The Primary DNS Address entered is invalid",	//INVALID_DNS_ADDRESS
					"The Primary DNS Address cannot be zero",	//ZERO_DNS_ADDRESS
					"Primary DNS Address",	//DNS_ADDRESS_DESC
					"The SSID field cannot be blank",	//SSID_EMPTY_ERROR					
					"WEP cannot be disabled when the Authentication type is set to Shared Key",	//AUTH_TYPE_ERROR
					"The length of the Passphrase must be at least 8 characters",	//PSK_LENGTH_ERROR
					"The Confirmed Passphrase does not match the Passphrase",	//PSK_MATCH_ERROR
					"The Confirmed Password does not match the New Password",	//MATCH_PWD_ERROR
					"The selected WEP key field cannot be blank",	//WEP_KEY_EMPTY
					"Please enter another Key",	//WIZARD_KEY_EMPTY
					"Quit setup wizard and discard settings?",	//QUIT_WIZARD
					"The legal characters for a MAC Address are 0~9, A~F, or a~f",	//MAC_ADDRESS_ERROR	 																	
					"The Ending IP Address must be greater than the Starting IP Address",	//IP_RANGE_ERROR
					"The Secondary DNS Address entered is invalid",	//INVALID_SEC_DNS_ADDRESS
					"The Secondary DNS Address cannot be zero",	//ZERO_SEC_DNS_ADDRESS
					"Secondary DNS Address",	//SEC_DNS_ADDRESS_DESC
					"The confirmed password does not match the new Admin password",	//ADMIN_PASS_ERROR
					"The confirmed password does not match the new User password",	//USER_PASS_ERROR
					"Please enter another Server Name",	//DDNS_SERVER_ERROR
					"Please enter another Host Name",	//DDNS_HOST_ERROR
					"Please enter another User Name",	//DDNS_USER_ERROR
					"Please enter another Password",	//DDNS_PASS_ERROR
					"Restore to Factory Default Settings?",	//RESTORE_DEFAULT
					"Are you sure you want to reboot the router?",	//REBOOT_ROUTER
					"Load settings from a saved configuration file?",	//LOAD_SETTING
					"Please select a saved configuration file to upload",	//LOAD_FILE_ERROR
					"Only the Admin account can download the settings",	//DOWNLOAD_SETTING_ERROR
					"Please enter either a Host Name or an IP Address",	//PING_IP_ERROR
					"Please enter another SMTP Server or IP Address",	//SMTP_SERVER_ERROR
					"Please enter a valid email Address",	//EMAIL_ADDRESS_ERROR
					"Are you sure that you want to delete this Virtual Server Rule?",	//DEL_SERVER_MSG
					"Are you sure that you want to delete this Application Rule",	//DEL_APPLICATION_MSG
					"Are you sure that you want to delete this Filter?",	//DEL_FILTER_MSG
					"Are you sure that you want to delete this Route?",	//DEL_ROUTE_MSG
					"Are you sure that you want to delete this MAC Address?",	//DEL_MAC_MSG
					"Are you sure that you want to delete this Keyword?",	//DEL_KEYWORD_MSG
					"Are you sure that you want to delete this Domain?",	//DEL_DOMAIN_MSG
					"Are you sure that you want to delete this Entry?",	//DEL_ENTRY_MSG
					"Are you sure that you want to delete this DHCP Reservation?",	//DEL_STATIC_DHCP_MSG
					"Please enter another name",	//NAME_ERROR
					"Please enter a Trigger Port number",	//TRIGGER_PORT_ERROR
					"Please enter a Firewall Port number",	//PUBLIC_PORT_ERROR
					"Please enter another Private Port number",	//PRIVATE_PORT_ERROR
					"Please enter a Private IP Address.",	//PRIVATE_IP_ERROR
					"Please enter another port number",	//PORT_ERROR
					"Please select a Keyword to delete",	//DEL_KEYWORD_ERROR
					"The Keyword entered already exists in the list",	//SAME_KEYWORD_ERROR
					"Please enter another Keyword",	//KEYWORD_ERROR
					"Unable to add another Keyword",	//ADD_KEYWORD_ERROR
					"Please select a Blocked Domain to delete",	//DEL_BLOCK_DOMAIN_ERROR
					"Please select a Permitted Domain to delete",	//DEL_PERMIT_DOMAIN_ERROR
					"The Domain entered already exists in the list of Blocked Domains",	//SAME_BLOCK_DOMAIN
					"Please enter another Blocked Domain",	//BLOCK_DOMAIN_ERROR
					"Unable to add another Blocked Domain",	//ADD_BLOCK_DOMAIN_ERROR
					"The Domain entered already exists in the list of Permitted Domains",	//SAME_PERMIT_DOMAIN
					"Please enter another Permitted Domain",	//PERMIT_DOMAIN_ERROR
					"Unable to add another Permitted Domain",	//ADD_PERMIT_DOMAIN_ERROR
					"Please select a Firmware file to upgrade the router to",	//FIRMWARE_UPGRADE_ERROR
					"Please enter another Domain",	//DOMAIN_ERROR
					"Unable to add another Control Domains",	//ADD_CONTROL_DOMAIN_ERROR
					"Please select a Control Domain to delete",	//DEL_CONTROL_DOMAIN_ERROR
					"Please enter at least one Control Domain",	//CONTROL_DOMAIN_ERROR
					"The RADIUS Server 1 IP Address entered is invalid",	//INVALID_RADIUS_SERVER1_IP
					"The Radius Server 1 IP Address cannot be zero",	//ZERO_RADIUS_SERVER1_IP
					"Radius Server 1 IP Address",	//RADIUS_SERVER1_IP_DESC
					"The RADIUS Server 2 IP Address entered is invalid",	//INVALID_RADIUS_SERVER2_IP
					"The Radius Server 2 IP Address cannot be zero",	//ZERO_RADIUS_SERVER2_IP
					"Radius Server 2 IP Address",	//RADIUS_SERVER2_IP_DESC
					"The IP Address entered is invalid (IP Range: 1~254)",	//INVALID_STATIC_DHCP_IP
					"Please enter another IP Address",	//ZERO_STATIC_DHCP_IP
					"Please enter another Name",	//STATIC_DHCP_NAME
					"The Server IP Address entered is invalid",	//INVALID_SERVER_IP
					"The Server IP Address cannot be zero",	//ZERO_SERVER_IP
					"Server IP Address",	//SERVER_IP_DESC
					"The Passwords entered do not match",	//MATCH_WIZARD_PWD_ERROR
					"The Source Start IP Address entered is invalid",	//INVALID_SOURCE_START_IP
					"The Source Start IP Address cannot be zero",	//ZERO_SOURCE_START_IP
					"Source Start IP Address",	//SOURCE_START_IP_DESC
					"The Source End IP Address entered is invalid",	//INVALID_SOURCE_END_IP
					"The Source End IP Address cannot be zero",	//ZERO_SOURCE_END_IP
					"Source End IP Address",	//SOURCE_END_IP_DESC
					"The Destination Start IP Address entered is invalid",	//INVALID_DEST_START_IP
					"The Destination Start IP Address cannot be zero",	//ZERO_DEST_START_IP
					"Destination Start IP Address",	//DEST_START_IP_DESC
					"The Destination End IP Address entered is invalid",	//INVALID_DEST_END_IP
					"The Destination End IP Address cannot be zero",	//ZERO_DEST_END_IP
					"Destination End IP Address",	//DEST_END_IP_DESC
					"The length of the Passphrase must be between 8 and 63 characters",	//PSK_OVER_LEN
					"Reset JumpStart?",	//RESET_JUMPSTAR
					"Are you sure that you want to delete this rule?",	//DEL_RULE_MSG
					"Are you sure that you want to delete this schedule?",	// DEL_SCHEDULE_MSG
					"Unable to add another schedule",			// ADD_SCHEDULE_ERROR
					"The Start Time entered is invalid",	// START_TIME_ERROR
					"The End Time entered is invalid",	// END_TIME_ERROR,
					"The Start Time cannot be greater than the End Time",	//	TIME_RANGE_ERROR
					"Please select a machine first",		// SELECT_MACHINE_ERROR
					"Please select an Application Name first",	// SELECT_APPLICATION_ERROR
					"Please select a Computer Name first",		// SELECT_COMPUTER_ERROR
					"Please enter another Wireless Security Password",	// SECURITY_PWD_ERROR
					"The URL/Domain entered is already in the list",		//	DUPLICATE_URL_ERROR
					"Login Name error",  //LOGIN_NAME_ERROR
					"Login Password error",	//LOGIN_PASS_ERROR
					"The Router Address entered is invalid",	//INVALID_ROUTER_ADDRESS
					"The Router Address cannot be zero",	//ZERO_ROUTER_ADDRESS
					"Router Address",	//ROUTER_ADDRESS_DESC
					"The Start IP address entered is invalid",	//INVALID_Start_IP_ADDRESS
					"The Start IP address cannot be zero",	//ZERO_Start_IP_ADDRESS
					"Start IP Address",	//Start_IP_DESC
					"The End IP address entered is invalid",	//INVALID_End_IP_ADDRESS
					"The End IP address cannot be zero",	//ZERO_End_IP_ADDRESS
					"End IP Address"	//End_IP_DESC
				);
var INVALID_IP_ADDRESS = 0;
var ZERO_IP_ADDRESS = 1;
var IP_ADDRESS_DESC = 2;
var INVALID_MASK_ADDRESS = 3;
var ZERO_MASK_ADDRESS = 4;
var MASK_ADDRESS_DESC = 5;
var INVALID_GATEWAY_ADDRESS = 6;
var ZERO_GATEWAY_ADDRESS = 7;
var GATEWAY_ADDRESS_DESC = 8;
var NOT_SAME_DOMAIN = 9;
var INVALID_START_IP = 10;
var ZERO_START_IP = 11;
var START_IP_DESC = 12;
var START_INVALID_DOMAIN = 13;
var INVALID_END_IP = 14;
var ZERO_END_IP = 15;
var END_IP_DESC = 16;
var END_INVALID_DOMAIN = 17;
var INVALID_DNS_ADDRESS = 18;
var ZERO_DNS_ADDRESS = 19;
var DNS_ADDRESS_DESC = 20;
var SSID_EMPTY_ERROR = 21;
var AUTH_TYPE_ERROR = 22;
var PSK_LENGTH_ERROR = 23;
var PSK_MATCH_ERROR = 24;
var MATCH_PWD_ERROR = 25;
var WEP_KEY_EMPTY = 26;
var WIZARD_KEY_EMPTY = 27;
var QUIT_WIZARD = 28;
var MAC_ADDRESS_ERROR = 29;
var IP_RANGE_ERROR = 30;
var INVALID_SEC_DNS_ADDRESS = 31;
var ZERO_SEC_DNS_ADDRESS = 32;
var SEC_DNS_ADDRESS_DESC = 33;
var ADMIN_PASS_ERROR = 34;
var USER_PASS_ERROR = 35;
var DDNS_SERVER_ERROR = 36;
var DDNS_HOST_ERROR = 37;
var DDNS_USER_ERROR = 38;
var DDNS_PASS_ERROR = 39;
var RESTORE_DEFAULT = 40;
var REBOOT_ROUTER = 41;
var LOAD_SETTING = 42;
var LOAD_FILE_ERROR = 43;
var DOWNLOAD_SETTING_ERROR = 44;
var PING_IP_ERROR = 45;
var SMTP_SERVER_ERROR = 46;
var EMAIL_ADDRESS_ERROR = 47;
var DEL_SERVER_MSG = 48;
var DEL_APPLICATION_MSG = 49;
var DEL_FILTER_MSG = 50;
var DEL_ROUTE_MSG = 51;
var DEL_MAC_MSG = 52;
var DEL_KEYWORD_MSG = 53;
var DEL_DOMAIN_MSG = 54;
var DEL_ENTRY_MSG = 55;
var DEL_STATIC_DHCP_MSG = 56;
var NAME_ERROR = 57;
var TRIGGER_PORT_ERROR = 58;
var PUBLIC_PORT_ERROR = 59;
var PRIVATE_PORT_ERROR = 60;
var PRIVATE_IP_ERROR = 61;
var PORT_ERROR = 62;
var DEL_KEYWORD_ERROR = 63;
var SAME_KEYWORD_ERROR = 64;
var KEYWORD_ERROR = 65;
var ADD_KEYWORD_ERROR = 66;
var DEL_BLOCK_DOMAIN_ERROR = 67;
var DEL_PERMIT_DOMAIN_ERROR = 68;
var SAME_BLOCK_DOMAIN = 69;
var BLOCK_DOMAIN_ERROR = 70;
var ADD_BLOCK_DOMAIN_ERROR = 71;
var SAME_PERMIT_DOMAIN = 72;
var PERMIT_DOMAIN_ERROR = 73;
var ADD_PERMIT_DOMAIN_ERROR = 74;
var FIRMWARE_UPGRADE_ERROR = 75;
var DOMAIN_ERROR = 76;
var ADD_CONTROL_DOMAIN_ERROR = 77;
var DEL_CONTROL_DOMAIN_ERROR = 78;
var CONTROL_DOMAIN_ERROR = 79;
var INVALID_RADIUS_SERVER1_IP = 80;
var ZERO_RADIUS_SERVER1_IP = 81;
var RADIUS_SERVER1_IP_DESC = 82;
var INVALID_RADIUS_SERVER2_IP = 83;
var ZERO_RADIUS_SERVER2_IP = 84;
var RADIUS_SERVER2_IP_DESC = 85;
var INVALID_STATIC_DHCP_IP = 86;
var ZERO_STATIC_DHCP_IP = 87;
var STATIC_DHCP_NAME = 88;
var INVALID_SERVER_IP = 89;
var ZERO_SERVER_IP = 90;
var SERVER_IP_DESC = 91;
var MATCH_WIZARD_PWD_ERROR = 92;
var INVALID_SOURCE_START_IP = 93;
var ZERO_SOURCE_START_IP = 94;
var SOURCE_START_IP_DESC = 95;
var INVALID_SOURCE_END_IP = 96;
var ZERO_SOURCE_END_IP = 97;
var SOURCE_END_IP_DESC = 98;
var INVALID_DEST_START_IP = 99;
var ZERO_DEST_START_IP = 100;
var DEST_START_IP_DESC = 101;
var INVALID_DEST_END_IP = 102;
var ZERO_DEST_END_IP = 103;
var DEST_END_IP_DESC = 104;
var PSK_OVER_LEN = 105;
var RESET_JUMPSTAR = 106;
var DEL_RULE_MSG = 107;
var DEL_SCHEDULE_MSG = 108;
var ADD_SCHEDULE_ERROR = 109;
var START_TIME_ERROR = 110;
var END_TIME_ERROR = 111;
var TIME_RANGE_ERROR = 112;
var SELECT_MACHINE_ERROR = 113;
var SELECT_APPLICATION_ERROR = 114;
var SELECT_COMPUTER_ERROR = 115;
var SECURITY_PWD_ERROR = 116;
var DUPLICATE_URL_ERROR = 117;
var LOGIN_NAME_ERROR = 118;
var LOGIN_PASS_ERROR = 119;
var INVALID_ROUTER_ADDRESS =120;
var ZERO_ROUTER_ADDRESS = 121;
var ROUTER_ADDRESS_DESC = 122;
var INVALID_Start_IP_ADDRESS = 123;
var ZERO_Start_IP_ADDRESS = 124;
var Start_IP_DESC = 125;
var INVALID_End_IP_ADDRESS = 126;
var ZERO_End_IP_ADDRESS = 127;
var End_IP_DESC = 128;

function addr_obj(addr, desc, allow_zero, e_msg1, e_msg2, e_msg3, is_mask){	
	this.addr = addr;
//	this.desc = msg[desc];
	this.desc = desc;
	this.allow_zero = allow_zero;	
//	this.e_msg1 = msg[e_msg1];
//	this.e_msg2 = msg[e_msg2];
	this.e_msg1 = e_msg1;
	this.e_msg2 = e_msg2;
	
	if (e_msg3 != -1){
		this.e_msg3 = msg[e_msg3];	
	}
	this.is_mask = is_mask;	
}

function varible_obj(var_value, desc, min, max, is_even){	
	this.var_value = var_value;
	this.desc = desc;
	this.min = min;
	this.max = max;		
	this.is_even = is_even;		
}

function raidus_obj(ip, port, secret, number){	
	this.ip = ip;
	this.port = port;
	this.secret = secret;
	this.number = number;		
}

function ip4_obj(ip, min_range, max_range, e_msg1, e_msg2){	
	this.ip = ip;	
	this.min_range = min_range;
	this.max_range = max_range;		
	this.e_msg1 = msg[e_msg1];
	this.e_msg2 = msg[e_msg2];	
}

function change_filter(which_filter){
    var html_file;
    
    switch(which_filter){
		case 0 :
	    	html_file = "adv_filters.html";
	    	break;
		case 1 :
	    	html_file = "adv_filters_mac.html";
	    	break;	    	
		case 2 :
	    	html_file = "adv_filters_url.html";
	    	break;
		case 3 :
	    	html_file = "adv_filters_domain.html";
	    	break;
	}
	
	location.href = html_file;
}

function change_routing(which_routing){
    var html_file;
    
    switch(which_routing){
        case 0 :
            html_file = "adv_routing.html";
            break;
        case 1 :
            html_file = "adv_routing_dynamic.html";
            break;
        case 2 :
            html_file = "adv_routing_table.html";
            break;
    }
    
    location.href = html_file;
}

function check_hex(data){	
	data = data.toUpperCase();
	
	if (!(data >= 'A' && data <= 'F') && !(data >= '0' && data <= '9')){	
		return false;
	}	
	return true;
}

function check_ip4(ip4){
	var temp_ip = (ip4.ip).split(" ");
	
	if (ip4.ip == ""){
		alert(ip4.e_msg1);
		return false;
	}else if (isNaN(ip4.ip) || temp_ip.length > 1 || parseInt(ip4.ip) < ip4.min_range || parseInt(ip4.ip) > ip4.max_range){
		alert(ip4.e_msg2);
		return false;
	}
	return true;
}
function check_ip(ipaddr){
	var temp_ip = ipaddr.split(" ");


	if (ipaddr == ""){
		return false;
	}else if (isNaN(ipaddr) || temp_ip.length > 1 || parseInt(ipaddr) < 0 || parseInt(ipaddr) > 255){
		return false;
	}
	return true;                                                                                                           	
}

function check_key(){            	                        	
	var length = get_length();
	var wep_type = get_by_id("wep_type");
	var wep_def_key = get_by_id("wep_def_key");
	var wep_key_type = get_by_id("wep_key_type");
	if (wep_type.selectedIndex == 1 ){		                                 	                	
    	for (var i = 1; i < 5; i++){					
		    var key = get_by_id("key" + i).value;
		    
		    if (wep_def_key[i-1].checked){
		        if (key == ''){
    	            alert(msg[WEP_KEY_EMPTY]);
			        return false;
    	        }
		    }
	        if (key != ''){
	            if (key.length < length){
	                alert("The length of Key" + i + " must be " + length + " characters");
	                return false;
	            }else{
	            	if (wep_key_type.value == "0"){	// check the key is hex or not
		            	for (var j = 0; j < key.length; j++){
		            		if (!check_hex(key.substring(j, j+1))){
		            			alert("Key" + i + " is invalid. The legal characters are 0~9, A~F, or a~f");
		            			return false;
		            		}
		            	}
		            }
	            }
	        }                	  
    	}                	                	
	}
	return true;
}

function check_mac(mac){
    var temp_mac = mac.split("-");
    var error = true;
    
    if (temp_mac.length == 6){
	    for (var i = 0; i < 6; i++){        
	        var temp_str = temp_mac[i];
	        
	        if (temp_str == ""){
	            error = false;
	        }else{        	
	            if (!check_hex(temp_str.substring(0,1)) || !check_hex(temp_str.substring(1))){
	                error = false;
	            }
	        }
	        
	        if (!error){
	            break;
	        }
	    }
	}else{
		error = false;
	}
    return error;
}

function check_varible(obj){	
	var temp_obj = (obj.var_value).split(" ");
	
	if (temp_obj == ""){
		alert(obj.desc + " cannot be left blank");	
		return false;
	}else if (temp_obj.length > 1){
		alert("Please enter another " + obj.desc + " value");
		return false;
	}else if (isNaN(obj.var_value)){
		alert(obj.desc + " must be a number");
		return false;
	}else if (parseInt(obj.var_value) < obj.min || parseInt(obj.var_value) > obj.max){
		alert("The " + obj.desc + " value range is " + obj.min + " ~ " + obj.max + "");
		return false;
	}else if (obj.is_even && (parseInt(obj.var_value) % 2 != 0)){
		alert(obj.desc + " must be an even number");
		return false;
	}
	return true;
}

function check_integer(which_value){	
	var temp_obj = (which_value).split(" ");
	
	if (temp_obj == "" || temp_obj.length > 1 || isNaN(which_value)){	
		return false;
	}
	
	return true;
}

function get_seq(index){
	var seq;
	
	switch(index){
		case 0:
//			seq = "1st";
			seq = "1";
			break;
		case 1:
//			seq = "2nd";
			seq = "2";
			break;
		case 2:
//			seq = "3rd";
			seq = "3";
			break;
		case 3:
//			seq = "4th";
			seq = "4";
			break;
	}
	return seq;
}

function check_ip_range(order, my_obj){
	var which_ip = (my_obj.addr[order]).split(" ");				
	var start, end;
	
	if ((order != 0 && order != 3) || my_obj.is_mask){
		start = 0;
		end = 255;
	}else if(order != 0){					
		start = 1;
		end = 254;				
	}
	else{
		start = 1;
		end = 223;
	}
					
	if (isNaN(which_ip) || which_ip == "" || which_ip.length > 1){
//		alert("The " + get_seq(order) + " octet of the " + my_obj.desc + " must be a number");
		alert(netErrorMessage1 + get_seq(order) + netErrorMessage2 + my_obj.desc + netErrorMessage3);
		return false;
	}else if (parseInt(which_ip) < start || parseInt(which_ip) > end){
//		alert("The " + get_seq(order) + " octet of the " + my_obj.desc + " must be a number between " + start + " and " + end + "");
		alert(netErrorMessage1 + get_seq(order) + netErrorMessage2 + my_obj.desc + netErrorMessage4 + start + netErrorMessage5 + end + "");
		return false;
	}				
	return true;
}

function is_valid_ip(my_obj){
	var count_zero = 0;
	var ip = my_obj.addr;
	
	for(var i = 0; i < ip.length; i++){
		if (ip[i] == "0"){
			count_zero++;
		}								
	}
	
	if (ip[0] == 254 && ip[1] == 254 && ip[2] == 254 && ip[3] == 254) {
		alert(my_obj.e_msg1);
		return false;
	}

	if (!my_obj.allow_zero && count_zero == 4){
		alert(my_obj.e_msg2);
		return false;
	}else{
		if (count_zero != 4){
			for(var i = 0; i < ip.length; i++){
				if (!check_ip_range(i, my_obj)){
					return false;
				}							
			}
		}
	}
	return true;				
}

function check_address(my_obj){					
	if (my_obj.addr.length == 4){										
		if (!is_valid_ip(my_obj)){	
			return false;
		}else{
			return true;
		}
	}else{
		alert(my_obj.e_msg1);
		return false;
	}				
}
function check_gateway_mask(){
	
	
	}
function check_mask(my_mask){
	var temp_mask = my_mask.addr;							
	var in_range = false;
	var error;
	
	for (var i = 0; i < temp_mask.length; i++){	
		var mask = parseInt(temp_mask[i]);
						
		for (var j = 0; j < subnet_mask.length; j++){
			if (mask == subnet_mask[j]){							
				in_range = true;
				break;
			}else{
				in_range = false;
			}
		}
		
		if (!in_range){	// when not in the subnet mask range
//			error = "The " + get_seq(i) + " octect of the " + my_mask.desc + " must be ";
			error = netErrorMessage1 + get_seq(i) + netErrorMessage2 + my_mask.desc + netErrorMessage6;
			for (var j = 0; j < subnet_mask.length; j++){
				error += subnet_mask[j];
				if (j < subnet_mask.length - 1){
					error += ",";
				}
			}
			alert(error);
			return false;
		}
		
		if (i != 0 && mask != 0){ // when not the 1st range and the value is not 0
			if (parseInt(temp_mask[i-1]) != 255){  // check the previous value is 255 or not
				alert(my_mask.e_msg1);
				return false;
			}
		}	
	}
	
	if (my_mask.addr.length != 4){// check mask is vaild or not
		alert(my_mask.e_msg1);
		return false;
	}

	if (temp_mask[0] == 255 && temp_mask[1] == 255 && temp_mask[2] == 255 && temp_mask[3] == 255) {
		alert(my_mask.e_msg1);
		return false;
	}
	
	if (temp_mask[0] == 0 && temp_mask[1] == 0 && temp_mask[2] == 0 && temp_mask[3] == 0) {
		alert(my_mask.e_msg1);
		return false;
	}
	
	return true;
}

function check_domain(ip, mask, gateway){
	var temp_ip = ip.addr;
	var temp_mask = mask.addr;
	var temp_gateway = gateway.addr;
	var is_same = true;
	
	if (temp_gateway[0] == 0 && temp_gateway[1] == 0 && temp_gateway[2] == 0
			&& temp_gateway[3] == 0){
		if (gateway.allow_zero){
			return is_same;
		}
	}
		
	for (var i = 0; i < temp_ip.length - 1; i++){
		if ((temp_ip[i] & temp_mask[i]) != (temp_gateway[i] & temp_mask[i])){
			alert(gateway.e_msg3);
			is_same = false;		// when not in the same subnet mask, return false
			break;
		}
	}

	return is_same;
}

function check_lan_setting(ip, mask, gateway){				
	var temp_ip_obj = new addr_obj(ip.split("."), IP_ADDRESS_DESC, false, INVALID_IP_ADDRESS, ZERO_IP_ADDRESS, -1, false);
	var temp_mask_obj = new addr_obj(mask.split("."), MASK_ADDRESS_DESC, false, INVALID_MASK_ADDRESS, ZERO_MASK_ADDRESS, -1, true);
	var temp_gateway_obj = new addr_obj(gateway.split("."), GATEWAY_ADDRESS_DESC, false, INVALID_GATEWAY_ADDRESS, ZERO_GATEWAY_ADDRESS, NOT_SAME_DOMAIN, false);
		
	if (!check_address(temp_ip_obj)){	// when ip is invalid
		return false;
	}else if (!check_address(temp_mask_obj)){	// when subnet mask is invalid
		return false;	
	}else if (!check_mask(temp_mask_obj)){	// when subnet mask is not in the subnet mask range
		return false;   
	}else if (!check_address(temp_gateway_obj)){	// when gateway is invalid
		return false;	
	}else if (!check_domain(temp_ip_obj, temp_mask_obj, temp_gateway_obj)){		// check if the ip and the gateway are in the same subnet mask or not					
		return false;
	}
	return true;
}

function check_pwd(pwd1, pwd2){
	if (get_by_id(pwd1).value != get_by_id(pwd2).value){
		 alert(msg[MATCH_PWD_ERROR]);
		 return false;
	}
	return true;
}

function check_radius(radius){
	
	if (!check_address(radius.ip)){
		return false;
	}else if (!check_port(radius.port)){
        alert("The RADIUS Server " + radius.number + " Port entered is invalid");
        return false;
    }else if (radius.secret == ""){
        alert("The RADIUS Server " + radius.number + " Shared Secret cannot be zero");
        return false;               
	}
	
	return true;
}

function check_ssid(id){
	if (get_by_id(id).value == ""){
	    alert(msg[SSID_EMPTY_ERROR]);
	    return false;
	}
	return true;        
}

function check_port(port){
    var temp_port = port.split(" ");
    
    if (isNaN(port) || port == "" || temp_port.length > 1 
    		|| (parseInt(port) < 1 || parseInt(port) > 65534)){
        return false;
    }
    return true;
}

function check_pf_port(port){
    var temp_port = port.split(" ");
    
    if (isNaN(port) || port == "" || temp_port.length > 1 
    		|| (parseInt(port) < 0 || parseInt(port) > 65535)){
        return false;
    }
    return true;
}

function change_color(table_name, row){
    var obj = get_by_id(table_name);
    for (var i = 1; i < obj.rows.length; i++){
        if (row == i){
            obj.rows[i].style.backgroundColor = "#FFFF00";
        }else{
            obj.rows[i].style.backgroundColor = "#FFFFFF";
        }
    }       
}

function exit_wizard(){
    if (confirm(msg[QUIT_WIZARD])){
        window.close();
    }
}

function get_by_id(id){
	with(document){
		return getElementById(id);
	}
}

function get_by_name(name){
	with(document){
		return getElementsByName(name);
	}
}

function get_length(){
    var wep_key_len = get_by_id("wep_key_len");
    var wep_key_type = get_by_id("wep_key_type");       
	var length = parseInt(wep_key_len.value);
		
	if (wep_key_type.value == "0"){
	    length *= 2;
	}
	return length;
}

function openwin(url,w,h) {
	var winleft = (screen.width - w) / 2;
	var wintop = (screen.height - h) / 2;
	window.open(url,"popup",'width='+w+',height='+h+',top='+wintop+',left='+winleft+',scrollbars=yes,status=no,location=no,resizable=yes')
}	

function send_submit(which_form){
	get_by_id(which_form).submit();
}

function set_server(is_enable){
	var enable = get_by_id("enable");
	
    if (is_enable == "1"){
        enable[0].checked = true;
    }else{
        enable[1].checked = true;
    }
}

function set_protocol(which_value, obj){
    for (var i = 0; i < 3; i++){
        if (which_value == obj.options[i].value){
            obj.selectedIndex = i;
            break;
        }
    }
}

function set_schedule(data, index){ 
	var schd = get_by_name("schd");  
	
    if (data[index] == "0"){
        schd[0].checked = true;      
    }else{
        schd[1].checked = true;        
    }
    
    get_by_id("hour1").selectedIndex = data[index+1];
    get_by_id("min1").selectedIndex = data[index+2];
    get_by_id("am1").selectedIndex = data[index+3];
    get_by_id("hour2").selectedIndex = data[index+4];
    get_by_id("min2").selectedIndex = data[index+5];
    get_by_id("am2").selectedIndex = data[index+6];
    get_by_id("day1").selectedIndex = data[index+7];
    get_by_id("day2").selectedIndex = data[index+8];
}

function set_mac(mac){
	var temp_mac = mac.split("-");
	for (var i = 0; i < 6; i++){
		var obj = get_by_id("mac" + (i+1));
		obj.value = temp_mac[i];
	}
}

function show_dns(type){
    if (type){
        get_by_id("dns1").value = "0.0.0.0";
        get_by_id("dns2").value = "0.0.0.0";
    }
}

function show_wizard(name){
	window.open(name,"Wizard","width=450,height=370");
}

function show_window(name){
	window.open(name,"Window","width=500,height=600,scrollbar=yes");
}

function get_row_data(obj, index){	
		
    try {
    	return obj.cells[index].childNodes[0].data;
    }catch(e) {
        return ("");
    }
}

function copy_application(index){
	var data;
	
	if (get_by_id("application" + index).selectedIndex > 0){
		data = (get_by_id("application" + index).value).split(",");		
		get_by_id("name" + index).value = data[0];
		get_by_id("public_port" + index).value = data[1];
		get_by_id("private_port" + index).value = data[2];
		set_protocol(data[3], get_by_id("protocol" + index));	
	}else{
		alert(msg[SELECT_APPLICATION_ERROR]);
	}		
}

function copy_ip(index){

	if (get_by_id("ip_list" + index).selectedIndex > 0){
		get_by_id("ip" + index).value = get_by_id("ip_list" + index).options[get_by_id("ip_list" + index).selectedIndex].value;
	}else{
		alert(msg[SELECT_COMPUTER_ERROR]);
	}
}

function get_random_char(){
	var number_list = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	var number = Math.round(Math.random()*62);
	
	return(number_list.substring(number, number + 1));
}

function generate_psk(key){
	var i = key.length;
	
	if (key.length < 8){
		for (; i < 8; i++){
			key += get_random_char();
		}
	}

	return key;
}

function create_wep_key128(passpharse, pharse_len){
    var pseed2 = "";
   	var md5_str = "";
   	var count;
   	
   	
    for(var i = 0; i < 64; i++){
        count = i % pharse_len;
        pseed2 += passpharse.substring(count, count+1);
    }
    
    md5_str = calcMD5(pseed2);   
    
    return md5_str.substring(0, 26).toUpperCase(); 
}

function readCookie(name)
{
        var nameEQ = name + '=';
        var ca = document.cookie.split(';');
        var i = 0;
        while (true) {
                if (i  >= ca.length)
                        break;
                var theChar = ca[i];
                while (theChar.charAt(0)==' ')
                        theChar = theChar.substring(1,theChar.length);
                if (theChar.indexOf(nameEQ) == 0)
                        return theChar.substring(nameEQ.length,theChar.length);
                i++;
        }
        return 'null';
}
function IpAndMask(ip,mask,router)
{
	for(var i=0; i < 4;i++)
	{
		if((ip[i] & mask[i]) != (router[i] & mask[i]))
		return false;
	}
	return true;
}
function ieCheck()
{
	var _info = navigator.userAgent;
	var _ie = (_info.indexOf("MSIE") > 0 && _info.indexOf("Win") > 0 && _info.indexOf("Windows 3.1") < 0);
	return _ie;
}

function numcheck(value)
{
	if(value<=0)
		return -1;
	else
		return 0;
}

function checkwepkey_old(index)
{
	for(i=1;i<5;i++)
	{
		var key = get_by_id("key" + i).value;

		if(document.form1.defkeyid[i-1].checked)
		{
			if(key.length!=index)
			{
				alert("WEP Key" + i + " length must be " + index + " characters");
				return false;
			}
			if(index==10 || index==26)
			{
				for (var j = 0; j < key.length; j++){
					if (!check_hex(key.substring(j, j+1))){
						alert("WEP Key" + i + " is invalid. The legal characters are 0~9, A~F, or a~f");
					return false;
					}
				}
			}
		
			return true;
		}
	}	
}

function checkwepkey(keyError1,keyError2)
{
	var key = get_by_id("key").value;

	if(key.length!=5 && key.length!=10 && key.length!=13 && key.length!=26){
//		alert("WEP Key length must be 5 or 10 or 13 or 26 characters");
		alertAndSelect(document.form1.key,keyError1);
		return false;
	}
	if(key.length==10 || key.length==26){
		for (var j = 0; j < key.length; j++){
			if (!check_hex(key.substring(j, j+1))){
//				alert("WEP Key is invalid. If WEP Key Length is 10 or 26\nThe legal characters are 0~9, A~F, or a~f");
				alertAndSelect(document.form1.key,keyError2);
				return false;
			}
		}
	}

	return true;
}

function checkpresharedkey_old()
{
	for(i=1;i<3;i++)
	{
		var presharedkey = get_by_id("presharedkey" + i).value;
		
		if(document.form1.security[i+1].checked)
		{
			if (presharedkey == ""){
				alert("Pre-shared key can't be NULL");
				return false;
			}

			if(presharedkey.length==64)
			{
				for (var j = 0; j < presharedkey.length; j++){
					if (!check_hex(presharedkey.substring(j, j+1))){
						alert("Pre-shared key is invalid. The legal 64 characters are 0~9, A~F, or a~f");
					return false;
					}
				}
			}
			
			return true;
		}
	}
}

function checkpresharedkey(keyError3,keyError4,keyError5)
{
	var presharedkey = get_by_id("key").value;
		
	if (presharedkey == ""){
//		alert("Pre-shared key can't be NULL");
		alertAndSelect(document.form1.key,keyError3);
		return false;
	}

	if(presharedkey.length<8){
//		alert("Pre-shared key is invalid. The minimum character is 8 characters");
		alertAndSelect(document.form1.key,keyError4);
		return false;
	}

	if(presharedkey.length==64)
	{
		for (var j = 0; j < presharedkey.length; j++){
			if (!check_hex(presharedkey.substring(j, j+1))){
//				alert("Pre-shared key is invalid. The legal 64 characters are 0~9, A~F, or a~f");
				alertAndSelect(document.form1.key,keyError5);
			return false;
			}
		}
	}
			
	return true;
}

//Wireless Select Security Mode
function setSecurity(chooser) {
var regiondb = new Object( )
regiondb["Open"] = [{value:"Disable", text:"Disable"},
                      {value:"WEP", text:"WEP"}];
regiondb["Shared"] = [{value:"WEP", text:"WEP"}];
regiondb["WPA-PSK"] = [{value:"TKIP", text:"TKIP"},
                          {value:"AES", text:"AES"}];
regiondb["WPA2-PSK"] = [{value:"TKIP", text:"TKIP"},
                          {value:"AES", text:"AES"}];;

    var newElem;
    var where = (navigator.appName == "Microsoft Internet Explorer") ? -1 : null;
    var cityChooser = chooser.form.elements["encryption"];
    while (cityChooser.options.length) {
        cityChooser.remove(0);
    }
    var choice = chooser.options[chooser.selectedIndex].value;
    var db = regiondb[choice];
//    newElem = document.createElement("option");
//    newElem.text = "Please Choose a Mode:";
//    newElem.value = "";
//    cityChooser.add(newElem, where);
    if (choice != "") {
        for (var i = 0; i < db.length; i++) {
            newElem = document.createElement("option");
            newElem.text = db[i].text;
            newElem.value = db[i].value;
            cityChooser.add(newElem, where);
        }
    }
	
}

function initSecurity(chooser,key,order) {
//if(key == "WPA(2)-PSK")
//	key == "WPA2-PSK";
var regiondb = new Object( )
regiondb["Open"] = [{value:"Disable", text:"Disable"},
                      {value:"WEP", text:"WEP"}];
regiondb["Shared"] = [{value:"WEP", text:"WEP"}];
regiondb["WPA-PSK"] = [{value:"TKIP", text:"TKIP"},
                          {value:"AES", text:"AES"}];
regiondb["WPA2-PSK"] = [{value:"TKIP", text:"TKIP"},
                          {value:"AES", text:"AES"}];;

    var newElem;
    var where = (navigator.appName == "Microsoft Internet Explorer") ? -1 : null;
    var cityChooser = chooser.form.elements["encryption"];
    while (cityChooser.options.length) {
        cityChooser.remove(0);
    }
    var choice = chooser.options[chooser.selectedIndex].value;
	var db = regiondb[key];
	for (var i = 0; i < db.length; i++) {
  		  newElem = document.createElement("option");
            newElem.text = db[i].text;
            newElem.value = db[i].value;
            cityChooser.add(newElem, where);
	}
	document.form1.encryption.value = order;
}

function getNowDate()
{
	var now = new Date( );
	var year=now.getFullYear();
	var mon=now.getMonth()+1;
	if (mon <=9) 
		mon = "0" + mon;
		
	var date=now.getDate();
	if (date <=9) 
		date = "0" + date;
		
	var date = year + "/" + mon + "/" + date ;
	return date;
}

function getNowTime()
{
	var now = new Date( );
	var hour=now.getHours();
	if (hour <=9) 
		hour = "0" + hour;
			
	var minute=now.getMinutes();
	if (minute <=9) 
		minute = "0" + minute;
			
	var sec=now.getSeconds();
	if (sec <=9) 
		sec = "0" + sec;
		
	var time = hour + ":" + minute + ":" + sec ;
	return time;
}
/*
function sendMoveRequest(x, y, hostname, request, onAlert) {//PT
	var url = hostname + ":" + window.location.port + "/cgi/ptdc.cgi?command=set_relative_pos&posX=" + x + "&posY=" + y ;
	request.onreadystatechange = onAlert;
	try {
		request.open('GET', encodeURI(url), true);
		request.send("");
	}
	catch(e) {
		alert(e);
	}
}
function sendMoveRs485Request(dirX, dirY, speedX, speedY, hostname, request, onAlert) {//RS485
	var url = hostname + ":" + window.location.port + "/cgi/ptz485dc.cgi?command=move&dirX=" + dirX + "&dirY=" + dirY + "&speedX=" + speedX + "&speedY=" + speedY;
	request.onreadystatechange = onAlert;
	try {
		request.open('GET', encodeURI(url), true);
		request.send("");
	}
	catch(e) {
		alert(e);
	}
}*/
function sendMoveRequest(x, y, hostname) {//PT
	var urlXML = hostname + ":" + window.location.port + "/cgi/ptdc.cgi?command=set_relative_pos&posX=" + x + "&posY=" + y ;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDocSendIndex(urlXML,urlXSL);
}
function sendMoveRs485Request(dirX, dirY, speedX, speedY, hostname) {//RS485
	var urlXML = hostname + ":" + window.location.port + "/cgi/ptz485dc.cgi?command=move&dirX=" + dirX + "&dirY=" + dirY + "&speedX=" + speedX + "&speedY=" + speedY;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDocSendIndex(urlXML,urlXSL);
}

/*
function sendHomeRequest(flagRs485, hostname, request, onAlert) {
	if (flagRs485==0)
		var url = hostname + ":" + window.location.port + '/cgi/ptdc.cgi?command=go_home';
	if (flagRs485==1)
		var url = hostname + ":" + window.location.port + '/cgi/ptz485dc.cgi?command=go_home';
	request.onreadystatechange = onAlert;
	try {
       	request.open('GET', encodeURI(url), true);
       	request.send("");
	}
	catch(e) {
		alert(e);
	}
}*/
function sendHomeRequest(flagRs485, hostname) {
	if (flagRs485==0)
		var urlXML = hostname + ":" + window.location.port + '/cgi/ptdc.cgi?command=go_home';
	if (flagRs485==1)
		var urlXML = hostname + ":" + window.location.port + '/cgi/ptz485dc.cgi?command=go_home';
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDocSendIndex(urlXML,urlXSL);
}

function sendHomePosRequest(command, hostname) {
	var urlXML = hostname + ":" + window.location.port + '/cgi/ptdc.cgi?command=' + command;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDocSendIndex(urlXML,urlXSL);
}

function sendPresetRequest(flagRs485, presetName, hostname, request, onAlert) {
	if (flagRs485==0)
		var url = hostname + ":" + window.location.port + "/cgi/ptdc.cgi?command=goto_preset_position&presetName=" + presetName ;
	if (flagRs485==1)
		var url = hostname + ":" + window.location.port + "/cgi/ptz485dc.cgi?command=goto_preset_position&presetName=" + presetName ;
//	var url = hostname + ":" + window.location.port + "/cgi/ptdc.cgi?command=goto_preset_position&presetName=" + presetName ;
	request.onreadystatechange = onAlert;
	try {
		request.open('GET', encodeURI(url), true);
		request.send("");
	}
	catch(e) {
		alert(e);
	}
}
/*
function sendPresetRequest(flagRs485, presetName, hostname) {
	if (flagRs485==0)
		var urlXML = hostname + ":" + window.location.port + "/cgi/ptdc.cgi?command=goto_preset_position&presetName=" + presetName ;
	if (flagRs485==1)
		var urlXML = hostname + ":" + window.location.port + "/cgi/ptz485dc.cgi?command=goto_preset_position&presetName=" + presetName ;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDocSendIndex(urlXML,urlXSL);
}*/

function sendPatrolRequest(command, hostname) {
	var urlXML = hostname + ":" + window.location.port + '/cgi/ptdc.cgi?command=' + command;
	var urlXSL = 'index.xsl';
	LoadXMLXSLTDocSendIndex(urlXML,urlXSL);
}

function sendGPOutputRequest(value, hostname, request, onAlert) {
	var url = hostname + ":" + window.location.port + '/dev/gpioCtrl.cgi?out1=' + value;
	request.onreadystatechange = onAlert;
	try {
       	request.open('GET', encodeURI(url), true);
       	request.send("");
	}
	catch(e) {
		alert(e);
	}
}

function sendLedRequest(value, hostname, request, onAlert) {
	var url = hostname + ":" + window.location.port + '/dev/gpioCtrl.cgi?led=' + value;
	request.onreadystatechange = onAlert;
	try {
       	request.open('GET', encodeURI(url), true);
       	request.send("");
	}
	catch(e) {
		alert(e);
	}
}

//function sendImageRequest(type, hostname, request, onAlert) {
function sendImageRequest(type, hostname, sensor) {
	var value;
	//brightness
	if(type == 'mt9m112_brightness')
		value = document.form1.mt9m112_brightness.value
	if(type == 'vx1128_brightness')
		value = document.form1.vx1128_brightness.value
	if(type == 'vicam3_brightness')
		value = document.form1.vicam3_brightness.value
	if(type == 'ov7725_brightness')
		value = document.form1.ov7725_brightness.value
	if(type == 'yk2085_brightness')
		value = document.form1.yk2085_brightness.value
	if(type == 'mt9m112_brightness' || type == 'vx1128_brightness' || type == 'vicam3_brightness' || type == 'ov7725_brightness' || type == 'yk2085_brightness')
		type = "brightness";
	//saturation
	if(type == 'mt9m112_saturation')
		value = document.form1.mt9m112_saturation.value
	if(type == 'vx1128_saturation')
		value = document.form1.vx1128_saturation.value
	if(type == 'vicam3_saturation')
		value = document.form1.vicam3_saturation.value
	if(type == 'ov7725_saturation')
		value = document.form1.ov7725_saturation.value
	if(type == 'yk2085_saturation')
		value = document.form1.yk2085_saturation.value
	if(type == 'mt9m112_saturation' || type == 'vx1128_saturation' || type == 'vicam3_saturation' || type == 'ov7725_saturation' || type == 'yk2085_saturation')
		type = "saturation";
	//contrast
	if(type == 'mt9m112_contrast')
		value = document.form1.mt9m112_contrast.value
	if(type == 'vx1128_contrast')
		value = document.form1.vx1128_contrast.value
	if(type == 'vicam3_contrast')
		value = document.form1.vicam3_contrast.value
	if(type == 'ov7725_contrast')
		value = document.form1.ov7725_contrast.value
	if(type == 'yk2085_contrast')
		value = document.form1.yk2085_contrast.value
	if(type == 'mt9m112_contrast' || type == 'vx1128_contrast' || type == 'vicam3_contrast' || type == 'ov7725_contrast' || type == 'yk2085_contrast')
		type = "contrast";
	//hue
	if(type == 'vx1128_hue')
		value = document.form1.vx1128_hue.value
	if(type == 'vicam3_hue')
		value = document.form1.vicam3_hue.value
	if(type == 'yk2085_hue')
		value = document.form1.yk2085_hue.value
	if(type == 'vx1128_hue' || type == 'vicam3_hue' || type == 'yk2085_hue')
		type = "hue";
	//sharpness
	if(type == 'vicam3_sharpness')
		value = document.form1.vicam3_sharpness.value
	if(type == 'vicam3_sharpness')
		type = "sharpness";
	//noise reduction
	if(type == 'vicam3_noise')
		value = document.form1.vicam3_noise.value
	if(type == 'vicam3_noise')
		type = "noiseReduction";
	//backlight compensation
	if(type == 'vicam3_backlight')
		value = document.form1.vicam3_backlight.value
	if(type == 'vicam3_backlight')
		type = "backlightCompensation";
	//backlight control
	if(type == 'yk2085_backlightControl'){
		if(document.form1.yk2085_blc1.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'yk2085_backlightControl')
		type = "backlightControl";
	//auto gain
	if(type == 'yk2085_autoGain'){
		if(document.form1.yk2085_agc1.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'yk2085_autoGain')
		type = "autoGain";
	//frequency
	if(type == 'mt9m112_frequency')
		value = document.form1.mt9m112_frequency.value
	if(type == 'vicam3_frequency')
		value = document.form1.vicam3_frequency.value
	if(type == 'ov7725_frequency')
		value = document.form1.ov7725_frequency.value
	if(type == 'mt9m112_frequency' || type == 'vicam3_frequency' || type == 'ov7725_frequency')
		type = "frequency";
	//whiteBalance
	if(type == 'mt9m112_whiteBalance')
		value = document.form1.mt9m112_whiteBalance.value
	if(type == 'vicam3_whiteBalance')
		value = document.form1.vicam3_whiteBalance.value
	if(type == 'ov7725_whiteBalance')
		value = document.form1.ov7725_whiteBalance.value
	if(type == 'yk2085_whiteBalance'){
		if(document.form1.yk2085_awb1.checked)
			value = "0";
		else
			value = "1";
	}
/*	if(type == 'vx1128_whiteBalance'){
		if(document.form1.awb1.checked)
			value = "0";
		else
			value = "1";
	}*/
	if(type == 'mt9m112_whiteBalance' || type == 'vicam3_whiteBalance' || type == 'ov7725_whiteBalance' || type == 'yk2085_whiteBalance')
		type = "whiteBalance";
	//source
	if(type == 'source')
		value = document.form1.source.value
	//bw
	if(type == 'mt9m112_bw'){
		if(document.form1.mt9m112_bw.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'vicam3_bw'){
		if(document.form1.vicam3_bw.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'ov7725_bw'){
		if(document.form1.ov7725_bw.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'mt9m112_bw' || type == 'vicam3_bw' || type == 'ov7725_bw')
		type = "bw";
	//flip
	if(type == 'mt9m112_flip'){
		if(document.form1.mt9m112_flip.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'vicam3_flip'){
		if(document.form1.vicam3_flip.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'ov7725_flip'){
		if(document.form1.ov7725_flip.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'mt9m112_flip' || type == 'vicam3_flip' || type == 'ov7725_flip')
		type = "flip";
	//mirror
	if(type == 'mt9m112_mirror'){
		if(document.form1.mt9m112_mirror.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'vicam3_mirror'){
		if(document.form1.vicam3_mirror.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'ov7725_mirror'){
		if(document.form1.ov7725_mirror.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'mt9m112_mirror' || type == 'vicam3_mirror' || type == 'ov7725_mirror')
		type = "mirror";
	//autoExposure
	if(type == 'yk2085_autoExposure'){
		if(document.form1.yk2085_aes1.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'mt9m112_autoExposure' || type == 'vx1128_autoExposure' || type == 'vicam3_autoExposure' || type == 'yk2085_autoExposure')
		type = "autoExposure";
/*	if(type == 'mt9m112_autoExposure'){
		if(document.form1.mt9m112_autoExposure.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'vicam3_autoExposure'){
		if(document.form1.vicam3_autoExposure.checked)
			value = "1";
		else
			value = "0";
	}
	if(type == 'vx1128_autoExposure'){
		if(document.form1.aes1.checked)
			value = "1";
		else
			value = "0";
	}
*/
	var url = hostname + ":" + window.location.port + "/cgi/admin/adv_image.cgi?command=update&" + type + "=" + value;

	if(type != 'bw'){
		if (sensor == "mt9m112_cs633" || sensor == "mt9v111_cs675"){
			if(document.form1.mt9m112_bw.checked)
				url = url + "&bw=1";
			else
				url = url + "&bw=0";
		}
		if (sensor == "vicam3"){
			if(document.form1.vicam3_bw.checked)
				url = url + "&bw=1";
			else
				url = url + "&bw=0";
		}
		if (sensor == "ov7725_cs632" || sensor == "ov7725_cs637"){
			if(document.form1.ov7725_bw.checked)
				url = url + "&bw=1";
			else
				url = url + "&bw=0";
		}
	}
	if(type != 'flip'){
		if (sensor == "mt9m112_cs633" || sensor == "mt9v111_cs675"){
			if(document.form1.mt9m112_flip.checked)
				url = url + "&flip=1";
			else
				url = url + "&flip=0";
		}
		if (sensor == "vicam3"){
			if(document.form1.vicam3_flip.checked)
				url = url + "&flip=1";
			else
				url = url + "&flip=0";
		}
		if (sensor == "ov7725_cs632" || sensor == "ov7725_cs637"){
			if(document.form1.ov7725_flip.checked)
				url = url + "&flip=1";
			else
				url = url + "&flip=0";
		}
	}
	if(type != 'mirror'){
		if (sensor == "mt9m112_cs633" || sensor == "mt9v111_cs675"){
			if(document.form1.mt9m112_mirror.checked)
				url = url + "&mirror=1";
			else
				url = url + "&mirror=0";
		}
		if (sensor == "vicam3"){
			if(document.form1.vicam3_mirror.checked)
				url = url + "&mirror=1";
			else
				url = url + "&mirror=0";
		}
		if (sensor == "ov7725_cs632" || sensor == "ov7725_cs637"){
			if(document.form1.ov7725_mirror.checked)
				url = url + "&mirror=1";
			else
				url = url + "&mirror=0";
		}
	}

//	if(type != 'autoExposure'){
//		if(document.form1.autoExposure.checked)
//			url = url + "&autoExposure=on";
//		else
//			url = url + "&autoExposure=off";
//	}
/*	if(type != 'antiFlicker'){
		if(document.form1.antiFlicker.checked)
			url = url + "&antiFlicker=on";
		else
			url = url + "&antiFlicker=off";
	}*/

	LoadXMLXSLTDocSendImage(url,url);
}

function getServeyRequest(hostname, request, onAlert) {
	var url = hostname + "/cgi/admin/adv_survey2.cgi";
	request.onreadystatechange = onAlert;
	try {
		request.open('GET', encodeURI(url), true);
		request.send("");
	}
	catch(e) {
		alert(e);
	}
}

function isPosInt(num){
	re = /^\d+$/;
	if (!re.test(num)) 
		return false;
	return true;
}

function range(value,min,max){
	return ((value<min)||(value>max))?false:true;
}

function alertAndSelect(obj,str){
	alert(str);
	obj.select();
}

function checkRTSPUrl(Errmsg1,Errmsg2,Errmsg3)
{
	var url1;
	var url2;
	for(var i = 1; i <= 4 ;i++)
    {
		for(var j = 1; j <= 4 ;j++)
		{
			if(i!=j)
			{
				url1 = document.getElementById("url" + i).value;
				url2 = document.getElementById("url" + j).value;
				if(url1.toUpperCase() == url2.toUpperCase())
				{
					alert(Errmsg1 + i + Errmsg2 + j + Errmsg3);
					return false;
				}
	         }
        }
    }
	return true;
}

//for tools_system.xsl
function checkASCII(asciiError){
	osdText = document.getElementById("osdText");
	var result;
	var i=0   
	for (i=0; i<osdText.value.length; i++){
		result = osdText.value.charCodeAt(i); 
//		if (result < 32 || result > 126 || result == 34 || result == 38 || result == 39 || result == 60 || result == 62 ){
		if (result < 32 || result > 126){
//			alert("OSD Label only can't accept non-number, non-alphabet, & < > \' \" characters")
			alert(asciiError)
			document.form1.osdText.select();
			return -1;
		}
	}
}

//for motion detection
function checkSenseRange(value){
	if(value == " " || value == "  " || value == "   " || value == "-0" || value == "-00" || value == "-0 " || value == " -0")
		return false;
}

//for recording
function sendRecordItems(items,itemSize){
	var i;
	for (i=itemSize+1; i<=7; i++)
		items[i] = "";
}

function setItemDayAndTime(theForm, splitDate){
	if(splitDate[0] == 0){
		theForm.sun.checked=true;
		theForm.sunH1.value = splitDate[1];
		theForm.sunM1.value = splitDate[2];
		if (splitDate[3] == 1){
			theForm.sunH2.value = '24';
			theForm.sunM2.value = splitDate[5];
		}
		else{
			theForm.sunH2.value = splitDate[4];
			theForm.sunM2.value = splitDate[5];
		}
	}
	else if(splitDate[0] == 1){
		theForm.mon.checked=true;
		theForm.monH1.value = splitDate[1];
		theForm.monM1.value = splitDate[2];
		if (splitDate[3] == 2){
			theForm.monH2.value = '24';
			theForm.monM2.value = splitDate[5];
		}
		else{
			theForm.monH2.value = splitDate[4];
			theForm.monM2.value = splitDate[5];
		}
	}
	else if(splitDate[0] == 2){
		theForm.tue.checked=true;
		theForm.tueH1.value = splitDate[1];
		theForm.tueM1.value = splitDate[2];
		if (splitDate[3] == 3){
			theForm.tueH2.value = '24';
			theForm.tueM2.value = splitDate[5];
		}
		else{
			theForm.tueH2.value = splitDate[4];
			theForm.tueM2.value = splitDate[5];
		}
	}
	else if(splitDate[0] == 3){
		theForm.wed.checked=true;
		theForm.wedH1.value = splitDate[1];
		theForm.wedM1.value = splitDate[2];
		if (splitDate[3] == 4){
			theForm.wedH2.value = '24';
			theForm.wedM2.value = splitDate[5];
		}
		else{
			theForm.wedH2.value = splitDate[4];
			theForm.wedM2.value = splitDate[5];
		}
	}
	else if(splitDate[0] == 4){
		theForm.thu.checked=true;
		theForm.thuH1.value = splitDate[1];
		theForm.thuM1.value = splitDate[2];
		if (splitDate[3] == 5){
			theForm.thuH2.value = '24';
			theForm.thuM2.value = splitDate[5];
		}
		else{
			theForm.thuH2.value = splitDate[4];
			theForm.thuM2.value = splitDate[5];
		}
	}
	else if(splitDate[0] == 5){
		theForm.fri.checked=true;
		theForm.friH1.value = splitDate[1];
		theForm.friM1.value = splitDate[2];
		if (splitDate[3] == 6){
			theForm.friH2.value = '24';
			theForm.friM2.value = splitDate[5];
		}
		else{
			theForm.friH2.value = splitDate[4];
			theForm.friM2.value = splitDate[5];
		}
	}
	else if(splitDate[0] == 6){
		theForm.sat.checked=true;
		theForm.satH1.value = splitDate[1];
		theForm.satM1.value = splitDate[2];
		if (splitDate[3] == 0){
			theForm.satH2.value = '24';
			theForm.satM2.value = splitDate[5];
		}
		else{
			theForm.satH2.value = splitDate[4];
			theForm.satM2.value = splitDate[5];
		}
	}
}

function timeCheckHours(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,0,23)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

function timeCheckHoursFull(obj1,obj2,errcode1,errcode2){
	if(isPosInt(obj1.value)==false || range(obj1.value,0,24)==false){
		alertAndSelect(obj1,errcode1);
		return false;
	}
	if(obj1.value==24){
		if(obj2.value>0){
			alertAndSelect(obj2,errcode2);
			return false;
		}
	}
	return true;
}

function timeCheckMins(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,0,59)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

function timeCheckSecs(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,0,59)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

function checkServer(obj,serverError){
	var data = document.getElementById(obj);
	if(data.value == ""){
		alert(serverError)
		data.select();
		return false;
	}

	var result;
	var i=0   
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result < 45 || result > 122 || (result > 57 && result < 65) || (result > 90 && result < 95) || result == 47 || result == 96){
			alert(serverError)
			data.select();
			return false;
		}
	}
}

function checkNTP(obj, serverError){
	var data = document.getElementById(obj);
	var re = /^[\w-]+\.+([\w-]+)*/;
	if(!data.value.match(re)){
		alert(serverError);
		return false;
	}
	return true;
}


function checkShareFolder(obj,shareFolderError){
	var data = document.getElementById(obj);
	if(data.value == ""){
		alert(shareFolderError)
		data.select();
		return false;
	}

	var result;
	var i=0   
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result < 45 || result > 122 || (result > 57 && result < 65) || (result > 90 && result < 95) || result == 46 || result == 96){
			alert(shareFolderError)
			data.select();
			return false;
		}
	}
}

//Samba Test
function sendSambaTest(usernameError,passwordError,confimError,testmsg){
	if(checkServer("server",serverError)==false)
		return false;
	if(checkShareFolder("shareFolder",shareFolderError)==false)
		return false;
	
	if(document.form1.anonymous[0].selected){
		if(document.form1.user.value == ""){
			alert(usernameError);
			document.form1.user.select();
			return false;
		}
		/*if(document.form1.password.value == ""){
			alert(passwordError);
			document.form1.password.select();
			return false;
		}*/
		if(document.form1.password.value != document.form1.passwordConfim.value){
			alert(confimError);
			document.form1.passwordConfim.select();
			return false;
		}
		
		var urlXMLSamba = document.form1.hostname.value + ":" + window.location.port + "/cgi/admin/recorder_test.cgi?server=" + document.form1.server.value + "&shareFolder=" + document.form1.shareFolder.value + "&anonymous=" + document.form1.anonymous.value + "&user=" + document.form1.user.value + "&password=" + document.form1.password.value;
	}
	else
		var urlXMLSamba = document.form1.hostname.value + ":" + window.location.port + "/cgi/admin/recorder_test.cgi?server=" + document.form1.server.value + "&shareFolder=" + document.form1.shareFolder.value + "&anonymous=" + document.form1.anonymous.value;
	
	document.getElementById("sambaStatusResult").innerHTML = testmsg;
	disableButton(1);
	var urlXSLSamba = 'adv_recording.xsl';
	
	LoadXMLXSLTDocSambaTest(urlXMLSamba,urlXSLSamba);
}

//check ftp path
function checkFolder(obj,errCode){
	
	var data = document.getElementById(obj);
	var tags = "~ ! @ # $ % ^ & ( ) + { } ` = [ ] ; ' , \\ | *";
	var arytags = tags.split(" ");
	
	for(var i = 0 ; i < arytags.length ; i++)
	{
		if(data.value.indexOf(arytags[i]) != (-1))	
		{
			alert(errCode + " \"/\" , \".\" , \"-\" , \"_\"");
			data.select();
			return false;
		}
	}
	
	/*var result;
	var i=0   
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result < 33 ||result > 126 || result == 34 || result == 42 || result == 58 || result == 60 || result == 62 || result == 63 || result == 124 ){
			alert(errCode);
			data.select();
			return false;
		}
	}*/
}

//ftp interval
function ftpIntervalCheck(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,1,86400)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

//check ftp fix filename
function checkFixFilename(obj,fixFilenameError){
	var data = document.getElementById(obj);
	if(data.value == ""){
		alert(fixFilenameError + " \".\" , \"-\" , \"_\"");
		return false;
	}
	
	for (i=0; i<data.value.length; i++){
		var result = data.value.charCodeAt(i); 
		if (result < 33 || result > 126 ){
			alert(fixFilenameError + " \".\" , \"-\" , \"_\"");
			data.select();
			return false;
		}
	}
	
	var tags = "~ ! @ # $ % ^ & ( ) + { } ` = [ ] ; ' , \\ | * / : * ? \" < > |";
	var arytags = tags.split(" ");
	
	for(var i = 0 ; i < arytags.length ;i++)
	{
		if(data.value.indexOf(arytags[i]) != (-1))	
		{
			alert(fixFilenameError + " \".\" , \"-\" , \"_\"");
			data.select();
			return false;
		}
	}
	/*var result;
	var i=0   
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result < 33 ||result > 126 || result == 34 || result == 42 || result == 47 || result == 58 || result == 60 || result == 62 || result == 63 || result == 92 || result == 124 ){
			alert(fixFilenameError);
			data.select();
			return false;
		}
	}*/
}

//for adv_recording.xsl check time
function legalTimeCheck(obj1,obj2,obj3,obj4,errcode){
	var start = parseInt(obj1.value*100) + parseInt(obj2.value*1);
	var end = parseInt(obj3.value*100) + parseInt(obj4.value*1);

	if(start >= end){
		alertAndSelect(obj1,errcode);
		return false;
	}

	return true;
}

//for cam_control.xsl
function checkPreset(presetError){
	presetName = document.getElementById("presetName");
	var result;
	var i=0   
	for (i=0; i<presetName.value.length; i++){
		result = presetName.value.charCodeAt(i); 
		if (result == 32 || result == 34 || result == 38 || result == 39 || result == 60 || result == 62 ){
			alert("Preset name can't accept space & < > \' \" characters")
//			alert(presetError)
			document.form2.presetName.select();
			return false;
		}
	}
}

//for adv_network.xsl
function checkSubnetMask(maskMessage2){
	var netmask = document.getElementById("netmask");
	var result;
	var i=0   
	for (i=0; i<netmask.value.length; i++){
		result = netmask.value.charCodeAt(i); 
		if (result < 46 || result > 57 || result == 47){
//			alert("Preset name can't accept space & < > \' \" characters")
			alert(maskMessage2)
			document.form1.netmask.select();
			return false;
		}
	}
}

//for adv_wireless.xsl
function wirelessDoXSLT(ssid,bssid,signal,type,channel,encrypt,auth){
	if (xmlDoc==null){// alert("null");
		return false; 
	}
//	document.getElementById("sambaStatus").innerHTML = xmlDoc.getElementsByTagName('samba')[0].firstChild.nodeValue;
//	document.getElementById("sdCardStatus").innerHTML = xmlDoc.getElementsByTagName('usb')[0].firstChild.nodeValue;
	var listNumber = xmlDoc.getElementsByTagName('totalCount')[0].firstChild.nodeValue

	for (i=1;i<=listNumber;i++){
		ssid[i] = xmlDoc.getElementsByTagName('ssid')[i-1].firstChild.nodeValue;
		bssid[i] = xmlDoc.getElementsByTagName('bssid')[i-1].firstChild.nodeValue;
		signal[i] = xmlDoc.getElementsByTagName('signal')[i-1].firstChild.nodeValue;
		type[i] = xmlDoc.getElementsByTagName('type')[i-1].firstChild.nodeValue;
		channel[i] = xmlDoc.getElementsByTagName('channel')[i-1].firstChild.nodeValue;
		encrypt[i] = xmlDoc.getElementsByTagName('encrypt')[i-1].firstChild.nodeValue;
		auth[i] = xmlDoc.getElementsByTagName('auth')[i-1].firstChild.nodeValue;
	}
	initSSID(document.form1.listSSID,listNumber,ssid);
}

function initSSID(chooser,listNumber,ssid) {
var ssidDB = new Object( )
    var newElem;

    var where = (navigator.appName == "Microsoft Internet Explorer") ? -1 : null;
    var cityChooser = chooser.form.elements["listSSID"];
    while (cityChooser.options.length) {
        cityChooser.remove(0);
    }
//    var choice = chooser.options[chooser.selectedIndex].value;
//	var db = regiondb[key];
	for (var i = 0; i <= listNumber; i++) {
		newElem = document.createElement("option");
		if(i==0)
			newElem.text = "===SSID List===";
		else
			newElem.text = ssid[i];
		newElem.value = i;
		cityChooser.add(newElem, where);
	}
	chooser.disabled = false;
//	document.form1.encryption.value = order;
}

//for adv_network.xsl
function checkPort(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,1,65535)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

//tools_admin.xsl for check blank
function checkAdminPass(errorCode){
	admin = document.form1.password;
	var result;
	var i=0   
	for (i=0; i<admin.value.length; i++){
		result = admin.value.charCodeAt(i); 
		if (result < 33 || result > 126 || result == 34  ){
			alert(errorCode+ " \" ");
//			alert(presetError)
			document.form1.password.select();
			return false;
		}
	}
}

//tools_admin.xsl for check blank
function checkAddUser(errorCode1,errorCode2){
	userName = document.form2.user;
	userPass = document.form2.password;
	var result;
	var i=0;
	for (i=0; i<userName.value.length; i++){
		result = userName.value.charCodeAt(i); 
		if (result < 45 || result > 122 || (result > 57 && result < 65) || (result > 90 && result < 95) || result == 47 || result == 96 ){
			alert(errorCode1);
			document.form2.user.select();
			return false;
		}
	}
	for (i=0; i<userPass.value.length; i++){
		result = userPass.value.charCodeAt(i); 
		if (result < 33 || result > 126 ){
			alert(errorCode2);
			document.form2.password.select();
			return false;
		}
	}
}

function checkBlank1(errcode){
	data = document.form1.password;
	var result;
	var i=0;
	var count=0;
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result == 32)
			count++;
	}
	if (count == data.value.length){
		alert(errcode);
		return false;
	}
}

function checkBlank2(errcode){
	data = document.form2.user;
	var result;
	var i=0;
	var count=0;
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result == 32)
			count++;
	}
	if (count == data.value.length){
		alert(errcode);
		return false;
	}
}

//for tool_system check time and date
function manualDateCheck(parameterError,yearError,monError,dayError1,dayError2,dayError3,dayError4){
	var systemDate = document.form1.webDate.value.split("/");

	if(systemDate[1]==null || systemDate[2]==null){
		alert(parameterError);
		return false;
	}
		
	if(	isPosInt(systemDate[0])==false || range(systemDate[0],1970,2037)==false){
		alert(yearError);
		return false;
	}
	
	if(	isPosInt(systemDate[1])==false || range(systemDate[1],1,12)==false){
		alert(monError);
		return false;
	}
	
	if(	isPosInt(systemDate[2])==false || range(systemDate[2],1,31)==false){
		alert(dayError1);
		return false;
	}
	
	if(systemDate[1]==4 || systemDate[1]==6 || systemDate[1]==9 || systemDate[1]==11){
		if(systemDate[2] > 30){
			alert(dayError2);
			return false;
		}
	}

	if(systemDate[1]==2){
		if( (systemDate[0]%4==0 && systemDate[0]%100!=0) || systemDate[0]%400==0 ){
			if(systemDate[2] > 29){
				alert(dayError3);
				return false;
			}
		}
		else{
			if(systemDate[2] > 28){
				alert(dayError4);
				return false;
			}
		}		
	}
}

function manualTimeCheck(parameterError,hourError,minuteError,secondError){
	var systemTime = document.form1.webTime.value.split(":");

	if(systemTime[1]==null || systemTime[2]==null){
		alert(parameterError);
		return false;
	}
		
	if(	isPosInt(systemTime[0])==false || range(systemTime[0],0,23)==false){
		alert(hourError);
		return false;
	}
	
	if(	isPosInt(systemTime[1])==false || range(systemTime[1],0,59)==false){
		alert(minuteError);
		return false;
	}
	
	if(	isPosInt(systemTime[2])==false || range(systemTime[2],0,59)==false){
		alert(secondError);
		return false;
	}
}

//for check username password
function checkName(id,errCode){
	data = document.getElementById(id);
	var result;
	var i=0   
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result < 33 ||result > 126){
			alert(errCode);
			data.select();
			return false;
		}
	}
}
function checkDeviceName(id,errorMsg){
	data = document.getElementById(id);
	var result;
	var i=0 ;

	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
			if (result == 47 || result == 92 || result == 58 || result == 42 || result == 63 || result == 34 || result == 60 || result == 62  || result == 124 || result == 38){
			alert(errorMsg+"/ \\ : * ? \" < > | &");
			data.select();
			return false;
		}
	}
}

function checkNameLimit(id){
	data = document.getElementById(id);
	var result;
	var i=0 ;
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
			if (result < 33 ||result > 126 || result == 34 || result == 39 || result == 47 || (result < 65 && result > 58) || (result < 94 && result > 90) || result == 43 || result == 44  || result == 42  || result == 124){
			alert("Name can't accept Non-ASCII, space, / \\ \" \' [ ] = | < > + = ; , ? * @ characters");
			data.select();
			return false;
		}
	}
}
function checkPasswordLimit(id){
	data = document.getElementById(id);
	var result;
	var i=0   
	for (i=0; i<data.value.length; i++){
		result = data.value.charCodeAt(i); 
		if (result < 33 ||result > 126 || result == 34 || result == 38 || result == 39 || result == 60 || result == 62 ){
			alert("password can't accept Non-ASCII, space & < > \' \" characters");
			data.select();
			return false;
		}
	}
}

function checkAddUsername(userlist,index,newadd,errCode1,errCode2){
	var i=0;
	for(i=0;i<index;i++){
		if(newadd == userlist[i]){
			alert(errCode1);
			return false;
		}
		if(newadd == "admin"){
			alert(errCode2);
			return false;
		}
	}
}

//for index.xsl zoon in
function zoonIn(){
	var dcscontrol1 = document.getElementById("dcscontrol1");
	overImage('zoon_in');
//	alert("zoon in, not works");
	var ratio = dcscontrol1.GetZoomRatio();
	if(ratio < 16){
		ratio = ratio * 1.07;
		dcscontrol1.SetZoomRatio(ratio);
	}
}

function zoonOut(){
	var dcscontrol1 = document.getElementById("dcscontrol1");
	overImage('zoon_out');
//	alert("zoon out, not works");
	var ratio = dcscontrol1.GetZoomRatio();
	if(ratio > 1){
		ratio = ratio/1.07;
		dcscontrol1.SetZoomRatio(ratio);
	}
}

//for PT patrol


function delPatrol(){
	var patrolPoint = document.form4.patrolPoint;
	if(patrolPoint.selectedIndex !=-1)
	{
		for(var i=0; i< patrolPoint.options.length; i++)
		{
			if(patrolPoint.options[i].selected)	
			{
				patrolPoint.remove(i);
				i = 0;
			}
		}
	}
	//if(patrolPoint.selectedIndex !=-1)
		//patrolPoint.remove(patrolPoint.selectedIndex);
	//else
		//alert("Please select a point");
}

function changepos(index){
	var obj = document.form4.patrolPoint;
	if(index==-1){
		if(obj.selectedIndex !=-1){
			if (obj.selectedIndex>0){
				swapNode(obj.options[obj.selectedIndex],obj.options[obj.selectedIndex-1]);
				//obj.options(obj.selectedIndex).swapNode(obj.options(obj.selectedIndex-1));//only for IE
			}
		}
		else{
			alert("Please select a point");
		}
	}
	else if(index==1){
		if(obj.selectedIndex !=-1){
			if (obj.selectedIndex<obj.options.length-1) {
				swapNode(obj.options[obj.selectedIndex],obj.options[obj.selectedIndex+1]);
				//obj.options(obj.selectedIndex).swapNode(obj.options(obj.selectedIndex+1));//only for IE
			}
		}
		else{
			alert("Please select a point");
		}
	}
}
function swapNode(node1,node2)
{
	var parent = node1.parentNode;
	var t1 = node1.nextSibling;
	var t2 = node2.nextSibling;
	if(t1) 
		parent.insertBefore(node2,t1);
	else
		parent.appendChild(node2);
	if(t2) 
		parent.insertBefore(node1,t2);
	else
		parent.appendChild(node1);
}   
function checkPoint(){
	var patrolPoint = document.form4.patrolPoint;
	var routeValue = "";
	for(var i=0;i<patrolPoint.options.length;i++)
		routeValue = routeValue + patrolPoint.options[i].value + ",";
	
	routeValue = routeValue.substring(0,routeValue.length-1)
	document.form4.route.value = routeValue;
}

function getPoint(route){
	var patrolPoint = document.form4.patrolPoint;
	var j=0;
	var Point = route.split(',');

	for(var i=0;i<Point.length;i++)
	{
		patrolPoint.options.add(new Option(Point[i],Point[i]));
	}	
	
/*	for(var i=0;i<route.length;i++){
		patrolPoint.remove(i);
	}
	
	for(var i=0;i<route.length;i++){
		patrolPoint.options.add(new Option(route.substring(i,i+1), route.substring(i,i+1)));
		i++;
		j++;
	}*/
}

//for cam_control
function checkWaitTime(obj,errcode){
	if(isPosInt(obj.value)==false || range(obj.value,0,60)==false){
		alertAndSelect(obj,errcode);
		return false;
	}
	return true;
}

function disableObj(flag, objIDStr){
	var Obj;
	var IDStrarray = objIDStr.split(" ");
	var i = 0;
	for (i = 0; i < (IDStrarray.length); i++) {
		Obj = get_by_id(IDStrarray[i]);
		if (flag)
			Obj.disabled=true;
		else
			Obj.disabled=false;
	}
}

function formatNumber(dataArray) {
	for (var i = 0; i < (dataArray.length); i++) {
		if (dataArray[i].length == 1) {
			if (dataArray[i] == 0)
				dataArray[i] = "00";
			else
				dataArray[i] = "0"+dataArray[i];
		}
	}
}

function check_ptz_id(protocol,id) {
	if(protocol=='0'){
		if(1 > id||id > 255)
			return false;
	}
	if(protocol=='1'){
		if(1 > id||id > 32)
			return false;
	}
	if(protocol=='2'){
		if(1 > id||id > 223)
		return false;
	}
	if(protocol=='3'){
		if(1 > id||id > 64)
			return false;
	}
	return true;
}

function handle_address(ip) {
	temp = ip.split(".");
	temp[0] = parseInt(temp[0],10);
	temp[1] = parseInt(temp[1],10);
	temp[2] = parseInt(temp[2],10);
	temp[3] = parseInt(temp[3],10);
	ip = temp[0].toString()+"." + temp[1].toString()+"." + temp[2].toString()+"." + temp[3].toString();
	return ip;
}
function simOptionClickForIE()
{    
    var evt=window.event;     
    var selectObj=evt?evt.srcElement:null;      
	//for IE only
    if (evt && selectObj &&  evt.offsetY && evt.button!=2     
        && (evt.offsetY > selectObj.offsetHeight || evt.offsetY<0 ))
	{    
          var oldIdx = selectObj.selectedIndex;     
          setTimeout(function(){     
                var option=selectObj.options[selectObj.selectedIndex];        
                 goPreset();
            }, 60);     
     }     
}
function reflashImage()
{
	document.getElementById("mjpgImage").src= "";
	document.getElementById("mjpgImage").src="/video/mjpg.cgi?profileid="+ profileForNonIE + "&"+ Math.random();
}
