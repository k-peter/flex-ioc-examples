package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	
	public class AddProductToShoppingCartCommand implements ICommand
	{
		
		public var shoppingCart : ShoppingCart;
	
		public function execute( event : CairngormEvent ): void
		{
			var shoppingEvent : UpdateShoppingCartEvent =
				UpdateShoppingCartEvent( event );
			
			shoppingCart.addElement( shoppingEvent.product, shoppingEvent.quantity );
		}
		
	}

}