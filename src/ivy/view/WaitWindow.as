package ivy.view
{
	import ivy.core.inter.IX;
	import ivy.core.view.IWait;
	
	import mx.controls.SWFLoader;
	import mx.events.FlexEvent;
	
	import spark.components.BorderContainer;
	import spark.components.Label;

	/**
	 *
	 * @author xubch
	 */
	public class WaitWindow extends BorderContainer implements IX , IWait
	{
		[Embed(source="../assets/sys/loading/loading.swf")]
		public static var loading:Class;
		[Embed(source="../assets/sys/loading/1.swf")]
		public static var l1:Class;
		[Embed(source="../assets/sys/loading/2.swf")]
		public static var l2:Class;
		[Embed(source="../assets/sys/loading/3.swf")]
		public static var l3:Class;
		[Embed(source="../assets/sys/loading/4.swf")]
		public static var l4:Class;
		[Embed(source="../assets/sys/loading/5.swf")]
		public static var l5:Class;
		[Embed(source="../assets/sys/loading/6.swf")]
		public static var l6:Class;
		[Embed(source="../assets/sys/loading/7.swf")]
		public static var l7:Class;
		[Embed(source="../assets/sys/loading/8.swf")]
		public static var l8:Class;
		[Embed(source="../assets/sys/loading/9.swf")]
		public static var l9:Class;
		[Embed(source="../assets/sys/loading/10.swf")]
		public static var l10:Class;
		[Embed(source="../assets/sys/loading/11.swf")]
		public static var l11:Class;
		[Embed(source="../assets/sys/loading/12.swf")]
		public static var l12:Class;
		[Embed(source="../assets/sys/loading/13.swf")]
		public static var l13:Class;
		[Embed(source="../assets/sys/loading/14.swf")]
		public static var l14:Class;
		[Embed(source="../assets/sys/loading/15.swf")]
		public static var l15:Class;
		[Embed(source="../assets/sys/loading/16.swf")]
		public static var l16:Class;
		[Embed(source="../assets/sys/loading/17.swf")]
		public static var l17:Class;
		[Embed(source="../assets/sys/loading/18.swf")]
		public static var l18:Class;

		public function WaitWindow(index:Number=-1)
		{
			super();
			loadindex=index;
			onCreate();
			addEventListener(FlexEvent.INITIALIZE, onInit);
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationCompleted);

		}

		protected function getSwfSource():void
		{
			if (loadindex >= 0)
			{
				swf.source=loadarray[loadindex];
			}
			else
			{
				//random
				var i:int=int(Math.floor(Math.random() * loadarray.length));
				swf.source = loadarray[i];
			}
		}

		public var effect:Boolean=false;
		public var alphaBase:Number=0.8;
		private var swf:SWFLoader=new SWFLoader;
		private var loadindex:Number=-1;

		public function show(b:Boolean=true):void
		{
			if (effect || b)
			{

			}
			else
			{
				this.alpha=alphaBase;
				visible=true;
			}
		}

		public function hide(b:Boolean=true):void
		{
			if (effect || b)
			{

			}
			else
				visible=false;
		}

		public static var loadarray:Array=[];
		
		public function destroy(param:*=null):Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
		public function waitOff():void
		{
			hide(false);
			
		}
		
		public function waitOn():void
		{
			show(false);
			
		}
		
		public function onCreate():void
		{
			
			
		}
		
		public function onCreationCompleted(event:FlexEvent=null):void
		{
			percentHeight=100;
			percentWidth=100;
			alpha=alphaBase;
			visible=false;
			depth=201;
			setStyle("cornerRadius", 15);
			setStyle('backgroundColor', 0x464646);
			
		}
		
		public function onInit(event:FlexEvent=null):void
		{
			getSwfSource();
			swf.horizontalCenter=swf.verticalCenter=0;
			swf.width=swf.height=70;
			addElement(swf);
			
		}
		
		{
			loadarray=[loading, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18];
		}
		
	}
}
