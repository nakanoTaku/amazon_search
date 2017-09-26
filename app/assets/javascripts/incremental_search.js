$(window).on('load', function() {
  var timer;
  var preInput = "";

  ajaxSearch = function(input) {
    $.ajax({
      url: "/",
      type: "GET",
      dataType: 'script',
      data: ("keyword=" + input)
    });
  };

  triggerAjax = function(input) {
    if(preInput !== input) {
      clearTimeout(timer);
      timer = setTimeout(ajaxSearch, 500, input);
    };
  };

  $('#book_search').on('keyup', function() {
    input = $.trim($(this).val());
    triggerAjax(input);
    preInput = input;
  });
});
