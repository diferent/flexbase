package ivy.chart.core
{
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectUtil;

	/**
	 *
	 * @author holaivy@gmail.com
	 */
	public class SimpleChartData
	{
		public function SimpleChartData(obj:Object=null)
		{
			if (obj is SimpleChartData)
			{
				var ob:Object=ObjectUtil.getClassInfo(SimpleChartData);
				trace( ObjectUtil.toString(ob));

			}
			else if (obj)
			{
				for (var key:String in obj)
				{
					if (this.hasOwnProperty(key))
						this[key]=obj[key];
				}
			}
		}

		private var _data:ArrayCollection;

		private var _charttype:String=ChartType.ColumnChart;


		private var _xfield:String;

		private var _yfield:String;

		private var _horizontalAxisName:String;

		private var _displayName:String;


		public function get displayName():String
		{
			return _displayName;
		}

		public function set displayName(value:String):void
		{
			_displayName=value;
		}

		public function get yfield():String
		{
			return _yfield;
		}

		public function set yfield(value:String):void
		{
			_yfield=value;
		}

		public function get xfield():String
		{
			return _xfield;
		}

		public function set xfield(value:String):void
		{
			_xfield=value;
		}

		public function get horizontalAxisName():String
		{
			return _horizontalAxisName;
		}

		public function set horizontalAxisName(value:String):void
		{
			_horizontalAxisName=value;
		}

		public function get charttype():String
		{
			return _charttype;
		}

		public function set charttype(value:String):void
		{
			_charttype=value;
		}

		public function get data():ArrayCollection
		{
			return _data;
		}

		public function set data(value:ArrayCollection):void
		{
			_data=value;
		}

	}
}
