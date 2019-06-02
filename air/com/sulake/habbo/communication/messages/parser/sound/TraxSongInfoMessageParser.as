//com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class TraxSongInfoMessageParser implements IMessageParser {

        private var _songs:Array;

        public function TraxSongInfoMessageParser();

        public function get songs():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

