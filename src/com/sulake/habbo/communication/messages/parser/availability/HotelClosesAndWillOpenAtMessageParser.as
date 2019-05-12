package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HotelClosesAndWillOpenAtMessageParser implements IMessageParser 
    {
        private var _openHour:int;
        private var _openMinute:int;
        private var _userThrownOutAtClose:Boolean;


        public function get openHour():int
        {
            return this._openHour;
        }

        public function get openMinute():int
        {
            return this._openMinute;
        }

        public function get userThrownOutAtClose():Boolean
        {
            return this._userThrownOutAtClose;
        }

        public function flush():Boolean
        {
            this._openHour = 0;
            this._openMinute = 0;
            this._userThrownOutAtClose = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._openHour = k.readInteger();
            this._openMinute = k.readInteger();
            this._userThrownOutAtClose = k.readBoolean();
            return true;
        }
    }
}
