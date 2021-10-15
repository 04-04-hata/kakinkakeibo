function checkAnswer (radio) {
  var is_result_status = radio.value;
  var winning_count = document.getElementById('winning_count');
  var winning_count_one = document.getElementById('winning_count_one')
  var winning_count_two = document.getElementById('winning_count_two')
  var winning_count_three = document.getElementById('winning_count_three')
  var winning_count_four = document.getElementById('winning_count_four')
  var winning_count_five_tims_or_more = document.getElementById('winning_count_five_tims_or_more')
  if (is_result_status == "0"){
    winning_count_one.checked = false;
    winning_count_two.checked = false;
    winning_count_three.checked = false;
    winning_count_four.checked = false;
    winning_count_five_tims_or_more.checked = false;
    winning_count_one.disabled = true;
    winning_count_two.disabled = true;
    winning_count_three.disabled = true;
    winning_count_four.disabled = true;
    winning_count_five_tims_or_more.disabled = true;
    winning_count.style.color = "#999999";
  }else{
    winning_count_one.disabled = false;
    winning_count_two.disabled = false;
    winning_count_three.disabled = false;
    winning_count_four.disabled = false;
    winning_count_five_tims_or_more.disabled = false;
    winning_count.style.color = "#000000";
  }
}