package flicc.config
{
	
/**
 * Provides an <code>IObjectFactory</code> with an object that has already 
 * been created. 
 * 
 * <p>
 * The <code>objectId</code> property is still used to refer to the 
 * <code>IObjectPlaceHolder</code> but the IObjectFactory will essentially 
 * ignore all other properties and simply return <code>object</code> when 
 * required.
 * </p>     
 */ 	
public interface IObjectPlaceHolder extends IObjectDescriptor
{
	/**
	 * The object that will be used by the factory whenever it is required to
	 * instantiate or provide <code>objectId</code>.  
	 */ 
	function get object() : Object;
}

}