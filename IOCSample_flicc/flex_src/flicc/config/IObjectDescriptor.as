package flicc.config
{
	
import mx.collections.ICollectionView;
   
/**
 * Describes an object to be created by an IObjectFactory.
 */ 
public interface IObjectDescriptor
{
	/**
	 * A unique identifier - within the scope of any given IObjectFactoryConfig 
	 * - for this IObjectDescriptor.
	 */ 
	function get objectId() : String;
  
  	/**
  	 * The actual <code>Class</code> to be instantiated when creating an object
  	 * from this IObjectDescriptor.
  	 */ 
	function get clazz() : Class;
  
  	/**
  	 * Indicates wether or not a factory should create a new instance of <code>
  	 * clazz</code> when required, or cache and re-use a single instance. 
  	 */
	function get isSingleton() : Boolean;

	/**
	 * A list of IDependencys that describe the dependencies to be injected on 
	 * to the created instance of <code>clazz</code> by an IObjectFactory.
	 * 
	 * @see flicc.config.dependency.IDependency
	 */ 
  	function get dependencies() : ICollectionView;

  	/** 
  	 * A list of IConstructorDependencys that describe the constructor arguments
  	 * to be passed when creating an instance of <code>clazz</code>.
  	 * 
  	 * @see flicc.config.dependency.IConstructorDependency
  	 */ 
  	function get constructorArgs() : ICollectionView;

	/**
	 * A list of IEventHandlers that desribe what event handlers should be added
	 * by an IObjectFactory to the created instance of <code>clazz</code>.
	 * 
	 * @see flicc.config.event.IEventHandler
	 */ 
	function get eventHandlers() : ICollectionView;
}

}