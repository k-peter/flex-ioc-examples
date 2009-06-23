package com.adobe.cairngorm.samples.store.model.domain.shoppingcart
{
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	public interface IShoppingCart
	{
		function addElement( element : ProductVO, quantity : Number = 1 ) : void;
	}
}