//com.sulake.habbo.communication.messages.parser.room.engine.UserUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserUpdateMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserUpdateMessageParser implements IMessageParser {

        private var _users:Array;

        public function UserUpdateMessageParser();

        public function get userUpdateCount():int;

        public function flush():Boolean;

        public function getUserUpdateData(k:int):UserUpdateMessageData;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

