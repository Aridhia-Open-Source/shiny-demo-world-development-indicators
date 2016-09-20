google.load("visualization", "1", {packages:["motionchart"]});

function drawChart(Idvar, Timevar, Xvar, Yvar, Colorvar, Sizevar){

        var data = new google.visualization.DataTable();

		data.addColumn('string', 'idvar');
		data.addColumn('number', 'timevar');
		data.addColumn('number', 'xvar');
		data.addColumn('number', 'yvar');
		data.addColumn('string', 'Region');
		data.addColumn('number', 'Population');

        for (i = 0; i < Idvar.length; i++) { 
          data.addRows([
		    [Idvar[i], Timevar[i], Xvar[i], Yvar[i], Colorvar[i], Sizevar[i]]
		  ]);
        };
      
        var options = {
		  width: 1100, height: 600,
		  showChartButtons: false,
		  showHeader: false,
		  showXMetricPicker: false,
		  showYMetricPicker: false,
          showAdvancedPanel: false
        };

        var chart = new google.visualization.MotionChart(document.getElementById('chart_div'));

        chart.draw(data, options);
}