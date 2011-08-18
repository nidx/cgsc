$(document).ready(function() {
    var ev;
    $.getJSON("api/events",function(d){
        ev = d;
        $("#activity_event_template").tmpl(d).appendTo("#activity");
    });
});