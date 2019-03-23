$(function () {
	$("#applicant_university_id").change(function(){
	alert('hello')
	var university = $(this).val();
    $.ajax({
        url: '/applicants/load_other_university',
        data: {university: university},
        success: function(response){
        	$('#other_university').html(response)
        }
    });
    })
});