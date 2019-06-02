//com.sulake.habbo.communication.messages.incoming.game.arena.Game2GameRejoinMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2GameRejoinMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameRejoinMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameRejoinMessageEvent(k:Function);

        public function getParser():Game2GameRejoinMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

