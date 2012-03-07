package ivy.core.http
{
	
	import mx.rpc.events.ResultEvent;

	/**
	 * New Message Struct
	 * @author holaivy@gmail.com
	 */
	public class RInfo
	{
		public function RInfo(param:*=null)
		{
			if (param is ResultEvent)
				decode(param)
			else if (param)
				body.data=param;

		}

		public function toString():String
		{
			return JSON.stringify(this);
		}

		public var header:HeaderInfo=new HeaderInfo;
		public var body:BodyInfo= new BodyInfo;

		public function decode(e:ResultEvent):void
		{
			try
			{
				var info:Object=JSON.parse(e.result as String);
				if (info)
				{
					header.infocode=info.header.infocode;
					header.infomessage=info.header.infomessage;
					body.data=info.body.data;
				}
			}
			catch (err:Error)
			{
				header.infocode=HeaderInfo.FAULT;
				header.infomessage=err.message;
				header.infomessage+=" |----| response result is : " + e.result;
			}
		}

		public function success():Boolean
		{
			return header.isSuccess();
		}

		public function put(key:String, value:Object):RInfo
		{
			return this;
		}

		public function fetch(key:String):Object
		{
			if (body.data)
			{
				return body.data[key];
			}
			else
				return null;
		}

		public function outputError():void
		{
			header.outputMessgae();
		}

		public function getDataObject():Object
		{
			return body.data;
		}

	}



}
import ivy.core.controls.PAlert;

class HeaderInfo
{
	public var infocode:int=UNINITIALIZED;
	public var infomessage:String;

	public static const SUCCESS:int=1;
	public static const FAULT:int=-1;
	public static const UNINITIALIZED:int=0;


	public function outputMessgae():void
	{
		switch (infocode)
		{
			case FAULT:
				PAlert.e(infomessage);
				break;
			case SUCCESS:
				PAlert.i(infomessage);
				break;
		}
	}


	public function isSuccess():Boolean
	{
		return infocode == SUCCESS;
	}
}

class BodyInfo
{
	public var data:Object={};
}
