$(document).ready(function () {
  var show_chart = function () {
    var question = $('#questions').val();

    $.ajax({
      dataType: 'json',
      type: 'get',
     # url: '/questions/chart/' + activity
    }).done(process_activity);
  };

  var process_question = function (questions) {
    $('#chart').empty();
    new Morris.Line({
      element: 'chart',
      data: questions,
      xkey: 'completed',
      ykeys: ['value'],
      labels: ['Value']
    });
  };

  $('#show_chart').click(show_chart).trigger('click');
});