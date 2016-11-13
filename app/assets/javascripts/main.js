$(document).on('ready', function() {
  $('body').on('click', 'input.addFavorite', function(event) {
    var html = '<li>' + event.target.parentNode.childNodes[0].data + '<input type="button" value="Remove" class="removeFavorite"/></li>'
    $('.favorites-container ul').append(html)
  })

  $('body').on('click', 'input.removeFavorite', function(event) {
    // remove favorite from favorites-container
    console.log(event.target)
  })
})
