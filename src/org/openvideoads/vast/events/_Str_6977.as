package org.openvideoads.vast.events
{
    import flash.events.Event;

    public class _Str_6977 extends Event 
    {
        public static const _Str_16488:String = "ova-control-bar-enable";
        public static const _Str_18397:String = "ova-control-bar-disable";
        public static const _Str_3824:String = "ova-control-bar-show";
        public static const _Str_2703:String = "ova-control-bar-hide";

        public function _Str_6977(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            return new _Str_6977(type, bubbles, cancelable);
        }
    }
}
