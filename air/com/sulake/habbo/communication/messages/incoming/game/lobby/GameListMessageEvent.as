//com.sulake.habbo.communication.messages.incoming.game.lobby.GameListMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameListMessageParser;

    [SecureSWF(rename="true")]
    public class GameListMessageEvent extends MessageEvent implements IMessageEvent {

        public function GameListMessageEvent(k:Function);

        public function getParser():GameListMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

