//com.sulake.habbo.communication.messages.parser.help.CallForHelpDisabledNotifyMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CallForHelpDisabledNotifyMessageParser implements IMessageParser {

        private var _infoUrl:String;

        public function CallForHelpDisabledNotifyMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get infoUrl():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

