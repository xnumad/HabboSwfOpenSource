package org.openvideoads.vast.events
{
    import flash.events.Event;

    public class _Str_7987 extends Event 
    {
        public static const TOGGLE:String = "toggle";

        protected var _Str_17473:Boolean = false;

        public function _Str_7987(k:String, _arg_2:Boolean, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._Str_17473 = _arg_2;
        }

        public function _Str_25126():Boolean
        {
            return this._Str_17473;
        }

        public function _Str_26053():Boolean
        {
            return !(this._Str_25126());
        }

        override public function clone():Event
        {
            return new _Str_7987(type, this._Str_17473, bubbles, cancelable);
        }
    }
}
