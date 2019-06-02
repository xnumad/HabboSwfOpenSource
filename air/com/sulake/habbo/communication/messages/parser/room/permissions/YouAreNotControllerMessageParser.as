//com.sulake.habbo.communication.messages.parser.room.permissions.YouAreNotControllerMessageParser

package com.sulake.habbo.communication.messages.parser.room.permissions{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class YouAreNotControllerMessageParser implements IMessageParser {

        public function YouAreNotControllerMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.permissions

