package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class MysteryBoxKeysUpdateEvent extends Event 
    {
        public static const MBKE_UPDATE:String = "mbke_update";

        private var _boxColor:String;
        private var _keyColor:String;

        public function MysteryBoxKeysUpdateEvent(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(MBKE_UPDATE, _arg_3, _arg_4);
            this._boxColor = k;
            this._keyColor = _arg_2;
        }

        public function get boxColor():String
        {
            return this._boxColor;
        }

        public function get keyColor():String
        {
            return this._keyColor;
        }
    }
}
