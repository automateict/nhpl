$(function () {
    $("#exam_search_button").click(function(){
        var id_number = $("#exam_result_id_number").val();
        var first_name = $("#exam_result_first_name").val();
        var father_name = $("#exam_result_father_name").val();
        $.ajax({
            url: '/applicants/check_exam',
            data: {id_number: id_number, first_name: first_name, father_name: father_name},
            success: function(response){
                $('#exam_result').html(response)
            }
        });
    })
});