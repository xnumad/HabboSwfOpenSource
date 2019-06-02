package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.IAsset;
	import com.sulake.habbo.notifications.singular.HabboNotificationItem;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class HabboNotificationItemView implements IUpdateReceiver 
    {
        public static const _Str_9659:int = 70;
        public static const _Str_18890:int = 5;
        private static const _Str_694:int = 0;
        private static const _Str_3847:int = 1;
        private static const _Str_14483:int = 2;
        private static const _Str_6008:int = 3;

        private var _window:IWindow;
        private var _item:HabboNotificationItem;
        private var _hovering:Boolean = false;
        private var _styleConfig:Map;
        private var _viewConfig:Map;
        private var _fadeInStart:uint;
        private var _fadeOutStart:uint;
        private var _displayStart:uint;
        private var _margin:int;
        private var _blend:Number;
        private var _resizeMargin:int;
        private var _windowMinHeight:int;
        private var _state:int;

        public function HabboNotificationItemView(k:IAsset, _arg_2:IHabboWindowManager, _arg_3:Map, _arg_4:Map, _arg_5:HabboNotificationItem)
        {
            this._styleConfig = _arg_3;
            this._viewConfig = _arg_4;
            var _local_6:XmlAsset = (k as XmlAsset);
            if (_local_6 == null)
            {
                return;
            }
            this._window = _arg_2.buildFromXML((_local_6.content as XML), 1);
            this._window.tags.push("notificationview");
            this._window.context.getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_17251);
            this._window.procedure = this._Str_3061;
            this._window.blend = 0;
            this._window.visible = false;
            var _local_7:ITextWindow = (IWindowContainer(this._window).findChildByTag("notification_text") as ITextWindow);
            if (_local_7 != null)
            {
                this._resizeMargin = (this._window.height - _local_7.bottom);
            }
            else
            {
                this._resizeMargin = 15;
            }
            this._windowMinHeight = this._window.height;
            this._margin = 4;
            this._blend = 0;
            this._state = _Str_694;
            this._Str_16969(_arg_5);
        }

        public function get disposed():Boolean
        {
            return this._window == null;
        }

        public function get ready():Boolean
        {
            return this._state == _Str_694;
        }

        public function get verticalPosition():int
        {
            return this._margin;
        }

        private function _Str_16969(k:HabboNotificationItem):void
        {
            var _local_3:BitmapData;
            if (k == null)
            {
                return;
            }
            var _local_2:String = k.content;
            this._Str_23521(_local_2);
            if (k.style._Str_21712 == null)
            {
                _local_3 = k.style.icon;
                this._Str_20154(_local_3);
            }
            else
            {
                IStaticBitmapWrapperWindow(IWindowContainer(this._window).findChildByTag("notification_icon_static")).assetUri = k.style._Str_21712;
            }
            this._item = k;
            this._Str_5615();
            this._Str_23164();
        }

        public function _Str_18673(k:BadgeImageReadyEvent):void
        {
            if (k.badgeId != this._item.style._Str_25821)
            {
                return;
            }
            if (k.badgeImage != null)
            {
                this._Str_20154(k.badgeImage);
            }
        }

        public function update(k:uint):void
        {
            var _local_2:Number;
            var _local_3:Number;
            switch (this._state)
            {
                case _Str_694:
                    return;
                case _Str_3847:
                    this._fadeInStart = (this._fadeInStart + k);
                    _local_2 = (Number(this._fadeInStart) / Number(this._viewConfig["time_fade_in"]));
                    if (this._fadeInStart > int(this._viewConfig["time_fade_in"]))
                    {
                        this._Str_25847();
                    }
                    this._Str_20743(_local_2);
                    return;
                case _Str_14483:
                    this._displayStart = (this._displayStart + k);
                    if (((this._displayStart > int(this._viewConfig["time_display"])) && (!(this._hovering))))
                    {
                        this._Str_21559();
                    }
                    return;
                case _Str_6008:
                    this._fadeOutStart = (this._fadeOutStart + k);
                    _local_3 = (1 - (Number(this._fadeOutStart) / Number(this._viewConfig["time_fade_out"])));
                    this._Str_20743(_local_3);
                    if (this._fadeOutStart > int(this._viewConfig["time_fade_in"]))
                    {
                        this._Str_22474();
                    }
                    return;
            }
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._item != null)
            {
                this._item.dispose();
                this._item = null;
            }
        }

        private function _Str_23521(k:String):void
        {
            var _local_2:ITextWindow = (IWindowContainer(this._window).findChildByTag("notification_text") as ITextWindow);
            if (((_local_2 == null) || (k == null)))
            {
                return;
            }
            this._window.height = 0;
            _local_2.text = k;
            _local_2.height = (_local_2.textHeight + this._resizeMargin);
            if (this._window.height < this._windowMinHeight)
            {
                this._window.height = this._windowMinHeight;
            }
        }

        private function _Str_20154(k:BitmapData):void
        {
            var _local_3:BitmapData;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_2:IBitmapWrapperWindow = (IWindowContainer(this._window).findChildByTag("notification_icon") as IBitmapWrapperWindow);
            if (_local_2 == null)
            {
                return;
            }
            if (k == null)
            {
                _local_2.bitmap = null;
                return;
            }
            if (((k.width < _local_2.width) && (k.height < _local_2.height)))
            {
                _local_3 = new BitmapData(_local_2.width, _local_2.height, true, 0);
                _local_5 = ((_local_2.width - k.width) / 2);
                _local_6 = ((_local_2.height - k.height) / 2);
                _local_3.copyPixels(k, k.rect, new Point(_local_5, _local_6));
            }
            else
            {
                if (k.width < k.height)
                {
                    _local_3 = new BitmapData(k.height, k.height, true, 0);
                    _local_4 = ((k.height - k.width) / 2);
                    _local_3.copyPixels(k, k.rect, new Point(_local_4, 0));
                }
                else
                {
                    if (k.width > k.height)
                    {
                        _local_3 = new BitmapData(k.width, k.width, true, 0);
                        _local_4 = ((k.width - k.height) / 2);
                        _local_3.copyPixels(k, k.rect, new Point(0, _local_4));
                    }
                    else
                    {
                        _local_3 = new BitmapData(k.width, k.height);
                        _local_3.copyPixels(k, k.rect, new Point(0, 0));
                    }
                }
            }
            _local_2.bitmap = _local_3;
        }

        private function _Str_23164():void
        {
            this._fadeInStart = 0;
            this._state = _Str_3847;
            this._window.visible = true;
        }

        private function _Str_21559():void
        {
            this._fadeOutStart = 0;
            this._state = _Str_6008;
        }

        private function _Str_25847():void
        {
            this._displayStart = 0;
            this._state = _Str_14483;
        }

        private function _Str_22474():void
        {
            this._state = _Str_694;
            this._window.visible = false;
        }

        public function _Str_5615(k:int=-1):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:IDesktopWindow = this._window.context.getDesktopWindow();
            if (_local_2 == null)
            {
                return;
            }
            if (k != -1)
            {
                this._margin = k;
            }
            this._window.x = ((_local_2.width - this._window.width) - _Str_18890);
            this._window.y = this._margin;
        }

        public function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k == null)
            {
                return;
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                this._hovering = true;
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    this._hovering = false;
                }
                else
                {
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        if (this._item != null)
                        {
                            this._item._Str_25246();
                            this._Str_21559();
                        }
                    }
                }
            }
        }

        private function _Str_17251(k:WindowEvent):void
        {
            this._Str_5615();
        }

        private function _Str_20743(k:Number):void
        {
            this._blend = k;
            if (this._blend > 1)
            {
                this._blend = 1;
            }
            if (this._blend < 0)
            {
                this._blend = 0;
            }
            this._window.blend = this._blend;
        }
    }
}
