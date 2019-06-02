//com.sulake.habbo.communication.messages.incoming.game.lobby.JoinedQueueMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.JoinedQueueMessageParser;

    [SecureSWF(rename="true")]
    public class JoinedQueueMessageEvent extends MessageEvent implements IMessageEvent {

        public function JoinedQueueMessageEvent(k:Function);

        public function getParser():JoinedQueueMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

