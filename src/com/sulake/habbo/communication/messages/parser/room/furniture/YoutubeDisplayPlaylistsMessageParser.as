package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class YoutubeDisplayPlaylistsMessageParser implements IMessageParser 
    {
        private var _furniId:int;
        private var _playlists:Vector.<YoutubePlayListNode>;
        private var _selectedPlaylistId:String;


        public function flush():Boolean
        {
            this._playlists = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._furniId = k.readInteger();
            var count:int = k.readInteger();
            this._playlists = new Vector.<YoutubePlayListNode>(0);
            var index:int;
            while (index < count)
            {
                this._playlists.push(new YoutubePlayListNode(k.readString(), k.readString(), k.readString()));
                index++;
            }
            this._selectedPlaylistId = k.readString();
            return true;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get playlists():Vector.<YoutubePlayListNode>
        {
            return this._playlists;
        }

        public function get unknownString():String
        {
            return this._selectedPlaylistId;
        }
    }
}
