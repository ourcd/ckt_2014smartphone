package item.media
{
	import flash.net.URLRequest;
	
	import ghostcat.util.display.DisplayUtil;
	
	import org.bytearray.gif.events.GIFPlayerEvent;
	import org.bytearray.gif.player.GIFPlayer;
	
	public class MediaGif extends BaseMedia
	{
		private var mGIFPlayer:GIFPlayer=null;
		public function MediaGif(src:String)
		{
			super();
			this.mGIFPlayer = new GIFPlayer();
			addChild ( mGIFPlayer );
			mGIFPlayer.load(new URLRequest(src));
			mGIFPlayer.addEventListener ( GIFPlayerEvent.COMPLETE, onCompleteGIFLoad );
			
		}
		
		public override function destroy():void
		{
			DisplayUtil.removeAllChildren(this);
		}
		
		private function onCompleteGIFLoad(e:GIFPlayerEvent):void
		{
			mGIFPlayer.removeEventListener ( GIFPlayerEvent.COMPLETE, onCompleteGIFLoad );
			this.mGIFPlayer.play();
		}
	}
}