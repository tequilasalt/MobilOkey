package mobilOkey.view.layer.transitions {
	
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	
	public class AlphaTransition extends Transition {
		
		protected var _targetValue:Number;
		
		public function AlphaTransition(targetType:uint=0, transitionType:uint=0, predefinedTarget:DisplayObject=null, duration:Number = 0.5, delay:Number = 0, targetValue:Number = 0){
			super(targetType, transitionType, predefinedTarget, duration, delay);
			
			_targetValue = targetValue;
			
		}
		
		override protected function start():void{
			TweenMax.to(_target, _duration, {alpha:_targetValue, onComplete:end, delay:_delay});	
		}
		
	}
}