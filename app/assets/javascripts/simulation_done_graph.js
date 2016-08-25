$(document).ready()

var dps = [];

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



