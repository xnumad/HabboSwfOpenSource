//com.sulake.habbo.communication.messages.parser.room.action.ExpressionMessageParser

package com.sulake.habbo.communication.messages.parser.room.action{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ExpressionMessageParser implements IMessageParser {

        private var _userId:int;
        private var _expressionType:int;

        public function ExpressionMessageParser();

        public function get userId():int;

        public function get expressionType():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.action

