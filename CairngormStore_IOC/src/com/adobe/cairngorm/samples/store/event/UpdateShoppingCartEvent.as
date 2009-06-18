package com.adobe.cairngorm.samples.store.event
{
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	import flash.events.Event;

	public class UpdateShoppingCartEvent extends Event
	{	
		public static const ADD : String = "addProductToShoppingCart";
		public static const DELETE : String = "deleteProductFromShoppingCart";
			
		public var product : ProductVO;
		public var quantity : Number;	
		
		public function UpdateShoppingCartEvent( 	type : String, 
													bubbles : Boolean = true, 
													cancelable : Boolean = false )
		{
			super( type, bubbles, cancelable );
		}	
		
		override public function clone() : Event
		{
			return new UpdateShoppingCartEvent( type, bubbles, cancelable );
		}
	}
}