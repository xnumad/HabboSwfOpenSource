package com.sulake.core.runtime.events
{
    import flash.events.Event;

    public class WarningEvent extends Event 
    {
        protected var _message:String;

        public function WarningEvent(type:String, message:String)
        {
            this._message = ((message == null) ? "undefined" : message);
            super(type);
        }

        public function get message():String
        {
            return this._message;
        }
    }
}
