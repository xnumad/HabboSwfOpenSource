package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Point;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.core.window.motion.Queue;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.MoveTo;
    import com.sulake.core.window.motion.Callback;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetZoomToggleMessage;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.system.System;

    public class RoomToolsToolbarCtrl extends RoomToolsCtrlBase 
    {
        private static const _Str_18592:int = 1;
        private static const _Str_12959:int = -130;

        private var _roomToolsHistory:RoomToolsHistory;

        public function RoomToolsToolbarCtrl(k:RoomToolsWidget, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
            _window = (_arg_2.buildFromXML((_arg_3.getAssetByName("room_tools_toolbar_xml").content as XML)) as IWindowContainer);
            _window.procedure = this._Str_3061;
            _window.addEventListener(WindowMouseEvent.OVER, this._Str_3061);
            _window.addEventListener(WindowMouseEvent.OUT, this._Str_3061);
            this._Str_17459();
        }

        override public function dispose():void
        {
            if (this._roomToolsHistory)
            {
                this._roomToolsHistory.dispose();
                this._roomToolsHistory = null;
            }
            var k:IWindowContainer = (_Str_2268.windowManager.getWindowByName("share_room_link") as IWindowContainer);
            if (k)
            {
                k.dispose();
            }
            super.dispose();
        }

        public function _Str_20713():void
        {
            if (_Str_2268.currentRoomIndex >= (_Str_2268.visitedRooms.length - 1))
            {
                _window.findChildByName("button_history_forward").disable();
            }
            else
            {
                _window.findChildByName("button_history_forward").enable();
            }
            if (_Str_2268.currentRoomIndex == 0)
            {
                _window.findChildByName("button_history_back").disable();
            }
            else
            {
                _window.findChildByName("button_history_back").enable();
            }
            if (_Str_2268.visitedRooms.length <= 1)
            {
                _window.findChildByName("button_history").disable();
            }
            else
            {
                _window.findChildByName("button_history").enable();
            }
        }

        public function _Str_18755():void
        {
            _window.findChildByName("button_history_forward").disable();
            _window.findChildByName("button_history_back").disable();
        }

        private function _Str_24287():void
        {
            if (this._roomToolsHistory)
            {
                this._roomToolsHistory.dispose();
                this._roomToolsHistory = null;
            }
            else
            {
                this._roomToolsHistory = new RoomToolsHistory(_Str_2277, _assets, handler);
                this._roomToolsHistory.populate(_Str_2268.visitedRooms);
                this._Str_3714();
            }
        }

        public function _Str_24545(k:Boolean):void
        {
            this.setElementVisible("button_chat_history", k);
        }

        public function _Str_23347(k:Boolean):void
        {
            this.setElementVisible("button_camera", k);
        }

        public function _Str_21132(k:Boolean):void
        {
            this.setElementVisible("button_like", k);
        }

        override public function setElementVisible(k:String, _arg_2:Boolean):void
        {
            if (!window)
            {
                return;
            }
            window.visible = true;
            super.setElementVisible(k, _arg_2);
            this._Str_3714();
        }

        public function _Str_3714():void
        {
            var k:IWindow;
            var _local_2:IWindow;
            var _local_3:IItemListWindow;
            var _local_4:IWindow;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IWindow;
            if (_Str_3510)
            {
                k = window.findChildByName("side_bar_expand");
                k.y = (window.height - k.height);
            }
            else
            {
                _local_2 = window.findChildByName("arrow_collapse");
                _local_3 = (window.findChildByName("itemlist_buttons") as IItemListWindow);
                _local_4 = window.findChildByName("side_bar_collapse");
                _local_5 = 0;
                _local_6 = 0;
                while (_local_6 < _local_3.numListItems)
                {
                    _local_7 = _local_3.getListItemAt(_local_6);
                    if (_local_7.visible)
                    {
                        _local_5 = (_local_5 + _local_7.height);
                    }
                    _local_6++;
                }
                _local_4.height = _local_5;
                window.height = (_local_3.height = (window.findChildByName("window_bg").height = _local_5));
                _local_2.y = ((_local_5 * 0.5) - (_local_2.height * 0.5));
            }
            window.position = new Point(_Str_10400, ((window.desktop.height - _Str_15557) - window.height));
            if (this._roomToolsHistory)
            {
                this._roomToolsHistory.window.position = new Point((this.right - this._roomToolsHistory.window.width), (window.position.y - this._roomToolsHistory.window.height));
            }
        }

        override public function setCollapsed(k:Boolean):void
        {
            var _local_2:Motion;
            if (((_Str_3510 == k) || (!(window))))
            {
                return;
            }
            _Str_3510 = k;
            var _local_3:IWindow = window.findChildByName("window_bg");
            if (!_local_3)
            {
                return;
            }
            if (_Str_3510)
            {
                _local_2 = new Queue(new EaseOut(new MoveTo(_local_3, _Str_7674, _Str_12959, _local_3.y), 1), new Callback(this._Str_9372));
            }
            else
            {
                _local_3.x = _Str_12959;
                this._Str_17459();
                _local_2 = new EaseOut(new MoveTo(_local_3, _Str_7674, _Str_18592, _local_3.y), 1);
            }
            Motions._Str_4598(_local_2);
        }

        private function _Str_9372(k:Motion):void
        {
            this._Str_17459();
        }

        private function _Str_17459():void
        {
            if (((!(window)) || (!(window.findChildByName("window_bg")))))
            {
                return;
            }
            window.findChildByName("window_bg").visible = (!(_Str_3510));
            window.findChildByName("side_bar_collapse").visible = (!(_Str_3510));
            window.findChildByName("side_bar_expand").visible = _Str_3510;
            this._Str_3714();
        }

        private function _Str_3061(event:WindowEvent, target:IWindow):void
        {
            var link:String;
            var window:IWindowContainer;
            var openCameraEvent:HabboToolbarEvent;
            var message:RoomWidgetZoomToggleMessage;
            var asset:XML;
            if (((((event.type == WindowEvent.WINDOW_EVENT_PARENT_RESIZED) && (window)) && (window.parent)) && (event.target == window.parent)))
            {
                return this._Str_3714();
            }
            switch (event.type)
            {
                case WindowMouseEvent.CLICK:
                    _Str_10524();
                    switch (target.name)
                    {
                        case "button_settings":
                            handler.toggleRoomInfoWindow();
                            break;
                        case "button_zoom":
                            if (_Str_2268.messageListener)
                            {
                                message = new RoomWidgetZoomToggleMessage();
                                _Str_2268.messageListener.processWidgetMessage(message);
                            }
                            break;
                        case "button_collapse":
                        case "button_expand":
                            _Str_2268.setCollapsed((!(_Str_3510)));
                            handler.sessionDataManager.setRoomToolsState((!(_Str_3510)));
                            break;
                        case "button_history_back":
                            _Str_2268.goToPreviousRoom();
                            break;
                        case "button_history_forward":
                            _Str_2268.goToNextRoom();
                            break;
                        case "button_history":
                            this._Str_24287();
                            break;
                        case "button_chat_history":
                            if (_Str_2268.freeFlowChat)
                            {
                                _Str_2268.freeFlowChat.toggleVisibility();
                            }
                            break;
                        case "button_like":
                            handler.rateRoom();
                            window.findChildByName("button_like").disable();
                            break;
                        case "button_share":
                            link = this._Str_8567();
                            window = (_Str_2268.windowManager.getWindowByName("share_room_link") as IWindowContainer);
                            if (window == null)
                            {
                                asset = (_assets.getAssetByName("share_room_xml").content as XML);
                                if (asset)
                                {
                                    window = (_Str_2268.windowManager.buildFromXML(asset) as IWindowContainer);
                                }
                            }
                            if (window)
                            {
                                HabboTracking.getInstance().trackEventLog("RoomLink", "click", "client.room_link.clicked");
                                window.name = "share_room_link";
                                window.center();
                                window.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, function (k:WindowMouseEvent, _arg_2:IWindow=null):void
                                {
                                    window.dispose();
                                });
                                window.findChildByName("embed_src_txt").caption = this._Str_8567();
                                window.findChildByName("embed_src_direct_txt").caption = this._Str_8567("embed_src_direct_txt", "${url.prefix}/hotel?room=%roomId%");
                                IStaticBitmapWrapperWindow(window.findChildByName("thumbnail_image")).assetUri = this._Str_24878();
                            }
                            try
                            {
                                System.setClipboard(this._Str_8567());
                            }
                            catch(error:Error)
                            {
                            }
                            break;
                        case "button_camera":
                            openCameraEvent = new HabboToolbarEvent(HabboToolbarEvent.HTE_ICON_CAMERA);
                            openCameraEvent._Str_4856 = HabboToolbarEvent.ROOMTOOLSMENU;
                            handler.container.toolbar.events.dispatchEvent(openCameraEvent);
                            break;
                    }
                    return;
            }
        }

        private function _Str_8567(k:String="navigator.embed.src", _arg_2:String=""):String
        {
            var _local_3:String;
            var _local_4:String;
            if (_Str_2268.handler.navigator.enteredGuestRoomData != null)
            {
                _local_3 = "private";
                _local_4 = ("" + _Str_2268.handler.navigator.enteredGuestRoomData.flatId);
            }
            var _local_5:String = _Str_2268.handler.container.config.getProperty("user.hash");
            if (_Str_2268.localizations.hasLocalization(k))
            {
                _Str_2268.localizations.registerParameter(k, "roomType", _local_3);
                _Str_2268.localizations.registerParameter(k, "embedCode", _local_5);
                _Str_2268.localizations.registerParameter(k, "roomId", _local_4);
            }
            else
            {
                if (_arg_2 != "")
                {
                    _arg_2 = _arg_2.replace("${url.prefix}", _Str_2268.handler.container.config.getProperty("url.prefix"));
                    _arg_2 = _arg_2.replace("%roomId%", _local_4);
                    return _arg_2;
                }
            }
            return _Str_2268.localizations.getLocalization(k, _arg_2);
        }

        private function _Str_24878():String
        {
            var _local_2:String;
            var k:String = "";
            if (_Str_2268.handler.navigator.enteredGuestRoomData.officialRoomPicRef != null)
            {
                if (_Str_2268.handler.container.config.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                {
                    _local_2 = _Str_2268.handler.container.config.getProperty("navigator.thumbnail.url_base");
                    k = ((_local_2 + _Str_2268.handler.navigator.enteredGuestRoomData.flatId) + ".png");
                }
                else
                {
                    k = (_Str_2268.handler.container.config.getProperty("image.library.url") + _Str_2268.handler.navigator.enteredGuestRoomData.officialRoomPicRef);
                }
            }
            else
            {
                _local_2 = _Str_2268.handler.container.config.getProperty("navigator.thumbnail.url_base");
                k = ((_local_2 + _Str_2268.handler.navigator.enteredGuestRoomData.flatId) + ".png");
            }
            return k;
        }

        public function get right():int
        {
            var k:IWindow;
            if (!window)
            {
                return 0;
            }
            if (_Str_3510)
            {
                k = window.findChildByName("side_bar_expand");
                return (k) ? (k.width + _Str_10400) : 0;
            }
            return window.width + _Str_10400;
        }
    }
}
