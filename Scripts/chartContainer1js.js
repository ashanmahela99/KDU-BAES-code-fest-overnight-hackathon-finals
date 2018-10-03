window.onload = function () {

	var dataPoints1 = [];
	var dataPoints2 = [];

	var chart1 = new CanvasJS.Chart("chartContainer1", {
		zoomEnabled: true,
		title: {

			text: "Step 1 Completion/Error Rate"
		},
		axisX: {
			title: "chart updates every 1 secs"
		},
		axisY: {
			prefix: "P/Sec",
			includeZero: false
		},
		toolTip: {
			shared: true
		},
		legend: {
			cursor: "pointer",
			verticalAlign: "top",
			fontSize: 22,
			fontColor: "dimGrey",
			itemclick: toggleDataSeries
		},
		data: [{
			type: "line",
			xValueType: "dateTime",
			yValueFormatString: "P/Sec:####.00",
			xValueFormatString: ":ss TT",
			showInLegend: true,
			name: "Completion Rate",
			dataPoints: dataPoints1
		},
		{
			type: "line",
			xValueType: "dateTime",
			yValueFormatString: "P/Sec:####.00",
			showInLegend: true,
			name: "Error Rate",
			dataPoints: dataPoints2
		}]
	});

	function toggleDataSeries(e) {
		if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		}
		else {
			e.dataSeries.visible = true;
		}
		chart1.render();
	}

	var updateInterval = 300;
	// initial value
	var yValue1 = 0;
	var yValue2 = 0;

	var time = new Date;
	// starting at 9.30 am
	time.setHours(0);
	time.setMinutes(00);
	time.setSeconds(00);
	time.setMilliseconds(00);

	function updateChart(count) {
		count = count || 1;
		var deltaY1, deltaY2;
		for (var i = 0; i < count; i++) {
			time.setTime(time.getTime() + updateInterval);
			deltaY1 = .1 + Math.random() * (-.1 - .1);
			deltaY2 = .1 + Math.random() * (-.1 - .1);

			// adding random value and rounding it to two digits. 
			yValue1 = Math.round((yValue1 + deltaY1) * 100) / 100;
			yValue2 = Math.round((yValue2 + deltaY2) * 100) / 100;

			// pushing the new values
			dataPoints1.push({
				x: time.getTime(),
				y: yValue1
			});
			dataPoints2.push({
				x: time.getTime(),
				y: yValue2
			});
		}

		// updating legend text with  updated with y Value 
		chart1.options.data[0].legendText = " Completion Rate/sec  " + yValue1;
		chart1.options.data[1].legendText = " Error Rate/sec  " + yValue2;
		chart1.render();
	}
	// generates first set of dataPoints 
	updateChart(100);
	setInterval(function () { updateChart() }, updateInterval);

}