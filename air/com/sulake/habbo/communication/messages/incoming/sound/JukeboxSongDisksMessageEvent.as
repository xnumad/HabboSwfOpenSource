//com.sulake.habbo.communication.messages.incoming.sound.JukeboxSongDisksMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.JukeboxSongDisksMessageParser;

    [SecureSWF(rename="true")]
    public class JukeboxSongDisksMessageEvent extends MessageEvent implements IMessageEvent {

        public function JukeboxSongDisksMessageEvent(k:Function);

        public function getParser():JukeboxSongDisksMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

