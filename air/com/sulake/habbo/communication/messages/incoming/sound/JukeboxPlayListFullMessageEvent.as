//com.sulake.habbo.communication.messages.incoming.sound.JukeboxPlayListFullMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.JukeboxPlayListFullMessageParser;

    [SecureSWF(rename="true")]
    public class JukeboxPlayListFullMessageEvent extends MessageEvent implements IMessageEvent {

        public function JukeboxPlayListFullMessageEvent(k:Function);

        public function getParser():JukeboxPlayListFullMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

