package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.business.ProductDelegateStub;
	import com.adobe.cairngorm.samples.store.model.Products;
	import com.adobe.cairngorm.samples.store.model.State;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ICollectionView;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	
	public class GetProductsCommand extends EventDispatcher implements ICommand, IResponder
	{
		[Inject]
		public var state : State;
		[Inject]
		public var productsHolder : Products;
		
		public function GetProductsCommand() 
		{
			trace("looking for config");
			dispatchEvent( new Event('configureIOC', true) )
		}
		
		public function execute( event : CairngormEvent ): void
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
			
			// sort the data
			var sort :Sort = new Sort();
		   sort.fields = [ new SortField( "name", true ) ];
		   products.sort = sort;
		   products.refresh();
	   
	   	// set the products on the model
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