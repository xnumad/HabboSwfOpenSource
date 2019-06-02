//com.sulake.habbo.communication.messages.parser.sound.NowPlayingMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NowPlayingMessageParser implements IMessageParser {

        private var _currentSongId:int;
        private var _currentPosition:int;
        private var _nextSongId:int;
        private var _nextPosition:int;
        private var _syncCount:int;

        public function NowPlayingMessageParser();

        public function get currentSongId():int;

        public function get currentPosition():int;

        public function get nextSongId():int;

        public function get nextPosition():int;

        public function get syncCount():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

