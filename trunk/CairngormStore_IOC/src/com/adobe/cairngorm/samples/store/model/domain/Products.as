package com.adobe.cairngorm.samples.store.model.domain
{
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	import mx.collections.ICollectionView;
	
	[Bindable]
	public class Products
	{
		public var selectedItem : ProductVO;
		public var products : ICollectionView;
	}
}