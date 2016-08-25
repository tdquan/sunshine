$(document).ready(function(){

var dps = $("#simulation-done-graph").data("points");
console.log(dps)
    var chart = new CanvasJS.Chart("simulation-done-graph",{
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
    chart.render();
});


