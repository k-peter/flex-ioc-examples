package flicc.config.mxml
{
	
import flicc.config.IObjectDescriptorReference;

/**
 * An <code>IObjectDescriptorReference</code> for use in mxml.
 * 
 * <p>
 * Provides a public setter method for <code>objectId</code>.
 * </p>
 */ 
public class Ref implements IObjectDescriptorReference
{
	private var _objectId : String;

	/**
	 * @inheritDoc
	 */ 
	public function get objectId() : String
	{
		return _objectId;
	}
      
	public function set objectId( value : String ) : void
	{
		_objectId = value;
	}
	
	/**
	 * Short-hand for setting <code>objectId</code>
	 */ 
	public function set to( value : String ) : void
	{
		_objectId = value;
	}
}

}