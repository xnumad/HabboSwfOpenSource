//com.sulake.habbo.communication.messages.incoming.game.directory.Game2UserLeftGameMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2UserLeftGameMessageParser;

    [SecureSWF(rename="true")]
    public class Game2UserLeftGameMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2UserLeftGameMessageEvent(k:Function);

        public function getParser():Game2UserLeftGameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

