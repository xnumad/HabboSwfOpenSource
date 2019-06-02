//com.sulake.habbo.communication.messages.incoming.game.lobby.LoadGameMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameMessageParser;

    [SecureSWF(rename="true")]
    public class LoadGameMessageEvent extends MessageEvent implements IMessageEvent {

        public function LoadGameMessageEvent(k:Function);

        public function getParser():LoadGameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

