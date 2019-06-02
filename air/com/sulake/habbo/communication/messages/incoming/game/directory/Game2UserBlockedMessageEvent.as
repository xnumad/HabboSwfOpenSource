//com.sulake.habbo.communication.messages.incoming.game.directory.Game2UserBlockedMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2UserBlockedMessageParser;

    [SecureSWF(rename="true")]
    public class Game2UserBlockedMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2UserBlockedMessageEvent(k:Function);

        public function getParser():Game2UserBlockedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

