package com.adobe.cairngorm.samples.store.model.pm.checkout
{
	import com.adobe.ac.validators.ValidatorGroup;
	import com.adobe.cairngorm.samples.store.model.domain.order.General;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseShowable;
	
	[Event(name="navigate", 
			type="com.adobe.ac.navigation.events.NavigateEvent")]
	public class GeneralInformationPM extends BaseShowable
	{
		//[Inject]
		public var validators : ValidatorGroup;
		
		[Inject]
		[Bindable]
		public var generalInfo : General;
		
		override public function get name() : String
		{
			return "GENERAL_INFORMATION";
		}

	}
}