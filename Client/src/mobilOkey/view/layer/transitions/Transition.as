package mobilOkey.view.layer.transitions {

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Transition extends EventDispatcher{
		
		public static const TARGET_TYPE_RUNTIME:uint = 0;
		public static const TARGET_TYPE_PREDEFINED:uint = 1;
		
		public static const TRANSITION_TYPE_OPEN:uint = 0;
		public static const TRANSITION_TYPE_CLOSE:uint = 1;
		
		private var _targetType:uint;
		private var _predefinedTarget:DisplayObject;		
		private var _transitionType:uint;
		
		protected var _duration:Number;
		protected var _target:DisplayObject;
		protected var _delay:Number;
		
		public function Transition(targetType:uint = 0, transitionType:uint = 0, predefinedTarget:DisplayObject = null, duration:Number = 0.5, delay:Number = 0){
			
			_targetType = targetType;
			_predefinedTarget = predefinedTarget;
			_transitionType = transitionType;
			_delay = delay;
			_duration = duration;
			
		}
		
		public function get transitionType():uint{
			return _transitionType;
		}

		public function get targetType():uint{
			return _targetType;
		}

		public function startTransition(target:DisplayObject = null):void{
			
			if(_targetType == TARGET_TYPE_PREDEFINED){
				_target = _predefinedTarget 
			}else{
				_target = target;
			}
			
			start();
		}
		
		protected function start():void{
			
		}
		
		protected function end(e:Event = null):void{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	}
}