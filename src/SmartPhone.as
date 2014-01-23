package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import ghostcat.manager.SoundManager;
	import ghostcat.util.data.XMLListUtil;
	
	import item.ItemData;
	import item.ItemSprite;

	[SWF(width="1536",height="544",backgroundColor="0x000000",frameRate="25")]
	public class SmartPhone extends Sprite
	{
		private var mItems:Vector.<ItemData>=new Vector.<ItemData>();
		private var mSprite:ItemSprite=new ItemSprite();
		public function SmartPhone()
		{
			Config.sStageWidth=stage.stageWidth;
			Config.sStageHeight=stage.stageHeight;
			stage.scaleMode=StageScaleMode.SHOW_ALL;
			this.mouseChildren=false;
			this.addChild(mSprite);
			this.loadXML();
		}
		
		private function loadXML():void
		{
			var loader:URLLoader=new URLLoader();
			loader.addEventListener(Event.COMPLETE,onXmlComplete);
			loader.load(new URLRequest("data.xml"));
		}
		
		private function onXmlComplete(e:Event):void
		{
			var xml:XML=new XML(e.target.data);
			Config.sRootURL=xml.@folder;
			var xmlList:XMLList=xml.elements();
			for(var i:int=0;i<xmlList.length();i++)
			{
				this.mItems.push(new ItemData(XMLListUtil.getItemAt(xmlList,i)));
			}
			stage.addEventListener(KeyboardEvent.KEY_UP,onKeyEvent);
			//play bg sound
			SoundManager.instance.play(Config.sRootURL+xml.@bgsound);
			//play first item
			this.playItem();
			
		}
		
		private function onKeyEvent(e:KeyboardEvent):void
		{
			if(Config.ACTION_KEY==e.keyCode)
			{
				this.playItem();
			}
		}
		
		private function playItem():void
		{
			if(mItems.length>0)
			{
				mSprite.destroy();
				var it:ItemData=mItems.shift();
				mSprite.play(it);
				setTimeout(playItem,it.mTime);
			}
		}
	}
}