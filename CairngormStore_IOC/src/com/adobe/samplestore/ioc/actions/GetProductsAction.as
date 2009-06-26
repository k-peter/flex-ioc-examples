package com.adobe.samplestore.ioc.actions
{
	import com.adobe.samplestore.business.IProductDelegate;
	import com.adobe.samplestore.event.GetProductsEvent;
	import com.adobe.samplestore.event.NavigateEvent;
	import com.adobe.samplestore.model.domain.Products;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ICollectionView;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	
	public class GetProductsAction extends EventDispatcher implements IResponder
	{
		[Inject]
		public var productsHolder : Products;
		
		[Inject]
		public var delegate : IProductDelegate;
		
		 [MessageHandler]
		 public function execute( event : GetProductsEvent ) : void 
		 {
			  if( productsHolder.products == null )
			{
				 delegate.addResponder( this );
				 delegate.getProducts();
			}
			else
			{
				Alert.show( "Products already retrieved!" );
				return;
			}
		 }
		 
		public function result( event : Object ) : void
		{				
			var products : ICollectionView = ICollectionView( event.result );
			
			var sort :Sort = new Sort();
			sort.fields = [ new SortField( "name", true ) ];
			products.sort = sort;
			products.refresh();
		
			productsHolder.selectedItem = products[ 0 ];
			productsHolder.products = products;
			dispatchEvent( new NavigateEvent( NavigateEvent.CHECKOUT ) );
		}
	
		public function fault( event : Object ) : void
		{
			var faultEvent : FaultEvent = FaultEvent( event );
			Alert.show( "Products could not be retrieved!" );
		}
	}
}