package com.adobe.samplestore.model.domain
{
	import com.adobe.samplestore.vo.ProductVO;
	
	import mx.collections.ICollectionView;
	
	[Bindable]
	public class Products
	{
		public var selectedItem : ProductVO;
		public var products : ICollectionView;
	}
}