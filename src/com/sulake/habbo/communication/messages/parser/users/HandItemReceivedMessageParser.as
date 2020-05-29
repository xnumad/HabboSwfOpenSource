package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HandItemReceivedMessageParser implements IMessageParser
    {
        private var _giverUserId:int = -1;
        private var _handItemType:int = 0;


        public function get giverUserId():int
        {
            return this._giverUserId;
        }

        public function get handItemType():int
        {
            return this._handItemType;
        }

        public function flush():Boolean
        {
            this._giverUserId = -1;
            this._handItemType = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._giverUserId = k.readInteger();
            this._handItemType = k.readInteger();
            return true;
        }
    }
}
