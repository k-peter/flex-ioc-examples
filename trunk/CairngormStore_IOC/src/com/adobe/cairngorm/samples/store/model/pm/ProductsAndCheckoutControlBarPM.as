package com.adobe.cairngorm.samples.store.model.pm
{
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.NavigateEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.model.domain.order.Order;
	import com.adobe.cairngorm.samples.store.view.assets.CairngormStoreAssets;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	[Event(name="validateCreditCard",type="com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent")]
	[Event(name="incompleteForm",type="com.adobe.cairngorm.samples.store.event.CheckoutEvent")]
	[Event(name="productsGrid",type="com.adobe.cairngorm.samples.store.event.NavigateEvent")]
	[Event(name="productsList",type="com.adobe.cairngorm.samples.store.event.NavigateEvent")]
	[ManagedEvents("validateCreditCard,incompleteForm,productsGrid,productsList")]
	public class ProductsAndCheckoutControlBarPM extends EventDispatcher
	{
		private static const GRID_INDEX : int = 0;
		private static const LIST_INDEX : int = 1;
		private static const CHECKOUT_INDEX : int = 2;
		
		[Bindable]
		public var selectedIndex : int;
		
		[Bindable] 
		public var assets : CairngormStoreAssets = new CairngormStoreAssets();	
		
		[Inject]
		public var order : Order;
		
		
		[MessageHandler]
		public function handleNavigate( event : NavigateEvent ) : void
		{
			if( event.type == NavigateEvent.CHECKOUT )
			{
				selectedIndex = CHECKOUT_INDEX;
			}
			if( event.type == NavigateEvent.PRODUCTS_GRID )
			{
				selectedIndex = GRID_INDEX;
			}
			if( event.type == NavigateEvent.PRODUCTS_LIST )
			{
				selectedIndex = LIST_INDEX;
			}
			dispatchEvent( new Event( "navigationUpdated" ) );
		}
		
		[Bindable("navigationUpdated")]		
		public function getProductThumbnailsButton() : Class
		{
			return selectedIndex == GRID_INDEX ? assets.thumbOn : assets.thumbOff;
		}
		
		public function getProductThumbnailsButtonMouseOut() : Class
		{
			return selectedIndex == GRID_INDEX ? assets.thumbOn : assets.thumbOff;
		}
		
		[Bindable("navigationUpdated")]		
		public function getProductListButton() : Class
		{
			return selectedIndex == LIST_INDEX ? assets.listOn: assets.listOff;
		}
		
		public function showProductThumbnails():void
		{
			dispatchEvent( new NavigateEvent( NavigateEvent.PRODUCTS_GRID ) );
		}	
		
		public function showProductGrid() : void
		{
			dispatchEvent( new NavigateEvent( NavigateEvent.PRODUCTS_LIST ) );
		}		
		
		public function startCheckout() : void
		{
			if( order.isValid )
			{
				dispatchEvent( new ValidateCreditCardEvent() );
			}
			else
			{
				dispatchEvent( CheckoutEvent.newIncompleteFormEvent() );
			}
		}
	}
}