package org.swizframework.util
{
	
	import flash.utils.describeType;
	
	import mx.collections.ListCollectionView;
	import mx.events.CollectionEvent;
	import mx.rpc.AbstractService;
	
	import org.swizframework.Swiz;
	import org.swizframework.SwizBean;

	public class BeanLoader extends ListCollectionView
	{
		public function BeanLoader()
		{
			super();
			// addEventListener(CollectionEvent.COLLECTION_CHANGE, registerBeans);
		}
		
		public function registerBeans( e : CollectionEvent ) : void {
			trace( "load up these beans!");
			
			var swiz : Swiz = Swiz.getInstance();
			var collItems : Array = [ "list", "sort", "filterFunction" ];
			var xmlDescription : XML = describeType( this );
			var accessors : XMLList = xmlDescription.accessor.( @access == "readwrite" ).@name;
			
			
			var name : String;
			for ( var i : uint = 0; i<accessors.length(); i++ ) {
				name = accessors[ i ];
				if (collItems.indexOf(name) < 0) {
				// trace( "trying to add: "+name );
				// if (this[ name] is SwizBean || this[ name] is AbstractService)
					swiz.addBean( name, this[ name ] );
				}
			}
			
			// trace( ObjectUtil.toString(accessors) );
		}
		
	}
}