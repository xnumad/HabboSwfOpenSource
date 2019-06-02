//com.sulake.habbo.communication.messages.incoming.game.arena.Game2ArenaEnteredMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2ArenaEnteredMessageParser;

    [SecureSWF(rename="true")]
    public class Game2ArenaEnteredMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2ArenaEnteredMessageEvent(k:Function);

        public function getParser():Game2ArenaEnteredMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

