package com.sulake.habbo.communication.messages.parser.room.furniture
{
    public class YoutubePlayListNode 
    {
        private var _video:String;
        private var _title:String;
        private var _description:String;

        public function YoutubePlayListNode(k:String, _arg_2:String, _arg_3:String)
        {
            this._video = k;
            this._title = _arg_2;
            this._description = _arg_3;
        }

        public function get video():String
        {
            return this._video;
        }

        public function get title():String
        {
            return this._title;
        }

        public function get description():String
        {
            return this._description;
        }
    }
}
