package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HotelWillCloseInMinutesMessageParser implements IMessageParser 
    {
        private var _minutes:int;


        public function get minutes():int
        {
            return this._minutes;
        }

        public function flush():Boolean
        {
            this._minutes = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._minutes = k.readInteger();
            return true;
        }
    }
}
