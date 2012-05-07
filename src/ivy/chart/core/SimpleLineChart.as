package ivy.chart.core
{
	
	import ivy.chart.series.ELineSeries;
	
	import mx.charts.chartClasses.Series;
	import mx.states.OverrideBase;

	public class SimpleLineChart extends SimpleColumnChart
	{
		public function SimpleLineChart()
		{
			super();
		}
		override public function getSeries():Series
		{
			var cc:ELineSeries = new ELineSeries;
			cc.xField=dataset.xfield;
			cc.yField=dataset.yfield;
			cc.displayName=dataset.displayName;
			return cc;
		}
	}
}