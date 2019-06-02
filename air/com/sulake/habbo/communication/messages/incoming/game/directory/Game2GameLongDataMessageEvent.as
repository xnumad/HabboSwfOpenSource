//com.sulake.habbo.communication.messages.incoming.game.directory.Game2GameLongDataMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2GameLongDataMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameLongDataMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameLongDataMessageEvent(k:Function);

        public function getParser():Game2GameLongDataMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

