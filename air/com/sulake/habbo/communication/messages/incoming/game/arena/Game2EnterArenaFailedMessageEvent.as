//com.sulake.habbo.communication.messages.incoming.game.arena.Game2EnterArenaFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2EnterArenaFailedMessageParser;

    [SecureSWF(rename="true")]
    public class Game2EnterArenaFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2EnterArenaFailedMessageEvent(k:Function);

        public function getParser():Game2EnterArenaFailedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

