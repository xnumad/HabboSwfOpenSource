package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_9350 implements _Str_7707 
    {
        public static const OK:String = "POLL_OFFER_STATE_OK";
        public static const POLL_OFFER_STATE_CANCEL:String = "POLL_OFFER_STATE_CANCEL";
        public static const UNKNOWN:String = "POLL_OFFER_STATE_UNKNOWN";

        private var _disposed:Boolean = false;
        private var _window:IFrameWindow;
        private var _state:String = "POLL_OFFER_STATE_UNKNOWN";
        private var _roomPollWidget:RoomPollWidget;
        private var _id:int = -1;

        public function _Str_9350(k:int, _arg_2:String, _arg_3:String, _arg_4:RoomPollWidget)
        {
            var _local_6:IWindow;
            var _local_7:IWindow;
            var _local_8:IWindow;
            var _local_9:IWindow;
            var _local_10:IItemListWindow;
            var _local_11:ITextWindow;
            var _local_12:ITextWindow;
            super();
            this._id = k;
            this._roomPollWidget = _arg_4;
            var _local_5:XmlAsset = (this._roomPollWidget.assets.getAssetByName("poll_offer") as XmlAsset);
            if (_local_5 != null)
            {
                this._window = (this._roomPollWidget.windowManager.buildFromXML((_local_5.content as XML)) as IFrameWindow);
                if (this._window)
                {
                    this._window.center();
                    _local_6 = this._window.findChildByName("poll_offer_button_ok");
                    if (_local_6 != null)
                    {
                        _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_6167);
                    }
                    _local_7 = this._window.findChildByName("poll_offer_button_cancel");
                    if (_local_7 != null)
                    {
                        _local_7.addEventListener(WindowMouseEvent.CLICK, this._Str_26455);
                    }
                    _local_8 = this._window.findChildByName("poll_offer_button_later");
                    if (_local_8 != null)
                    {
                        _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_22751);
                    }
                    _local_9 = this._window.findChildByName("header_button_close");
                    if (_local_9 != null)
                    {
                        _local_9.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
                    }
                    _local_11 = (this._window.findChildByName("poll_offer_headline") as ITextWindow);
                    if (_local_11)
                    {
                        _local_11.htmlText = _arg_2;
                        _local_10 = (this._window.findChildByName("poll_offer_headline_wrapper") as IItemListWindow);
                        if (_local_10)
                        {
                            this._window.height = (this._window.height + (_local_10.visibleRegion.height - _local_10._Str_3707.height));
                        }
                    }
                    _local_12 = (this._window.findChildByName("poll_offer_summary") as ITextWindow);
                    if (_local_12)
                    {
                        _local_12.htmlText = _arg_3;
                        _local_10 = (this._window.findChildByName("poll_offer_summary_wrapper") as IItemListWindow);
                        if (_local_10)
                        {
                            this._window.height = (this._window.height + (_local_10.visibleRegion.height - _local_10._Str_3707.height));
                        }
                    }
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get state():String
        {
            return this._state;
        }

        public function start():void
        {
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._roomPollWidget = null;
        }

        private function _Str_6167(k:WindowEvent):void
        {
            if (this._state != UNKNOWN)
            {
                return;
            }
            this._state = OK;
            this._roomPollWidget.messageListener.processWidgetMessage(new RoomWidgetPollMessage(RoomWidgetPollMessage.RWPM_START, this._id));
        }

        private function _Str_26455(k:WindowEvent):void
        {
            if (this._state != UNKNOWN)
            {
                return;
            }
            this._state = POLL_OFFER_STATE_CANCEL;
            this._roomPollWidget.messageListener.processWidgetMessage(new RoomWidgetPollMessage(RoomWidgetPollMessage.RWPM_REJECT, this._id));
            this._roomPollWidget._Str_12823(this._id);
        }

        private function _Str_22751(k:WindowEvent):void
        {
            if (this._state != UNKNOWN)
            {
                return;
            }
            this._state = POLL_OFFER_STATE_CANCEL;
            this._roomPollWidget._Str_12823(this._id);
        }

        private function onCloseHandler(k:WindowEvent):void
        {
            if (this._state != UNKNOWN)
            {
                return;
            }
            this._state = POLL_OFFER_STATE_CANCEL;
            this._roomPollWidget.messageListener.processWidgetMessage(new RoomWidgetPollMessage(RoomWidgetPollMessage.RWPM_REJECT, this._id));
            this._roomPollWidget._Str_12823(this._id);
        }
    }
}
