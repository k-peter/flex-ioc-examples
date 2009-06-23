package com.adobe.cairngorm.samples.store.model.pm.productchooser
{
	import com.adobe.cairngorm.samples.store.event.NavigateEvent;
	import com.adobe.cairngorm.samples.store.model.domain.Products;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseShowable;
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	import mx.formatters.CurrencyFormatter;
	
	public class TextualProductListPM extends BaseShowable
	{
		[Inject]
		[Bindable]
		public var productsHolder : Products;
		
		[Inject]
		public var currencyFormatter : CurrencyFormatter;
		
		public function format( item : ProductVO ) : String
		{
			return currencyFormatter.format( item.price );
		}
		
		override public function get name() : String
		{
			return NavigateEvent.PRODUCTS_LIST;
		}
				
	}
}