package util.stateMachine {
	import flash.utils.Dictionary;
	
	public class StateMachine{
		
		private var _defaultState:String = "Default";
		private var _previousState:String;
		
		private var _currentState:AbstractState;
		private var _registeredStates:Dictionary;
		
		public function StateMachine(){
			_registeredStates = new Dictionary();
		}
		
		public function get currentState():AbstractState{
			return _currentState;			
		}
		
		public function set currentState(value:AbstractState):void{
		
			if (_currentState != null){
				_currentState.dispose();
			}
			
			_currentState = value;
			_currentState.init();
			
		}
		
		public function get defaultState():String{
			return _defaultState;
		}
		
		public function set defaultState(value:String):void{
			_defaultState = value;
		}
		
		public function get previousState():String{
			return _previousState;
		}
		
		public function setState(type:String):void{
			currentState = getState(type);
		}
		
		public function registerState(state:AbstractState):void{
			_registeredStates.Add(state.type, state);
		}
		
		public function rollBackDefault():void{
			currentState = getState(_defaultState);
		}
		
		protected function getState(type:String):AbstractState{
			if (!_registeredStates[type]) {
				return _registeredStates[_defaultState];
			}
			
			return _registeredStates[type];
		}
	}
}