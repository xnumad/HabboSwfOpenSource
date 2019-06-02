//com.sulake.habbo.communication.messages.parser.help.GuideSessionMessageMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionMessageMessageParser implements IMessageParser {

        private var _chatMessage:String;
        private var _senderId:int;

        public function GuideSessionMessageMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get chatMessage():String;

        public function get senderId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

