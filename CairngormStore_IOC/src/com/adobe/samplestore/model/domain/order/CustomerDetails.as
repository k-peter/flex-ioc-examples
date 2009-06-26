package com.adobe.samplestore.model.domain.order
{
	
	[Bindable]
	public class CustomerDetails
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