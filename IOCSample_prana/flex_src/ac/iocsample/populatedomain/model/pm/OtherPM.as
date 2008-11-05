package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.model.domain.BackEnd;
	
	[Bindable]
	public class OtherPM
	{
		
		public var backend : BackEnd;
		
		public function OtherPM( backend : BackEnd )
		{
			this.backend = backend;
		}

	}
}