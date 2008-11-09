package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.control.events.PopulateDomainEvent;
	import ac.iocsample.populatedomain.model.domain.Account;
	
	[Bindable]
	public class MainPM
	{
		public var account : Account;
		
		public function MainPM( account : Account )
		{
			
			this.account = account;
			
			new PopulateDomainEvent().dispatch();
		}
	}
}