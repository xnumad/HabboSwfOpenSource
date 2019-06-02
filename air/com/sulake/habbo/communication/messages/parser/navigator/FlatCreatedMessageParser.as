//com.sulake.habbo.communication.messages.parser.navigator.FlatCreatedMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatCreatedMessageParser implements IMessageParser {

        private var _flatId:int;
        private var _flatName:String;

        public function FlatCreatedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get flatId():int;

        public function get flatName():String;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

