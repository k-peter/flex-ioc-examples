package com.adobe.samplestore.model.pm.checkout
{
	import com.adobe.ac.validators.ValidatorGroup;
	import com.adobe.samplestore.model.domain.order.CustomerDetails;
	import com.adobe.samplestore.model.pm.navigation.BaseShowable;
	
	[Event(name="navigate", 
			type="com.adobe.ac.navigation.events.NavigateEvent")]
	public class GeneralInformationPM extends BaseShowable
	{
		//[Inject]
		public var validators : ValidatorGroup;
		
		[Inject]
		[Bindable]
		public var generalInfo : CustomerDetails;
		
		override public function get name() : String
		{
			return "GENERAL_INFORMATION";
		}

	}
}