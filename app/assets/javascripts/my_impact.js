$(document).ready(function(){
  if ($("#my-impact-simulations")[0]) {
    var numberSimulations = parseFloat($("#my-impact-simulations")[0].textContent);
    if (numberSimulations > 0){
     var days = 30;
    }
    var lighting = numberSimulations * 10;
    var trees = (0.6 * numberSimulations).toFixed(2);

    $("#my-impact-days").text(days);
    $("#my-impact-lightning").text(lighting);
    $("#my-impact-trees").text(trees);
  }
})

