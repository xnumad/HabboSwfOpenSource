//com.sulake.habbo.communication.messages.parser.sound.PlayListMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PlayListMessageParser implements IMessageParser {

        private var _synchronizationCount:int;
        private var _playlist:Array;

        public function PlayListMessageParser();

        public function get synchronizationCount():int;

        public function get playList():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

