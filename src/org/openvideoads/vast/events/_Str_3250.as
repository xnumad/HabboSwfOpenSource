package org.openvideoads.vast.events
{
    import flash.events.Event;
    import org.openvideoads.vast.schedule.ads.AdSlot;

    public class _Str_3250 extends Event 
    {
        public static const _Str_3592:String = "adslot-load-success";
        public static const _Str_18922:String = "adslot-load-error";
        public static const _Str_6699:String = "adslot-load-timeout";
        public static const _Str_6462:String = "adslot-load-deferred";

        protected var _Str_3267:AdSlot = null;
        protected var _Str_10947:Event = null;

        public function _Str_3250(k:String, _arg_2:AdSlot, _arg_3:Event=null, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._Str_10947 = _arg_3;
            this._Str_3267 = _arg_2;
        }

        public function _Str_25908():Boolean
        {
            return !(this._Str_3267 == null);
        }

        public function get adSlot():AdSlot
        {
            return this._Str_3267;
        }

        public function _Str_26007():Boolean
        {
            return !(this._Str_10947 == null);
        }

        public function get _Str_26197():Event
        {
            return this._Str_10947;
        }

        public function _Str_26310():Boolean
        {
            if (this._Str_3267 != null)
            {
                return this._Str_3267.hasLinearAd();
            }
            return false;
        }

        override public function toString():String
        {
            if (this._Str_10947 != null)
            {
                return this._Str_10947.toString();
            }
            if (this._Str_3267 != null)
            {
                return this._Str_3267.toString();
            }
            return "no data";
        }
    }
}
