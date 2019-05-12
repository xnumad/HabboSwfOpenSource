package org.openvideoads.vast.events
{
    import flash.events.Event;

    public class _Str_3525 extends Event 
    {
        public static const _Str_3831:String = "display-notice";
        public static const _Str_2703:String = "hide-notice";
        public static const _Str_18470:String = "tick-notice";

        protected var _Str_3124:Object = null;
        protected var _Str_2467:int = 0;

        public function _Str_3525(k:String, _arg_2:Object=null, _arg_3:int=0, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            if (_arg_2 != null)
            {
                this._Str_3124 = _arg_2;
            }
            this._Str_2467 = _arg_3;
        }

        public function _Str_23019():Boolean
        {
            return !(this._Str_3124 == null);
        }

        public function set notice(k:Object):void
        {
            this._Str_3124 = k;
        }

        public function get notice():Object
        {
            return this._Str_3124;
        }

        public function set duration(k:int):void
        {
            this._Str_2467 = k;
        }

        public function get duration():int
        {
            return this._Str_2467;
        }

        override public function clone():Event
        {
            return new _Str_3525(type, this._Str_3124, this._Str_2467, bubbles, cancelable);
        }
    }
}
