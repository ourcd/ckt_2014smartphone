package item
{
	import flash.display.Sprite;
	
	import ghostcat.manager.SoundManager;
	import ghostcat.util.display.DisplayUtil;
	import ghostcat.util.easing.Back;
	import ghostcat.util.easing.Bounce;
	import ghostcat.util.easing.Cubic;
	import ghostcat.util.easing.Elastic;
	import ghostcat.util.easing.Expo;
	import ghostcat.util.easing.Linear;
	import ghostcat.util.easing.Quad;
	import ghostcat.util.easing.Quart;
	import ghostcat.util.easing.Quint;
	import ghostcat.util.easing.Sine;
	import ghostcat.util.easing.Strong;
	import ghostcat.util.easing.TweenUtil;
	
	import item.media.BaseMedia;
	import item.media.MediaGif;
	import item.media.MediaSwf;
	import item.media.MediaVideo;
	
	public class ItemSprite extends Sprite
	{
		private var mData:ItemData=null;
		private var mMedia:BaseMedia=null;
		private var mSound:String="";
		public function ItemSprite()
		{
			super();
		}
				
		public function play(data:ItemData):void
		{
			this.mData=data;
			//animation
			this.x=data.mFromX;
			this.y=data.mFromY;			
			this.scaleX=data.mFromScaleX;
			this.scaleY=data.mFromScaleY;
			this.alpha=data.mFromAlpha;
			if(Config.EASE_NONE==data.mEase)
			{
				TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,onStart:onAnimStart});
			}
			else
			{
				switch(data.mEase)
				{
					
					case Config.EASE_BACK:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Back.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_BOUNCE:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Bounce.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_CUBIC:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Cubic.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_ELASTIC:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Elastic.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_EXPO:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Expo.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_LINEAR:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Linear.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_QUAD:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Quad.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_QUART:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Quart.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_QUINT:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Quint.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_SINE:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Sine.easeIn,onStart:onAnimStart});
						break;
					case Config.EASE_STRONG:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,ease:Strong.easeIn,onStart:onAnimStart});
						break;
					default:
						TweenUtil.to(this,data.mDuration,{x:data.mToX,y:data.mToY,scaleX:data.mToScaleX,scaleY:data.mToScaleY,alpha:data.mToAlpha,onStart:onAnimStart});
						break;
				}
			}
		}
		
		public function destroy():void
		{
			TweenUtil.removeAllTween();
			this.x=0;
			this.y=0;
			if(null!=stage)
			{
				this.width=stage.stageWidth;
				this.height=stage.stageHeight;
			}
			if(""!=mSound)
			{
				SoundManager.instance.stop(mSound);
			}
			if(null!=mMedia)
			{
				this.mMedia.destroy();
			}
			DisplayUtil.removeAllChildren(this);
		}
		
		private function onAnimStart():void
		{
			//media
			if(""!=mData.mSrc)
			{
				switch(mData.mType)
				{
					case Config.MEDIA_IMAGE:
					case Config.MEDIA_SWF:
						this.mMedia=new MediaSwf(Config.sRootURL+mData.mSrc);
						this.addChild(mMedia);
						break;
					case Config.MEDIA_VIDEO:
						this.mMedia=new MediaVideo(Config.sRootURL+mData.mSrc);
						this.addChild(mMedia);
						break;
					case Config.MEDIA_GIF:
						this.mMedia=new MediaGif(Config.sRootURL+mData.mSrc);
						this.addChild(mMedia);
						break;
				}
			}
			//bg sound
			if(""!==mData.mSound)
			{
				this.mSound=Config.sRootURL+mData.mSound;
				SoundManager.instance.play(mSound);
			}
		}
		
		
	}
}