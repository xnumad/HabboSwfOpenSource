package com.sulake.habbo.ui.widget.furniture.ecotronbox
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.ui.widget.events._Str_3072;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_2490;
    import flash.events.IEventDispatcher;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenMessage;

    public class EcotronboxFurniWidget extends ConversionTrackingWidget 
    {
        private static const _Str_4126:Number = 100;
        private static const _Str_4162:Number = 100;

        private var _window:IWindowContainer;
        private var _Str_2319:int = -1;
        private var _text:String;
        private var _Str_2278:Boolean;
        private var _Str_3608:Boolean = false;
        private var _Str_6880:String = "ecotron_box";
        private var _Str_10029:Map;

        public function EcotronboxFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null)
        {
            this._Str_10029 = new Map();
            super(k, _arg_2, _arg_3);
            this._Str_10029.add("", "ecotronbox_card");
            this._Str_10029.add("ecotron_box", "ecotronbox_card");
            this._Str_10029.add("matic_box", "ecotronbox_card_furnimatic");
        }

        override public function dispose():void
        {
            this._Str_2718();
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3072.RWEBDUE_PACKAGEINFO, this.onObjectUpdate);
            k.addEventListener(_Str_3072.RWEBDUE_CONTENTS, this.onObjectUpdate);
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this._Str_4159);
            k.addEventListener(_Str_2490.RWPDUE_PACKAGEINFO, this._Str_20683);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3072.RWEBDUE_PACKAGEINFO, this.onObjectUpdate);
            k.removeEventListener(_Str_3072.RWEBDUE_CONTENTS, this.onObjectUpdate);
            k.removeEventListener(_Str_2490.RWPDUE_PACKAGEINFO, this._Str_20683);
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this._Str_4159);
        }

        private function onObjectUpdate(k:_Str_3072):void
        {
            this._Str_2718();
            switch (k.type)
            {
                case _Str_3072.RWEBDUE_PACKAGEINFO:
                    this._Str_3608 = false;
                    this._Str_2319 = k._Str_1577;
                    this._text = k.text;
                    this._Str_2278 = k.controller;
                    this._Str_6880 = k._Str_17878;
                    this._Str_3030();
                    return;
                case _Str_3072.RWEBDUE_CONTENTS:
                    if (!this._Str_3608)
                    {
                        return;
                    }
                    this._Str_2319 = k._Str_1577;
                    this._Str_3030();
                    this._Str_9278(k._Str_11625);
                    this._Str_23892(k.text);
                    this._Str_19806(false);
                    return;
            }
        }

        private function _Str_4159(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            if (k.id == this._Str_2319)
            {
                this._Str_2718();
            }
        }

        private function _Str_20683(k:_Str_2490):void
        {
            switch (k.type)
            {
                case _Str_2490.RWPDUE_PACKAGEINFO:
                    this._Str_2718();
                    return;
            }
        }

        private function _Str_9278(k:BitmapData):void
        {
            if (k == null)
            {
                k = new BitmapData(1, 1);
            }
            if (this._window == null)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("ecotronbox_card_preview") as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:int = ((_local_2.width - k.width) / 2);
            var _local_4:int = ((_local_2.height - k.height) / 2);
            if (_local_2.bitmap == null)
            {
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0xFFFFFF);
            }
            _local_2.bitmap.fillRect(_local_2.bitmap.rect, 0xFFFFFF);
            _local_2.bitmap.copyPixels(k, k.rect, new Point(_local_3, _local_4), null, null, false);
        }

        private function _Str_23892(k:String):void
        {
            var _local_2:ITextWindow;
            _local_2 = (this._window.findChildByName("ecotronbox_card_msg") as ITextWindow);
            if (((!(_local_2 == null)) && (!(k == null))))
            {
                _local_2.caption = k;
            }
        }

        private function _Str_3030():void
        {
            var _local_3:ITextWindow;
            var _local_4:IWindow;
            if (this._Str_2319 < 0)
            {
                return;
            }
            var k:IAsset = assets.getAssetByName(this._Str_10029.getValue(this._Str_6880));
            var _local_2:XmlAsset = XmlAsset(k);
            if (_local_2 == null)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._window = (windowManager.createWindow("ecotronboxcardui_container", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(_Str_4126, _Str_4162, 2, 2), null, 0) as IWindowContainer);
            this._window.buildFromXML(XML(_local_2.content));
            _local_3 = (this._window.findChildByName("ecotronbox_card_date") as ITextWindow);
            if (((!(_local_3 == null)) && (!(this._text == null))))
            {
                _local_3.caption = this._text;
            }
            _local_4 = this._window.findChildByName("ecotronbox_card_btn_close");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            this._Str_19806(true);
        }

        private function _Str_19806(k:Boolean):void
        {
            var _local_2:IWindow;
            if (this._window == null)
            {
                return;
            }
            _local_2 = this._window.findChildByName("ecotronbox_card_btn_open");
            if (_local_2 != null)
            {
                if (((this._Str_2278) && (k)))
                {
                    _local_2.visible = true;
                    _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
                }
                else
                {
                    _local_2.visible = false;
                }
            }
        }

        private function _Str_2718():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (!this._Str_3608)
            {
                this._Str_2319 = -1;
            }
            this._text = "";
            this._Str_2278 = false;
        }

        private function _Str_16426():void
        {
            var k:RoomWidgetEcotronBoxOpenMessage;
            if ((((this._Str_3608) || (this._Str_2319 == -1)) || (!(this._Str_2278))))
            {
                return;
            }
            this._Str_3608 = true;
            if (messageListener != null)
            {
                k = new RoomWidgetEcotronBoxOpenMessage(RoomWidgetEcotronBoxOpenMessage.RWEBOM_OPEN_ECOTRONBOX, this._Str_2319);
                messageListener.processWidgetMessage(k);
            }
        }

        private function _Str_3132(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "ecotronbox_card_btn_open":
                    this._Str_16426();
                    return;
                case "ecotronbox_card_btn_close":
                default:
                    this._Str_3608 = false;
                    this._Str_2718();
            }
        }
    }
}
