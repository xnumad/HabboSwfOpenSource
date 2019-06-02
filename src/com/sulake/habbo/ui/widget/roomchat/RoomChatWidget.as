package com.sulake.habbo.ui.widget.roomchat
{
	import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.ui.widget.roomchat.style.ChatBubbleFactory;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Point;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.ui.handler.ChatWidgetHandler;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import flash.utils.getTimer;
    import com.sulake.habbo.ui.widget.events._Str_3535;
    import com.sulake.habbo.ui.widget.events._Str_3040;
    import flash.events.IEventDispatcher;
    import com.sulake.room.utils.RoomEnterEffect;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class RoomChatWidget extends ConversionTrackingWidget implements IUpdateReceiver 
    {
        private static var _Str_3867:ChatBubbleFactory = null;
        private static const _Str_3729:int = 19;
        private static const _Str_18120:int = 10;
        private static const _Str_12991:int = 20;
        private static const _Str_11054:int = 32;
        private static const _Str_16411:int = 25;
        private static const _Str_13238:int = 4000;
        private static const _Str_17591:int = 6000;
        private static const _Str_17318:int = 3;
        private static const _Str_17488:int = 1;
        private static const _Str_16314:int = 8;
        private static const _Str_15627:int = 10;
        private static const _Str_11205:int = 12;
        private static const _Str_6970:int = 0;
        private static const _Str_17792:int = (((_Str_16314 + _Str_6970) * _Str_3729) + _Str_3729);//171
        private static const _Str_18733:int = (((_Str_15627 + _Str_6970) * _Str_3729) + _Str_3729);//209
        private static const _Str_17276:int = (((_Str_11205 + _Str_6970) * _Str_3729) + _Str_3729);//247
        private static const _Str_6383:int = 23;
        private static const _Str_18228:int = 40;
        private static const _Str_6198:uint = 1;
        private static const _Str_17685:int = 750;
        private static const _Str_16222:int = 1000;

        private var _Str_10568:int = 0;
        private var _Str_8808:int = 0;
        private var _Str_2496:IWindowContainer;
        private var _Str_4396:IItemListWindow;
        private var _Str_3454:IWindowContainer;
        private var _Str_2338:Array;
        private var _Str_3107:Array;
        private var _Str_4125:Array;
        private var _Str_11471:int;
        private var _Str_20565:int = 0;
        private var _Str_7136:Number = 1;
        private var _Str_4567:String;
        private var _Str_7184:Number = 1;
        private var _Str_16304:Number = 0;
        private var _Str_7165:Point;
        private var _Str_2701:RoomChatHistoryViewer;
        private var _gpuMode:Boolean = false;
        private var _Str_17185:Boolean = false;
        private var _Str_2296:Component = null;
        private var _configurationManager:IHabboConfigurationManager;
        private var _Str_19219:int = 150;
        private var _Str_3991:int;
        private var _Str_9513:int = 19;
        private var _Str_24033:int = 100;
        private var _Str_25154:int = 205;
        private var _Str_8959:int;
        private var _Str_11243:int;

        public function RoomChatWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager, _arg_6:int, _arg_7:Component)
        {
            this._Str_2338 = new Array();
            this._Str_3107 = new Array();
            this._Str_4125 = new Array();
            this._Str_7165 = new Point();
            super(k, _arg_2, _arg_3, _arg_4);
            (k as ChatWidgetHandler).widget = this;
            this._configurationManager = _arg_5;
            this._Str_11471 = _arg_6;
            var _local_8:IDesktopWindow = _arg_2.getDesktop(_Str_6198);
            if (_local_8.height >= _Str_16222)
            {
                this._Str_8959 = _Str_17276;
                this._Str_11243 = _Str_11205;
                Logger.log("Hi-res chat desktop selected");
            }
            else
            {
                if (_local_8.height >= _Str_17685)
                {
                    this._Str_8959 = _Str_18733;
                    this._Str_11243 = _Str_15627;
                    Logger.log("Mid-res chat desktop selected");
                }
                else
                {
                    this._Str_8959 = _Str_17792;
                    this._Str_11243 = _Str_11205;
                    Logger.log("Lo-res chat desktop selected");
                }
            }
            this._Str_3991 = (this._Str_8959 + _Str_6383);
            this._Str_2496 = (_arg_2.createWindow("chat_container", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, WindowParam.WINDOW_PARAM_NULL, new Rectangle(0, 0, 200, (this._Str_3991 + RoomChatHistoryPulldown._Str_3788)), null, 0) as IWindowContainer);
            this._Str_2496.background = true;
            this._Str_2496.color = 33554431;
            this._Str_2496.tags.push("room_widget_chat");
            this._Str_4396 = (_arg_2.createWindow("chat_contentlist", "", WindowType.WINDOW_TYPE_ITEMLIST_VERTICAL, _Str_3108.NULL, (WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT | WindowParam.WINDOW_PARAM_RELATIVE_SCALE_STRETCH), new Rectangle(0, 0, 200, this._Str_3991), null, 0) as IItemListWindow);
            this._Str_4396.disableAutodrag = true;
            this._Str_2496.addChild(this._Str_4396);
            this._Str_3454 = (_arg_2.createWindow("chat_active_content", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.NULL, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, new Rectangle(0, 0, 200, this._Str_3991), null, 0) as IWindowContainer);
            this._Str_3454.clipping = false;
            this._Str_4396.addListItem(this._Str_3454);
            this._Str_2701 = new RoomChatHistoryViewer(this, _arg_2, this._Str_2496, _arg_3);
            this._Str_4567 = _arg_5.getProperty("site.url");
            this._Str_19219 = _arg_5.getInteger("chat.history.item.max.count", 150);
            var _local_9:Boolean = ((_arg_5.getBoolean("chat.history.disabled")) || (this.isGameSession));
            if (this._Str_2701 != null)
            {
                this._Str_2701.disabled = _local_9;
            }
            if (_arg_7 != null)
            {
                this._Str_2296 = _arg_7;
                this._Str_2296.registerUpdateReceiver(this, 1);
            }
            if (!_Str_3867)
            {
                _Str_3867 = new ChatBubbleFactory(_arg_3, _arg_2, XML(_assets.getAssetByName("roomchat_styles_chatstyles_xml").content));
            }
        }

        public static function get _Str_5827():ChatBubbleFactory
        {
            return _Str_3867;
        }


        override public function get mainWindow():IWindow
        {
            return this._Str_2496;
        }

        public function get config():IHabboConfigurationManager
        {
            return this._configurationManager;
        }

        public function get handler():ChatWidgetHandler
        {
            return _Str_2470 as ChatWidgetHandler;
        }

        override public function dispose():void
        {
            var k:RoomChatItem;
            var _local_2:int;
            if (disposed)
            {
                return;
            }
            while (this._Str_4125.length > 0)
            {
                k = this._Str_4125.shift();
            }
            this._Str_2701.dispose();
            this._Str_2701 = null;
            while (this._Str_2338.length > 0)
            {
                k = this._Str_2338.shift();
                k.dispose();
            }
            while (this._Str_3107.length > 0)
            {
                k = this._Str_3107.shift();
                k.dispose();
            }
            this._Str_2496.dispose();
            if (this._Str_2296 != null)
            {
                this._Str_2296.removeUpdateReceiver(this);
                this._Str_2296 = null;
            }
            super.dispose();
        }

        public function update(k:uint):void
        {
            var _local_2:int;
            if (((getTimer() > this._Str_10568) && (this._Str_10568 > 0)))
            {
                this._Str_10568 = -1;
                this._Str_22131();
            }
            if (this._gpuMode)
            {
                _local_2 = ((k / _Str_16411) * _Str_17318);
                if ((_local_2 + this._Str_8808) > this._Str_9513)
                {
                    _local_2 = (this._Str_9513 - this._Str_8808);
                }
                if (_local_2 > 0)
                {
                    this._Str_20086(_local_2);
                    this._Str_8808 = (this._Str_8808 + _local_2);
                }
                if (this._Str_8808 >= this._Str_9513)
                {
                    this._Str_9513 = _Str_3729;
                    this._Str_8808 = 0;
                    this._Str_21950();
                    this._Str_19076();
                    this._Str_10568 = (getTimer() + _Str_13238);
                }
            }
            if (this._Str_2701 != null)
            {
                this._Str_2701.update(k);
            }
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3535.RWCUE_EVENT_CHAT, this._Str_21452);
            k.addEventListener(_Str_3040.RWRVUE_ROOM_VIEW_SIZE_CHANGED, this._Str_8873);
            k.addEventListener(_Str_3040.RWRVUE_ROOM_VIEW_POSITION_CHANGED, this._Str_8873);
            k.addEventListener(_Str_3040.RWRVUE_ROOM_VIEW_SCALE_CHANGED, this._Str_8873);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3535.RWCUE_EVENT_CHAT, this._Str_21452);
            k.removeEventListener(_Str_3040.RWRVUE_ROOM_VIEW_SIZE_CHANGED, this._Str_8873);
            k.removeEventListener(_Str_3040.RWRVUE_ROOM_VIEW_POSITION_CHANGED, this._Str_8873);
            k.removeEventListener(_Str_3040.RWRVUE_ROOM_VIEW_SCALE_CHANGED, this._Str_8873);
        }

        private function _Str_21452(k:_Str_3535):void
        {
            if (((RoomEnterEffect.isRunning()) && (!(k.chatType == _Str_3535.CHAT_TYPE_WHISPER))))
            {
                return;
            }
            var _local_2:RoomChatItem = new RoomChatItem(this, windowManager, assets, this._Str_22070(), localizations, this._Str_4567);
            _local_2._Str_13182(k);
            this._Str_21167(_local_2);
        }

        public function _Str_5863(k:String, _arg_2:String, _arg_3:int, _arg_4:BitmapData, _arg_5:uint, _arg_6:Boolean):void
        {
            var _local_7:RoomChatItem = new RoomChatItem(this, windowManager, assets, this._Str_22070(), localizations, this._Str_4567);
            _local_7.message = k;
            _local_7.senderName = _arg_2;
            _local_7._Str_7368 = _arg_3;
            _local_7._Str_25766 = _arg_4;
            _local_7._Str_23108 = _arg_5;
            if (_arg_6)
            {
                _local_7.chatType = _Str_3535._Str_15836;
            }
            _local_7._Str_13126();
            this._Str_21167(_local_7);
        }

        private function _Str_21167(k:RoomChatItem):void
        {
            if (this._Str_7184 != 1)
            {
                k._Str_7368 = (k._Str_7368 / this._Str_7184);
            }
            k._Str_7368 = (k._Str_7368 - this._Str_7165.x);
            this._Str_14645(k);
            this._Str_3107.push(k);
            this._Str_19076();
        }

        private function _Str_8873(k:_Str_3040):void
        {
            var _local_2:Rectangle = k.rect;
            if (k.scale > 0)
            {
                if (this._Str_16304 == 0)
                {
                    this._Str_16304 = k.scale;
                }
                else
                {
                    this._Str_7184 = (k.scale / this._Str_16304);
                }
            }
            if (k._Str_17974 != null)
            {
                this._Str_7165.x = (this._Str_7165.x + (k._Str_17974.x / this._Str_7184));
                this._Str_7165.y = (this._Str_7165.y + (k._Str_17974.y / this._Str_7184));
            }
            if (k.rect != null)
            {
                if (this._Str_2701 == null)
                {
                    return;
                }
                this._Str_2496.width = _local_2.width;
                this._Str_2496.height = (this._Str_3991 + this._Str_2701._Str_22103);
                this._Str_4396.width = (this._Str_2496.width - this._Str_2701._Str_10683);
                this._Str_4396.height = this._Str_3991;
                this._Str_4396.x = this._Str_2496.x;
                this._Str_4396.y = this._Str_2496.y;
                this._Str_3454.width = (this._Str_2496.width - this._Str_2701._Str_10683);
                this._Str_3454.height = this._Str_3991;
                if (this._Str_3910())
                {
                    this._Str_20247();
                }
                this._Str_2701._Str_8958(this._Str_2496.rectangle, true);
            }
            this._Str_12615();
        }

        private function _Str_19076():void
        {
            if (this._gpuMode)
            {
                return;
            }
            if (this._Str_3107.length == 0)
            {
                return;
            }
            while (((this._Str_3107.length > _Str_17488) || ((this._Str_3910()) && (this._Str_3107.length > 0))))
            {
                this._Str_20317();
            }
            var k:Boolean;
            if (this._Str_2338.length == 0)
            {
                k = true;
            }
            else
            {
                k = this._Str_16477(this._Str_3107[0]);
            }
            if (k)
            {
                this._Str_20317();
                this._Str_10568 = (getTimer() + _Str_13238);
            }
            else
            {
                if (((this._Str_2338.length > 0) && (this._Str_3107.length > 0)))
                {
                    this._Str_9513 = this._Str_9323(this._Str_2338[(this._Str_2338.length - 1)], this._Str_3107[0]);
                }
                else
                {
                    this._Str_9513 = _Str_3729;
                }
                this._Str_22131();
            }
        }

        private function _Str_20317():void
        {
            var k:RoomChatItem;
            var _local_2:IWindowContainer;
            var _local_3:int;
            if (this._Str_3107.length == 0)
            {
                return;
            }
            if (this._Str_23927())
            {
                this._Str_8599();
                this._Str_7189();
            }
            if (!this._Str_16477(this._Str_3107[0]))
            {
                this._Str_19863();
                this._Str_20086(this._Str_9323(this._Str_2338[(this._Str_2338.length - 1)], this._Str_3107[0]));
                if (!this._Str_16477(this._Str_3107[0]))
                {
                    this._Str_3454.height = (this._Str_3454.height + _Str_3729);
                    if (this._Str_2701 != null)
                    {
                        this._Str_2701._Str_8958(this._Str_2496.rectangle);
                    }
                }
            }
            k = this._Str_3107.shift();
            if (k != null)
            {
                k._Str_13126();
                _local_2 = k.view;
                if (_local_2 != null)
                {
                    this._Str_3454.addChild(_local_2);
                    k.timeStamp = new Date().time;
                    this._Str_2338.push(k);
                    _local_3 = 0;
                    if (this._Str_2338.length > 1)
                    {
                        _local_3 = this._Str_2338[(this._Str_2338.length - 2)].screenLevel;
                        if (this._Str_3910())
                        {
                            k.screenLevel = (_local_3 + 1);
                        }
                        else
                        {
                            k.screenLevel = (_local_3 + Math.max(this._Str_7136, 1));
                        }
                    }
                    else
                    {
                        k.screenLevel = 100;
                    }
                    k.aboveLevels = this._Str_7136;
                    if (k.aboveLevels > ((this._Str_11243 + _Str_6970) + 2))
                    {
                        k.aboveLevels = ((this._Str_11243 + _Str_6970) + 2);
                    }
                    this._Str_7136 = 0;
                    this._Str_14645(k);
                    this._Str_19662(k);
                    this._Str_19620(k);
                }
            }
        }

        private function _Str_16477(k:RoomChatItem):Boolean
        {
            if (this._Str_2338.length == 0)
            {
                return true;
            }
            var _local_2:RoomChatItem = this._Str_2338[(this._Str_2338.length - 1)];
            if (((k == null) || (_local_2 == null)))
            {
                return false;
            }
            if (_local_2.view == null)
            {
                return true;
            }
            if (((this._Str_3454.bottom - ((this._Str_3454.y + _local_2.y) + _local_2.height)) - _Str_6383) <= this._Str_9323(_local_2, k))
            {
                return false;
            }
            return true;
        }

        public function _Str_12615():void
        {
            var k:int;
            var _local_2:RoomChatItem;
            var _local_3:IWindowContainer;
            if (this._Str_2701 == null)
            {
                return;
            }
            k = (this._Str_2338.length - 1);
            while (k >= 0)
            {
                _local_2 = this._Str_2338[k];
                if (_local_2 != null)
                {
                    this._Str_14645(_local_2);
                    this._Str_19662(_local_2);
                }
                k--;
            }
            k = 0;
            while (k < this._Str_2338.length)
            {
                _local_2 = this._Str_2338[k];
                if (_local_2 != null)
                {
                    this._Str_19620(_local_2);
                }
                k++;
            }
            k = 0;
            while (k < this._Str_3107.length)
            {
                _local_2 = this._Str_3107[k];
                if (_local_2 != null)
                {
                    this._Str_14645(_local_2);
                }
                k++;
            }
        }

        private function _Str_22131():void
        {
            if (this._gpuMode)
            {
                return;
            }
            this._Str_19863();
            this._gpuMode = true;
        }

        private function _Str_21950():void
        {
            this._gpuMode = false;
        }

        private function _Str_19863():void
        {
            var _local_4:RoomChatItem;
            if (this._gpuMode)
            {
                return;
            }
            this._Str_19458();
            this._Str_4125 = new Array();
            var k:int = new Date().time;
            var _local_2:int;
            if (this._Str_2338.length == 0)
            {
                this._Str_7136 = 1;
                return;
            }
            if (this._Str_3910())
            {
                return;
            }
            this._Str_7136++;
            var _local_3:int = (this._Str_2338.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = this._Str_2338[_local_3];
                if (_local_4.view != null)
                {
                    if ((((_local_4.screenLevel > _Str_6970) || (_local_4.screenLevel == (_local_2 - 1))) || ((k - _local_4.timeStamp) >= _Str_17591)))
                    {
                        _local_4.timeStamp = k;
                        _local_2 = _local_4.screenLevel;
                        _local_4.screenLevel--;
                        this._Str_4125.push(_local_4);
                    }
                }
                _local_3--;
            }
        }

        private function _Str_20086(k:int):void
        {
            var _local_3:Boolean;
            if (this._Str_4125 == null)
            {
                return;
            }
            if (this._Str_4125.length == 0)
            {
                return;
            }
            var _local_2:RoomChatItem;
            var _local_4:int = -1;
            var _local_5:int = (this._Str_4125.length - 1);
            while (_local_5 >= 0)
            {
                _local_2 = this._Str_4125[_local_5];
                if (_local_2 != null)
                {
                    if (_local_4 == -1)
                    {
                        _local_4 = this._Str_2338.indexOf(_local_2);
                    }
                    else
                    {
                        _local_4++;
                    }
                    _local_3 = true;
                    if (this._Str_3910())
                    {
                        if (((_local_2.y - k) + _local_2.height) < 0)
                        {
                            _local_3 = false;
                        }
                    }
                    if (_local_4 > 0)
                    {
                        if (this._Str_2338[(_local_4 - 1)].view != null)
                        {
                            if (((_local_2.y - k) - this._Str_2338[(_local_4 - 1)].y) < this._Str_9323(this._Str_2338[(_local_4 - 1)], _local_2))
                            {
                                _local_3 = false;
                            }
                        }
                    }
                    if (_local_3)
                    {
                        _local_2.y = (_local_2.y - k);
                    }
                }
                _local_5--;
            }
        }

        private function _Str_14645(k:RoomChatItem):void
        {
            var _local_9:Number;
            var _local_10:Number;
            if (((k == null) || (this._Str_2701 == null)))
            {
                return;
            }
            var _local_2:Number = ((k._Str_7368 + this._Str_7165.x) * this._Str_7184);
            var _local_3:Number = (_local_2 - (k.width / 2));
            var _local_4:Number = (_local_3 + k.width);
            var _local_5:Number = (((-(this._Str_2496.width) / 2) - _Str_12991) + this._Str_24033);
            var _local_6:Number = ((((this._Str_2496.width / 2) + _Str_12991) - this._Str_2701._Str_10683) - this._Str_25154);
            var _local_7:Boolean = ((_local_3 >= _local_5) && (_local_3 <= _local_6));
            var _local_8:Boolean = ((_local_4 >= _local_5) && (_local_4 <= _local_6));
            if (((_local_7) && (_local_8)))
            {
                _local_9 = _local_3;
                _local_10 = _local_9;
            }
            else
            {
                if (_local_2 >= 0)
                {
                    _local_9 = (_local_6 - k.width);
                }
                else
                {
                    _local_9 = _local_5;
                }
            }
            k.x = ((_local_9 + (this._Str_2496.width / 2)) + this._Str_2496.x);
            if (((_local_2 < _local_5) || (_local_2 > _local_6)))
            {
                k._Str_22279();
            }
            else
            {
                k._Str_23410((_local_3 - _local_9));
            }
        }

        private function _Str_19662(k:RoomChatItem):void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_4:Number;
            if (k != null)
            {
                _local_2 = this._Str_2338.indexOf(k);
                _local_3 = ((this._Str_3910()) ? 0 : this._Str_7136);
                if (_local_2 == (this._Str_2338.length - 1))
                {
                    k.y = ((this._Str_23166() - ((_local_3 + 1) * _Str_3729)) - _Str_6383);
                }
                else
                {
                    _local_4 = this._Str_2338[(_local_2 + 1)].aboveLevels;
                    if (_local_4 < 2)
                    {
                        k.y = (this._Str_2338[(_local_2 + 1)].y - this._Str_9323(k, this._Str_2338[(_local_2 + 1)]));
                    }
                    else
                    {
                        k.y = (this._Str_2338[(_local_2 + 1)].y - (_local_4 * _Str_3729));
                    }
                }
            }
        }

        private function _Str_19620(k:RoomChatItem):void
        {
            if (k != null)
            {
                if (k.y < -(_Str_11054))
                {
                    if (k.view != null)
                    {
                        this._Str_3454.removeChild(k.view);
                        k._Str_5574();
                    }
                }
                else
                {
                    if (k.view == null)
                    {
                        k._Str_13126();
                        if (k.view != null)
                        {
                            this._Str_3454.addChild(k.view);
                        }
                    }
                }
            }
        }

        public function _Str_17890():int
        {
            var k:RoomChatItem;
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < this._Str_2338.length)
            {
                k = this._Str_2338[_local_3];
                if (k != null)
                {
                    if (_local_3 == 0)
                    {
                        _local_2 = (_local_2 + _Str_3729);
                    }
                    else
                    {
                        _local_2 = (_local_2 + this._Str_9323(this._Str_2338[(_local_3 - 1)], k));
                    }
                    _local_2 = (_local_2 + ((k.aboveLevels - 1) * _Str_3729));
                }
                _local_3++;
            }
            return _local_2;
        }

        private function _Str_23166():Number
        {
            if (this._Str_3910())
            {
                return this._Str_3454.height;
            }
            return this._Str_3991 + this._Str_2496.y;
        }

        private function _Str_9323(k:RoomChatItem, _arg_2:RoomChatItem):Number
        {
            var _local_3:int = _Str_5827._Str_24902(k._Str_24439);
            if (k._Str_23373(_local_3, _arg_2.x, k.y, _arg_2.width, _arg_2.height))
            {
                return _Str_3729;
            }
            return _Str_18120;
        }

        private function _Str_19458():void
        {
            var _local_2:RoomChatItem;
            if (this._Str_3910())
            {
                return;
            }
            var k:int;
            var _local_3:int;
            while (this._Str_2338.length > this._Str_19219)
            {
                _local_2 = this._Str_2338.shift();
                _local_3 = this._Str_4125.indexOf(_local_2);
                if (_local_3 > -1)
                {
                    this._Str_4125.splice(_local_3, 1);
                }
                if (_local_2.view != null)
                {
                    this._Str_3454.removeChild(_local_2.view);
                    _local_2._Str_5574();
                }
                _local_2.dispose();
                _local_2 = null;
            }
            var _local_4:Boolean;
            k = 0;
            while (k < this._Str_2338.length)
            {
                _local_2 = this._Str_2338[k];
                if (_local_2 != null)
                {
                    if (_local_2.y <= -(_Str_11054))
                    {
                        _local_2.aboveLevels = 1;
                        if (_local_2.view != null)
                        {
                            _local_3 = this._Str_4125.indexOf(_local_2);
                            if (_local_3 > -1)
                            {
                                this._Str_4125.splice(_local_3, 1);
                            }
                            this._Str_3454.removeChild(_local_2.view);
                            _local_2._Str_5574();
                        }
                    }
                    else
                    {
                        _local_4 = true;
                        break;
                    }
                }
                k++;
            }
            if (this._Str_3107.length > 0)
            {
                _local_4 = true;
            }
            if ((((this._Str_17890() > _Str_3729) && (!(_local_4))) && (!(this._Str_3910()))))
            {
                if (this._Str_2701 != null)
                {
                    this._Str_16224(this._Str_2496.y);
                    this._Str_12615();
                    if (!this._Str_3910())
                    {
                        this._Str_2701._Str_18199();
                    }
                    if (!this._Str_17277())
                    {
                        this._Str_2701.visible = true;
                    }
                }
            }
            else
            {
                if (this._Str_17277())
                {
                    this._Str_2701.visible = false;
                }
            }
        }

        private function _Str_22070():String
        {
            return (("chat_" + this._Str_11471.toString()) + "_item_") + this._Str_20565++.toString();
        }

        public function _Str_22991(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:WindowMouseEvent):void
        {
            if (_arg_5.shiftKey)
            {
                if (this._Str_2701 != null)
                {
                    this._Str_2701._Str_24994();
                }
                return;
            }
            var _local_6:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_INFO, k, _arg_3);
            messageListener.processWidgetMessage(_local_6);
            var _local_7:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.RWCSAM_MESSAGE_SELECT_AVATAR, k, _arg_2, _arg_4);
            messageListener.processWidgetMessage(_local_7);
        }

        public function _Str_24206(k:int, _arg_2:int, _arg_3:int, _arg_4:WindowMouseEvent):void
        {
            if (this._Str_17277())
            {
                return;
            }
            if (this._Str_2701 != null)
            {
                this._Str_2701._Str_19757(_arg_4.stageY, true);
            }
        }

        public function _Str_22868(k:int, _arg_2:int, _arg_3:int, _arg_4:WindowMouseEvent):void
        {
        }

        public function _Str_25858(k:int, _arg_2:int, _arg_3:int, _arg_4:WindowMouseEvent):void
        {
        }

        public function _Str_12979(k:WindowMouseEvent):void
        {
            if (this._Str_2701 != null)
            {
                this._Str_2701._Str_19757(k.stageY, true);
            }
        }

        public function _Str_24607(k:WindowMouseEvent):void
        {
            if (this._Str_2701 != null)
            {
                this._Str_2701._Str_7189();
            }
        }

        public function _Str_23426(k:Number):void
        {
            var _local_2:Number = ((this._Str_2496.bottom + k) - RoomChatHistoryPulldown._Str_3788);
            this._Str_16224(_local_2);
        }

        public function _Str_16224(k:Number):void
        {
            var _local_2:int = ((this._Str_2496.context.getDesktopWindow().height - RoomChatHistoryPulldown._Str_3788) - _Str_18228);
            k = Math.min(k, _local_2);
            this._Str_3991 = (k - this._Str_2496.y);
            this._Str_2496.height = (this._Str_3991 + RoomChatHistoryPulldown._Str_3788);
            if (this._Str_2701 != null)
            {
                this._Str_2701._Str_8958(this._Str_2496.rectangle);
            }
        }

        public function _Str_8599(k:Boolean=true):void
        {
            if (this._Str_2701 == null)
            {
                return;
            }
            this._Str_21950();
            this._Str_3991 = (this._Str_8959 + _Str_6383);
            this._Str_2496.height = (this._Str_3991 + this._Str_2701._Str_22103);
            this._Str_4396.width = (this._Str_2496.width - this._Str_2701._Str_10683);
            this._Str_4396.height = this._Str_3991;
            this._Str_3454.width = (this._Str_2496.width - this._Str_2701._Str_10683);
            if (this._Str_3910())
            {
                this._Str_3454.height = (this._Str_17890() + _Str_6383);
            }
            else
            {
                this._Str_3454.height = this._Str_3991;
            }
            this._Str_4396.scrollV = 1;
            if (!this._Str_3910())
            {
                this._Str_2701._Str_8958(this._Str_2496.rectangle);
            }
            this._Str_19458();
            if (((this._Str_3910()) || (k)))
            {
                this._Str_12615();
            }
        }

        private function _Str_3910():Boolean
        {
            return (this._Str_2701 == null) ? false : this._Str_2701.active;
        }

        private function _Str_17277():Boolean
        {
            return (this._Str_2701 == null) ? false : this._Str_2701.visible;
        }

        public function _Str_7189():void
        {
            if (this._Str_2701 != null)
            {
                this._Str_2701._Str_7189();
            }
        }

        private function _Str_23927():Boolean
        {
            return this._Str_4396.height <= 1;
        }

        public function _Str_23995():void
        {
            var _local_4:RoomChatItem;
            var k:int;
            var _local_2:int;
            while (_local_2 < this._Str_2338.length)
            {
                _local_4 = this._Str_2338[_local_2];
                if (_local_4.y > k)
                {
                    k = _local_4.y;
                }
                _local_2++;
            }
            _local_2 = 0;
            while (_local_2 < this._Str_3107.length)
            {
                _local_4 = this._Str_3107[_local_2];
                if (_local_4.y > k)
                {
                    k = _local_4.y;
                }
                _local_2++;
            }
            k = (k + _Str_11054);
            k = ((k < 0) ? 0 : k);
            var _local_3:int = this._Str_2496.bottom;
            this._Str_16224((this._Str_2496.top + k));
            _local_3 = (_local_3 - this._Str_2496.bottom);
            if (Math.abs(_local_3) < RoomChatHistoryViewer._Str_14515)
            {
                this._Str_8599();
                return;
            }
            _local_2 = 0;
            while (_local_2 < this._Str_2338.length)
            {
                _local_4 = this._Str_2338[_local_2];
                _local_4.y = (_local_4.y + _local_3);
                _local_2++;
            }
            _local_2 = 0;
            while (_local_2 < this._Str_3107.length)
            {
                _local_4 = this._Str_3107[_local_2];
                _local_4.y = (_local_4.y + _local_3);
                _local_2++;
            }
            this._Str_17185 = true;
        }

        public function _Str_20437():void
        {
            this._Str_4396.stopDragging();
            var k:Number = (this._Str_2496.bottom - RoomChatHistoryPulldown._Str_3788);
            if (k < this._Str_8959)
            {
                if (k <= (this._Str_3991 + this._Str_2496.y))
                {
                    if (this._Str_3910())
                    {
                        this._Str_7189();
                    }
                    this._Str_8599();
                    return;
                }
            }
            if (((this._Str_17185) && (!(this._Str_3910()))))
            {
                this._Str_8599();
                this._Str_17185 = false;
            }
        }

        public function _Str_20247():void
        {
            if (this._Str_3910())
            {
                this._Str_3454.height = (this._Str_17890() + _Str_6383);
                this._Str_12615();
            }
        }

        public function _Str_25376():void
        {
            var _local_2:int;
            var k:RoomChatItem;
            _local_2 = 0;
            while (_local_2 < this._Str_2338.length)
            {
                k = this._Str_2338[_local_2];
                k._Str_16939();
                _local_2++;
            }
            _local_2 = 0;
            while (_local_2 < this._Str_3107.length)
            {
                k = this._Str_3107[_local_2];
                k._Str_16939();
                _local_2++;
            }
        }

        public function _Str_25298():void
        {
            var _local_2:int;
            var k:RoomChatItem;
            _local_2 = 0;
            while (_local_2 < this._Str_2338.length)
            {
                k = this._Str_2338[_local_2];
                k._Str_22093();
                _local_2++;
            }
            _local_2 = 0;
            while (_local_2 < this._Str_3107.length)
            {
                k = this._Str_3107[_local_2];
                k._Str_22093();
                _local_2++;
            }
        }

        public function get isGameSession():Boolean
        {
            return this.handler.container.roomSession.isGameSession;
        }

        public function removeItem(k:RoomChatItem):void
        {
            var _local_2:int;
            _local_2 = this._Str_2338.indexOf(k);
            if (_local_2 > -1)
            {
                this._Str_2338.splice(_local_2, 1);
            }
            _local_2 = this._Str_4125.indexOf(k);
            if (_local_2 > -1)
            {
                this._Str_4125.splice(_local_2, 1);
            }
            if (k.view != null)
            {
                this._Str_3454.removeChild(k.view);
                k._Str_5574();
            }
            k.dispose();
            this._Str_8599(false);
        }
    }
}
