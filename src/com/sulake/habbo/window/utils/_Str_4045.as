package com.sulake.habbo.window.utils
{
    import com.sulake.core.window.utils.INotify;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.enum._Str_3023;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class _Str_4045 implements _Str_2418, INotify 
    {
        protected static const _ALERT_BUTTON_LIST:String = "_alert_button_list";
        protected static const _ALERT_BUTTON_OK:String = "_alert_button_ok";
        protected static const _ALERT_BUTTON_CANCEL:String = "_alert_button_cancel";
        protected static const _ALERT_BUTTON_CUSTOM:String = "_alert_button_custom";
        protected static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        protected static const _ALERT_TEXT_SUMMARY:String = "_alert_text_summary";
        private static var _Str_2214:uint = 0;

        protected var _Str_2495:String = "";
        protected var _Str_4444:String = "";
        protected var _disposed:Boolean = false;
        protected var _Str_2715:Function = null;
        protected var window:IFrameWindow;
        protected var _Str_2440:_Str_2784;

        public function _Str_4045(k:IHabboWindowManager, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function, _arg_7:Boolean)
        {
            var _local_9:IWindow;
            super();
            _Str_2214++;
            if (_arg_7)
            {
                this._Str_2440 = k.buildModalDialogFromXML(_arg_2);
                this.window = (this._Str_2440._Str_2429 as IFrameWindow);
            }
            else
            {
                this.window = (k.buildFromXML(_arg_2, 2) as IFrameWindow);
            }
            if (_arg_5 == _Str_3023.NULL)
            {
                _arg_5 = ((_Str_3023.BUTTON_OK | _Str_3023._Str_18202) | _Str_3023.TEXT_SUMMARY);
            }
            var _local_8:IItemListWindow = (this.window.findChildByName(_ALERT_BUTTON_LIST) as IItemListWindow);
            if (_local_8)
            {
                if (!(_arg_5 & _Str_3023.BUTTON_OK))
                {
                    _local_9 = _local_8.getListItemByName(_ALERT_BUTTON_OK);
                    _local_9.dispose();
                }
                if (!(_arg_5 & _Str_3023.BUTTON_CANCEL))
                {
                    _local_9 = _local_8.getListItemByName(_ALERT_BUTTON_CANCEL);
                    _local_9.dispose();
                }
                if (!(_arg_5 & _Str_3023.BUTTON_CUSTOM))
                {
                    _local_9 = _local_8.getListItemByName(_ALERT_BUTTON_CUSTOM);
                    _local_9.dispose();
                }
            }
            this.window.procedure = this.dialogEventProc;
            this.window.center();
            this.title = _arg_3;
            this.summary = _arg_4;
            this.callback = _arg_6;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._Str_2440) && (!(this._Str_2440.disposed))))
                {
                    this._Str_2440.dispose();
                    this._Str_2440 = null;
                    this.window = null;
                }
                if (((this.window) && (!(this.window.disposed))))
                {
                    this.window.dispose();
                    this.window = null;
                }
                this._Str_2715 = null;
                this._disposed = true;
            }
        }

        protected function dialogEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:WindowEvent;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case _ALERT_BUTTON_OK:
                        if (this._Str_2715 != null)
                        {
                            _local_3 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_OK, null, null);
                            this._Str_2715(this, _local_3);
                            _local_3.recycle();
                        }
                        else
                        {
                            this.dispose();
                        }
                        return;
                    case HEADER_BUTTON_CLOSE:
                    case _ALERT_BUTTON_CANCEL:
                        if (this._Str_2715 != null)
                        {
                            _local_3 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CANCEL, null, null);
                            this._Str_2715(this, _local_3);
                            _local_3.recycle();
                        }
                        else
                        {
                            this.dispose();
                        }
                        return;
                }
            }
        }

        public function _Str_24380(k:int):_Str_5394
        {
            var _local_2:IInteractiveWindow;
            if (!this._disposed)
            {
                switch (k)
                {
                    case _Str_3023.BUTTON_OK:
                        _local_2 = (this.window.findChildByName(_ALERT_BUTTON_OK) as IInteractiveWindow);
                        break;
                    case _Str_3023.BUTTON_CANCEL:
                        _local_2 = (this.window.findChildByName(_ALERT_BUTTON_CANCEL) as IInteractiveWindow);
                        break;
                    case _Str_3023.BUTTON_CUSTOM:
                        _local_2 = (this.window.findChildByName(_ALERT_BUTTON_CUSTOM) as IInteractiveWindow);
                        break;
                }
            }
            return (_local_2) ? new _Str_5639(_local_2.caption, _local_2._Str_2613, _local_2.visible) : null;
        }

        public function _Str_13956(k:int, _arg_2:_Str_5394):void
        {
            var _local_3:IInteractiveWindow;
            if (!this._disposed)
            {
                switch (k)
                {
                    case _Str_3023.BUTTON_OK:
                        _local_3 = (this.window.findChildByName(_ALERT_BUTTON_OK) as IInteractiveWindow);
                        break;
                    case _Str_3023.BUTTON_CANCEL:
                        _local_3 = (this.window.findChildByName(_ALERT_BUTTON_CANCEL) as IInteractiveWindow);
                        break;
                    case _Str_3023.BUTTON_CUSTOM:
                        _local_3 = (this.window.findChildByName(_ALERT_BUTTON_CUSTOM) as IInteractiveWindow);
                        break;
                }
            }
            if (_local_3)
            {
                _local_3.caption = _arg_2.text;
            }
        }

        public function set title(k:String):void
        {
            this._Str_2495 = k;
            if (this.window)
            {
                this.window.caption = this._Str_2495;
            }
        }

        public function get title():String
        {
            return this._Str_2495;
        }

        public function set summary(k:String):void
        {
            this._Str_4444 = k;
            if (this.window)
            {
                ITextWindow(this.window.findChildByTag("DESCRIPTION")).text = this._Str_4444;
            }
        }

        public function get summary():String
        {
            return this._Str_4444;
        }

        public function set callback(k:Function):void
        {
            this._Str_2715 = k;
        }

        public function get callback():Function
        {
            return this._Str_2715;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
