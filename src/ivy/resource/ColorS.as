package ivy.resource
{
	import ivy.core.inter.IDestory;

	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.RadialGradient;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;

	/**
	 *
	 * @author holaivy@gmail.com
	 */
	public class ColorS implements IDestory
	{
		public function ColorS(st:uint=radial)
		{
			style=st;
			initcolor();
		}

		public function initcolor():void
		{
			if ((style & onlylinechart) == onlylinechart)
			{
				buildlinechart();
			}
			else
			{
				var i:int=1;
				if (basiccolor.length >= 3 && basiccolor.length % 2 == 1)
					basiccolor.pop();
				var array:Array=basiccolor;
				for (; i < array.length; i=i + 2)
				{
					var e1:GradientEntry=new GradientEntry(array[i - 1], 0);
					var e2:GradientEntry=new GradientEntry(array[i], 1);
					sfill=[];
					if ((style & radial) == radial)
					{
						var r:RadialGradient=new RadialGradient;
						r.entries=[e1, e2];
						sfill.push(r);
					}
					else if ((style & line) == line)
					{
						var l:LinearGradient=new LinearGradient;
						l.rotation=90;
						l.entries=[e1, e2];
						sfill.push(l);
					}
				}

				//build stroker 
				array=basicstroke;
				for (i=0; i < array.length; i++)
				{
					var s:SolidColorStroke=new SolidColorStroke(uint(array[i]), 2, 0.8);
					stroke.push(s);
				}
				// with build linechart color
				if ((style & withlinechart) == withlinechart)
					buildlinechart();
			}
		}

		public function buildlinechart():void
		{
			lineSroke=new SolidColorStroke(basiclinestroke, 2);
			lineFill=new SolidColor(basiclinefill);
		}


		public static const radial:uint=0x1;
		public static const line:uint=0x2;

		public static const onlylinechart:uint=0x4;
		public static const withlinechart:uint=0x8;

		private var _style:uint=radial;

		public static var basiccolor:Array=[0x249ACD, 0x0B5A8E, 0xEF7651, 0x994C34, 0xCFCD3D, 0x959A1B, 0xE66440, 0x8E2900, 0x89BB86, 0x54874F, 0xCDAB88, 0xAC7F48, 0x44C0C8, 0x148280, 0x92AFD0, 0x3F6B9C, 0xD188D4, 0x9C3DA1, 0x9F5671, 0x782747, 0x68FDFB, 0x08D2D0, 0x38D24C, 0x1D8410, 0x6FB35F, 0x497B54, 0xA1AECF, 0x47447A, 0xBA9886, 0xAE775B];
		public static var basicstroke:Array=[0x7FE137, 0x249FDF, 0xB222E1, 0xD21E5A, 0xCCD71F, 0x0060BF, 0x59AB1D, 0x1C81B5, 0x931CBA, 0xA11845, 0xE1E1E1, 0xBF00BF, 0x0000CD, 0xB4EEB4];
		public static var basiclinestroke:uint=0x858585;
		public static var basiclinefill:uint=0x45B400;
		public static var customcolor:Array=[];
		public static var customstroke:Array=[];

		[Bindable]
		public var sfill:Array=[];
		[Bindable]
		public var stroke:Array=[];

		[Bindable]
		public var lineSroke:SolidColorStroke;

		[Bindable]
		public var lineFill:SolidColor;

		public function get randomColorArray():Array
		{
			var array:Array=[];
			var len:Number=sfill.length;
			var index:Number=int(Math.random() * len);
			for (var i:Number=index, ii:Number=0; ii < len; ii++)
			{
				i=i < len ? i : 0;
				array[ii]=sfill[i++];
			}
			return array;
		}

		[Bindable]
		public function set randomColorArray(value:Array):void
		{
			sfill.splice(0, sfill.length);
			stroke.splice(0, stroke.length);
			lineSroke=null;
			lineFill=null;
		}

		public function get style():uint
		{
			return _style;
		}

		public function set style(value:uint):void
		{
			if (value != _style)
			{
				_style=value;
				initcolor();
			}

		}

		public function destroy(param:*=null):Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}



		{

		}


	}
}
