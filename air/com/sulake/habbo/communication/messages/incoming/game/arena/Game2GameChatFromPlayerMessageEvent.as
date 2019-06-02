//com.sulake.habbo.communication.messages.incoming.game.arena.Game2GameChatFromPlayerMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.arena{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.arena.Game2GameChatFromPlayerMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameChatFromPlayerMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameChatFromPlayerMessageEvent(k:Function);

        public function getParser():Game2GameChatFromPlayerMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.arena

