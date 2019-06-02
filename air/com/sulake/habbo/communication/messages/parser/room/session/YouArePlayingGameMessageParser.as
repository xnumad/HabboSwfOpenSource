//com.sulake.habbo.communication.messages.parser.room.session.YouArePlayingGameMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class YouArePlayingGameMessageParser implements IMessageParser {

        private var _isPlaying:Boolean;

        public function YouArePlayingGameMessageParser();

        public function get isPlaying():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

