$(document).ready(function() {
  function previewImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#avatar').empty();
          $('#avatar').append("<img src='"+e.target.result+"' width='160' class='img-circle'>");
        }
        reader.readAsDataURL(input.files[0]);
    }
  }

  $("#user_avatars").change(function(){
      previewImg(this);
  });

});
