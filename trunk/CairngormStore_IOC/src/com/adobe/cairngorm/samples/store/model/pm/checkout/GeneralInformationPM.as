package com.adobe.cairngorm.samples.store.model.pm.checkout
{
	import com.adobe.ac.navigation.event.NavigateEvent;
	import com.adobe.ac.validators.ValidatorGroup;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseShowable;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;
	
	[Event(name="navigate", 
			type="com.adobe.ac.navigation.events.NavigateEvent")]
	public class GeneralInformationPM extends BaseShowable
	{
		//[Inject]
		public var validators : ValidatorGroup;
		
		[Inject]
		[Bindable]
		public var generalInformationModel : GeneralInformationModel;
		
		override public function get canHide():Boolean
		{
			return false;
		}
		

	}
}