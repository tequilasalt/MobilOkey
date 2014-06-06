package mobilOkey.view.layout {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mobilOkey.view.layer.UILayer;
	
	public class UILayout extends Sprite {
		
		protected var _currentLayer:UILayer;
		protected var _targetLayer:UILayer;
		
		protected var _translating:Boolean;
		
		public function UILayout(layoutName:String){
			name = layoutName;
		}
		
		public function get currentLayer():UILayer{
			return _currentLayer;
		}
		
		public function setLayer(layer:UILayer):void{
			
			if(_currentLayer && _currentLayer.id == layer.id){
				return;
			}
			
			if(_currentLayer){
				removeChild(_currentLayer);
			}
			
			_currentLayer = layer;
			
			layer.onResize();
			addChild(layer);
			
			layer.x = 0;
			layer.y = 0;
			
			layer.open();
			
		}
		
		public function cleanCurrentLayer():void{
			
			if(!_currentLayer){
				return;
			}
			
			_currentLayer.addEventListener(Event.CLOSE, onLayerClose, false, 0, true);
			_currentLayer.close();

		}
		
		public function translateLayer(layer:UILayer, deep:int = 0):void{
			
			if(_currentLayer && layer.id == _currentLayer.id){
				return;
			}
			
			_targetLayer = layer;
			
			addChildAt(layer, deep);	
			
			layer.onResize();
			
			layer.x = 0;
			layer.y = 0;
			
			layer.open();
			
			if(_currentLayer){
				cleanCurrentLayer();
			}else{
				onLayerClose();
			}
		}
		
		public function onResize():void{
			if(_currentLayer){
				_currentLayer.onResize();
			}
		}
		
		private function onLayerClose(e:Event = null):void{
			
			if(_currentLayer){
				removeChild(_currentLayer);
			}
			if(_targetLayer){
				_currentLayer = _targetLayer;
				_targetLayer = null;
			}else{
				_currentLayer = null;
			}
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
	}
}