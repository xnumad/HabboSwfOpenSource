//com.sulake.habbo.communication.messages.incoming.game.lobby.GameStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameStatusMessageParser;

    [SecureSWF(rename="true")]
    public class GameStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function GameStatusMessageEvent(k:Function);

        public function getParser():GameStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

