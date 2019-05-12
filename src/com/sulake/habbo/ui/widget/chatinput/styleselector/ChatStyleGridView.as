package com.sulake.habbo.ui.widget.chatinput.styleselector
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.window.components.IItemGridWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Point;

    public class ChatStyleGridView implements IDisposable 
    {
        private static const _Str_14727:int = 92;

        private var _window:IBorderWindow;
        private var _selector:ChatStyleSelector;

        public function ChatStyleGridView(k:ChatStyleSelector, _arg_2:ISessionDataManager)
        {
            this._selector = k;
            var _local_3:IAssetLibrary = k._Str_20286.widget.assets;
            this._window = IBorderWindow(k._Str_20286.widget.windowManager.buildFromXML(XML(_local_3.getAssetByName("styleselector_menu_new_xml").content)));
            this._window.visible = false;
        }

        public function dispose():void
        {
            this._window.dispose();
            this._window = null;
            this._selector = null;
        }

        public function get disposed():Boolean
        {
            return this._window == null;
        }

        public function get grid():IItemGridWindow
        {
            return IItemGridWindow(this._window.findChildByName("itemgrid"));
        }

        public function get window():IBorderWindow
        {
            return this._window;
        }

        public function _Str_25385(k:IWindowContainer):void
        {
            var _local_5:int;
            var _local_2:Rectangle = new Rectangle();
            k.getGlobalRectangle(_local_2);
            var _local_3:IWindowContainer = IWindowContainer(this._window.parent);
            _local_3.x = (_local_2.right - this._window.width);
            _local_3.y = (_local_2.bottom - this._window.height);
            var _local_4:Point = new Point();
            _local_3.getGlobalPosition(_local_4);
            if (_local_4.x < _Str_14727)
            {
                _local_5 = (_Str_14727 - _local_4.x);
                _local_3.x = (_local_3.x + _local_5);
            }
            _local_3.x = _local_2.x;
            _local_3.y = ((_local_2.bottom - 35) - this._window.height);
        }
    }
}
