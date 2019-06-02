//com.sulake.habbo.communication.messages.parser.users.AccountSafetyLockStatusChangeMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AccountSafetyLockStatusChangeMessageParser implements IMessageParser {

        public static const SAFETY_LOCK_STATUS_LOCKED:int;
        public static const SAFETY_LOCK_STATUS_UNLOCKED:int;

        private var _status:int;

        public function AccountSafetyLockStatusChangeMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get status():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

