//when additionalIncentive.html page load this page call automativally
$(document).ready(function(){
    function getAddionalinfo() {
      $.post('/napi/ai/info',{},function(data){
        var trHTML = '';
        $.each(data, function (i, item) {
          trHTML += '<tr><td>'+item.carrier+'</td><td>' + item.incentive_pct + '</td><td>' + item.incentive_dlrs
          trHTML += '</td><td>' + item.agt_share_pct + '</td><td><button class="deleteCarrier" carrier="'+item.carrier+'">delete</button></td></tr>';
        });
        $('#AIInfo tbody').empty().append(trHTML);
      })
    }
    getAddionalinfo();
      // to populate popup show additional insentive
    $(document).on("click",".deleteCarrier", function (event) {
      var carrier = $(event.target).attr('carrier')
      $.post('/napi/ai/delete',{carrier:carrier},function(data){
        getAddionalinfo();
      })
    })
    $(document).on("click","#updateChange", function (event) {
      var val0 = $('#val0').val()
      var val1 = $('#val1').val()
      var val2 = $('#val2').val()
      var val3 = $('#val3').val()
      var changeDict = {val0:val0,val1:val1,val2:val2,val3:val3}
      $.post('/napi/ai/update',changeDict,function(data){
        getAddionalinfo();
      })
    });

});
