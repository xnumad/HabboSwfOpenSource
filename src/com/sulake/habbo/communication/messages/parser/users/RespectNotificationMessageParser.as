package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RespectNotificationMessageParser implements IMessageParser
    {
        private var _userId:int = 0;
        private var _respectTotal:int = 0;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            this._respectTotal = k.readInteger();
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get respectTotal():int
        {
            return this._respectTotal;
        }
    }
}
