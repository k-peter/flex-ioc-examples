package com.adobe.samplestore.model.pm.productchooser
{
	import com.adobe.samplestore.event.NavigateEvent;
	import com.adobe.samplestore.model.domain.Products;
	import com.adobe.samplestore.model.pm.navigation.BaseShowable;
	import com.adobe.samplestore.vo.ProductVO;
	
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