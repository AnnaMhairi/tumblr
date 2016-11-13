$(document).on('ready', function() {
  $('body').on('click', 'input.add-favorite', function(event) {
    var $favorites = $('.favorites-container ul')
    var $selectedElement = $(event.target.parentElement)
    var $selectedInput = $(event.currentTarget)
    var postInfo = $selectedElement.children('.post-info')[0].innerHTML
    var id = $selectedElement.data('id')
    var removeButton = '<input type="button" value="Remove" class="remove-favorite"/>'

    if($favorites.find($("li[data-id=" + id + "]")).length == 0) {
      var html = '<li data-id="' + id + '"><span class="favorite-info">' + postInfo + '</span>' + removeButton + '</li>'
      $favorites.append(html)
      $selectedInput.prop('disabled', true);
    }
  })

  $('body').on('click', 'input.remove-favorite', function(event) {
    var $search = $('.search-results-container ul')
    var $selectedElement = $(event.target.parentElement)
    var id = $selectedElement.data('id')
    var $searchResultInput = $search.find($('li[data-id='+ id +']')).children('.add-favorite')

    $selectedElement.remove()
    $searchResultInput.prop('disabled', false);
  })
})

