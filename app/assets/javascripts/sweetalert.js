$(document).ready(function() {
  $('.who').click(function() {
    Swal.fire(
      'Good job!',
      'You clicked the button!',
      'success'
    )
  })
});

$( document ).on('turbolinks:load', function() {
  $('body').on('click', '.del', function() {
    let link = $(this)
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        $.ajax({
        url : link.attr('href'),
        type: 'DELETE'
        })
      }
    })
    return false;
  })
})
