package com.adobe.login.control.handler
{
	import org.spicefactory.parsley.mvc.ApplicationEvent;
	
	public interface Handler
	{
		function get eventId() : String;
		function execute( event : ApplicationEvent ) : void;
	}
}