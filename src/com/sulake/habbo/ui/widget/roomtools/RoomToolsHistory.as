package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;

    public class RoomToolsHistory 
    {
        private static const _Str_5133:int = 5;
        private static const _Str_2942:int = 2;

        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _window:IWindowContainer;
        private var _handler:RoomToolsWidgetHandler;
        private var _items:Vector.<IWindowContainer>;

        public function RoomToolsHistory(k:IHabboWindowManager, _arg_2:IAssetLibrary, _arg_3:RoomToolsWidgetHandler)
        {
            this._items = new Vector.<IWindowContainer>();
            super();
            this._handler = _arg_3;
            this._assets = _arg_2;
            this._windowManager = k;
            this._window = (k.buildFromXML((_arg_2.getAssetByName("room_tools_history_xml").content as XML)) as IWindowContainer);
        }

        public function populate(k:Vector.<_Str_2370>):void
        {
            var _local_2:IWindow;
            var _local_3:_Str_2370;
            var _local_4:IWindowContainer;
            for each (_local_3 in k)
            {
                _local_4 = (this._windowManager.buildFromXML((this._assets.getAssetByName("room_tools_history_item_xml").content as XML)) as IWindowContainer);
                this._window.addChild(_local_4);
                _local_4.findChildByName("room_name").caption = _local_3.roomName;
                if (_local_2)
                {
                    _local_4.y = (_local_2.bottom + _Str_2942);
                }
                else
                {
                    _local_4.y = _Str_5133;
                }
                _local_4.x = _Str_5133;
                _local_4.id = _local_3.flatId;
                _local_4.procedure = this.onClick;
                _local_2 = _local_4;
                this._items.push(_local_4);
            }
            if (_local_2)
            {
                this._window.height = (_local_2.bottom + (2 * _Str_5133));
            }
        }

        public function dispose():void
        {
            var k:IWindowContainer;
            for each (k in this._items)
            {
                k.procedure = null;
                k.dispose();
            }
            this._items = null;
            this._windowManager = null;
            this._handler = null;
            this._assets = null;
            this._window.dispose();
            this._window = null;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._handler.goToPrivateRoom(_arg_2.id);
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }
    }
}
