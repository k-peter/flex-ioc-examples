package com.adobe.login.control
{

	import com.adobe.login.control.handler.Handler;
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	[DefaultProperty("handlerArray")]
	public class SimpleController extends UIComponent
	{
		[ArrayElementType("com.adobe.login.control.handler.Handler")]
		public var handlerArray : Array;
		
		public function handleEvent( event : Event ) : void
		{
			getHandlerForEventType( event.type ).execute( event );
		}
		
		private function getHandlerForEventType( type : String ) : Handler
		{
			for( var i : int = 0; i < handlerArray.length ; i++ )
			{
				var handler : Handler = Handler( handlerArray[i] );
				if( type == handler.eventId )
				{
					return handler;
				}
			}
			throw new Error("can't find handler");
		}
	
	}
}