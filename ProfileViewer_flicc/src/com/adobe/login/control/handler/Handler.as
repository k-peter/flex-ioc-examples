package com.adobe.login.control.handler
{
	import flash.events.Event;
	
	public interface Handler
	{
		function get eventId() : String;
		function execute( event : Event ) : void;
	}
}