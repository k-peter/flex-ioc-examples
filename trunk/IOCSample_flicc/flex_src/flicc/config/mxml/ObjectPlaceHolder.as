package flicc.config.mxml
{
	
import flicc.config.IObjectPlaceHolder;

import mx.collections.ArrayCollection;
import mx.collections.ICollectionView;

[DefaultProperty("object")]

/**
 * An <code>IObjectPlaceHolder</code> to be used in mxml.
 * 
 * <p>
 * Setters are defined for <code>objectId</code> and <code>object</code> only,
 * all other properties are returned as empty or null defaults.
 * </p>
 * 
 * @mxml
 * <pre>
 * 	&lt;ObjectPlaceHolder objectId="createdObject"&gt;
 * 		&lt;mx:Button label="A button" /&gt;		
 * 	&lt;/ObjectPlaceHolder&gt;
 * </pre>
 */  
public class ObjectPlaceHolder implements IObjectPlaceHolder
{
	private var _objectId : String;
	private var _object : Object;
	
	public function set object( value : Object ) : void
	{
		_object = value;
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function get object():Object
	{
		return _object;
	}
	
	public function set objectId( value : String ) : void
	{
		_objectId = value;
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function get objectId():String
	{
		return _objectId;
	}
	
	/**
	 * Always null
	 */
	public function get clazz():Class
	{
		return null;
	}
	
	/**
	 * Always true
	 */
	public function get isSingleton():Boolean
	{
		return true;
	}
	
	/**
	 * Always empty
	 */ 
	public function get dependencies():ICollectionView
	{
		return new ArrayCollection();
	}
	
	/**
	 * Always empty
	 */
	public function get constructorArgs():ICollectionView
	{
		return new ArrayCollection();
	}
	
	/**
	 * Always empty
	 */
	public function get eventHandlers():ICollectionView
	{
		return new ArrayCollection();
	}
}
}