package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	
	public class AddProductToShoppingCartAction
	{
		[Inject]
		public var shoppingCart : ShoppingCart;
	
		[MessageHandler(selector="addProductToShoppingCart")]
		public function execute( event : UpdateShoppingCartEvent ): void
		{
			shoppingCart.addElement( event.product, event.quantity );
		}

	}
}