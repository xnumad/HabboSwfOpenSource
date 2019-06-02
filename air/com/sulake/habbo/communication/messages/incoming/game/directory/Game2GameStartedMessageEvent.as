//com.sulake.habbo.communication.messages.incoming.game.directory.Game2GameStartedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2GameStartedMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameStartedMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameStartedMessageEvent(k:Function);

        public function getParser():Game2GameStartedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

