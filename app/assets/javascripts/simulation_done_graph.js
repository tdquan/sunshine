$(document).ready(function(){

var dps = $("#simulation-done-graph").data("points");
console.log(dps)
    var chart = new CanvasJS.Chart("simulation-done-graph",{
      title :{
        text: "Total Energy Transfer",
        fontColor: "#F5A623",
      },
      data: [{
        type: "area",
        dataPoints: dps,
        color: "#F5A623",
        fillOpacity: .3,
      }],
      axisX:{
        viewportMinimum: 0,
        viewportMaximum: 30,
      },
      axisY:{
        viewportMinimum: 0,
        viewportMaximum: 15,
      },
       backgroundColor: ""
    });
    chart.render();
});


