//com.sulake.habbo.communication.messages.parser.sound.OfficialSongIdMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OfficialSongIdMessageParser implements IMessageParser {

        private var _songId:int;
        private var _officialSongId:String;

        public function OfficialSongIdMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get songId():int;

        public function get officialSongId():String;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

