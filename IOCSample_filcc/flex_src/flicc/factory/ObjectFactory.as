package flicc.factory
{
	
import flicc.config.IObjectDescriptor;
import flicc.config.IObjectDescriptorReference;
import flicc.config.IObjectFactoryConfig;
import flicc.config.IObjectPlaceHolder;
import flicc.config.dependency.IConstructorDependency;
import flicc.config.dependency.IDependency;
import flicc.config.event.IEventHandler;
import flicc.error.FliccError;
	
/**
 * Basic implementation of <code>IObjectFactory</code>
 * 
 * <p>
 * Rather than use this class directly in Flicc, you generally use the <code>
 * MxmlObjectFactory</code> sub-class that allows to you declare your factory
 * instance on an mxml document.
 * </p>
 * 
 * @see flicc.factory.mxml.MxmlObjectFactory  
 */ 
public class ObjectFactory implements IObjectFactory
{
	private var _config : IObjectFactoryConfig ;
	private var _singletonStore : SingletonStore;
	private var _instantiationStrategy : IInstantiationStrategy;
	
	/**
	 * @param config The factory configuration
	 */ 
	public function ObjectFactory( config : IObjectFactoryConfig )
	{
		this._singletonStore = new SingletonStore();
		this._instantiationStrategy = new TenArgLimitSwitchStatementInstantiation();
		
		this.config = config;
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function getInstance( id : String ) : *
	{
		var descriptor : IObjectDescriptor = config.getDescriptorForId( id );
		
		return instantiate( descriptor );
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function configure( object : Object, id : String ) : void
	{
		applyDependencies( config.getDescriptorForId( id ), object );
	}
	          
	private function instantiate( descriptor : IObjectDescriptor ) : *
	{
		if( descriptor.isSingleton && _singletonStore.hasSingletonFor( descriptor ) )
		{
			return _singletonStore.getSingletonFor( descriptor );
		}
		
		try
     	{
          	var currentInstance : * = _instantiationStrategy.instantiate( 
          									descriptor.clazz,  
          									createConstructorArguments( descriptor ) );
          			
			if( descriptor.isSingleton )
			{
				_singletonStore.storeSingleton( descriptor, currentInstance );
			}
				
			applyDependencies( descriptor, currentInstance );
         	applyEventHandlers( descriptor, currentInstance );
			
			if( currentInstance is IInitialisable )
         	{
            	IInitialisable( currentInstance ).initialised(); 
         	}
		
     	}
		catch( e : Error )
		{
			throw new FliccError( "Error while trying to instantiate class " 
									+ descriptor + ":" 
									+ e.message, e );
		}
		         
		return currentInstance;
	}
  
  	private function applyDependencies( descriptor : IObjectDescriptor, 
  			instance : Object ) : void {
  				  
		for each( var dependency : IDependency in descriptor.dependencies ) 
     	{           
       		dependency.apply( resolveValue( dependency.value ), instance  );
     	}
	}

  	private function applyEventHandlers( descriptor : IObjectDescriptor, 
  			instance : Object ) : void {
  				
     	for each( var handler : IEventHandler in descriptor.eventHandlers )
     	{
        	handler.apply( resolveValue( handler.source ), instance );   
		}
	}
  
  	private function createConstructorArguments( descriptor : IObjectDescriptor ) : Array
	{
		var constructorArgs : Array = [];

		for each( var constructorDep : IConstructorDependency in 
				descriptor.constructorArgs ) {
    	
       		var resolvedValue : * = resolveValue( constructorDep.value );
       
       		if( constructorDep.index > - 1 )
       		{
       			constructorArgs[ constructorDep.index ] = resolvedValue;		
       		}		
       		else
       		{
         		constructorArgs.push( resolvedValue );
       		} 
		}
    
    	return constructorArgs;
  	}
  
  	private function resolveValue( value : * ) : *
  	{
     	var resolvedValue : *;
     
     	if( value is IObjectDescriptorReference )
     	{
        	var valueAsReference : IObjectDescriptorReference = 
				IObjectDescriptorReference( value );

        	var descriptorToInject : IObjectDescriptor = 
				config.getDescriptorForId( valueAsReference.objectId );
           
        	resolvedValue = instantiate( descriptorToInject );
     	}
     	else if( value is IObjectDescriptor )
     	{                
        	var valueAsDescriptor : IObjectDescriptor = IObjectDescriptor( value );
           
        	resolvedValue = instantiate( valueAsDescriptor );
     	}
     	else
     	{        
        	resolvedValue = value;
		}
     
		return resolvedValue;
	}
	
	private function get config() : IObjectFactoryConfig 
	{
		return _config;
	}
	
	private function set config( value : IObjectFactoryConfig ) : void 
	{
		_config = value;
		
		for each( var descriptor : IObjectDescriptor in config.getAllDescriptors() )
		{
			if( descriptor is IObjectPlaceHolder )
			{
				_singletonStore.storeSingleton( descriptor, 
						IObjectPlaceHolder( descriptor ).object );
						
			}
			else if( config.preInstantiateSingletons && 
					 descriptor.isSingleton && 
					 !_singletonStore.hasSingletonFor( descriptor ) ) {
						
				instantiate( descriptor );		
			}
		}
	}

}

}

import flash.utils.Dictionary;
import flicc.config.IObjectDescriptor;
	
class SingletonStore
{
	private var singletons : Dictionary;
	
	public function SingletonStore()
	{
		singletons = new Dictionary();	
	}
	
	public function hasSingletonFor( descriptor : IObjectDescriptor ) : Boolean
	{
		return singletons[ descriptor.objectId ] != null;	
	}
	
	public function getSingletonFor( descriptor : IObjectDescriptor ) : Object
	{
		return singletons[ descriptor.objectId ];	
	}
	
	public function storeSingleton( desciptor : IObjectDescriptor, instance : Object ) : void
	{
		singletons[ desciptor.objectId ] = instance;
	}
}

interface IInstantiationStrategy
{
	function instantiate( clazz : Class, args : Array ) : Object;
}
	
class TenArgLimitSwitchStatementInstantiation implements IInstantiationStrategy
{
	public function instantiate( clazz : Class, args : Array ) : Object
	{
		var instance : Object;
      	
      	if( args == null || args.length == 0 )
      	{
      		instance = new clazz();	
      	}
      	
      	switch( args.length )
      	{
      		case 1:
      			instance = new clazz( args[ 0 ] );	
      		break;
      		
      		case 2:
      			instance = new clazz( args[ 0 ], args[ 1 ] );	
      		break;
      		
      		case 3:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ] );	
      		break;
      		
      		case 4:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ] );	
      		break;
      		
      		case 5:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ], args[ 4 ] );	
      		break;
      		
      		case 6:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ], args[ 4 ], args[ 5 ] );	
      		break;
      		
      		case 7:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ], args[ 4 ], args[ 5 ], args[ 6 ] );	
      		break;
      		
      		case 8:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ], args[ 4 ], args[ 5 ], args[ 6 ], args[ 7 ] );	
      		break;
      		
      		case 9:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ], args[ 4 ], args[ 5 ], args[ 6 ], args[ 7 ], args[ 8 ] );	
      		break;
      		
      		case 10:
      			instance = new clazz( args[ 0 ], args[ 1 ], args[ 2 ], args[ 3 ], args[ 4 ], args[ 5 ], args[ 6 ], args[ 7 ], args[ 8 ], args[ 9 ] );	
      		break;
      	}
		
		return instance;	
	}
	
}