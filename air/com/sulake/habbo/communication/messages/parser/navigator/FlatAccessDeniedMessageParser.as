//com.sulake.habbo.communication.messages.parser.navigator.FlatAccessDeniedMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatAccessDeniedMessageParser implements IMessageParser {

        private var _userName:String;

        public function FlatAccessDeniedMessageParser();

        public function get userName():String;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

