package item.media
{
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import ghostcat.util.display.DisplayUtil;
	
	public class MediaVideo extends BaseMedia
	{
		private var m_videoConnection:NetConnection=null;
		private var m_videoStream:NetStream=null;
		private var m_video:Video=null;
		public function MediaVideo(src:String)
		{
			super();
			m_videoConnection = new NetConnection();
			m_videoConnection.connect(null);
			m_videoStream = new NetStream(m_videoConnection);
			m_videoStream.play(src);
			var metaListener:Object = new Object();
			metaListener.onMetaData = onMetaData;//必写，否则报错
			m_videoStream.client = metaListener;
			m_video = new Video(Config.sStageWidth,Config.sStageHeight);//设定大小
			m_video.x=(Config.sStageWidth-m_video.width)/2;
			m_video.y=(Config.sStageHeight-m_video.height)/2;
			m_video.attachNetStream(m_videoStream);
			addChild(m_video);
		}
		
		public override function destroy():void
		{
			this.m_video.clear();
			this.m_videoStream.close();
			this.m_videoConnection.close();
			this.removeChild(m_video);
			DisplayUtil.removeAllChildren(this);
		}
		
		private function onMetaData(data:Object):void
		{
		}
	}
}