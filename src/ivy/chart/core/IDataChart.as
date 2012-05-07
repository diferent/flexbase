package ivy.chart.core
{
	import mx.core.IVisualElement;

	public interface IDataChart extends IVisualElement
	{
		function get dataset():SimpleChartData;

		function set dataset(value:SimpleChartData):void;
	}
}
