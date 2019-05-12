package org.openvideoads.vast.events
{
    import flash.events.Event;

    public class AdTagEvent extends Event 
    {
        public static const _Str_18229:String = "adcall-started";
        public static const _Str_18441:String = "adcall-failover";
        public static const _Str_16223:String = "adcall-complete";

        protected var _Str_6360:*;

        public function AdTagEvent(k:String, _arg_2:*, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._Str_6360 = _arg_2;
        }

        public function _Str_25894():Boolean
        {
            if (this._Str_6360 != null)
            {
                if (this._Str_6360.masterTag != null)
                {
                    return this._Str_6360.masterTag.callOnDemand;
                }
            }
            return false;
        }

        public function includesLinearAds():Boolean
        {
            if (this._Str_6360 != null)
            {
                if (this._Str_6360.masterTag != null)
                {
                    return this._Str_6360.masterTag.includesLinearAds();
                }
            }
            return false;
        }

        public function get _Str_26256():*
        {
            return this._Str_6360;
        }
    }
}
