package ivy.core.http
{
	
	import ivy.core.controls.PAlert;
	
	import mx.rpc.events.ResultEvent;

	/**
	 *
	 * @author holaivy@gmail.com
	 */
	public class JInfo
	{
		public function JInfo(d:Object=null)
		{
			if (d is ResultEvent)
				pareseResult(d as ResultEvent);
			else if (d)
				data=d;
		}

		private var _data:Object;
		private var _infocode:int=0;
		private var _infomessage:String;

		public static const SUCCESSSTATE:int=1;
		public static const FAULTSTATE:int=-1;

		public function get infomessage():String
		{
			return _infomessage;
		}

		public function set infomessage(value:String):void
		{
			_infomessage=value;
		}

		public function get infocode():int
		{
			return _infocode;
		}

		public function set infocode(value:int):void
		{
			_infocode=value;
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data=value;
		}

		protected function pareseResult(e:ResultEvent):void
		{
			try
			{
				var info:Object=JSON.parse(e.result as String);
				if (info)
				{
					for (var key:Object in info)
						if (this.hasOwnProperty(key))
							this[key]=info[key];
				}
			}
			catch (err:Error)
			{
				infocode=FAULTSTATE;
				infomessage=err.message + " |----| response result is : " + e.result;
			}
		}

		public function toString():String
		{
			return JSON.stringify(this);
		}

		public function fine():Boolean
		{
			return infocode == SUCCESSSTATE;
		}

		public function fetchData():Object
		{
			return data;
		}

		public function pushData(obj:Object):Object
		{
			return data=obj;
		}

		public function put(key:String, obj:Object):Object
		{
			if (!data)
				data={};
			data[key]=obj;
			return data;
		}

		public function fetch(key:Object):Object
		{
			if (data)
				return data[key];
			return null;
		}


		public function outputErr():String
		{
			switch (infocode)
			{
				case SUCCESSSTATE:
					PAlert.i(infomessage);
					break;
				case FAULTSTATE:
					PAlert.e(infomessage);
					break;
				default:
					PAlert.w(infomessage);
			}
			return infomessage;
		}
	}
}
