//com.sulake.habbo.communication.messages.incoming.game.arena.Game2PlayerExitedGameArenaMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2PlayerExitedGameArenaMessageParser;

    [SecureSWF(rename="true")]
    public class Game2PlayerExitedGameArenaMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2PlayerExitedGameArenaMessageEvent(k:Function);

        public function getParser():Game2PlayerExitedGameArenaMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

