$(document).ready(function() {

  $('form#sign_in').bind('ajax:success', function(e, data, status, xhr) {    
    console.log(data);
    if(data.success) {        
        $('#user_login_box').html(data.content);
    } else {
       //$('#login-div').html(data.errors.join('<br />'));        
        $('#user_login_box').prepend(data.errors.join('<br />'));
    }
  });

});