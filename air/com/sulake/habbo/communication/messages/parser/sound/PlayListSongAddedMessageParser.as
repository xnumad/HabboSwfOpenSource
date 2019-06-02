//com.sulake.habbo.communication.messages.parser.sound.PlayListSongAddedMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PlayListSongAddedMessageParser implements IMessageParser {

        private var _entry:PlayListEntry;

        public function PlayListSongAddedMessageParser();

        public function get entry():PlayListEntry;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

