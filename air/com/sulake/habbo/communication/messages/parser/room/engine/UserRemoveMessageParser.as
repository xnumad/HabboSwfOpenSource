//com.sulake.habbo.communication.messages.parser.room.engine.UserRemoveMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserRemoveMessageParser implements IMessageParser {

        private var _id:int;

        public function UserRemoveMessageParser();

        public function get id():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

