package ivy.core.inter
{
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;

	public interface IX extends IDestory, IVisualElement
	{
		function onCreate():void;
		function onInit(event:FlexEvent=null):void;
		function onCreationCompleted(event:FlexEvent=null):void;
	}
}
