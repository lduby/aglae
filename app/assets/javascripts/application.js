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

function open_tab(title,content_url) {
  //alert("Tab title = "+title);
  //alert("Content url = "+content_url);
  var tab_header = "<li><a class='tab-header' href=\"#"+title.replace(" ",'_')+"\" data-toggle=\"tab\"><button class=\"close tab-close-button\" type=\"button\" onclick=\"close_tab($(this),$(this).closest('a').attr('href'));\">×</button>"+title+"</a></li>";
  $("ul.nav-tabs").append(tab_header);
  //$("ul.nav-tabs").append("<li><a class='tab-header' href=\"#"+title.replace(" ",'_')+"\" data-toggle=\"tab\">"+title+"</a><a href=\"#\" class=\"close tab-close-button\">x</a></li>");
  $(".tab-pane.active").removeClass("active");
  $(".tab-content").append("<div class=\"tab-pane active\" id=\""+title.replace(" ",'_')+"\"></div>");
  $("#"+title.replace(" ",'_')).load(content_url, function() {
      $(this).show('slow');
  });
  $('#dashboardTabs a[href="#'+title.replace(" ",'_')+'"]').tab('show');
}

function close_tab(tab_button,tab_content_anchor) {
  alert(tab_content_anchor);
  //$('#dashboardTabs a[href="'+tab_content_anchor+'"]').tab('hide');
  $(tab_button).closest('li').remove();
  $(tab_content_anchor).remove();
  // retour au tab par defaut
  $('#dashboardTabs a[href="#dashboard"]').tab('show');
  $("#dashboard.tab-pane").addClass("active");
  $("#dashboard").show();
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