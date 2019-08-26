$(function () {
    $("#exam_search_button").click(function(){
        var id_number = $("#exam_result_id_number").val();
        var first_name = $("#exam_result_first_name").val();
        $.ajax({
            url: '/exams/check_exam',
            data: {id_number: id_number, first_name: first_name},
            success: function(response){
                $('#exam_result').html(response)
            }
        });
    })
});