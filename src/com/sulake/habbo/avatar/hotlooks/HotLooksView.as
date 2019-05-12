package com.sulake.habbo.avatar.hotlooks
{
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.wardrobe.Outfit;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class HotLooksView implements IAvatarEditorCategoryView 
    {
        private var _window:IWindowContainer;
        private var _model:HotLooksModel;
        private var _hotLooksGrid:IItemGridWindow;

        public function HotLooksView(k:HotLooksModel)
        {
            this._model = k;
        }

        public function init():void
        {
            if (this._hotLooksGrid)
            {
                this._hotLooksGrid._Str_3956();
            }
            if (!this._window)
            {
                this._window = (this._model.controller.view.getCategoryContainer(AvatarEditorFigureCategory.HOTLOOKS) as IWindowContainer);
                this._hotLooksGrid = (this._window.findChildByName("hotlooks") as IItemGridWindow);
                this._window.visible = false;
            }
            this.update();
        }

        public function dispose():void
        {
            this._hotLooksGrid._Str_3956();
            this._window = null;
            this._model = null;
        }

        public function update():void
        {
            var k:IWindow;
            var _local_2:Outfit;
            this._hotLooksGrid._Str_3956();
            for each (_local_2 in this._model._Str_24788)
            {
                k = _local_2.view.window;
                this._hotLooksGrid._Str_2816(k);
                k.procedure = this._Str_23998;
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            return this._window;
        }

        private function _Str_23998(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_3:int;
            if (_arg_2 == null)
            {
                _arg_2 = (k.target as IWindow);
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._hotLooksGrid._Str_3373(_arg_2.parent);
                this._model._Str_24318(_local_3);
            }
        }

        public function switchCategory(k:String):void
        {
        }

        public function _Str_5614(k:String, _arg_2:int):void
        {
        }

        public function reset():void
        {
        }
    }
}
