//com.sulake.habbo.communication.messages.parser.moderation.ModMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ModMessageParser implements IMessageParser {

        private var _message:String;
        private var _url:String;

        public function ModMessageParser();

        public function get message():String;

        public function get url():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

