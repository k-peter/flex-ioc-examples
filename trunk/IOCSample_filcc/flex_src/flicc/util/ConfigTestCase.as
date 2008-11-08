package flicc.util
{
	import flexunit.framework.TestCase;
	
	import flicc.config.IObjectDescriptor;

	/**
	 * Base test class for unit testing IObjectFactory config implementations.
	 * 
	 * <p>
	 * Provides custom assertions to test that IObjectDescriptors have the
	 * exepected dependencies and constructor arguments.
	 * </p>
	 */ 
	public class ConfigTestCase extends TestCase
	{
		
		public function assertPropertyIsValue( property : String, value : Object,
				descriptor : IObjectDescriptor ) : void {
					
			assertTrue( "Property dependency not set", ConfigUtil.hasDependecyForProperty( property, descriptor ) );
			assertTrue( "Property value not correct", ConfigUtil.propertyIsValue( property, value, descriptor ) ); 
		}
		
		public function assertPropertyIsReferenceTo( property : String, reference : String,
				descriptor : IObjectDescriptor ) : void {
					
			assertTrue( "Property dependency not set", ConfigUtil.hasDependecyForProperty( property, descriptor ) );
			assertTrue( "Property reference not correct", ConfigUtil.propertyIsReferenceTo( property, reference, descriptor ) ); 
		}
		
		
		public function assertIndexIsValue( index : Number, value : Object,
				descriptor : IObjectDescriptor ) : void {
					
			assertTrue( "Index dependency not set", ConfigUtil.hasDependencyAtIndex( index, descriptor ) );
			assertTrue( "Index value not correct", ConfigUtil.indexIsValue( index, value, descriptor ) ); 
		}
		
		public function assertIndexIsReferenceTo( index : Number, reference : String,
				descriptor : IObjectDescriptor ) : void {
					
			assertTrue( "Index dependency not set", ConfigUtil.hasDependencyAtIndex( index, descriptor ) );
			assertTrue( "Index reference not correct", ConfigUtil.indexIsReferenceTo( index, reference, descriptor ) ); 
		}
		
		
		public function assertConstuctorArgIsValue( index : Number, value : Object,
				descriptor : IObjectDescriptor ) : void {
					
			assertTrue( "Constructor dependency not set", ConfigUtil.hasConstructorArgumentAtIndex( index, descriptor ) );
			assertTrue( "Constructor value not correct", ConfigUtil.constructorArgIsValue( index, value, descriptor ) ); 
		}
		
		public function assertConstuctorArgIsReferenceTo( index : Number, reference : String,
				descriptor : IObjectDescriptor ) : void {
					
			assertTrue( "Constructor dependency not set", ConfigUtil.hasConstructorArgumentAtIndex( index, descriptor ) );
			assertTrue( "Constructor reference not correct", ConfigUtil.constructorArgIsReferenceTo( index, reference, descriptor ) ); 
		}		
	}
}