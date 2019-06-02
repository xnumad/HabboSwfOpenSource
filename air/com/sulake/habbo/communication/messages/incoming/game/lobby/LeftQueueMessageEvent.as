//com.sulake.habbo.communication.messages.incoming.game.lobby.LeftQueueMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LeftQueueMessageParser;

    [SecureSWF(rename="true")]
    public class LeftQueueMessageEvent extends MessageEvent implements IMessageEvent {

        public function LeftQueueMessageEvent(k:Function);

        public function getParser():LeftQueueMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

