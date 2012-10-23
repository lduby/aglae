/***
 * Contains basic SlickGrid formatters.
 * @module Formatters
 * @namespace Slick
 */

(function ($) {
  // register namespace
  $.extend(true, window, {
    "Slick": {
      "Formatters": {
        "PercentComplete": PercentCompleteFormatter,
        "PercentCompleteBar": PercentCompleteBarFormatter,
        "YesNo": YesNoFormatter,
        "Checkmark": CheckmarkFormatter,
        "MemberType": MemberTypeFormatter,
        "Locality": LocalityFormatter
      }
    }
  });

  function PercentCompleteFormatter(row, cell, value, columnDef, dataContext) {
    if (value == null || value === "") {
      return "-";
    } else if (value < 50) {
      return "<span style='color:red;font-weight:bold;'>" + value + "%</span>";
    } else {
      return "<span style='color:green'>" + value + "%</span>";
    }
  }

  function PercentCompleteBarFormatter(row, cell, value, columnDef, dataContext) {
    if (value == null || value === "") {
      return "";
    }

    var color;

    if (value < 30) {
      color = "red";
    } else if (value < 70) {
      color = "silver";
    } else {
      color = "green";
    }

    return "<span class='percent-complete-bar' style='background:" + color + ";width:" + value + "%'></span>";
  }

  function YesNoFormatter(row, cell, value, columnDef, dataContext) {
    return value ? "Yes" : "No";
  }

  function CheckmarkFormatter(row, cell, value, columnDef, dataContext) {
    return value ? "<img src='/assets/tick.png'>" : "";
  }

  function MemberTypeFormatter(row, cell, value, columnDef, dataContext) {
    var img_to_be_displayed;
    if (value == "Individual") {
      img_to_be_displayed = "<i class='icon-group'></i>";
      
    } else if (value == "Group") {
      img_to_be_displayed = "<i class='icon-sitemap'></i>";
    } else {
      img_to_be_displayed = value;
    }
    return img_to_be_displayed;
  }

  function LocalityFormatter(row, cell, value, columnDef, dataContext) {
    return value ? "<i class='icon-home'></i>" : "";
  }
})(jQuery);