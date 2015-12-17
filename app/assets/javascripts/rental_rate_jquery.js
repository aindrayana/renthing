
$(document).ready(function() {
  $(".listing-rate > .list-group-item").click(function(){
    $(this).addClass("active").siblings().removeClass("active");
    var term = $(this).attr('data-term');
    var rate = $(this).attr('data-rate');
    $('#reservation').empty();
    $('#reservation').append("<input type='hidden' name='reservation[rent_term]' value='"+term+"'>");
    $('#reservation').append("<input type='hidden' name='reservation[rent_fee]' value='"+rate+"'>");
  });
});
