
$(document).ready(function() {
  $(".listing-rate > .list-group-item").click(function(){
    $(this).addClass("active").siblings().removeClass("active");
    // $('#avatar').append("<img src='"+e.target.result+"' width='160' class='img-circle'>");

  });
});
