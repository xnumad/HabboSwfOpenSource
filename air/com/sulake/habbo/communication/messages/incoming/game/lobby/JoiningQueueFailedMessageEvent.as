//com.sulake.habbo.communication.messages.incoming.game.lobby.JoiningQueueFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.JoiningQueueFailedMessageParser;

    [SecureSWF(rename="true")]
    public class JoiningQueueFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function JoiningQueueFailedMessageEvent(k:Function);

        public function getParser():JoiningQueueFailedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

