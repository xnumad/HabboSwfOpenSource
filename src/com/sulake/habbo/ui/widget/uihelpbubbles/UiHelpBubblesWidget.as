package com.sulake.habbo.ui.widget.uihelpbubbles
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.friendbar.view.IHabboFriendBarView;
    import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.ui.IRoomDesktop;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.enum.Direction;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetScriptProceedMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;

    public class UiHelpBubblesWidget extends ConversionTrackingWidget implements ILinkEventTracker 
    {
        private var _component:Component;
        private var _bubbles:Map;
        private var _toolBar:IHabboToolbar;
        private var _friendBar:IHabboFriendBarView;
        private var _roomTools:RoomToolsWidget;
        private var _chatInput:RoomChatInputWidget;
        private var _bubblesToShow:Array;
        private var _bubbleIndex:int = 0;
        private var _localization:IHabboLocalizationManager;

        public function UiHelpBubblesWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboFriendBarView, _arg_6:IHabboToolbar, _arg_7:IRoomDesktop, _arg_8:Component)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._component = _arg_8;
            this._friendBar = _arg_5;
            this._toolBar = _arg_6;
            this._bubbles = new Map();
            this._localization = _arg_4;
            this._bubblesToShow = [];
            if (_arg_7)
            {
                this._roomTools = (_arg_7._Str_11511(RoomWidgetEnum.ROOM_TOOLS) as RoomToolsWidget);
                this._chatInput = (_arg_7._Str_11511(RoomWidgetEnum.CHAT_INPUT_WIDGET) as RoomChatInputWidget);
            }
            (_arg_2 as Component).context.addLinkEventTracker(this);
        }

        override public function dispose():void
        {
            var k:_Str_4171;
            if (disposed)
            {
                return;
            }
            if (this._bubbles)
            {
                for each (k in this._bubbles)
                {
                    k.dispose();
                    k = null;
                }
                this._bubbles.dispose();
                this._bubbles = null;
                this._bubblesToShow = null;
            }
            super.dispose();
        }

        private function _Str_15620(k:_Str_4171, _arg_2:Boolean=false):Rectangle
        {
            var _local_8:Rectangle;
            var _local_9:IWindowContainer;
            var _local_10:IWindow;
            var _local_11:Array;
            var _local_12:IWindowContainer;
            var _local_13:ITextFieldWindow;
            var _local_14:Rectangle;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            if (((!(k)) || (!(k._Str_5493()))))
            {
                return null;
            }
            var _local_3:String = k.getName();
            if (((_local_3 == "") || (!(_local_3))))
            {
                return null;
            }
            var _local_4:int = k._Str_5493().height;
            var _local_5:int = k._Str_5493().width;
            var _local_6:String = Direction.DOWN;
            var _local_7:int = -1;
            if (this._Str_9496)
            {
                _local_10 = this._Str_9496._Str_6621(_local_3);
                if (_local_10)
                {
                    _local_8 = new Rectangle();
                    _local_10.getGlobalRectangle(_local_8);
                    k._Str_16079(_local_10);
                }
            }
            if (this._Str_19402)
            {
                if (!_local_8)
                {
                    _local_9 = this._Str_19402.getIconLocation(_local_3);
                    if (_local_9)
                    {
                        _local_8 = new Rectangle();
                        _local_9.getGlobalRectangle(_local_8);
                        k._Str_16079((_local_9 as IWindow));
                    }
                }
            }
            if (!_local_8)
            {
                if (this._Str_19331)
                {
                    _local_10 = this._Str_19331.getIconLocation(_local_3);
                    if (_local_10)
                    {
                        _local_8 = new Rectangle();
                        _local_10.getGlobalRectangle(_local_8);
                        k._Str_16079(_local_10);
                    }
                }
            }
            if (!_local_8)
            {
                if (((this._Str_20546) && (_local_3 == UiHelpBubbleIconEnum.CHAT_INPUT)))
                {
                    _local_11 = this._Str_20546._Str_23678();
                    if (_local_11.length > 1)
                    {
                        _local_12 = (_local_11[0] as IWindowContainer);
                        _local_13 = (_local_11[1] as ITextFieldWindow);
                    }
                    _local_8 = _local_12.rectangle;
                    if (_local_8)
                    {
                        if (((_arg_2) && (_local_8)))
                        {
                            return _local_8;
                        }
                        _local_8.y = (_local_8.y - (_local_4 - 40));
                        _local_8.x = (_local_8.x + ((_local_8.width / 2) - 10));
                        k._Str_22662(_local_13);
                        k._Str_11739(_local_6, _local_7);
                        return _local_8;
                    }
                }
            }
            if (_local_8)
            {
                if (_arg_2)
                {
                    return _local_8;
                }
                _local_14 = _local_8.clone();
                _local_15 = 15;
                _local_16 = k._Str_5493().desktop.width;
                if ((_local_8.y - (_local_4 + _local_15)) < 50)
                {
                    _local_15 = 0;
                }
                _local_6 = Direction.DOWN;
                _local_7 = 0;
                _local_8.x = (_local_8.x + (_local_8.width / 2));
                _local_8.y = (_local_8.y - (_local_4 + _local_15));
                _local_17 = (_local_8.right - _local_14.right);
                if (_local_17 >= (_local_5 / 2))
                {
                    _local_17 = ((_local_5 / 2) - 25);
                }
                if (_local_8.y < _local_4)
                {
                    _local_8.y = (_local_8.y + ((_local_8.height + _local_4) + 10));
                    _local_6 = Direction.UP;
                    if (_local_17 <= 30)
                    {
                        _local_17 = (_local_17 / 3);
                    }
                    _local_7 = _local_17;
                    k._Str_11739(_local_6, _local_7);
                }
                if (_local_8.x < (_local_5 / 2))
                {
                    _local_8.x = 10;
                    _local_7 = (_local_7 - ((_local_5 / 2) - 30));
                    k._Str_11739(_local_6, _local_7);
                    return _local_8;
                }
                if ((_local_8.x + (_local_5 / 2)) > _local_16)
                {
                    _local_8.x = (_local_16 - (_local_5 / 2));
                    _local_7 = (_local_5 / 4);
                    k._Str_11739(_local_6, _local_7);
                    return _local_8;
                }
                k._Str_11739(_local_6, _local_7);
            }
            return _local_8;
        }

        public function _Str_17912():void
        {
            var _local_5:Point;
            if ((((!(this._bubblesToShow)) || (this._bubblesToShow.length == 0)) || (this._bubblesToShow.length < (this._bubbleIndex + 1))))
            {
                return;
            }
            var k:_Str_5419 = (this._bubblesToShow[this._bubbleIndex] as _Str_5419);
            var _local_2:* = (this._bubblesToShow.length > (this._bubbleIndex + 1));
            var _local_3:String = k.name;
            var _local_4:_Str_4171 = new _Str_4171(this, k, _local_2);
            if (this._bubbles.hasKey(_local_3))
            {
                this._Str_14683(_local_3);
            }
            var _local_6:Rectangle = this._Str_15620(_local_4);
            this._bubbleIndex++;
            if (_local_6)
            {
                _local_5 = new Point(_local_6.x, _local_6.y);
            }
            if (_local_5)
            {
                _local_4._Str_19842(_local_5);
                _local_4._Str_5493().desktop.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                _local_4._Str_21122(this._Str_15620(_local_4, true));
                this._Str_25089(_local_3, _local_4);
            }
            else
            {
                _local_4.dispose();
                this._Str_17912();
            }
        }

        private function _Str_25089(k:String, _arg_2:_Str_4171):void
        {
            if (((!(this._bubbles)) || (!(_arg_2))))
            {
                return;
            }
            this._bubbles.add(k, _arg_2);
        }

        public function _Str_14683(k:String):void
        {
            if (!this._bubbles)
            {
                return;
            }
            var _local_2:_Str_4171 = (this._bubbles.getValue(k) as _Str_4171);
            if (!_local_2)
            {
                return;
            }
            this._bubbles.remove(k);
            _local_2.dispose();
            this._Str_17912();
        }

        private function _Str_3630(k:WindowEvent=null):void
        {
            var _local_2:_Str_4171;
            var _local_3:Rectangle;
            var _local_4:Point;
            for each (_local_2 in this._bubbles)
            {
                _local_3 = this._Str_15620(_local_2);
                if (_local_3)
                {
                    _local_4 = new Point(_local_3.x, _local_3.y);
                    _local_2._Str_19842(_local_4);
                    _local_2._Str_21122(this._Str_15620(_local_2, true));
                }
            }
        }

        public function _Str_25030():void
        {
            var k:RoomWidgetMessage = new RoomWidgetScriptProceedMessage(RoomWidgetScriptProceedMessage.RWPM_ANSWER);
            if (messageListener)
            {
                messageListener.processWidgetMessage(k);
            }
        }

        public function get eventUrlPrefix():String
        {
            return "helpBubble/";
        }

        public function linkReceived(k:String):void
        {
            var _local_4:int;
            var _local_5:_Str_5419;
            var _local_6:int;
            var _local_7:String;
            var _local_8:String;
            if (!this._bubbles)
            {
                this._bubbles = new Map();
            }
            if (!this._bubblesToShow)
            {
                this._bubblesToShow = [];
            }
            var _local_2:Array = k.split("/");
            var _local_3:int = _local_2.length;
            if (_local_3 < 3)
            {
                return;
            }
            if (_local_2[1] == "add")
            {
                _local_4 = 0;
                _local_6 = 2;
                while (_local_6 < _local_3)
                {
                    _local_4++;
                    if (_local_4 == 1)
                    {
                        _local_5 = new _Str_5419();
                        _local_7 = _local_2[_local_6];
                        _local_8 = UiHelpBubbleIconEnum[_local_7];
                        if (!_local_8)
                        {
                            _local_8 = _local_7;
                        }
                        _local_5.name = _local_8;
                        _local_5._Str_16803 = true;
                    }
                    if (_local_4 == 2)
                    {
                        _local_5.text = this._localization.getLocalization(_local_2[_local_6], _local_2[_local_6]);
                        _local_4 = 0;
                        this._bubblesToShow.push(_local_5);
                    }
                    _local_6++;
                }
                this._Str_17912();
            }
            else
            {
                if (_local_2[1] == "remove")
                {
                    this._Str_14683(_local_2[2]);
                }
            }
        }

        public function get _Str_9496():IHabboToolbar
        {
            return this._toolBar;
        }

        public function get _Str_19402():IHabboFriendBarView
        {
            return this._friendBar;
        }

        public function get _Str_19331():RoomToolsWidget
        {
            return this._roomTools;
        }

        public function get _Str_20546():RoomChatInputWidget
        {
            return this._chatInput;
        }
    }
}
