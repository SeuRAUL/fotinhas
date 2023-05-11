$ ->
  $('#pics').imagesLoaded ->
    $('#pics').masonry
      itemSelector: '.box'
        isFitWidth: true