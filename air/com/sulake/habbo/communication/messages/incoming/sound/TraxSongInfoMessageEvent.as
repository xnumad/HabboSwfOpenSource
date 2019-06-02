//com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;

    [SecureSWF(rename="true")]
    public class TraxSongInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function TraxSongInfoMessageEvent(k:Function);

        public function getParser():TraxSongInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

