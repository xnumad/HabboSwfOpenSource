//com.sulake.habbo.communication.messages.parser.sound.JukeboxSongDisksMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class JukeboxSongDisksMessageParser implements IMessageParser {

        private var _songDisks:Map;
        private var _maxLength:int;

        public function JukeboxSongDisksMessageParser();

        public function get songDisks():Map;

        public function get maxLength():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

