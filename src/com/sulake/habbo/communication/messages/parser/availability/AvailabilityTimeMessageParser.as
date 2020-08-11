package com.sulake.habbo.communication.messages.parser.availability
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AvailabilityTimeMessageParser implements IMessageParser
    {
        private var _isOpen:Boolean;
        private var _minutesUntilChange:int;


        public function get isOpen():Boolean
        {
            return this._isOpen;
        }

        public function get _Str_26363():int
        {
            return this._minutesUntilChange;
        }

        public function flush():Boolean
        {
            this._isOpen = false;
            this._minutesUntilChange = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isOpen = (k.readInteger() > 0);
            this._minutesUntilChange = k.readInteger();
            return true;
        }
    }
}
