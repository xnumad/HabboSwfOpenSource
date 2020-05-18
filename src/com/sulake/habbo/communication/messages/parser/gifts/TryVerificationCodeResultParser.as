package com.sulake.habbo.communication.messages.parser.gifts
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TryVerificationCodeResultParser implements IMessageParser 
    {
        private var _resultCode:int;
        private var _millisecondsToAllowProcessReset:int;


        public function get resultCode():int
        {
            return this._resultCode;
        }

        public function get millisecondsToAllowProcessReset():int
        {
            return this._millisecondsToAllowProcessReset;
        }

        public function flush():Boolean
        {
            this._resultCode = -1;
            this._millisecondsToAllowProcessReset = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultCode = k.readInteger();
            this._millisecondsToAllowProcessReset = k.readInteger();
            return true;
        }
    }
}
