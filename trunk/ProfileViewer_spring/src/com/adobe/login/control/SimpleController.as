package com.adobe.login.control
{

	import com.adobe.login.control.handler.Handler;
	import com.adobe.util.logging.LogUtil;
	
	import flash.events.EventDispatcher;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	[DefaultProperty("handlers")]
	public class SimpleController extends UIComponent
	{
		[ArrayElementType("com.adobe.login.control.handler.Handler")]
		public var handlers : Array;
		
		[ArrayElementType("flash.events.EventDispatcher")]
		public var dispatchers : Array;
		
		public function init() : void
		{
			LogUtil.getLogger( this ).info( "init.." );
			bindListeners();
		}	
		
		private function bindListeners() : void
		{
			for( var z : int = 0 ; z < dispatchers.length; z++ )
			{
				var dispatcher : EventDispatcher = dispatchers[z];
				addHandlers( dispatcher );
			}
		}
		
		private function addHandlers( dispatcher : EventDispatcher ) : void
		{
			for( var i : int = 0 ; i < handlers.length ; i++ )
			{
				var handler : Handler = Handler( handlers[i] );
				dispatcher.addEventListener( handler.eventId, handler.execute );
			}
		}
		
	}
}