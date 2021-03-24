$(document).ready(function(){
	sendData(targets.LOAD_DATA, null);
});

const targets = {
	HISTORY: "history overview",
	LOAD_DATA: "load data"
}

const statusRequest = {
	SUCCESS: "SUCCESS",
	WARNING: "WARNING",
	ERROR: "ERROR"
}

const lists = {
	ROLES: "ROLES",
	YEARS: "YEARS"
}

const operations = {
	OVERVIEW: "OVERVIEW_COMPENSATION"
}

if (!targets ) {
	throw new Error("Targets are not defined")
}

if (!statusRequest ) {
	throw new Error("Enum class for status request is not defined")
}

if (!lists ) {
	throw new Error("Enum class for retrieved lists is not defined")
}

function retrieveTravelCompensationOverview(event){
	sendData(targets.HISTORY,$('form#form1').serialize());
	event.preventDefault();
	return false;
}

function sendData(target,data){
	var url = "";
	if (target == targets.HISTORY){
		url = "./getTravelCompensationHistory.php"+(data != null ? "?"+data : "");
	} else if(target == targets.LOAD_DATA){
		url = "./loadData.php"+ (data != null ? "?"+data : "");
		
	}
	
	if (url != ""){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				// alert(xmlhttp.responseText) // debugging purposes
				var data;
				try {
					data = JSON.parse(xmlhttp.responseText);
					
				}
				catch(err) {
				  alert("Unknown error when parsing response. Target: " + target);
				  throw new Error(err);
				}
				handleResults(data,target);
			} /*else
				alert("An error occurred while executing target '"+target+"'")*/
		}
		xmlhttp.open("GET",url,true);
		xmlhttp.send();
	}
}

function handleResults(json,forwardTo){
	// JSON.stringify(obj); //debugging purposes use this
	if (forwardTo == targets.HISTORY){
		document.location.href = json['response'][operations.OVERVIEW];
	} else if (forwardTo == targets.LOAD_DATA){
		if (json['status'][lists.ROLES] == statusRequest.SUCCESS && json['status'][lists.YEARS] == statusRequest.SUCCESS){
			$('img.loading'). remove();
			$("div#wrapperForm").removeClass("hide");
			displayLoadedData(json['response']);
		} else{
			alert(JSON.stringify(json['status']));
			alert(JSON.stringify(json['message']));
		}
	}
}

function displayLoadedData(data){
	$("#fEmployee").selectize({
		plugins: ['remove_button'],
		persist: false,
		maxItems: null,
		valueField: 'role',
		labelField: 'name',
		searchField: ['name', 'role'],
		options: [
			{role: 'Software Engineer', name: 'Arthur Palm'},
			{role: 'Front-end Engineer', name: 'Rens Garcia'},
			{role: 'Data Engineer', name: 'Paul Johnson'}
		],
		render: {
			item: function(item, escape) {
				return '<div>' +
					(item.name ? '<span class="name">' + escape(item.name) + '</span>' : '') +
					(item.role ? '<span class="role"> &lt;' + escape(item.role) + '&gt;</span>' : '') +
				'</div>';
			},
			option: function(item, escape) {
				var label = item.name || item.role;
				var caption = item.name ? item.role : null;
				return '<div>' +
					'<span class="label">' + escape(label) + '</span>' +
					(caption ? '<span class="caption"> &lt;' + escape(caption) + '&gt;</span>' : '') +
				'</div>';
			}
		}
	});
	$("#fRoles").selectize({
		plugins: ['remove_button'],
		persist: false,
		maxItems: null,
		valueField: 'role_id',
		labelField: 'title',
		options: data[lists.ROLES],
		render: {
			item: function(item, escape) {
				return '<div>' +
					(item.title ? '<span class="title">' + escape(item.title) + '</span>' : '') +
				'</div>';
			},
			option: function(item, escape) {
				var caption = item.title
				return '<div>' +
					(caption ? '<span class="caption">' + escape(caption) + '</span>' : '') +
				'</div>';
			}
		}
	});
	$("#fYear").selectize({
		persist: false,
		maxItems: 1,
		valueField: 'years',
		options: data[lists.YEARS],
		render: {
			item: function(item, escape) {
				return '<div>' +
					(item.years ? '<span class="years">' + escape(item.years) + '</span>' : '') +
				'</div>';
			},
			option: function(item, escape) {
				var caption = item.years
				return '<div>' +
					(caption ? '<span class="caption">' + escape(caption) + '</span>' : '') +
				'</div>';
			}
		}
	});
}