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

  $('.branch-text[contenteditable="true"]').click(function () {
    if ($(this).text().trim() == "Continue the story from here...") {
      var placeholder_p = $(this).children().first();
      placeholder_p.text("");
    }
  });
});