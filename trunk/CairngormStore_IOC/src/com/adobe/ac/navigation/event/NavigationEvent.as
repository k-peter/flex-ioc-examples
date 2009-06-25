package com.adobe.ac.navigation.event
{
	import flash.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const MOVE_TO_NEXT : String = "moveToNext";
		
		public function NavigationEvent( type : String )
		{
			super( type );
		}

	}
}