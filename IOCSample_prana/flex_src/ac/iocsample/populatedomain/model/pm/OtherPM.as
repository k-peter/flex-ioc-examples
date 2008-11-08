package ac.iocsample.populatedomain.model.pm
{
	import ac.iocsample.populatedomain.model.domain.Backend;
	
	[Bindable]
	public class OtherPM
	{
		
		public var backend : Backend;
		
		public function OtherPM( backend : Backend )
		{
			this.backend = backend;
		}

	}
}