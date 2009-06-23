package com.adobe.cairngorm.samples.store.model.domain.shoppingcart
{
	import com.adobe.cairngorm.samples.store.vo.ProductVO;

	public class ShoppingCartElement
	{
		
		public function ShoppingCartElement( element : ProductVO )
		{
			this.element = element;
		}
		
		public var element : ProductVO;
		public var quantity : Number;
		public var name : String;
		public var price : Number;
		public var totalProductPrice : Number;
	}

}