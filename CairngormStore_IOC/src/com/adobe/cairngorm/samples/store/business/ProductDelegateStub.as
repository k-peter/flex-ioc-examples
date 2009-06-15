package com.adobe.cairngorm.samples.store.business
{
	import com.adobe.cairngorm.samples.store.business.stub.ProductFactory;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ProductDelegateStub
	{
		private var responder : IResponder;

		public function ProductDelegateStub( responder : IResponder )
		{
			this.responder = responder;
		}
		
		public function getProducts() : void
		{			
			responder.result( 
					new ResultEvent( 
						ResultEvent.RESULT, 
						false, 
						true, 
						ProductFactory.createProducts()
						) 
					);
		}
	}
}