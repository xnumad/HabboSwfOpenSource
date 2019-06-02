//com.sulake.habbo.communication.messages.incoming.game.directory.Game2GameCreatedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2GameCreatedMessageParser;

    [SecureSWF(rename="true")]
    public class Game2GameCreatedMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2GameCreatedMessageEvent(k:Function);

        public function getParser():Game2GameCreatedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

