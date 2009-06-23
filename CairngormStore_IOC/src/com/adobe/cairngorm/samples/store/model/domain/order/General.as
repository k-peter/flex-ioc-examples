package com.adobe.cairngorm.samples.store.model.domain.order
{
	import com.adobe.cairngorm.samples.store.model.domain.validation.GeneralValidator;
	import com.adobe.cairngorm.samples.store.model.domain.validation.ValidationGroup;
	
	[Bindable]
	public class General
	{
		  public var name : String;
		  public var address:  String;
		  public var city : String;
		  public var state : String;
		  public var zip : String;
		  public var email : String;
		  
		  public var isValid : Boolean;
		  
	}
}