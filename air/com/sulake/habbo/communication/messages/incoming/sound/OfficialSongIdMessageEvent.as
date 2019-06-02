//com.sulake.habbo.communication.messages.incoming.sound.OfficialSongIdMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.OfficialSongIdMessageParser;

    [SecureSWF(rename="true")]
    public class OfficialSongIdMessageEvent extends MessageEvent implements IMessageEvent {

        public function OfficialSongIdMessageEvent(k:Function);

        public function getParser():OfficialSongIdMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

