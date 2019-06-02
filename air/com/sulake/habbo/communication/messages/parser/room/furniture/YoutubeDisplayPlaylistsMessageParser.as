//com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayPlaylistsMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class YoutubeDisplayPlaylistsMessageParser implements IMessageParser {

        private var _furniId:int;
        private var _playlists:Vector.<YoutubeDisplayPlaylist>;
        private var _selectedPlaylistId:String;

        public function YoutubeDisplayPlaylistsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get furniId():int;

        public function get playlists():Vector.<YoutubeDisplayPlaylist>;

        public function get selectedPlaylistId():String;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

