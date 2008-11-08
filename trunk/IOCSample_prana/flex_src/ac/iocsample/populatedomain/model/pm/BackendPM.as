package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	import ac.iocsample.populatedomain.model.domain.Backend;
	
	[Bindable]
	public class BackendPM
	{
		public var backend : Backend;
		
		public function BackendPM( backend : Backend )
		{
			
			this.backend = backend;
			
			new PopulateBackendEvent().dispatch();
		}
	}
}