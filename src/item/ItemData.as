package item
{
	public class ItemData
	{
		public var mType:int=1;
		public var mSrc:String="";
		public var mSound:String="";
		public var mFromScaleX:Number=1;
		public var mToScaleX:Number=1;
		public var mFromScaleY:Number=1;
		public var mToScaleY:Number=1;
		public var mFromX:int=0;
		public var mToX:int=0;
		public var mFromY:int=0;
		public var mToY:int=0;
		public var mFromAlpha:Number=1;
		public var mToAlpha:Number=1;
		public var mDuration:int=0;
		public var mDelay:int=0;
		public var mTime:int=1000;
		public var mEase:int=Config.EASE_NONE;
		public function ItemData(data:Object)
		{
			this.mType=data.@type;
			if(data.@src)
			{
				this.mSrc=data.@src;
			}
			if(data.@sound)
			{
				this.mSound=data.@sound;
			}
			if(data.@fromScaleX)
			{
				this.mFromScaleX=data.@fromScaleX;
			}
			if(data.@toScaleX)
			{
				this.mToScaleX=data.@toScaleX;
			}
			if(data.@fromScaleY)
			{
				this.mFromScaleY=data.@fromScaleY;
			}
			if(data.@toScaleY)
			{
				this.mToScaleY=data.@toScaleY;
			}
			if(data.@fromX)
			{
				this.mFromX=data.@fromX;
			}
			if(data.@toX)
			{
				this.mToX=data.@toX;
			}
			if(data.@fromY)
			{
				this.mFromY=data.@fromY;
			}
			if(data.@toY)
			{
				this.mToY=data.@toY;
			}
			if(data.@fromAlpha)
			{
				this.mFromAlpha=data.@fromAlpha;
			}
			if(data.@toAlpha)
			{
				this.mToAlpha=data.@toAlpha;
			}
			if(data.@duration)
			{
				this.mDuration=data.@duration;
			}
			if(data.@delay)
			{
				this.mDelay=data.@delay;
			}
			if(data.@time)
			{
				this.mTime=data.@time;
			}
			var time:int=mDuration+mDelay;
			if(time>mTime)
			{
				this.mTime=time;
			}
			if(data.@ease)
			{
				this.mEase=data.@ease;
			}
		}
	}
}