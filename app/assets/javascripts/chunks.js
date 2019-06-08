$(document).ready(function () {
  $('body').click(function () {
    $('.active').removeClass('active');
    $('.editing').removeClass('editing');
  });

  $('.hover-container').click(function() {
    $(this).addClass('active');
    $(this).closest('.branch-point').addClass('active');
    $(this).closest('.branch-point').prev().addClass('editing');

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

  $('.js-submit-branch').click(function () {
    var card_container = $(this).closest('.card-content');
    var branch_text = card_container.find('.branch-text').html();
    var branch_form = card_container.find('form');

    // Do some stuff

    branch_form.submit();
  })
});