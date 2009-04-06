package com.adobe.login.control
{

	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.handler.Handler;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	[DefaultProperty("handlers")]
	public class SimpleController extends UIComponent
	{
		[ArrayElementType("com.adobe.login.control.handler.Handler")]
		public var handlers : Array;
		
		public function SimpleController()
		{
			addEventListener( FlexEvent.INITIALIZE, handleInitialize );
		}
				
		private function handleInitialize( event : FlexEvent ) : void
		{
			for( var i : int = 0 ; i < handlers.length ; i++ )
			{
				var handler : Handler = Handler( handlers[i] );
				parent.addEventListener( handler.eventId, handler.execute );
			}
		}
	}
}