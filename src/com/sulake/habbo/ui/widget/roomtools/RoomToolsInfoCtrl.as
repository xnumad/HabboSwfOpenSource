package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.core.window.motion.Queue;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.MoveTo;
    import com.sulake.core.window.motion.Callback;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class RoomToolsInfoCtrl extends RoomToolsCtrlBase 
    {
        private static const _Str_3226:int = 12;
        private static const _Str_15927:uint = 1800619;
        private static const _Str_17809:uint = 4696294;

        private var _roomTags:Array;

        public function RoomToolsInfoCtrl(k:RoomToolsWidget, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
            this._roomTags = new Array();
        }

        public function _Str_15920(k:Boolean, _arg_2:String, _arg_3:String, _arg_4:Array):void
        {
            if (!window)
            {
                _window = (_Str_2268.windowManager.buildFromXML((_assets.getAssetByName("room_tools_info_xml").content as XML)) as IWindowContainer);
                _window.procedure = this._Str_3061;
                _window.addEventListener(WindowMouseEvent.OVER, this._Str_3061);
                _window.addEventListener(WindowMouseEvent.OUT, this._Str_3061);
            }
            this._Str_3714();
            _window.findChildByName("room_name").caption = _arg_2;
            _window.findChildByName("room_owner").caption = _arg_3;
            if (_arg_4 == null)
            {
                return;
            }
            this._roomTags = _arg_4;
            _window.findChildByName("tag1_border").visible = (_arg_4.length >= 1);
            _window.findChildByName("tag2_border").visible = (_arg_4.length >= 2);
            if (_arg_4.length >= 1)
            {
                _window.findChildByName("tag1").caption = ("#" + this._Str_19801(_arg_4[0]));
            }
            if (_arg_4.length >= 2)
            {
                _window.findChildByName("tag2").caption = ("#" + this._Str_19801(_arg_4[1]));
            }
            this.setCollapsed(false);
        }

        public function _Str_3714():void
        {
            if (!_window)
            {
                return;
            }
            var k:int = ((((_Str_3510) ? -(_window.width) : 0) + _Str_2268.getRoomToolbarRight()) + _Str_3226);
            var _local_2:int = ((_window.desktop.height - _Str_15557) - _window.height);
            var _local_3:int = _Str_2268.getChatInputY();
            if (_local_3 < (_local_2 + _window.height))
            {
                _local_2 = ((_local_3 - _window.height) - _Str_3226);
            }
            _window.position = new Point(k, _local_2);
        }

        override public function setCollapsed(k:Boolean):void
        {
            var _local_3:Motion;
            if (_Str_3510 == k)
            {
                return;
            }
            _Str_3510 = k;
            if (!_Str_3510)
            {
                _Str_18018();
            }
            if (!_window)
            {
                return;
            }
            _window.visible = true;
            var _local_2:int = ((((_Str_3510) ? -(_window.width) : 0) + _Str_2268.getRoomToolbarRight()) + _Str_3226);
            if (_Str_3510)
            {
                _local_3 = new Queue(new EaseOut(new MoveTo(_window, _Str_7674, _local_2, _window.y), 1), new Callback(this._Str_9372));
            }
            else
            {
                _local_3 = new Queue(new EaseOut(new MoveTo(_window, _Str_7674, _local_2, _window.y), 1), new Callback(this._Str_9372));
            }
            Motions._Str_4598(_local_3);
        }

        public function _Str_23422(k:Boolean):void
        {
            if (!_window)
            {
                return;
            }
            this.setCollapsed(k);
            var _local_2:Motion = new EaseOut(new MoveTo(_window, _Str_7674, (_Str_2268.getRoomToolbarRight() + _Str_3226), _window.y), 1);
            Motions._Str_4598(_local_2);
        }

        private function _Str_9372(k:Motion):void
        {
            if (((_Str_3510) && (_window)))
            {
                _window.visible = false;
            }
        }

        private function _Str_19801(k:String):String
        {
            var _local_2:String = k;
            if (_local_2.length > 16)
            {
                _local_2 = (_local_2.substr(0, 16) + "...");
            }
            return _local_2;
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ITextWindow;
            var _local_4:String;
            if (k.type == WindowEvent.WINDOW_EVENT_PARENT_RESIZED)
            {
                return this._Str_3714();
            }
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    this.setCollapsed(true);
                    break;
                case WindowMouseEvent.OVER:
                    _Str_21734();
                    break;
                case WindowMouseEvent.OUT:
                    _Str_20157();
                    break;
            }
            if ((k as WindowMouseEvent) == null)
            {
                return;
            }
            if (_arg_2.name == "tag1_region")
            {
                _local_3 = (_window.findChildByName("tag1") as ITextWindow);
                _local_4 = ((this._roomTags[0] == null) ? "" : this._roomTags[0]);
            }
            if (_arg_2.name == "tag2_region")
            {
                _local_3 = (_window.findChildByName("tag2") as ITextWindow);
                _local_4 = ((this._roomTags[1] == null) ? "" : this._roomTags[1]);
            }
            if (_local_3 != null)
            {
                switch (k.type)
                {
                    case WindowMouseEvent.HOVERING:
                    case WindowMouseEvent.OVER:
                        _local_3.textColor = _Str_17809;
                        return;
                    case WindowMouseEvent.OUT:
                        _local_3.textColor = _Str_15927;
                        return;
                    case WindowMouseEvent.CLICK:
                        handler.navigator.performTagSearch(_local_4);
                        return;
                }
            }
        }

        public function get right():int
        {
            return (_window) ? (_window.width + window.x) : 0;
        }
    }
}
