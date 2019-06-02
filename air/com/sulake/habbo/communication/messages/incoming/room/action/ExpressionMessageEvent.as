//com.sulake.habbo.communication.messages.incoming.room.action.ExpressionMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.action{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.ExpressionMessageParser;

    [SecureSWF(rename="true")]
    public class ExpressionMessageEvent extends MessageEvent {

        public function ExpressionMessageEvent(k:Function);

        public function getParser():ExpressionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.action

