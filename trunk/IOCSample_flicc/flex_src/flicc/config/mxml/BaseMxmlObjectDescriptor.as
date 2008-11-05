package flicc.config.mxml
{
	
import flicc.config.IObjectDescriptor;
import flicc.config.dependency.ConstructorDependency;

import mx.collections.ArrayCollection;
import mx.collections.ICollectionView;

/**
 * Base class for mxml implementations of <code>IObjectDescriptor</code>.
 * 
 * <p>
 * The <code>BaseMxmlObjectDescriptor</code> exposes public setter methods for 
 * all the getters defined on <code>IObjectDescriptor</code>. Event handlers
 * and constructor arguments are also exposed through public <code>Array</code>
 * so they can be set directly in mxml. The <code>BaseMxmlObjectDescriptor
 * </code> sets the <code>clazz</code> to <code>Object</code> and <code>
 * isSingleton</code> to <code>true</code> by default.
 * </p>
 * 
 * <p>
 * The <code>BaseMxmlObjectDesciptor</code> does not define a <code>dependencies
 * </code> implementation, this is for sub-classes to provide.
 * </p>
 * 
 * <p>
 * This class should not be used directly, one of its sub-classes 
 * (<code>ObjectDescriptor</code> or <code>ListDescriptor</code>) should be used
 * instead.
 * </p>
 * 
 * @see flicc.config.mxml.ObjectDescriptor
 * @see flicc.config.mxml.ListDescriptor
 */
public class BaseMxmlObjectDescriptor implements IObjectDescriptor
{
  	private var _clazz : Class = Object;
	private var _singleton : Boolean = 	true;
	private var _objectId : String;
	private var _eventHandlers : ICollectionView;   
	
	/**
	 * An <code>Array</code> of <code>IEventHandler</code>.
	 * 
	 * <p>
	 * This property allows event handlers to be set in mxml without having to
	 * explicitly create an <code>ArrayCollection</code> - this is done by the
	 * <code>eventHandlers</code> get implmentation.
	 * </p>   
	 * 
	 * @see #eventHandlers
	 */ 
  	public var handlers : Array = [];  
  	
  	/**
  	 * An <code>Array</code> of values to be used as constructor arguments.
  	 * 
  	 * <p>
  	 * The <code>constructorArgs</code> get implementation will take these 
  	 * values and create a list of <code>IConstructorDependeny</code> values
  	 * using the order in which the values are defined in this <code>Array
  	 * </code> to determine the order in which they are provided as constructor
  	 * arguments.
  	 * </p>  
  	 */ 
	public var constructor : Array = []; 
	
	/**
	 * @deprecated Use <code>constructor</code> instead.
	 */ 
	public function set constructorDependencies( value : Array ) : void
	{
		constructor = value;	
	}	
		
	/**	
	 * @inheritDoc
	 */ 
  	public function get objectId() : String
  	{
    	return _objectId;
  	}
	
	/**
	 * @private
	 */ 
  	public function set objectId( value : String ) : void
  	{
		_objectId = value;
  	}  
  	
  	/**
  	 * @inheritDoc
  	 */ 
	public function get clazz() : Class 
	{
		return _clazz;
	}
	
	/**
	 * @private
	 */
  	public function set clazz( value : Class ) : void
  	{
     	_clazz = value;
  	}   

	/**
	 * @inheritDoc
	 */ 
  	public function get isSingleton() : Boolean
  	{
    	return _singleton && objectId!=null && objectId.length>0;
  	}

	/**
	 * @private
	 */ 
  	public function set isSingleton( value : Boolean ) : void
  	{
    	 _singleton = value;
  	}

	/**
	 * Intentionally unimplemented.
	 * 
	 * <p>
	 * Sub classes should override this method to return a list of <code> 
	 * IDependency</code> implementations.
	 * </p>
	 */ 
  	public function get dependencies() : ICollectionView
  	{
  		return null;
  	}
  
  	/**
  	 * @inheritDoc
  	 */
  	public function get eventHandlers() : ICollectionView
  	{
    	return new ArrayCollection( handlers );
  	}
	
	/**
	 * @inheritDoc
	 */ 
  	public function get constructorArgs() : ICollectionView
  	{
  		var constDeps : ArrayCollection = new ArrayCollection();
  		
  		for( var i : int = 0; i!=constructor.length; i++)
  		{
  			constDeps.addItem( new ConstructorDependency( i, constructor[ i ] ) );
  		}
  		
    	return constDeps;
	}
}

}