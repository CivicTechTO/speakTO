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

  var formReady = false;
  var videoReady = false;
  var videoUrl = '';
  var deputationId = '';

  $('.glyphicon-info-sign').on('click', function() { 
    $('#information-modal').modal('show');
  });

  $('#deputation-modal .submit').on('click', function(e) {
    e.preventDefault();
    var fd = new FormData();
    fd.append('first_name', $('#first_name').val());
    fd.append('last_name', $('#last_name').val());
    fd.append('postal_code', $('#postal_code').val());
    fd.append('make_public', $('#make_public').val());
    fd.append('agenda', $('#agenda').val());
    fd.append('occupation', $('#occupation').val());
    fd.append('current_deputation_id', deputationId);
    // submitForm(fd);
    $('#deputation-modal').modal('hide');
    formReady = true;
    redirectToDeputation();
  })

  $('#videoContainer').change(function(e) {
    $('div.file-upload').hide();
    $('div.loader').show();

    var filePath = $(this)[0].value;
    var fileName = filePath.split(/(\\|\/)/g).pop();
    $('.notifications').text(fileName).fadeIn('slow');
    setTimeout(function() {
      $('.notifications').fadeOut('slow');
      $('#deputation-modal').modal('show');
    }, 3000);

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
      submitFile(file);
	};

    rd.readAsArrayBuffer(file);
  });

  function submitFile(file) {
    var fd = new FormData();
    fd.append('video', file);
    fd.append('current_deputation_id', deputationId);

    $.ajax({
      url: "/deputations",
      type: "POST",
      data: fd,
      processData: false,
      contentType: false,
      success: function(response) {
        videoUrl = response.result.url;
        deputationId = response.result.id;
        videoReady = true;

        $('.flashNotif').slideDown('slow')
          .text('Upload successful!')
          .removeClass('.success .fail')
          .addClass('success');

        setTimeout(function () {
          $('.flashNotif').fadeOut('slow');
        }, 2400);

        redirectToDeputation();
      },
      error: function (e) {
        $('div.loader').hide();
        $('div.file-upload').show();

        $('.flashNotif').slideDown('slow')
          .text('Upload error!')
          .removeClass('.success .fail')
          .addClass('fail');

        setTimeout(function () {
          $('.flashNotif').fadeOut('slow');
        }, 2400);
        return true;
      }
    });
  };

  function progressHandlingFunction() {
  	// send progress to upload circle
  	return true;
  };

  function redirectToDeputation() {
    if(formReady && videoReady && videoUrl !== '') {
      window.location.href = videoUrl;
    }
  };

  function submitForm(formData) {
    $.ajax({
      url: "/deputations/" + deputationId,
      type: "PATCH",
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) {
        deputationId = response.result.deputation.id;
        formReady = true;
        redirectToDeputation();
      },
      error: function (e) {
        console.log(e)
      }
    });
  };

});