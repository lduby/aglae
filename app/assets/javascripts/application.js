// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function hide_load_and_show_div(divname,url) {
  $(divname).hide();
  $(divname).load(url, function() {
      $(this).show('slow');
  });
}

function clear_members_details() {
  $("#memberdetails").text("Click a member to view it.");
}
function clean_members_list() {
  $("#memberslist a").removeClass("selected");
  $("#memberslist a i").remove();
  $("#memberslist li").removeClass("active");
}
function clean_member_screen() {
  clear_members_details();
  clean_members_list();
}

function member_button_close() {
  $("#memberdetails .close").click(
    function (event) {
      event.preventDefault();
      clean_member_screen();
    }
  )
}

function display_member_details() {
  // removes all handlers before attaching new ones
  $("#memberslist a").off();
  // attach new handlers
  $("#memberslist a").click(function(event) {
    event.preventDefault();
    url=$(this).attr("href");
    link = $(this);
    
    if ($(this).hasClass("selected")) {
      link.removeClass("selected");
      clean_member_screen();
    } else {
      $("#memberdetails").load(url+"/jsshow", function () {
        clean_members_list();
        link.addClass("selected");
        link.parents("li").addClass("active");
        link.prepend("<i class=\"icon-arrow-right\"></i>");
      });
    }
  })
}

function load_members_list() {
  $('#memberslist').load("/members/list", display_member_details);
}

$(document).ready(function() {
  var st=new Array(); // regular array (add an optional integer
  $.getJSON('/members/search',function(data){
         var i=0;
         for(i=0;i<data.length;i++){
            console.log(data[i]);
            st[i]=data[i];
        }
        $('.typeahead').typeahead({source: st, items:5});
    });
});