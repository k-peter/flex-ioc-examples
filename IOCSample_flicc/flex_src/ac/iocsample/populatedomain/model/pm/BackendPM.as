package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	import ac.iocsample.populatedomain.model.domain.BackEnd;
	
	[Bindable]
	public class BackendPM
	{
		public var backend : BackEnd;
		
		public function BackendPM( backend : BackEnd )
		{
			
			this.backend = backend;
			
			new PopulateBackendEvent().dispatch();
		}
	}
}