//com.sulake.habbo.communication.messages.incoming.sound.PlayListMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.PlayListMessageParser;

    [SecureSWF(rename="true")]
    public class PlayListMessageEvent extends MessageEvent implements IMessageEvent {

        public function PlayListMessageEvent(k:Function);

        public function getParser():PlayListMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

