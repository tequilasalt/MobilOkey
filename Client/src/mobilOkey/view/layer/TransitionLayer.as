package mobilOkey.view.layer {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mobilOkey.view.layer.transitions.AlphaTransition;
	import mobilOkey.view.layer.transitions.FallDownTransition;
	import mobilOkey.view.layer.transitions.Transition;
	
	public class TransitionLayer extends UILayer {
		
		private var _transitions:Vector.<Transition>;
		
		public function TransitionLayer(layerId:String, content:Sprite=null){
			
			if(!content){
				content = new Sprite();
			}
			
			super(layerId, content, true);
			
			_transitions = new Vector.<Transition>();
			
			_transitions.push(new AlphaTransition(Transition.TARGET_TYPE_RUNTIME, Transition.TRANSITION_TYPE_OPEN, null, 0.01, 0, 1));
			_transitions.push(new FallDownTransition());

		}
		
		public function get transitions():Vector.<Transition>{
			return _transitions;
		}
		
		public function set transitions(value:Vector.<Transition>):void{
			_transitions = value;
		}
		
		override public function open():void{
			super.open();			
			startTransitions(Transition.TRANSITION_TYPE_OPEN, opened);			
		}
		
		override public function close():void{
			super.close();
			startTransitions(Transition.TRANSITION_TYPE_CLOSE, closed);	
		}
		
		protected function startTransitions(type:uint, handler:Function):void{
			
			var ml:MultiEventListener = new MultiEventListener();
			ml.addHandler(handler);
			
			for each(var t:Transition in _transitions){
				
				if(t.transitionType == type){
					
					ml.addDispatcher(t, Event.COMPLETE);
					
					if(t.targetType == Transition.TARGET_TYPE_RUNTIME){
						t.startTransition(_content);
					}else{
						t.startTransition();
					}
										
				}
			}
			
		}
		
	}
}