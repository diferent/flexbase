package ivy.chart.core
{

	/**
	 *
	 * @author holaivy@gmail.com
	 */
	public class ChartFactory
	{
		public function ChartFactory()
		{
		}

		public static function buildchart(data:SimpleChartData):IDataChart
		{
			var c:IDataChart;
			switch (data.charttype)
			{
				case ChartType.ColumnChart:
				{
					c=new SimpleColumnChart;
					c.dataset=data;
					break;
				}

				case ChartType.LineChart:
					c = new SimpleLineChart;
					c.dataset = data;
					break;
				case ChartType.PieChart:
					break;
				case ChartType.BarChart:
					break;
				case ChartType.AreaChart:
					break;
			}
			return c;
		}
	}
}
