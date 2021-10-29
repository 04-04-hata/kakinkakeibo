function buttonClick(){
  var gacha_kakeibo_is_result_status_false = document.getElementById("gacha_kakeibo_is_result_status_false");
  var winning_count = document.getElementById("winning_count");
  var gacha_kakeibo_winning_count = document.getElementById("gacha_kakeibo_winning_count");
  if(gacha_kakeibo_is_result_status_false.checked){
    winning_count.style.display = "none";
    gacha_kakeibo_winning_count.value = "";
  }else{
    winning_count.style.display = "";
  }

}