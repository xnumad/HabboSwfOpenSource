//com.sulake.habbo.communication.messages.parser.help.GuideSessionRequesterRoomMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionRequesterRoomMessageParser implements IMessageParser {

        private var _requesterRoomId:int;

        public function GuideSessionRequesterRoomMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getRequesterRoomId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

