package ivy.core.controls
{
	import flash.display.Sprite;

	import mx.controls.Alert;

	public class PAlert
	{
		public function PAlert()
		{
		}

		public static function e(msg:String, parent:Sprite=null):void
		{
			Alert.show(msg, "错误", Alert.NONMODAL, parent);
		}

		public static function w(msg:String, parent:Sprite=null):void
		{
			Alert.show(msg, "警告", Alert.NONMODAL, parent);

		}

		public static function i(msg:String, parent:Sprite=null):void
		{
			Alert.show(msg, "提示", Alert.NONMODAL, parent);
		}
	}
}
