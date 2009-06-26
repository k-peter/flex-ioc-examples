package com.adobe.samplestore.model.domain.shoppingcart
{
	import com.adobe.samplestore.vo.ProductVO;
	
	public interface IShoppingCart
	{
		function addElement( element : ProductVO, quantity : Number = 1 ) : void;
	}
}