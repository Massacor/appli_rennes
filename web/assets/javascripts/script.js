$(document).ready(function(){


  /* ===============
      Date picker
  ================ */


  $(function() {

      var start = moment().subtract(7, 'days');
      var end = moment();

      function cb(start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }

      $('#reportrange').daterangepicker({
          startDate: start,
          endDate: end,
      }, cb);

      cb(start, end);
  });




  /* =============
      Homemade collapse
  ============== */

  $("#content_test1-trigger").click(function(){
    $("#content_test1").toggle(500, function(){
      $("#content_test1-trigger").toggleClass("glyphicon-chevron-down glyphicon-chevron-up")
    });
  });

  $("#content_test2-trigger").click(function(){
    $("#content_test2").toggle(300);
  });

  $("#content_test3-trigger").click(function(){
    $("#content_test3").hide(300);
  });

  $("#content_test4-trigger").click(function(){
    $("#content_test4").hide(300);
  });

  $("#content_test4-trigger").click(function(){
    $("#content_test4").hide(300);
  });




});