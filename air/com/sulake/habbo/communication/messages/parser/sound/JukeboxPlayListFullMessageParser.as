//com.sulake.habbo.communication.messages.parser.sound.JukeboxPlayListFullMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class JukeboxPlayListFullMessageParser implements IMessageParser {

        public function JukeboxPlayListFullMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

