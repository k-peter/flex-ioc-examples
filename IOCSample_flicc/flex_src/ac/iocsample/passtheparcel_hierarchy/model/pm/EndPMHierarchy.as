package ac.iocsample.passtheparcel_hierarchy.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	import flash.events.Event;
	
	import mx.core.Application;
	
	[Bindable]
	public class EndPMHierarchy extends BasePMHierarchy
	{
		//injected by flicc
		public var parcel : Parcel;
		
		public function EndPMHierarchy()
		{
			super("End");
		}
		
	}
}