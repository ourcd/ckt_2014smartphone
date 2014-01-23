package
{
	import flash.ui.Keyboard;

	public final class Config
	{
		public static const ACTION_KEY:uint=Keyboard.SPACE;
		//media type
		public static const MEDIA_IMAGE:int=1;
		public static const MEDIA_SWF:int=2;
		public static const MEDIA_VIDEO:int=3;
		public static const MEDIA_GIF:int=4;
		//ease
		public static const EASE_NONE:int=0;
		public static const EASE_BACK:int=1;
		public static const EASE_BOUNCE:int=2;
		public static const EASE_CUBIC:int=3;
		public static const EASE_ELASTIC:int=4;
		public static const EASE_EXPO:int=5;
		public static const EASE_LINEAR:int=6;
		public static const EASE_QUAD:int=7;
		public static const EASE_QUART:int=8;
		public static const EASE_QUINT:int=9;
		public static const EASE_SINE:int=10;
		public static const EASE_STRONG:int=11;
		//------------------------------------------------------------
		public static var sRootURL:String="../assets/";
		public static var sStageWidth:int;
		public static var sStageHeight:int;
		
		
		
		
	}
}