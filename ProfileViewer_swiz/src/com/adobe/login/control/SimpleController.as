package com.adobe.login.control
{

	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.handler.Handler;
	
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	[DefaultProperty("handlers")]
	public class SimpleController extends AbstractController
	{
		[ArrayElementType("com.adobe.login.control.handler.Handler")]
		public var handlerArray : Array;
		
		public function SimpleController() 
		{
			Swiz.addEventListener(LoginEvent.LOGIN_EVENT, handleEvent );
		}
		
		private function handleEvent( event : Event ) : void
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