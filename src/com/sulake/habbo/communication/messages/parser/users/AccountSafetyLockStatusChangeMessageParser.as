package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AccountSafetyLockStatusChangeMessageParser implements IMessageParser
    {
        public static const SAFETY_LOCK_STATUS_LOCKED:int = 0;
        public static const SAFETY_LOCK_STATUS_UNLOCKED:int = 1;

        private var _status:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = k.readInteger();
            return true;
        }

        public function get status():int
        {
            return this._status;
        }
    }
}
