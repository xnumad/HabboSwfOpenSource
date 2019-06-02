//com.sulake.habbo.communication.messages.parser.navigator.FlatCatMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatCatMessageParser implements IMessageParser {

        private var _flatId:int;
        private var _nodeId:int;

        public function FlatCatMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get flatId():int;

        public function get nodeId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

