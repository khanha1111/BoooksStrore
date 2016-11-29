$(document).on('turbolinks:load', function() {
  $(document).on('change', '#file-upload', function(e) {
    var preview = document.getElementById("imgtag");
      var file    = document.querySelector('input[type=file]').files[0];
      var reader  = new FileReader();
      reader.onloadend = function () {
        preview.src = reader.result;
      }
      if (file) {
        reader.readAsDataURL(file);
      } else {
        preview.src = "";
      }
  });
  jQuery(document).ready(function() {
    jQuery("div.alert").delay(2000).slideUp();
    // $("select").select2();
    jQuery("#cate_name").hide();
    jQuery("#cate_name").attr("name","none");
    jQuery("#init_check").change(function() {
        if(jQuery(this).is(":checked")) {
          jQuery("#cate_select").hide();
          jQuery("#cate_name").show();
          jQuery("#cate_name").attr("name","request[cate_name]");
          jQuery("#request_cate_name").attr("name","none");
        }else{
          jQuery("#cate_select").show();
          jQuery("#cate_name").hide();
          jQuery("#cate_name").attr("name","none");
          jQuery("#request_cate_name").attr("name","request[cate_name]");
        }
    });

    jQuery(".sui-picker-input").change(function(){
      console.log("sdsd");
    });

    jQuery(".condition_search").on("click",function(e){
      jQuery("#general").text(jQuery(this).text());
      jQuery(".general").val(jQuery(this).text());
        var ul=jQuery(this).find('ul');
        ul.slideUp();
        jQuery('.header-button, .switch-show').not(this).find('ul').slideUp();
    });
     jQuery(".action").click(function(){
            alert("This book has "+jQuery(this).title);
            jQuery(this).hide();
          });


  });
});
