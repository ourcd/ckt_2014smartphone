package item.media
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import ghostcat.util.display.DisplayUtil;
	
	public class MediaSwf extends BaseMedia
	{
		public function MediaSwf(src:String)
		{
			super();
			var loader:Loader=new Loader();
			loader.load(new URLRequest(src));
			this.addChild(loader);
		}
		
		public override function destroy():void
		{
			DisplayUtil.removeAllChildren(this);
		}
	}
}