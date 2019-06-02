//com.sulake.habbo.communication.messages.parser.room.permissions.YouAreControllerMessageParser

package com.sulake.habbo.communication.messages.parser.room.permissions{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class YouAreControllerMessageParser implements IMessageParser {

        private var _roomControllerLevel:int;

        public function YouAreControllerMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get roomControllerLevel():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.permissions

