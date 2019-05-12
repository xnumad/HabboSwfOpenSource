package org.openvideoads.events
{
    import flash.events.Event;

    public class _Str_5692 extends Event 
    {
        public static const _Str_5406:String = "timed-out";

        public function _Str_5692(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            return new _Str_5692(type, bubbles, cancelable);
        }
    }
}
