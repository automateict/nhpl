$(function () {
    $("input[name='applicant_service[status]']:radio").change(function () {
        var served = $(this).val();
        if(served=="Yes") {
            $("#services_display").show();
        }else {
            $("#services_display").hide();

        }
    })
});