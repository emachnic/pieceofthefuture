$(function(){
  $("#search input").keyup(function() {
    $.get($("#search").attr("action"), $("#search").serialize(), null, "script");
    return false;
  });
})