//com.sulake.habbo.communication.messages.parser.navigator.DoorbellMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class DoorbellMessageParser implements IMessageParser {

        private var _userName:String;

        public function DoorbellMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get userName():String;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

