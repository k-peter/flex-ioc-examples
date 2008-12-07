package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	import ac.iocsample.populatedomain.model.domain.Account;
	
	[Bindable]
	public class MainPM
	{
		public var account : Account;
		
		public function MainPM()
		{
		}
		
		public function populateBackend() : void
		{
			new PopulateBackendEvent().dispatch();
		}
	}
}