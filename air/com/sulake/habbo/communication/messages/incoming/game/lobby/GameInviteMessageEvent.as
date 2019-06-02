//com.sulake.habbo.communication.messages.incoming.game.lobby.GameInviteMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameInviteMessageParser;

    [SecureSWF(rename="true")]
    public class GameInviteMessageEvent extends MessageEvent implements IMessageEvent {

        public function GameInviteMessageEvent(k:Function);

        public function getParser():GameInviteMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

