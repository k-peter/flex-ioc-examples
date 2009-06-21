package com.adobe.ac.navigation.event
{
	import flash.events.Event;
	
	public class NavigateEvent extends Event
	{
		public static const NAVIGATE : String = "navigate";
		public static const MOVE_TO_NEXT : String = "moveToNext";
		public static const MOVE_TO_PREVIOUS  : String = "moveToPrevious";
		
		public function NavigateEvent( type : String )
		{
			super( type );
		}

	}
}