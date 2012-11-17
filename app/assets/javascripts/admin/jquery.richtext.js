(function ($) {
  var script_location = '/assets/tinymce/tiny_mce.js';

  var tiny_mce_attributes = {
    extended:{
      content_css:"/assets/tinymce.css",
      theme:"advanced",
      extended_valid_elements:"",
      plugins:"advimage,media,pagebreak,paste,inlinepopups,spellchecker",
      theme_advanced_toolbar_location:"top",
      theme_advanced_statusbar_location:"none",
      theme_advanced_buttons1:"image,media,|,bold,italic,underline,strikethrough,|,bullist,numlist,blockquote,|,justifyleft,justifycenter,justifyright,justifyfull,|,link,unlink,pagebreak,formatselect,fontsizeselect,forecolor,fontselect,|,pastetext,pasteword,|,code,spellchecker",
      theme_advanced_buttons2:"",
      theme_advanced_buttons3:"",
      theme_advanced_fonts:"Bree Serif=bree-serif, sans-serif",
      script_url:script_location,
      object_resizing:false,
      relative_urls:false,
      remove_script_host:true,
      document_base_url:""
    }
  };

  $.fn.richText = function () {
    this.tinymce(tiny_mce_attributes.extended);
  };

})(jQuery);
