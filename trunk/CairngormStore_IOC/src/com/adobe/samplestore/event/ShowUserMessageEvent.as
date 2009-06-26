package com.adobe.samplestore.event
{
	import flash.events.Event;
	
	public class ShowUserMessageEvent extends Event
	{
		public static const SHOW_USER_MESSAGE : String = "showUserMessage";
		
		public var title : String;
		public var message : String;
		
		public function ShowUserMessageEvent( title : String , message : String )
		{
			super( SHOW_USER_MESSAGE );
			this.title = title;
			this.message = message;
		}

	}
}