package mobilOkey.controller.net {
	
	public class CommRequestController {
		
		private var _methods:Vector.<MethodCall>;
		
		private static var _instance:CommRequestController;
		
		public function CommRequestController(){
			_methods = new Vector.<MethodCall>();
		}
		
		public function connect(userId:String, server:String):void{
			
		}
		
		public function disconnect():void{
			
		}
		
		public function registerMethod(method:String, client:Function):void{
			
		}
		
		public function unRegisterMethod(method:String):void{
			
		}
		
		private function onMessage():void{
			
		}
		
		private function getClient(method:String):MethodCall{
			
			for each(var m:MethodCall in _methods){
				if(m.method == method){
					return m;
				}
			}
			
			return new MethodCall(method);
		}

		public static function get instance():CommRequestController{
			
			if(!_instance){
				_instance = new CommRequestController();
			}
			
			
			return _instance;
		}

		
	}
	
}
	
internal class MethodCall{
	
	private var _method:String;
	private var _clients:Vector.<Function>;
	
	public function MethodCall(method:String, client:Function = null){
		
		_method = method;
		_clients = new Vector.<Function>();
		
		if(client){			
			_clients.push(client);
		}
	}
	
	public function get method():String{
		return _method;
	}

	public function addClient(client:Function):void{
		
		if(_clients.indexOf(client) < 0){
			_clients.push(client);
		}
		
	}
	
	public function removeClient(client:Function):void{
		
		var index:uint = 0;
		
		for each(var f:Function in _clients){
			
			if(f === client){
				_clients.splice(index,1);
				break;
			}
			
			index++;
		}
		
	}
	
	public function invokeClients():void{
		
	}
	
	public function get length():int{
		return _clients.length;
	}
}
	
