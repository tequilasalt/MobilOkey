package mobilOkey.view.layer.transitions {
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Strong;
	
	import flash.display.DisplayObjectContainer;
	
	import mobilOkey.controller.game.GameController;
	
	public class FallDownTransition extends Transition {
		
		public function FallDownTransition(){
			super(TARGET_TYPE_RUNTIME, TRANSITION_TYPE_CLOSE, null, 0.5);
		}
		
		override protected function start():void{
			
			if(_target is DisplayObjectContainer){
				
				DisplayObjectContainer(_target).mouseEnabled = false;
				DisplayObjectContainer(_target).mouseChildren = false;
				
			}
			
			TweenMax.to(_target, _duration, {y:GameController.instance.settings.currentHeight/2, alpha:0, onComplete:end, ease:Strong.easeIn});
		}
	}
}