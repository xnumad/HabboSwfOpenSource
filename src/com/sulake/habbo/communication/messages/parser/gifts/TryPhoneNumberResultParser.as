package com.sulake.habbo.communication.messages.parser.gifts
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TryPhoneNumberResultParser implements IMessageParser 
    {
        private var _resultCode:int;
        private var _millisToAllowProcessReset:int;


        public function get resultCode():int
        {
            return this._resultCode;
        }

        public function get millisToAllowProcessReset():int
        {
            return this._millisToAllowProcessReset;
        }

        public function flush():Boolean
        {
            this._resultCode = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultCode = k.readInteger();
            this._millisToAllowProcessReset = k.readInteger();
            return true;
        }
    }
}
