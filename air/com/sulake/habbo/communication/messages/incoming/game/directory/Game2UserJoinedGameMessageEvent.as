//com.sulake.habbo.communication.messages.incoming.game.directory.Game2UserJoinedGameMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.directory{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2UserJoinedGameMessageParser;

    [SecureSWF(rename="true")]
    public class Game2UserJoinedGameMessageEvent extends MessageEvent implements IMessageEvent {

        public function Game2UserJoinedGameMessageEvent(k:Function);

        public function getParser():Game2UserJoinedGameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.directory

