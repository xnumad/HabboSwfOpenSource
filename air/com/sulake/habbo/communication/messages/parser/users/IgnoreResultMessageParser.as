//com.sulake.habbo.communication.messages.parser.users.IgnoreResultMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class IgnoreResultMessageParser implements IMessageParser {

        private var _result:int;
        private var _name:String;

        public function IgnoreResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get result():int;

        public function get name():String;


    }
}//package com.sulake.habbo.communication.messages.parser.users

