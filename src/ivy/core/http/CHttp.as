package ivy.core.http
{
	
	import flash.events.Event;
	
	import ivy.core.view.IWait;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	/**
	 *
	 * @author holaivy@gmail.com
	 */
	public class CHttp extends HTTPService
	{
		public function CHttp(ui:IWait=null, rootURL:String=null, destination:String=null)
		{
			super(rootURL, destination);
			_waitui=ui;
		}

		public function get waitui():IWait
		{
			return _waitui;
		}

		public function set waitui(value:IWait):void
		{
			_waitui=value;
		}

		public function sendRequest(url:String, requestparams:Object, successfunc:Function, faultfunc:Function=null):void
		{
			if (tradition)
				request={AppInfo: requestparams};
			else
				request={data: requestparams};
			post(url, successfunc, faultfunc);
		}

		public function sendJson(url:String, requestparams:Object, successfunc:Function, faultfunc:Function=null):void
		{
			request={data: JSON.stringify(requestparams ? requestparams : {})};
			post(url, successfunc, faultfunc);
		}


		public function post(url:String, successfunc:Function, faultfunc:Function=null):void
		{
			super.url=url;
			super.method="POST";
			resultFormat=RESULT_FORMAT_TEXT;
			addEventListener(ResultEvent.RESULT, waitoff);
			addEventListener(ResultEvent.RESULT, successfunc);
			if (faultfunc != null)
				addEventListener(FaultEvent.FAULT, faultfunc);
			else
				addEventListener(FaultEvent.FAULT, outputErr);
			waiton();
			send();
		}

		public function sendMessage(url:String, cinfo:*, successfunc:Function, faultfunc:Function=null):void
		{
			tradition=true;
			sendRequest(url, JSON.stringify(cinfo == null ? {} : cinfo), successfunc, faultfunc);
		}


		public function outputErr(event:FaultEvent):void
		{
			Alert.show("发送请求出错:" + event.fault.faultString + "\n详细信息：" + event.fault.faultDetail , "错误" );
		}

		protected var tradition:Boolean;
		protected var _waitui:IWait;
		protected var waitstateon:Boolean;

		protected function waitoff(e:Event=null):void
		{
			if (waitui)
			{
				waitui.waitOff();
				waitui=null;
			}
			waitstateon=false;
		}

		protected function waiton():void
		{
			if (waitui && !waitstateon)
			{
				waitui.waitOn();
				waitstateon=true;
			}
		}


	}
}
