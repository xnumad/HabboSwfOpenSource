//com.sulake.habbo.communication.messages.incoming.game.directory.Game2StopCounterMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2InArenaQueueMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StopCounterMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StopCounterMessageEvent(k:Function);

        public function getParser():Game2InArenaQueueMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

