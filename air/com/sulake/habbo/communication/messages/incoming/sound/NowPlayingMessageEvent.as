//com.sulake.habbo.communication.messages.incoming.sound.NowPlayingMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.NowPlayingMessageParser;

    [SecureSWF(rename="true")]
    public class NowPlayingMessageEvent extends MessageEvent implements IMessageEvent {

        public function NowPlayingMessageEvent(k:Function);

        public function getParser():NowPlayingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

