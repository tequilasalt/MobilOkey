package mobilOkey.view.layer.util {
	
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import mobilOkey.view.UI;
	import mobilOkey.view.layer.TransitionLayer;
	
	public class SingleClip extends TransitionLayer {
		
		protected var _clipPosition:Point;
		protected var _clipScale:Point;
		protected var _clip:Sprite;
		
		public function SingleClip(layerId:String, clip:Sprite, clipPosition:Point, clipScale:Point = null){
			
			var c:Sprite = new Sprite();
			
			_clip = clip;
			
			c.addChild(_clip);
			
			_clipPosition = clipPosition;
			_clipScale = clipScale;
			
			if(_clipScale){
				_clip.width = _clipScale.x;
				_clip.height = _clipScale.y;
			}
			
			super(layerId, c);
		}
		
		override public function onResize():void{
			
			_clip.x = UI.calculateValueX(_clipPosition.x);
			_clip.y = UI.calculateValueY(_clipPosition.y);
			
		}
		
	}
}