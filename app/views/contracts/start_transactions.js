// <<<<<<< HEAD
// $('#transactions').html("<%= j render 'transactions', transactions: @transactions %>")

// var i = 1;
// var transLength =  $('.transaction-line').length;
// var nextLine = $('.transaction-line').first();
// var daysRunning = 0;
// var lightingWeeks = 0;
// var treesSaved = 0;
// var cumulativeTransfer = 0;

// var dps = [];

// function runner () {

//     var chart = new CanvasJS.Chart("chartContainer",{
//       title :{
//         text: "Total Energy Transfer"
//       },
//       data: [{
//         type: "area",
//         dataPoints: dps
//       }],
//       axisX:{
//         viewportMinimum: 0,
//         viewportMaximum: 30,
//       },
//       axisY:{
//         viewportMinimum: 0,
//         viewportMaximum: 15,
//       }
//     });


//     var dataLength = 30; // number of dataPoints visible at any point

//     var updateChart = function (xVal, yVal) {

//         dps.push({
//           x: xVal,
//           y: yVal
//         });


//       console.log(dps)
//       chart.render();

//     };

//     // generates first set of dataPoints
//     updateChart(i, cumulativeTransfer);


//    setTimeout(function () {
//       console.log(nextLine);
//       nextLine.removeClass("hidden");
//       transferAmount = parseFloat(nextLine[0].getElementsByTagName("span")[0].textContent);
//       cumulativeTransfer += transferAmount;
//       i++;
//       updateChart(i, cumulativeTransfer);
//       nextLine = nextLine.next();
//       console.log(nextLine);
//       if (i < transLength) {
//          runner();
//       }

//       if (i % 5 == 0){
//         daysRunning += 1;
//         $("#days-running").text(daysRunning)
//       }

//       if (i % 2 == 0) {
//         lightingWeeks += 1;
//         $("#lighting-weeks").text(lightingWeeks)
//       }

//       if ( i % 4 == 0 ) {
//         treesSaved += 1;
//         $("#trees-saved").text(treesSaved)
//       }

//       $("#total-transfer").text((cumulativeTransfer).toFixed(2));



//    }, 1000)
// }

// runner();
$(document).ready(function(){
  $('#transactions').html("<%= j render 'transactions', transactions: @transactions %>")

  var i = 1;
  var transLength =  $('.transaction-line').length;
  var nextLine = $('.transaction-line').first();
  var container = $('.listed-transactions'),
      scrollTo = $('.transaction-line').last();
  var daysRunning = 0;
  var lightingWeeks = 0;
  var treesSaved = 0;

  function runner () {
     var chart = new CanvasJS.Chart("chartContainer",{
       title :{
         text: "Total Energy Transfer"
       },
       data: [{
         type: "area",
         dataPoints: dps
       }],
       axisX:{
         viewportMinimum: 0,
         viewportMaximum: 30,
       },
       axisY:{
         viewportMinimum: 0,
         viewportMaximum: 15,
       }
     });


     var dataLength = 30; // number of dataPoints visible at any point

     var updateChart = function (xVal, yVal) {

         dps.push({
           x: xVal,
           y: yVal
         });
       console.log(dps)
       chart.render();

     };

     // generates first set of dataPoints
     updateChart(i, cumulativeTransfer);

     setTimeout(function () {
        nextLine.fadeIn(300);
        transferAmount = parseFloat(nextLine[0].getElementsByTagName("span")[0].textContent);
        cumulativeTransfer += transferAmount;
        i++;
        updateChart(i, cumulativeTransfer);
        container.animate({
            scrollTop: container.offset().top - scrollTo.offset().top + container.scrollTop()
        });
        nextLine = nextLine.next();
        if (i < transLength) {
           runner();
        }

        if (i % 5 == 0){
          daysRunning += 1;
          $("#days-running").text(daysRunning)
        }

        if (i % 7 == 0) {
          lightingWeeks += 1;
          $("#lighting-weeks").text(lightingWeeks)
        }

        if ( i % 4 == 0 ) {
          treesSaved += 1;
          $("#trees-saved").text(treesSaved)
        }



     }, 1000)
  }

  runner();

})










