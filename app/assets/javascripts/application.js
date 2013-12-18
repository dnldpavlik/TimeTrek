// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require time_trek

// for more details see: http://emberjs.com/guides/application/
window.TimeTrek = Ember.Application.create();

//= require_tree .

$(document).ready(function() {
    $("li[data-task-id]").click(function() {
        getTask($(this).attr('data-task-id'), this);
    });
});

function getTask(task_id, element) {
    $(".content").addClass("active");
    $("li[data-task-id]").removeClass("selected");
    $(element).addClass("selected");


    $.getJSON(
        "/tasks/" + task_id,
        function(task) {
            $("#task_description span").text(task.description);
            var createdDate = new Date(task.created_at);
            $("#created .value").text(createdDate.toLocaleDateString() + " " + createdDate.toLocaleTimeString());
            var updatedDate = new Date(task.updated_at);
            $("#updated .value").text(updatedDate.toLocaleDateString() + " " + updatedDate.toLocaleTimeString());
            $("#status .value").text(task.status);
        });
}
