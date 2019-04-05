$(function () {
	$("#applicant_university_id").change(function(){
	var university = $(this).val();
    $.ajax({
        url: '/applicants/load_other_university',
        data: {university: university},
        success: function(response){
        	$('#other_university').html(response)
        }
    });
    })

    $("input[name='applicant[do_you_have_needs_for_disability]']").change(function(e){
        var need_for_disability = $(this).val()
        $.ajax({
            url: '/applicants/load_disability',
            data: {disability: need_for_disability},
            success: function(response){
                $('#disability').html(response)
            }
        });
    })

    $("#applicant_applicant_type").change(function(){
        var applicant_type = $(this).val();
        $.ajax({
            url: '/applicants/load_attachments',
            data: {applicant_type: applicant_type},
            success: function(response){
                $('#attachments').html(response)
            }
        });
    })

    });