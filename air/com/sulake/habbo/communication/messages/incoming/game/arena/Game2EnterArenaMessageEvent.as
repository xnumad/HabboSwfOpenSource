//com.sulake.habbo.communication.messages.incoming.game.arena.Game2EnterArenaMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2EnterArenaMessageParser;

    [SecureSWF(rename="true")]
    public class Game2EnterArenaMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2EnterArenaMessageEvent(k:Function);

        public function getParser():Game2EnterArenaMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

