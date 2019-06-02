//com.sulake.habbo.communication.messages.incoming.game.lobby.LoadGameUrlMessageEvent

package com.sulake.habbo.communication.messages.incoming.game.lobby{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameUrlMessageParser;

    [SecureSWF(rename="true")]
    public class LoadGameUrlMessageEvent extends MessageEvent implements IMessageEvent {

        public function LoadGameUrlMessageEvent(k:Function);

        public function getParser():LoadGameUrlMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.lobby

