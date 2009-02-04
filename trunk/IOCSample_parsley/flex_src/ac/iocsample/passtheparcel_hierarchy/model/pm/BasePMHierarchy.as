package ac.iocsample.passtheparcel_hierarchy.model.pm
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class BasePMHierarchy
	{
		public var name : String;
		
		public function BasePMHierarchy( name : String )
		{
			this.name = name;
		}
	}
}