//com.sulake.habbo.communication.messages.incoming.game.directory.Game2JoiningGameFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2JoiningGameFailedMessageParser;

    [SecureSWF(rename="true")]
    public class Game2JoiningGameFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2JoiningGameFailedMessageEvent(k:Function);

        public function getParser():Game2JoiningGameFailedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

