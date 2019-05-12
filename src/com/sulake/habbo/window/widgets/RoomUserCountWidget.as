package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.utils.IIterator;

    public class RoomUserCountWidget implements _Str_16564 
    {
        public static const ROOM_USER_COUNT:String = "room_user_count";

        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;

        public function RoomUserCountWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("room_user_count_xml").content as XML)) as IWindowContainer);
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
        }

        public function set userCount(k:int):void
        {
        }

        public function get properties():Array
        {
            return null;
        }

        public function set properties(k:Array):void
        {
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return false;
        }

        public function get iterator():IIterator
        {
            return null;
        }
    }
}

