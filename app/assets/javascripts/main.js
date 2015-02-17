$(document).ready(function(){
  $("[data-slide-src]").click(function(){
    var id = $(this).attr('data-slide-src');
    $("[data-slide-dest='"+id+"']").slideToggle();
  });


})