$(document).ready(function () {
  $('body').click(function () {
    $('.active').removeClass('active');
    $('.editing').removeClass('editing');
  });

  $('.hover-container').click(function() {
    $(this).addClass('active');
    $(this).parent().addClass('active');
    $(this).parent().prev().addClass('editing');

    var chunk_container = $(this).closest('.body');

    // debugger;

    return false;
  });
});