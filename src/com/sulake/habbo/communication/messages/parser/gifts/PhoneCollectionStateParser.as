package com.sulake.habbo.communication.messages.parser.gifts
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PhoneCollectionStateParser implements IMessageParser 
    {
        private var _phoneStatusCode:int;
        private var _collectionStatusCode:int;
        private var _millisecondsToAllowProcessReset:int;


        public function get phoneStatusCode():int
        {
            return this._phoneStatusCode;
        }

        public function get collectionStatusCode():int
        {
            return this._collectionStatusCode;
        }

        public function get millisecondsToAllowProcessReset():int
        {
            return this._millisecondsToAllowProcessReset;
        }

        public function flush():Boolean
        {
            this._phoneStatusCode = -1;
            this._millisecondsToAllowProcessReset = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._phoneStatusCode = k.readInteger();
            this._collectionStatusCode = k.readInteger();
            this._millisecondsToAllowProcessReset = k.readInteger();
            return true;
        }
    }
}
