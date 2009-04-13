package com.adobe.dashboard.presentationModel
{
	import com.adobe.dashboard.domain.ModelLocator;
	
	import mx.binding.utils.BindingUtils;
	
	[Bindable]
	public class SummaryPM
	{
		public var numberOfFriends : int;
		
		public function SummaryPM()
		{
			BindingUtils.bindProperty( this, "numberOfFriends", ModelLocator.getInstance(), ["friends", "friendsList", "length"] );
		}
	}
}