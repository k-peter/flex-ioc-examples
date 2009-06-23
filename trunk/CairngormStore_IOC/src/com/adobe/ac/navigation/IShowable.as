package com.adobe.ac.navigation
{
	import flash.events.IEventDispatcher;
	
	public interface IShowable extends IEventDispatcher
	{
		function get canShow() : Boolean;
		function get canHide() : Boolean;
		function get name() : String;
	}
}