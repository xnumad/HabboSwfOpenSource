package com.sulake.habbo.window
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum.HintStatus;
    import com.sulake.core.window.motion.Queue;
    import com.sulake.core.window.motion.Combo;
    import com.sulake.core.window.motion.EaseOut;
    import com.sulake.core.window.motion.MoveTo;
    import com.sulake.core.window.motion.ResizeTo;
    import com.sulake.core.window.motion.Callback;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.core.window.motion.Motions;
    import flash.geom.Point;
    import flash.utils.getTimer;

    public class HintManager implements IDisposable, IUpdateReceiver 
    {
        private static const _Str_4228:int = 10;
        private static const _Str_14711:int = 400;
        private static const _Str_8038:int = 15;

        private var _windowManager:HabboWindowManagerComponent;
        private var _registeredWindows:Dictionary;
        private var _activeHint:_Str_7715;
        private var _hint:IStaticBitmapWrapperWindow;
        private var _absStartRect:Rectangle;
        private var _absTargetRect:Rectangle;

        public function HintManager(k:HabboWindowManagerComponent)
        {
            this._registeredWindows = new Dictionary();
            super();
            this._windowManager = k;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this.hideHint();
            this._activeHint = null;
            this._registeredWindows = null;
            this._windowManager = null;
        }

        public function get disposed():Boolean
        {
            return this._windowManager == null;
        }

        public function _Str_23129(k:String, _arg_2:IWindow, _arg_3:int):void
        {
            if (this._registeredWindows[k] != null)
            {
                this._Str_20106(k);
            }
            this._registeredWindows[k] = new _Str_7715(_arg_2, k, _arg_3);
        }

        public function _Str_20106(k:String):void
        {
            if (this._Str_16927 == k)
            {
                this.hideHint();
            }
            delete this._registeredWindows[k];
        }

        public function showHint(k:String, _arg_2:Rectangle=null):void
        {
            var _local_3:_Str_7715 = this._registeredWindows[k];
            if ((((!(_local_3 == null)) && (!(_local_3.window == null))) && (!(k == this._Str_16927))))
            {
                this.hideHint();
                this._hint = (_local_3.window.context.create("", "", WindowType.WINDOW_TYPE_STATIC_BITMAP_WRAPPER, 0, 0, null, null, null, 0) as IStaticBitmapWrapperWindow);
                this._hint.fitSizeToContents = true;
                this._hint.visible = false;
                switch (_local_3.style)
                {
                    case HintStatus.NEW:
                        this._hint.assetUri = "common_green_arrow_vertical";
                        break;
                    default:
                        this._hint.assetUri = "common_green_arrow_horizontal";
                }
                this._activeHint = _local_3;
                this._absStartRect = _arg_2;
                this._absTargetRect = this._Str_23325(this._activeHint.window);
                if (_arg_2 != null)
                {
                    this._Str_25500(_arg_2);
                }
                else
                {
                    this._windowManager.registerUpdateReceiver(this, 10);
                    this.update(0);
                }
            }
        }

        protected function _Str_25500(k:Rectangle):void
        {
            this._hint.x = k.x;
            this._hint.y = k.y;
            this._hint.visible = true;
            var _local_2:int = (k.x - this._absTargetRect.x);
            var _local_3:int = (k.y - this._absTargetRect.y);
            var _local_4:Number = Math.sqrt(((_local_2 * _local_2) + (_local_3 * _local_3)));
            var _local_5:int = (500 - Math.abs(((((1 / _local_4) * 100) * 500) * 0.5)));
            var _local_6:int = this._hint.width;
            var _local_7:int = this._hint.height;
            this._hint.width = (this._hint.width * 0.4);
            this._hint.height = (this._hint.height * 0.4);
            var _local_8:Motion = new Queue(new Combo(new EaseOut(new MoveTo(this._hint, _local_5, this._absTargetRect.x, this._absTargetRect.y), 1), new ResizeTo(this._hint, _local_5, _local_6, _local_7)), new Callback(this._Str_9372));
            Motions._Str_4598(_local_8);
        }

        protected function _Str_9372(k:Motion):void
        {
            this._windowManager.registerUpdateReceiver(this, 10);
            this.update(0);
        }

        public function hideHint():void
        {
            this._windowManager.removeUpdateReceiver(this);
            this._activeHint = null;
            if (!this._hint)
            {
                return;
            }
            this._hint.dispose();
            this._hint = null;
        }

        public function _Str_12248(k:String):void
        {
            if (k == this._Str_16927)
            {
                this.hideHint();
            }
        }

        public function update(k:uint):void
        {
            var _local_2:Point;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if ((((!(this._activeHint == null)) && (!(this._hint == null))) && (!(this._activeHint.window == null))))
            {
                _local_2 = new Point();
                this._activeHint.window.getGlobalPosition(_local_2);
                if (((_local_2.x == 0) && (_local_2.y == 0)))
                {
                    return;
                }
                _local_3 = this._hint.zoomX;
                _local_4 = this._hint.zoomY;
                switch (this._activeHint.style)
                {
                    case HintStatus.NEW:
                        if (((_local_2.y - this._hint.height) - _Str_4228) > 0)
                        {
                            _local_5 = (_local_2.y - this._hint.height);
                            if (this._hint.y == 0)
                            {
                                this._hint.y = Math.max((_local_5 - _Str_14711), _Str_8038);
                            }
                            if ((_local_5 - this._hint.y) > (_Str_8038 + _Str_4228))
                            {
                                this._hint.y = (this._hint.y + _Str_8038);
                            }
                            else
                            {
                                this._hint.y = ((_local_5 - _Str_4228) - (5 * Math.abs(Math.sin((getTimer() * 0.003)))));
                            }
                            this._hint.zoomY = 1;
                        }
                        else
                        {
                            _local_6 = (_local_2.y + this._activeHint.window.height);
                            if (this._hint.y == 0)
                            {
                                this._hint.y = Math.min((this._windowManager.context.displayObjectContainer.stage.stageHeight - this._hint.height), (this._hint.y + _Str_14711));
                            }
                            if ((_local_6 - this._hint.y) > (_Str_8038 + _Str_4228))
                            {
                                this._hint.y = (this._hint.y - _Str_8038);
                            }
                            else
                            {
                                this._hint.y = ((_local_6 + _Str_4228) + (5 * Math.abs(Math.sin((getTimer() * 0.003)))));
                            }
                            this._hint.zoomY = -1;
                        }
                        this._hint.x = (_local_2.x + ((this._activeHint.window.width - this._hint.width) / 2));
                        break;
                    default:
                        if ((_local_2.x + (this._activeHint.window.width / 2)) > (this._activeHint.window.desktop.width / 2))
                        {
                            this._hint.x = (((_local_2.x - this._hint.width) - _Str_4228) - (5 * Math.abs(Math.sin((getTimer() * 0.003)))));
                            this._hint.zoomX = 1;
                        }
                        else
                        {
                            this._hint.x = (((_local_2.x + this._activeHint.window.width) + _Str_4228) + (5 * Math.abs(Math.sin((getTimer() * 0.003)))));
                            this._hint.zoomX = -1;
                        }
                        this._hint.y = (_local_2.y + ((this._activeHint.window.height - this._hint.height) / 2));
                }
                if (((!(this._hint.zoomX == _local_3)) || (!(this._hint.zoomY == _local_4))))
                {
                    this._hint.invalidate();
                }
                this._hint.visible = this._activeHint.window.visible;
            }
        }

        private function _Str_23325(k:IWindow):Rectangle
        {
            var _local_2:Rectangle = new Rectangle();
            var _local_3:Point = new Point();
            k.getGlobalPosition(_local_3);
            switch (this._activeHint.style)
            {
                case HintStatus.NEW:
                    if (((_local_3.y - this._hint.height) - _Str_4228) > 0)
                    {
                        _local_2.y = ((_local_3.y - this._hint.height) - _Str_4228);
                    }
                    else
                    {
                        _local_2.y = ((_local_3.y + k.height) + _Str_4228);
                    }
                    _local_2.x = (_local_3.x + ((k.width - this._hint.width) / 2));
                    break;
                default:
                    if ((_local_3.x + (k.width / 2)) > (k.desktop.width / 2))
                    {
                        _local_2.x = ((_local_3.x - this._hint.width) - _Str_4228);
                    }
                    else
                    {
                        _local_2.x = ((_local_3.x + k.width) + _Str_4228);
                    }
                    _local_2.y = (_local_3.y + ((k.height - this._hint.height) / 2));
            }
            return _local_2;
        }

        private function get _Str_16927():String
        {
            return (this._activeHint) ? this._activeHint.key : null;
        }
    }
}
