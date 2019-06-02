package com.sulake.habbo.ui.widget.furniture.stickie
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.ui.widget.events._Str_4863;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStickieSendUpdateMessage;

    public class StickieFurniWidget extends ConversionTrackingWidget 
    {
        private static const _Str_16242:int = 14;
        private static const _Str_5003:int = 500;
        private static const _Str_4126:Number = 100;
        private static const _Str_4162:Number = 100;

        private var _window:IWindowContainer;
        protected var _Str_2319:int = -1;
        protected var _Str_3796:String;
        protected var _text:String;
        protected var _Str_3062:String;
        protected var _Str_2278:Boolean;
        private var _Str_14561:BitmapData;
        protected var _Str_18958:String = "stickieui_container";

        public function StickieFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }

        protected function get window():IWindowContainer
        {
            return this._window;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this._Str_2718();
            if (this._Str_14561)
            {
                this._Str_14561.dispose();
            }
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_4863.RWSDUE_STICKIE_DATA, this.onObjectUpdate);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_4863.RWSDUE_STICKIE_DATA, this.onObjectUpdate);
        }

        protected function onObjectUpdate(k:_Str_4863):void
        {
            this._Str_2718(false);
            this._Str_2319 = k._Str_1577;
            this._Str_3796 = k.objectType;
            this._text = k.text;
            this._Str_3062 = k._Str_10471;
            this._Str_2278 = k.controller;
            this._Str_3030();
        }

        protected function _Str_3030():void
        {
            var _local_3:ITextFieldWindow;
            var _local_4:BitmapDataAsset;
            var _local_5:BitmapData;
            var _local_6:IBitmapWrapperWindow;
            var _local_7:String;
            if (this._Str_2319 == -1)
            {
                return;
            }
            var k:IAsset = assets.getAssetByName("stickie");
            if (k == null)
            {
                return;
            }
            var _local_2:XmlAsset = XmlAsset(k);
            if (_local_2 == null)
            {
                return;
            }
            if (this._window == null)
            {
                this._window = (windowManager.createWindow(this._Str_18958, "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(_Str_4126, _Str_4162, 2, 2), null, 0) as IWindowContainer);
                this._window.buildFromXML(XML(_local_2.content));
            }
            _local_3 = (this._window.findChildByName("text") as ITextFieldWindow);
            if (_local_3 != null)
            {
                _local_3.text = this._text;
                _local_3.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_24865);
            }
            _local_6 = (this._window.findChildByTag("bg") as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_7 = this._Str_3796.replace("post_it", "stickie");
                if (((assets.hasAsset(_local_7)) && (assets.getAssetByName(_local_7) is BitmapDataAsset)))
                {
                    _local_4 = (assets.getAssetByName(_local_7) as BitmapDataAsset);
                }
                else
                {
                    _local_4 = (assets.getAssetByName("stickie_blanco") as BitmapDataAsset);
                    _local_6.color = uint(("0xFF" + this._Str_3062));
                }
                _local_5 = (_local_4.content as BitmapData);
                if (this._Str_14561)
                {
                    _local_5 = this._Str_14561;
                }
                _local_6.bitmap = new BitmapData(_local_6.width, _local_6.height, true, 0);
                _local_6.bitmap.copyPixels(_local_5, _local_5.rect, new Point(0, 0));
            }
            _local_6 = (this._window.findChildByTag("close_button") as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_4 = (assets.getAssetByName("stickie_close") as BitmapDataAsset);
                _local_5 = (_local_4.content as BitmapData);
                _local_6.bitmap = new BitmapData(_local_6.width, _local_6.height, true, 0);
                _local_6.bitmap.copyPixels(_local_5, _local_5.rect, new Point(0, 0));
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            _local_6 = (this._window.findChildByTag("delete_button") as IBitmapWrapperWindow);
            if (((!(_local_6 == null)) && (this._Str_2278)))
            {
                _local_4 = (assets.getAssetByName("stickie_remove") as BitmapDataAsset);
                _local_5 = (_local_4.content as BitmapData);
                _local_6.bitmap = new BitmapData(_local_6.width, _local_6.height, true, 0);
                _local_6.bitmap.copyPixels(_local_5, _local_5.rect, new Point(0, 0));
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            this._Str_22258(((this._Str_2278) && (this._Str_3796 == "post_it")));
        }

        protected function _Str_2718(k:Boolean=true):void
        {
            if (k)
            {
                this.sendUpdate();
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._Str_2319 = -1;
            this._text = null;
            this._Str_2278 = false;
        }

        private function _Str_22258(k:Boolean):void
        {
            var _local_2:IWindow;
            var _local_3:Array = new Array("blue", "purple", "green", "yellow");
            var _local_4:int;
            while (_local_4 <= _local_3.length)
            {
                _local_2 = this._window.findChildByName(_local_3[_local_4]);
                if (_local_2 != null)
                {
                    if (k)
                    {
                        _local_2.visible = true;
                        _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
                    }
                    else
                    {
                        _local_2.visible = false;
                    }
                }
                _local_4++;
            }
        }

        protected function _Str_9532():Boolean
        {
            var k:ITextFieldWindow = (this._window.findChildByName("text") as ITextFieldWindow);
            if (k == null)
            {
                return false;
            }
            if (this._text == k.text)
            {
                return false;
            }
            this._text = k.text;
            return true;
        }

        protected function sendUpdate():void
        {
            var k:RoomWidgetStickieSendUpdateMessage;
            if (this._Str_2319 == -1)
            {
                return;
            }
            if (!this._Str_9532())
            {
                return;
            }
            if (messageListener != null)
            {
                k = new RoomWidgetStickieSendUpdateMessage(RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_UPDATE, this._Str_2319, this._text, this._Str_3062);
                messageListener.processWidgetMessage(k);
            }
        }

        protected function sendSetColor(k:uint):void
        {
            var _local_3:RoomWidgetStickieSendUpdateMessage;
            if (this._Str_2319 == -1)
            {
                return;
            }
            this._Str_9532();
            var _local_2:String = k.toString(16).toUpperCase();
            if (_local_2.length > 6)
            {
                _local_2 = _local_2.slice((_local_2.length - 6), _local_2.length);
            }
            if (_local_2 == this._Str_3062)
            {
                return;
            }
            this._Str_3062 = _local_2;
            if (messageListener != null)
            {
                _local_3 = new RoomWidgetStickieSendUpdateMessage(RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_UPDATE, this._Str_2319, this._text, this._Str_3062);
                messageListener.processWidgetMessage(_local_3);
            }
            this._Str_3030();
        }

        protected function sendDelete():void
        {
            var k:RoomWidgetStickieSendUpdateMessage;
            if (this._Str_2319 == -1)
            {
                return;
            }
            if (((!(messageListener == null)) && (this._Str_2278)))
            {
                k = new RoomWidgetStickieSendUpdateMessage(RoomWidgetStickieSendUpdateMessage.RWSUM_STICKIE_SEND_DELETE, this._Str_2319);
                messageListener.processWidgetMessage(k);
            }
        }

        private function _Str_24865(k:WindowEvent):void
        {
            var _local_2:ITextFieldWindow;
            _local_2 = (this._window.findChildByName("text") as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.maxChars = _Str_5003;
            if (_local_2.numLines < _Str_16242)
            {
                return;
            }
            _local_2.text = _local_2.text.slice(0, (_local_2.text.length - 1));
            _local_2.maxChars = _local_2.length;
        }

        protected function _Str_3132(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "blue":
                case "purple":
                case "green":
                case "yellow":
                    this.sendSetColor(_local_2.color);
                    return;
                case "close":
                    this._Str_2718();
                    return;
                case "delete":
                    this.sendDelete();
                    this._Str_2718(false);
                    return;
            }
        }
    }
}
