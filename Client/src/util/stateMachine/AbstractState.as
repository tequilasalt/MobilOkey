package util.stateMachine {
	
	public class AbstractState{
		
		private var _type:String;
		
		public function AbstractState(type:String){
			_type = type;
		}
		
		public function get type():String{
			return _type;
		}

		public function init():void{
			
		}
		
		public function dispose():void{
			
		}
	}
}