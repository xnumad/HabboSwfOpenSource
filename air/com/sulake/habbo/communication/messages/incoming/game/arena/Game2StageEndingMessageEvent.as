//com.sulake.habbo.communication.messages.incoming.game.arena.Game2StageEndingMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2StageEndingMessageParser;

    [SecureSWF(rename="true")]
    public class Game2StageEndingMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2StageEndingMessageEvent(k:Function);

        public function getParser():Game2StageEndingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

