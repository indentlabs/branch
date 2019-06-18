$(document).ready(function () {
  $('body').click(function () {
    $('.active').removeClass('active');
    $('.editing').removeClass('editing');

    $('.action-list').show();
  });

  $('.hover-container').click(function() {
    $(this).addClass('active');
    $(this).closest('.branch-point').addClass('active');
    $(this).closest('.branch-point').prev().addClass('editing');
    $('.action-list').hide();

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

  $('.show-advanced-options-link').click(function () {
    $(this).parent().find('.advanced-options').toggle();
  });

  $('.js-submit-branch').click(function () {
    var card_container  = $(this).closest('.card-content');
    var branch_text     = card_container.find('.branch-text').html();
    var branch_form     = card_container.find('form');
    var chunk_container = card_container.closest('.chunk');

    var prior_story = $.map(
      chunk_container.find('.body > p:visible').toArray(), 
      function (p) {
        return "<p>" + $(p).html() + "</p>";
      }
    ).join("\n");
  
    branch_form.append($("<input>")
      .attr("type", "hidden")
      .attr("name", "branch[prior_chunk_id]").val(chunk_container.data('id'))
    );

    branch_form.append($("<input>")
      .attr("type", "hidden")
      .attr("name", "branch[prior_chunk_text]").val(prior_story)
    );
  
    branch_form.append($("<input>")
      .attr("type", "hidden")
      .attr("name", "branch[new_chunk_text]").val(branch_text)
    );

    branch_form.submit();
  })
});