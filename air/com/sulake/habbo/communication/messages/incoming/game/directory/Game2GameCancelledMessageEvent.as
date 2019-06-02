//com.sulake.habbo.communication.messages.incoming.game.directory.Game2GameCancelledMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2GameCancelledMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameCancelledMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameCancelledMessageEvent(k:Function);

        public function getParser():Game2GameCancelledMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

