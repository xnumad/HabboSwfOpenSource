//com.sulake.habbo.communication.messages.incoming.game.arena.Game2StageStartingMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageStartingMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StageStartingMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StageStartingMessageEvent(k:Function);

        public function getParser():Game2StageStartingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

