package com.sulake.habbo.toolbar.extensions.purse
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import __AS3__.vec.Vector;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.utils._Str_988;
    import __AS3__.vec.*;

    public class CurrencyIndicatorBase implements ICurrencyIndicator 
    {
        protected static const _Str_13195:int = 0;
        protected static const _Str_20899:int = 1;
        private static const _Str_17795:Number = 0.025;

        protected var _window:IWindowContainer;
        protected var _Str_2277:IHabboWindowManager;
        protected var _assets:IAssetLibrary;
        private var _disposed:Boolean = false;
        private var _Str_11528:IStaticBitmapWrapperWindow;
        private var _Str_20776:uint;
        private var _Str_19880:uint;
        private var _Str_17400:String;
        private var _Str_4381:Vector.<String>;
        private var _Str_19991:uint;
        private var _Str_19883:String = null;
        private var _Str_17496:uint = 0;
        private var _Str_4371:int;
        private var _Str_3923:Timer;
        private var _Str_7792:Timer;
        private var _Str_8733:Number;
        private var _Str_21965:int;
        private var _Str_17953:int;

        public function CurrencyIndicatorBase(k:IHabboWindowManager, _arg_2:IAssetLibrary)
        {
            this._Str_4381 = new Vector.<String>();
            super();
            this._window = null;
            this._Str_2277 = k;
            this._assets = _arg_2;
            this._Str_3923 = null;
            this._Str_7792 = new Timer(40);
            this._Str_7792.addEventListener(TimerEvent.TIMER, this._Str_20072);
        }

        protected function set _Str_19567(k:uint):void
        {
            this._Str_20776 = k;
        }

        protected function set _Str_21715(k:uint):void
        {
            this._Str_19880 = k;
        }

        protected function set _Str_15051(k:String):void
        {
            this._Str_17400 = k;
        }

        protected function set _Str_22454(k:uint):void
        {
            this._Str_19991 = k;
        }

        protected function set _Str_8446(k:String):void
        {
            this._Str_19883 = k;
        }

        protected function get _Str_8446():String
        {
            return this._Str_19883;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._Str_7792 != null)
            {
                this._Str_7792.stop();
                this._Str_7792 = null;
            }
            if (this._Str_3923)
            {
                this._Str_3923.stop();
                this._Str_3923 = null;
            }
            if (this._Str_4381)
            {
                this._Str_4381 = null;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._disposed = true;
        }

        public function registerUpdateEvents(k:IEventDispatcher):void
        {
        }

        public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
        }

        protected function onContainerClick(k:WindowMouseEvent):void
        {
        }

        protected function createWindow(k:String, _arg_2:String):void
        {
            var _local_4:Array;
            var _local_3:XmlAsset = (this._assets.getAssetByName(k) as XmlAsset);
            if (_local_3)
            {
                this._window = (this._Str_2277.buildFromXML((_local_3.content as XML), 1) as IWindowContainer);
                if (this._window)
                {
                    this._window.addEventListener(WindowMouseEvent.CLICK, this.onContainerClick);
                    this._window.addEventListener(WindowMouseEvent.OVER, this.onContainerOver);
                    this._window.addEventListener(WindowMouseEvent.OUT, this.onContainerOut);
                    _local_4 = [];
                    if (this._window.groupChildrenWithTag("ICON", _local_4, -1) == 1)
                    {
                        this._Str_11528 = (_local_4[0] as IStaticBitmapWrapperWindow);
                        this.setAssetUri(_arg_2);
                    }
                }
            }
        }

        protected function _Str_26406(k:int):void
        {
            this._Str_17496 = k;
            if (((this._Str_11528) && (this._Str_4381.length > 0)))
            {
                if (this._Str_17496 == _Str_13195)
                {
                    this._Str_4371 = 0;
                }
                else
                {
                    this._Str_4371 = (this._Str_4381.length - 1);
                }
                this._Str_3923 = new Timer(this._Str_19991, this._Str_4381.length);
                this._Str_3923.addEventListener(TimerEvent.TIMER, this._Str_14894);
                this._Str_3923.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._Str_3923.start();
                this._Str_14894(null);
            }
        }

        protected function setAmount(k:int, _arg_2:int=-1):void
        {
            this._Str_2497(k.toString());
        }

        protected function _Str_2497(k:String):void
        {
            if (this._window)
            {
                this._window.findChildByName(this._Str_17400).caption = k;
            }
        }

        protected function _Str_13549(k:Boolean):void
        {
            if (this._window)
            {
                ITextWindow(this._window.findChildByName(this._Str_17400)).underline = k;
            }
        }

        protected function set _Str_23355(k:Array):void
        {
            var _local_2:String;
            for each (_local_2 in k)
            {
                this._Str_4381.push(_local_2);
            }
        }

        private function _Str_14894(k:TimerEvent):void
        {
            if (((this._Str_11528) && (this._Str_4381.length > 0)))
            {
                this.setAssetUri(this._Str_4381[this._Str_4371]);
                if (this._Str_17496 == _Str_13195)
                {
                    this._Str_4371++;
                    this._Str_4371 = ((this._Str_4371 < this._Str_4381.length) ? this._Str_4371 : (this._Str_4381.length - 1));
                }
                else
                {
                    this._Str_4371--;
                    this._Str_4371 = ((this._Str_4371 >= 0) ? this._Str_4371 : 0);
                }
            }
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            if (this._Str_4381.length > 0)
            {
                this.setAssetUri(this._Str_4381[0]);
            }
        }

        private function setAssetUri(k:String):void
        {
            if (this._Str_11528)
            {
                this._Str_11528.assetUri = k;
            }
        }

        private function onContainerOver(k:WindowMouseEvent):void
        {
            this._window.findChildByTag("BGCOLOR").color = this._Str_20776;
        }

        private function onContainerOut(k:WindowMouseEvent):void
        {
            this._window.findChildByTag("BGCOLOR").color = this._Str_19880;
        }

        protected function _Str_19581(k:int, _arg_2:int):void
        {
            var _local_3:IWindow;
            this._Str_8733 = 0;
            this._Str_21965 = k;
            this._Str_17953 = _arg_2;
            if (this._window != null)
            {
                _local_3 = this._window.findChildByName("change");
                if (_local_3 != null)
                {
                    _local_3.caption = (((_arg_2 > k) ? "+" : "") + (_arg_2 - k).toString());
                }
            }
            this._Str_7792.start();
            this._Str_20072(null);
        }

        private function _Str_20072(k:TimerEvent):void
        {
            var _local_2:Number = ((Math.pow((this._Str_8733 - 0.5), 3) * 4) + 0.5);
            this.setAmount(int(_Str_988._Str_1028(Math.max(0, ((this._Str_8733 * 2) - 1)), this._Str_21965, this._Str_17953)));
            var _local_3:IWindowContainer = (this._window.findChildByName("change_overlay") as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.visible = true;
            _local_3.blend = (1 - (Math.abs((0.5 - _local_2)) * 2));
            _local_3.x = _Str_988._Str_1028(_local_2, 0, (this._window.width - _local_3.width));
            this._Str_8733 = (this._Str_8733 + _Str_17795);
            if (this._Str_8733 >= 1)
            {
                _local_3.visible = false;
                this._Str_7792.stop();
                this.setAmount(this._Str_17953);
            }
        }
    }
}
