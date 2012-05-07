package ivy.chart.core
{

	
	import ivy.chart.renders.LineChartDataTip;
	
	import mx.charts.PieChart;

	public class SimplePieChart extends PieChart implements IDataChart
	{
		public function SimplePieChart()
		{
			super();
			init();
		}
		private var _dataset:SimpleChartData;

		protected function init():void
		{
			showDataTips=true;
			setStyle("dataTipRenderer", Class(LineChartDataTip));
		}

		public function get dataset():SimpleChartData
		{
			return _dataset;
		}

		public function set dataset(value:SimpleChartData):void
		{
			this._dataset=value;
			if (value)
				fillchart();
		}

		protected function fillchart():void
		{

		}
	}
}
