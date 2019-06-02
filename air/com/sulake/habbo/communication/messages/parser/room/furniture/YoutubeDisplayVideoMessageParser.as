//com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayVideoMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class YoutubeDisplayVideoMessageParser implements IMessageParser {

        private var _furniId:int;
        private var _videoId:String;
        private var _startAtSeconds:int;
        private var _endAtSeconds:int;

        public function YoutubeDisplayVideoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get furniId():int;

        public function get videoId():String;

        public function get startAtSeconds():int;

        public function get endAtSeconds():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

