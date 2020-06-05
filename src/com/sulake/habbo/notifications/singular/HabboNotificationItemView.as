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
        public static const ITEM_HEIGHT:int = 70;
        public static const SIDE_MARGIN:int = 5;
        private static const STATE_IDLE:int = 0;
        private static const STATE_FADE_IN:int = 1;
        private static const STATE_DISPLAY:int = 2;
        private static const STATE_FADE_OUT:int = 3;

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
            this._window.context.getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this.onRoomViewResized);
            this._window.procedure = this.onWindowEvent;
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
            this._state = STATE_IDLE;
            this.showItem(_arg_5);
        }

        public function get disposed():Boolean
        {
            return this._window == null;
        }

        public function get ready():Boolean
        {
            return this._state == STATE_IDLE;
        }

        public function get verticalPosition():int
        {
            return this._margin;
        }

        private function showItem(k:HabboNotificationItem):void
        {
            var _local_3:BitmapData;
            if (k == null)
            {
                return;
            }
            var _local_2:String = k.content;
            this.setNotificationText(_local_2);
            if (k.style._Str_21712 == null)
            {
                _local_3 = k.style.icon;
                this.setNotificationIcon(_local_3);
            }
            else
            {
                IStaticBitmapWrapperWindow(IWindowContainer(this._window).findChildByTag("notification_icon_static")).assetUri = k.style._Str_21712;
            }
            this._item = k;
            this.reposition();
            this.startFadeIn();
        }

        public function replaceIcon(k:BadgeImageReadyEvent):void
        {
            if (k.badgeId != this._item.style._Str_25821)
            {
                return;
            }
            if (k.badgeImage != null)
            {
                this.setNotificationIcon(k.badgeImage);
            }
        }

        public function update(k:uint):void
        {
            var _local_2:Number;
            var _local_3:Number;
            switch (this._state)
            {
                case STATE_IDLE:
                    return;
                case STATE_FADE_IN:
                    this._fadeInStart = (this._fadeInStart + k);
                    _local_2 = (Number(this._fadeInStart) / Number(this._viewConfig["time_fade_in"]));
                    if (this._fadeInStart > int(this._viewConfig["time_fade_in"]))
                    {
                        this.startDisplay();
                    }
                    this.adjustBlend(_local_2);
                    return;
                case STATE_DISPLAY:
                    this._displayStart = (this._displayStart + k);
                    if (((this._displayStart > int(this._viewConfig["time_display"])) && (!(this._hovering))))
                    {
                        this.startFadeOut();
                    }
                    return;
                case STATE_FADE_OUT:
                    this._fadeOutStart = (this._fadeOutStart + k);
                    _local_3 = (1 - (Number(this._fadeOutStart) / Number(this._viewConfig["time_fade_out"])));
                    this.adjustBlend(_local_3);
                    if (this._fadeOutStart > int(this._viewConfig["time_fade_in"]))
                    {
                        this.startIdling();
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

        private function setNotificationText(k:String):void
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

        private function setNotificationIcon(k:BitmapData):void
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

        private function startFadeIn():void
        {
            this._fadeInStart = 0;
            this._state = STATE_FADE_IN;
            this._window.visible = true;
        }

        private function startFadeOut():void
        {
            this._fadeOutStart = 0;
            this._state = STATE_FADE_OUT;
        }

        private function startDisplay():void
        {
            this._displayStart = 0;
            this._state = STATE_DISPLAY;
        }

        private function startIdling():void
        {
            this._state = STATE_IDLE;
            this._window.visible = false;
        }

        public function reposition(k:int=-1):void
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
            this._window.x = ((_local_2.width - this._window.width) - SIDE_MARGIN);
            this._window.y = this._margin;
        }

        public function onWindowEvent(k:WindowEvent, _arg_2:IWindow):void
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
                            this.startFadeOut();
                        }
                    }
                }
            }
        }

        private function onRoomViewResized(k:WindowEvent):void
        {
            this.reposition();
        }

        private function adjustBlend(k:Number):void
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
