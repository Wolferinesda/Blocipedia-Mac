// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require_tree .
var blocmetrics = {};
blocmetrics.report = function(eventName){
  var event = {event: { name: eventName }};

  // #2
  var request = new XMLHttpRequest();
  // #3
  request.open("POST", "http://localhost:3000/api/events", true);
  // #4
  request.setRequestHeader('Content-Type', 'application/json');
  // #5
  request.send(JSON.stringify(event));
};
