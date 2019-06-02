//com.sulake.habbo.communication.messages.parser.room.permissions.YouAreOwnerMessageParser

package com.sulake.habbo.communication.messages.parser.room.permissions{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class YouAreOwnerMessageParser implements IMessageParser {

        public function YouAreOwnerMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.permissions

