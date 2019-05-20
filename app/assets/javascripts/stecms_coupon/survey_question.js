$(document).ready(function() {
  // handle collapse or call edit partial
  $(document).on("click", "a.edit-question", function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    var $ddItem = $(this).closest('.dd-item');
    var $editContainer = $ddItem.children(".dd-item-container").children(".edit-component-collapse");
    
    if ( $editContainer.length ){
      $editContainer.collapse("show");
    } else {
      $.get(url, function(res, status, xhr){});
    }

  });
})
