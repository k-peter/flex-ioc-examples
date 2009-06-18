package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.business.ProductDelegateStub;
	import com.adobe.cairngorm.samples.store.event.GetProductsEvent;
	import com.adobe.cairngorm.samples.store.model.Products;
	import com.adobe.cairngorm.samples.store.model.State;
	
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
		public var state : State;
		
		[Inject]
		public var productsHolder : Products;
		
		
	    [MessageHandler]
	    public function execute( event : GetProductsEvent ) : void 
	    {
	        if( productsHolder.products == null )
			{
			    var delegate : ProductDelegateStub = new ProductDelegateStub( this );
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
			state.workflowState = State.VIEWING_PRODUCTS_IN_THUMBNAILS;
		}
	
		public function fault( event : Object ) : void
		{
			var faultEvent : FaultEvent = FaultEvent( event );
			Alert.show( "Products could not be retrieved!" );
		}
	}
}