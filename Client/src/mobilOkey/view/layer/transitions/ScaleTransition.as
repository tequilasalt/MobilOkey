package mobilOkey.view.layer.transitions {
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	import mobilOkey.view.UI;
	
	public class ScaleTransition extends Transition {
		
		private var _baseScale:Point;
		private var _ease:*;
		
		public function ScaleTransition(targetType:uint=0, transitionType:uint=0, predefinedTarget:DisplayObject=null, duration:Number=0.5, delay:Number=0, baseScale:Point = null, ease:* = null){
			super(targetType, transitionType, predefinedTarget, duration, delay);
			
			_baseScale = baseScale;
			
			if(!ease){
				_ease = Back.easeOut;
			}else{
				_ease = ease;
			}
		}
		
		override protected function start():void{
			TweenMax.to(_target, _duration, {width:UI.calculateValueX(_baseScale.x), height:UI.calculateValueX(_baseScale.y), ease:_ease, onComplete:end});
		}
	}
	
}