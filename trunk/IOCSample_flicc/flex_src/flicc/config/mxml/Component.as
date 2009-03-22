package flicc.config.mxml
{

import flicc.error.FliccError;

/**
 * An <code>IObjectDescriptor</code> that can be used as a place holder for a 
 * set of dependencies and event handlers to apply when calling 
 * <code>IObjectFactory.configure()</code>.
 * 
 * <p>
 * Although the standard <code>ObjectDescriptor</code> can be used to configure 
 * objects, this class signals intent more clearly. Attempting to set the 
 * <code>clazz</code> property on a <code>Component</code> will 
 * cause an error to be thrown. <code>constructorDependencies</code> are 
 * ignored.
 * </p>
 * 
 * @mxml
 * <p>
 * The <code>Component</code> is added to an <code>
 * MxmlFactoryConfig</code> like any other <code>ObjectDescriptor</code>, but 
 * without a <code>clazz</code> property:  
 * 
 * <pre>
 * 	/&lt;Component objectId="Class18Dependencies"&gt;
 *		&lt;prop1&gt;prop1&lt;/prop1&gt;
 *		&lt;prop2&gt;&lt;Ref objectId="Class1Id"/&gt;&lt;/prop2&gt;
 *	&lt;/Component&gt;
 * </pre>
 * </p>
 * 
 * @see com.flicc.factory.IObjectFactory#configure
 */  
public dynamic class Component extends ObjectDescriptor
{
	/**
	 * Attempting to set the <code>clazz</code> property will cause a 
	 * <code>FliccError</code> to be thrown.   
	 */ 
	override public function set clazz( value : Class ) : void
	{
		throw new FliccError( "Cannot set class on dependencies place holder" );
	}
}

}