package ivy.chart.core
{
	
	import ivy.chart.renders.LineChartDataTip;
	import ivy.chart.series.EColumnSeries;
	
	import mx.charts.CategoryAxis;
	import mx.charts.ColumnChart;
	import mx.charts.chartClasses.Series;

	/**
	 *
	 * @author holaivy@gmail.com
	 */
	public class SimpleColumnChart extends ColumnChart implements IDataChart
	{
		public function SimpleColumnChart()
		{
			super();
			init();
		}

		private function init():void
		{
			showDataTips=true;
			setStyle("dataTipRenderer", Class(LineChartDataTip));
		}

		private var _dataset:SimpleChartData;


		public function get dataset():SimpleChartData
		{
			return _dataset;
		}

		public function set dataset(value:SimpleChartData):void
		{

			_dataset=value;
			if (value)
				fillChart();
		}

		public function fillChart():void
		{
			fillHorizontalAxis();
			fillSeries();
			filldata();
		}


		public function filldata():void
		{
			if (dataset.data)
				this.dataProvider=dataset.data;
		}

		public function fillHorizontalAxis():void
		{
			var cx:CategoryAxis=new CategoryAxis;
			cx.categoryField=dataset.horizontalAxisName;
			horizontalAxis=cx;
		}

		public function fillSeries():void
		{
			series=[];
			series.push(getSeries());
		}

		public function getSeries():Series
		{
			var cc:EColumnSeries=new EColumnSeries;
			cc.xField=dataset.xfield;
			cc.yField=dataset.yfield;
			cc.displayName=dataset.displayName;
			return cc;
		}

	}
}
