package com.sulake.habbo.ui.widget.contextmenu
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.utils.FixedSizeStack;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.XmlAsset;

    public class ContextInfoView implements IDisposable 
    {
        protected static const _Str_21789:uint = 3000;
        protected static const _Str_16565:uint = 4281149991;
        protected static const _Str_13825:uint = 4282950861;
        protected static const _Str_18586:uint = 0xFF993300;
        protected static const _Str_6292:uint = 0xFFFFFF;
        protected static const _Str_6801:uint = 9552639;
        protected static const _Str_17354:uint = 0xFFFFFF;
        protected static const _Str_17165:uint = 5789011;
        protected static const _Str_16357:uint = 13947341;
        protected static const _Str_17248:uint = 5789011;
        private static const _Str_18514:int = 25;
        private static const _Str_14408:int = 3;
        protected static var _Str_3452:Boolean = false;

        protected var _window:IWindowContainer;
        protected var _Str_5032:IWindowContainer;
        protected var _Str_3007:IWindowContainer;
        private var _Str_16285:Boolean;
        protected var _Str_2268:IContextMenuParentWidget;
        protected var _Str_3196:Boolean;
        protected var _Str_17886:FixedSizeStack;
        protected var _Str_18538:int = -1000000;
        protected var _disposed:Boolean = false;
        private var _Str_21071:Boolean = true;
        protected var _Str_5435:Timer;
        protected var _Str_12637:int = 3000;
        protected var _Str_14625:Boolean;
        protected var _Str_13141:Boolean;
        protected var _Str_1917:Number;
        protected var _Str_5321:int;
        protected var _Str_22193:int = 500;
        protected var _Str_3403:Boolean;

        public function ContextInfoView(k:IContextMenuParentWidget)
        {
            this._Str_17886 = new FixedSizeStack(_Str_18514);
            super();
            this._Str_2268 = k;
            this._Str_3403 = true;
            this._Str_14625 = false;
            this._Str_13141 = false;
        }

        public static function _Str_8532(k:ContextInfoView):void
        {
            k._Str_14625 = false;
            k._Str_22193 = 500;
            k._Str_13141 = false;
            k._Str_1917 = 1;
            if (k._Str_3403)
            {
                if (!k._Str_5435)
                {
                    k._Str_5435 = new Timer(k._Str_12637, 1);
                    k._Str_5435.addEventListener(TimerEvent.TIMER_COMPLETE, k.onTimerComplete);
                }
                k._Str_5435.reset();
                k._Str_5435.start();
            }
            k.updateWindow();
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get maximumBlend():Number
        {
            return 1;
        }

        public function dispose():void
        {
            this._Str_2268 = null;
            this._Str_3007 = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_5032)
            {
                this._Str_5032.dispose();
                this._Str_5032 = null;
            }
            if (this._Str_5435)
            {
                this._Str_5435.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._Str_5435.reset();
                this._Str_5435 = null;
            }
            this._disposed = true;
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            this._Str_13141 = true;
            this._Str_5321 = 0;
            this.hide(true);
        }

        protected function _Str_2786(k:IWindow, _arg_2:Function):void
        {
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        protected function updateWindow():void
        {
        }

        protected function _Str_4612(k:WindowMouseEvent):void
        {
            this._Str_2268.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_START_NAME_CHANGE));
            this._Str_2268.removeView(this, false);
        }

        public function _Str_16818(k:IBitmapWrapperWindow, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_6:Point;
            if ((((!(k)) || (!(this._Str_2268))) || (!(this._Str_2268.assets))))
            {
                return;
            }
            var _local_4:BitmapDataAsset = (this._Str_2268.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (!_local_4)
            {
                return;
            }
            var _local_5:BitmapData = (_local_4.content as BitmapData);
            if (!_local_5)
            {
                return;
            }
            if (k.bitmap)
            {
                k.bitmap.fillRect(k.bitmap.rect, 0);
            }
            else
            {
                k.bitmap = new BitmapData(k.width, k.height, true, 0);
            }
            if (_arg_3)
            {
                _local_6 = new Point(((k.bitmap.width - _local_5.width) / 2), ((k.bitmap.height - _local_5.height) / 2));
            }
            else
            {
                _local_6 = new Point(0, 0);
            }
            k.bitmap.copyPixels(_local_5, _local_5.rect, _local_6, null, null, true);
            k.invalidate();
        }

        public function show():void
        {
            if (this._Str_3007 != null)
            {
                this._Str_3007.visible = true;
                if (!(this._Str_3007.parent is IDesktopWindow))
                {
                    this._Str_2268.windowManager.getDesktop(0).addChild(this._Str_3007);
                }
                if (this._Str_21071)
                {
                    this._Str_3007.activate();
                }
            }
        }

        public function hide(k:Boolean):void
        {
            if (this._Str_3007 != null)
            {
                if (((!(this._Str_14625)) && (k)))
                {
                    this._Str_14625 = true;
                    this._Str_5435.start();
                }
                else
                {
                    this._Str_3007.visible = false;
                    this._Str_3007.parent = null;
                }
            }
        }

        protected function getOffset(k:Rectangle):int
        {
            var _local_2:int = -(this._Str_3007.height);
            _local_2 = (_local_2 - 4);
            return _local_2;
        }

        public function update(k:Rectangle, _arg_2:Point, _arg_3:uint):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (!k)
            {
                return;
            }
            if (!this._Str_3007)
            {
                this.updateWindow();
            }
            if (this._Str_13141)
            {
                this._Str_5321 = (this._Str_5321 + _arg_3);
                this._Str_1917 = ((1 - (this._Str_5321 / Number(this._Str_22193))) * this.maximumBlend);
            }
            else
            {
                this._Str_1917 = this.maximumBlend;
            }
            if (this._Str_1917 <= 0)
            {
                this._Str_2268.removeView(this, false);
                return;
            }
            if (((!(this._Str_3196)) || (this._Str_16285)))
            {
                _local_4 = this.getOffset(k);
                _local_5 = (_arg_2.y - k.top);
                this._Str_17886._Str_22775(_local_5);
                _local_6 = this._Str_17886._Str_25797();
                if (_local_6 < (this._Str_18538 - _Str_14408))
                {
                    _local_6 = (this._Str_18538 - _Str_14408);
                }
                _local_7 = (_arg_2.y - _local_6);
                this._Str_18538 = _local_6;
                this._Str_3007.x = (_arg_2.x - (this._Str_3007.width / 2));
                this._Str_3007.y = (_local_7 + _local_4);
                this._Str_16285 = false;
            }
            this._Str_3007.blend = this._Str_1917;
            this.show();
        }

        protected function _Str_2743(k:WindowMouseEvent):void
        {
            if (k.type == WindowMouseEvent.OVER)
            {
                this._Str_3196 = true;
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    if (!k.window.hitTestGlobalPoint(new Point(k.stageX, k.stageY)))
                    {
                        this._Str_3196 = false;
                    }
                }
            }
        }

        protected function _Str_5129(k:Boolean):void
        {
            _Str_3452 = k;
            this._Str_16285 = true;
            this.updateWindow();
        }

        protected function _Str_3113():IWindowContainer
        {
            var k:XML;
            if (!this._Str_5032)
            {
                k = (XmlAsset(this._Str_2268.assets.getAssetByName("minimized_menu")).content as XML);
                this._Str_5032 = (this._Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
                this._Str_5032.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, this._Str_23220);
                this._Str_5032.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, this._Str_3052);
                this._Str_5032.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, this._Str_3052);
                this._Str_5032.addEventListener(WindowMouseEvent.OVER, this._Str_2743);
                this._Str_5032.addEventListener(WindowMouseEvent.OUT, this._Str_2743);
            }
            return this._Str_5032;
        }

        private function _Str_23220(k:WindowMouseEvent):void
        {
            this._Str_5129(false);
        }

        protected function set activeView(k:IWindowContainer):void
        {
            if (!k)
            {
                return;
            }
            if (this._Str_3007)
            {
                this._Str_3007.parent = null;
            }
            this._Str_3007 = k;
        }

        protected function _Str_4457(k:WindowMouseEvent):void
        {
            this._Str_5129(true);
        }

        protected function _Str_3052(k:WindowMouseEvent):void
        {
            var _local_3:IWindow;
            var _local_2:IWindowContainer = (k.window as IWindowContainer);
            if (_local_2)
            {
                _local_3 = _local_2.findChildByName("icon");
                if (_local_3)
                {
                    if (k.type == WindowMouseEvent.OVER)
                    {
                        _local_3.color = _Str_13825;
                    }
                    else
                    {
                        _local_3.color = 0xFFFFFF;
                    }
                }
            }
        }

        public function set _Str_26171(k:Boolean):void
        {
            this._Str_21071 = k;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }
    }
}
