package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	
	public class DeleteProductFromShoppingCartAction
	{
		[Inject]
		public var shoppingCart : ShoppingCart;
		
		[MessageHandler(selector="deleteProductFromShoppingCart")]
		public function execute( event : UpdateShoppingCartEvent ) : void
		{
			shoppingCart.deleteElement( event.product );
		}

	}
}