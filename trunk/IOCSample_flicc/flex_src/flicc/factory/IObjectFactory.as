package flicc.factory
{

/**
 * Creates and configures <code>Object</code>s based on an <code>
 * IObjectFactoryConfig</code>.
 * 
 * <p>
 * The means by which an IObjectFactory obtains an IObjectFactoryConfig is
 * left up to the implementation to decide.
 * </p>   
 */ 
public interface IObjectFactory
{
	/**
	 * Get an instance of the object described by <code>objectId</code> in the 
	 * <code>IObjectFactoryConfig</code> for this factoy. 
	 * 
	 * @param objectId The objectId of an <code>IObjectDescriptor</code> within
	 * this <code>IObjectFactory</code>s configuration.  
	 * 
	 * @return An instance of the described object with all dependencies, 
	 * constructor arguments and event handlers applied. 
	 */ 
	function getInstance( objectId : String ) : *;
	
	/**
	 * Applies the <code>IDependencies</code> and the <code>IEventHandlers
	 * </code> defined by <code>objectId</code> in the <code>
	 * IObjectFactoryConfig</code> for this factory on to the provided object.
	 * 
	 * @param   
	 */ 
	function configure( object : Object, objectId : String ) : void;
}

}