
package com.adobe.samplestore.model.domain.shoppingcart
{
	import com.adobe.samplestore.model.domain.IDeliverableItem;
	import com.adobe.samplestore.vo.ProductVO;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;
	
	[Bindable]
	public class ShoppingCart extends EventDispatcher implements IDeliverableItem, IShoppingCart
	{
		public var elements : ArrayCollection = new ArrayCollection();
	
		public var totalProductPrice : Number = 0;
		
		public var shippingCost : Number = 0;
		
		public function addElement( element : ProductVO, quantity : Number = 1 ) : void 
		{		
			if( quantity <= 0 ) 
			{
				quantity = 1;
			}
			
			for( var i : uint = 0; i < elements.length; i++ ) 
			{			
				var shoppingCartElement : ShoppingCartElement = elements[ i ];
				
				if( shoppingCartElement.element.id == element.id ) 
				{			
					shoppingCartElement.quantity += quantity;
					shoppingCartElement.totalProductPrice = shoppingCartElement.price * shoppingCartElement.quantity;
					totalProductPrice += shoppingCartElement.price * quantity;
					
					elements.dispatchEvent( new CollectionEvent( CollectionEvent.COLLECTION_CHANGE ) );
							
					return;
				}
			}
			
			addNewElementToCart( element, quantity );
		}
		
		public function deleteElement( element : ProductVO ) : Boolean
		{
			var deleted : Boolean = false;
			
			var i : int;
			for( i = 0; i < elements.length; i++ ) 
			{
				var shoppingCartElement : ShoppingCartElement = elements[ i ];
				if(shoppingCartElement.element.id === element.id) 
				{
					totalProductPrice -= shoppingCartElement.totalProductPrice;
					elements.removeItemAt( i );				
					deleted = true;
					break;
				}
			}		
			dispatchUpdate();
			return deleted;
		}
		
		public function getElements() : ArrayCollection
		{
			return elements;
		}
		
		private function addNewElementToCart( element : ProductVO, quantity : Number ):void
		{
			var shoppingCartElement : ShoppingCartElement = new ShoppingCartElement( element );
			shoppingCartElement.quantity = quantity;
			shoppingCartElement.name = element.name;
			shoppingCartElement.price = element.price;
			shoppingCartElement.totalProductPrice = element.price * quantity;
			elements.addItem( shoppingCartElement );
			totalProductPrice += shoppingCartElement.totalProductPrice;	
			dispatchUpdate();
		}				
		
		private function dispatchUpdate() : void
		{
			dispatchEvent( new Event( "cartChanged" ) );
		}
		
		[Bindable("cartChanged")]
		public function get cartEmpty() : Boolean
		{
			return getElements().length == 0;
		}
		
		public function get isValid() : Boolean
		{
			return !cartEmpty;
		}
		
	}

}