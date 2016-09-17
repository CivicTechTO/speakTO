// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// GLOBALS
var MAX_FILE_DURATION = 120;

$(document).ready(function() {

  $('#videoContainer').change(function(e) {
    var filePath = $(this)[0].value;
    var fileName = filePath.split(/(\\|\/)/g).pop();
    $('.notifications').text(fileName);

    var file = e.target.files[0];
	var mime = file.type;
	var rd = new FileReader();
	var fileDuration;

	rd.onload = function(e) {

	  var blob = new Blob([e.target.result], {
	      type: mime
	    }),
	    url = (URL || webkitURL).createObjectURL(blob),
	    video = document.createElement("video");

	  video.preload = "metadata";
	  video.addEventListener("loadedmetadata", function() {
	    fileDuration = parseInt(video.duration.toFixed(0));
	    (URL || webkitURL).revokeObjectURL(url);
	  });
	  video.src = url;
	  if (fileDuration > MAX_FILE_DURATION) {
	  	return;
	  }
	};
	rd.readAsArrayBuffer(file);

    submitFile();
  });

  function submitFile() {
    $.ajax({
      url: "upload",
      type: "POST",
      xhr: function() {
      	myXhr = $.ajaxSettings.xhr();
        if(myXhr.upload){
          myXhr.upload.addEventListener('progress', progressHandlingFunction, false);
        }
        return myXhr;
      },
      success: function() {
      	// send success to notif
      	return true;
      },
      error: function (e) {
      	// send error to notif
      	console.log("File Upload Error! " + e);
      	return true;
      }
    }, 'json');
  }

  function progressHandlingFunction() {
  	// send progress to upload circle
  	return true;
  }

});