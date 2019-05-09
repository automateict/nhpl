$(function () {
    $("#user_role").change(function(){
        var role = $(this).val()
        $.ajax({
            url: '/admin/users/load_institutions',
            data: {role: role},
            success: function(response){
                $('#institution').html(response)
            }
        });
    })
})