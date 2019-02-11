$("#user_profile_pic").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
            alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            alert("not an image");
            break;
    }
});



