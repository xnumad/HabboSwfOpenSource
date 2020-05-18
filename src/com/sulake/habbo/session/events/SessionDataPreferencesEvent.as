package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class SessionDataPreferencesEvent extends Event 
    {
        public static const APUE_UPDATED:String = "APUE_UPDATED";

        private var _uiFlags:int;

        public function SessionDataPreferencesEvent(k:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            this._uiFlags = k;
            super(APUE_UPDATED, _arg_2, _arg_3);
        }

        public function get uiFlags():int
        {
            return this._uiFlags;
        }
    }
}
