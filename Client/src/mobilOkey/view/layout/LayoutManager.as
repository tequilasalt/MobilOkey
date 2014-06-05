package mobilOkey.view.layout {
	
	import flash.display.Sprite;
	
	public class LayoutManager extends Sprite {
		
		private var _layouts:Vector.<UILayout>;
		
		public function LayoutManager(){			
			_layouts = new Vector.<UILayout>();			
		}
		
		public function createLayout(layoutName:String, order:int = 0):void{
			
			var uilayout:UILayout = new UILayout(layoutName); 
			_layouts.push(uilayout);
			
			if(order == -1){
				addChildAt(uilayout, 0);
			}else if(order == 0){
				addChild(uilayout);
			}else{
				addChildAt(uilayout, order);
			}
			
		}
		
		public function cleanLayouts(exceptions:Array):void{
			
			var c:Boolean;
			
			for each(var l:UILayout in _layouts){
				
				for each(var ln:String in exceptions){
					if(l.name == ln){
						c = true;
						break;
					}
				}
				
				if(c){
					c = false;
					continue;
				}
				
				l.cleanCurrentLayer();
			}
			
		}
		
		public function getLayout(layoutName:String):UILayout{
			
			for each(var l:UILayout in _layouts){
				if(l.name == layoutName){
					return l;
				}
			}
			
			return null;
		}
		
		public function destroyLayout(layoutName:String):void{
			
		}
		
		public function onResize():void{
			
			if(_layouts){
				for each(var lay:UILayout in _layouts){
					lay.onResize();
				}
			}
			
		}		
	}
}