package ivy.chart.renders
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.text.TextField;

	import mx.charts.chartClasses.DataTip;

	public class LineChartDataTip extends DataTip
	{
		// The title is renderered in a TextField.
		private var myText:TextField;

		public function LineChartDataTip()
		{
			super();
		}

		override protected function createChildren():void
		{
			super.createChildren();
			myText=new TextField();
		}

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);

			// The data property provides access to the data tip's text.
			if (data.hasOwnProperty('text'))
			{
				myText.text=data.text;
			}
			else
			{
				myText.text=data.toString();
			}

			this.setStyle("textAlign", "center");
			var g:Graphics=graphics;
			g.clear();
			var m:Matrix=new Matrix();
			m.createGradientBox(w + 100, h, 0, 0, 0);
			// 线性填充背景
			g.beginGradientFill(GradientType.LINEAR, [config.bgcolor1, config.bgcolor2], [config.bgalphas1, config.bgalphas2], [config.bgrotio1, config.bgrotio2], m, null, null, 0);
			g.drawRect(-50, 0, w + 100, h);
			g.endFill();
		}

		public static var config:Object={};
		{
			config.bgcolor1=0xFF0000;
			config.bgcolor2=0xFFFFFF;
			config.bgalphas1=0.1;
			config.bgalphas2=1;
			config.bgrotio1=0;
			config.bgrotio2=255;
		}
	}
}
