package com.sulake.habbo.friendlist.events
{
    import flash.events.Event;

    public class _Str_2948 extends Event 
    {
        public static const FRE_ACCEPTED:String = "FRE_ACCEPTED";
        public static const FRE_DECLINED:String = "FRE_DECLINED";

        private var _requestId:int;

        public function _Str_2948(k:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._requestId = _arg_2;
        }

        public function get requestId():int
        {
            return this._requestId;
        }
    }
}
