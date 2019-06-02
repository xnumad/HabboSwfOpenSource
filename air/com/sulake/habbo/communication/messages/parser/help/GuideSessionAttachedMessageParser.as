//com.sulake.habbo.communication.messages.parser.help.GuideSessionAttachedMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionAttachedMessageParser implements IMessageParser {

        private var _asGuide:Boolean;
        private var _helpRequestType:int;
        private var _helpRequestDescription:String;
        private var _roleSpecificWaitTime:int;

        public function GuideSessionAttachedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get asGuide():Boolean;

        public function get helpRequestType():int;

        public function get helpRequestDescription():String;

        public function get roleSpecificWaitTime():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

