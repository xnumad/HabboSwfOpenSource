//com.sulake.habbo.communication.messages.incoming.sound.PlayListSongAddedMessageEvent

package com.sulake.habbo.communication.messages.incoming.sound{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.sound.PlayListSongAddedMessageParser;

    [SecureSWF(rename="true")]
    public class PlayListSongAddedMessageEvent extends MessageEvent implements IMessageEvent {

        public function PlayListSongAddedMessageEvent(k:Function);

        public function getParser():PlayListSongAddedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

