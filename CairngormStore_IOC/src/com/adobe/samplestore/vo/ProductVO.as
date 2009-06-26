package com.adobe.samplestore.vo
{
	import com.adobe.samplestore.util.Comparable;
		 
	public class ProductVO implements Comparable 
	{
		public function get identifier() : String
		{
			return String( id );
		}
	
		public function toString() : String
		{
		    var s : String = "ProductVO[id=";
		    s += id;
		    s += ", name=";
		    s += name;
		    s += ", description=";
		    s += description;
		    s += ", price=";
		    s += price;
		    s += ", image=";
		    s += image;
		    s += ",thumbnail=";
		    s += thumbnail;
		    s += " ]";
		    return s;
		}
	
		[Bindable]
		public var id : Number;
			
		[Bindable]
		public var name : String;
			
		[Bindable]
		public var description : String;
		
		[Bindable]
		public var price : Number; 
		
		[Bindable]
		public var image : String;
		
		[Bindable]
		public var thumbnail : String;
	}

}