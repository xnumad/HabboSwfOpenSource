//com.sulake.habbo.communication.messages.incoming.game.arena.Game2GameEndingMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2GameEndingMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameEndingMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameEndingMessageEvent(k:Function);

        public function getParser():Game2GameEndingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

