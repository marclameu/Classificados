$(function() {
  $(".pagination a").live("click", function() {
    $(".pagination").html("Carregando...");
    $.getScript(this.href);
    return false;
  });
});