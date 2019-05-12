package com.sulake.core.window.services
{
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IFocusWindow;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.display.DisplayObject;
    import com.sulake.core.window.utils.*;
    import __AS3__.vec.*;

    public class FocusManager implements IFocusManagerService 
    {
        private var _disposed:Boolean = false;
        private var _stage:Stage;
        private var _array:Vector.<IFocusWindow>;

        public function FocusManager(k:DisplayObject)
        {
            this._array = new Vector.<IFocusWindow>();
            this._stage = k.stage;
            this._stage.addEventListener(Event.ACTIVATE, this._Str_21302);
            this._stage.addEventListener(FocusEvent.FOCUS_OUT, this._Str_4932);
            this._stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, this._Str_4932);
            this._stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, this._Str_4932);
            super();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._stage.removeEventListener(Event.ACTIVATE, this._Str_21302);
                this._stage.removeEventListener(FocusEvent.FOCUS_OUT, this._Str_4932);
                this._stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, this._Str_4932);
                this._stage.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, this._Str_4932);
                this._stage = null;
                this._disposed = true;
                this._array = null;
            }
        }

        public function registerFocusWindow(k:IFocusWindow):void
        {
            if (k != null)
            {
                if (this._array.indexOf(k) == -1)
                {
                    this._array.push(k);
                    if (this._stage.focus == null)
                    {
                        k.focus();
                    }
                }
            }
        }

        public function removeFocusWindow(k:IFocusWindow):void
        {
            var _local_2:int;
            if (k != null)
            {
                _local_2 = this._array.indexOf(k);
                if (_local_2 > -1)
                {
                    this._array.splice(_local_2, 1);
                }
            }
            if (this._stage.focus == null)
            {
                this._Str_16261();
            }
        }

        private function _Str_16261():IFocusWindow
        {
            var _local_2:IFocusWindow;
            var k:uint = this._array.length;
            while (k-- != 0)
            {
                _local_2 = (this._array[k] as IFocusWindow);
                if (_local_2.disposed)
                {
                    this._array.splice(k, 1);
                }
                else
                {
                    _local_2.focus();
                    break;
                }
            }
            return _local_2;
        }

        private function _Str_21302(k:Event):void
        {
            if (this._stage.focus == null)
            {
                this._Str_16261();
            }
        }

        private function _Str_4932(k:FocusEvent):void
        {
            if (this._stage.focus == null)
            {
                this._Str_16261();
            }
        }
    }
}
