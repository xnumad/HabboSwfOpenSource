package com.sulake.habbo.window.utils
{
    import com.sulake.core.window.utils.INotify;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class AlertDialog implements IAlertDialog, INotify
    {
        protected static const _ALERT_BUTTON_LIST:String = "_alert_button_list";
        protected static const _ALERT_BUTTON_OK:String = "_alert_button_ok";
        protected static const _ALERT_BUTTON_CANCEL:String = "_alert_button_cancel";
        protected static const _ALERT_BUTTON_CUSTOM:String = "_alert_button_custom";
        protected static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        protected static const _ALERT_TEXT_SUMMARY:String = "_alert_text_summary";
        private static var _counter:uint = 0;

        protected var _title:String = "";
        protected var _summary:String = "";
        protected var _disposed:Boolean = false;
        protected var _callback:Function = null;
        protected var _window:IFrameWindow;
        protected var _dialog:IModalDialog;

        public function AlertDialog(k:IHabboWindowManager, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function, _arg_7:Boolean)
        {
            var _local_9:IWindow;
            super();
            _counter++;
            if (_arg_7)
            {
                this._dialog = k.buildModalDialogFromXML(_arg_2);
                this._window = (this._dialog.rootWindow as IFrameWindow);
            }
            else
            {
                this._window = (k.buildFromXML(_arg_2, 2) as IFrameWindow);
            }
            if (_arg_5 == HabboAlertDialogFlag.NULL)
            {
                _arg_5 = ((HabboAlertDialogFlag.BUTTON_OK | HabboAlertDialogFlag.TEXT_TITLE) | HabboAlertDialogFlag.TEXT_SUMMARY);
            }
            var _local_8:IItemListWindow = (this._window.findChildByName(_ALERT_BUTTON_LIST) as IItemListWindow);
            if (_local_8)
            {
                if (!(_arg_5 & HabboAlertDialogFlag.BUTTON_OK))
                {
                    _local_9 = _local_8.getListItemByName(_ALERT_BUTTON_OK);
                    _local_9.dispose();
                }
                if (!(_arg_5 & HabboAlertDialogFlag.BUTTON_CANCEL))
                {
                    _local_9 = _local_8.getListItemByName(_ALERT_BUTTON_CANCEL);
                    _local_9.dispose();
                }
                if (!(_arg_5 & HabboAlertDialogFlag.BUTTON_CUSTOM))
                {
                    _local_9 = _local_8.getListItemByName(_ALERT_BUTTON_CUSTOM);
                    _local_9.dispose();
                }
            }
            this._window.procedure = this.dialogEventProc;
            this._window.center();
            this.title = _arg_3;
            this.summary = _arg_4;
            this.callback = _arg_6;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._dialog) && (!(this._dialog.disposed))))
                {
                    this._dialog.dispose();
                    this._dialog = null;
                    this._window = null;
                }
                if (((this._window) && (!(this._window.disposed))))
                {
                    this._window.dispose();
                    this._window = null;
                }
                this._callback = null;
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
                        if (this._callback != null)
                        {
                            _local_3 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_OK, null, null);
                            this._callback(this, _local_3);
                            _local_3.recycle();
                        }
                        else
                        {
                            this.dispose();
                        }
                        return;
                    case HEADER_BUTTON_CLOSE:
                    case _ALERT_BUTTON_CANCEL:
                        if (this._callback != null)
                        {
                            _local_3 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CANCEL, null, null);
                            this._callback(this, _local_3);
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

        public function getButtonCaption(k:int):ICaption
        {
            var _local_2:IInteractiveWindow;
            if (!this._disposed)
            {
                switch (k)
                {
                    case HabboAlertDialogFlag.BUTTON_OK:
                        _local_2 = (this._window.findChildByName(_ALERT_BUTTON_OK) as IInteractiveWindow);
                        break;
                    case HabboAlertDialogFlag.BUTTON_CANCEL:
                        _local_2 = (this._window.findChildByName(_ALERT_BUTTON_CANCEL) as IInteractiveWindow);
                        break;
                    case HabboAlertDialogFlag.BUTTON_CUSTOM:
                        _local_2 = (this._window.findChildByName(_ALERT_BUTTON_CUSTOM) as IInteractiveWindow);
                        break;
                }
            }
            return (_local_2) ? new AlertDialogCaption(_local_2.caption, _local_2.toolTipCaption, _local_2.visible) : null;
        }

        public function setButtonCaption(k:int, _arg_2:ICaption):void
        {
            var _local_3:IInteractiveWindow;
            if (!this._disposed)
            {
                switch (k)
                {
                    case HabboAlertDialogFlag.BUTTON_OK:
                        _local_3 = (this._window.findChildByName(_ALERT_BUTTON_OK) as IInteractiveWindow);
                        break;
                    case HabboAlertDialogFlag.BUTTON_CANCEL:
                        _local_3 = (this._window.findChildByName(_ALERT_BUTTON_CANCEL) as IInteractiveWindow);
                        break;
                    case HabboAlertDialogFlag.BUTTON_CUSTOM:
                        _local_3 = (this._window.findChildByName(_ALERT_BUTTON_CUSTOM) as IInteractiveWindow);
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
            this._title = k;
            if (this._window)
            {
                this._window.caption = this._title;
            }
        }

        public function get title():String
        {
            return this._title;
        }

        public function set summary(k:String):void
        {
            this._summary = k;
            if (this._window)
            {
                ITextWindow(this._window.findChildByTag("DESCRIPTION")).text = this._summary;
            }
        }

        public function get summary():String
        {
            return this._summary;
        }

        public function set callback(k:Function):void
        {
            this._callback = k;
        }

        public function get callback():Function
        {
            return this._callback;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
