package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	
	[Bindable]
	public class BackendPM
	{
		public var backend : Object;
		
		public function BackendPM( backend : Object )
		{
			
			this.backend = backend;
			
			new PopulateBackendEvent().dispatch();
		}
	}
}