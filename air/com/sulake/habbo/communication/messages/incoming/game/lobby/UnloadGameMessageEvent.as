//com.sulake.habbo.communication.messages.incoming.game.lobby.UnloadGameMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.UnloadGameMessageParser;

    [SecureSWF(rename="true")]
    public class UnloadGameMessageEvent extends MessageEvent implements IMessageEvent {

        public function UnloadGameMessageEvent(k:Function);

        public function getParser():UnloadGameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

