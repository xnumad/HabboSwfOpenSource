//com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry

package com.sulake.habbo.communication.messages.incoming.sound{
    public class PlayListEntry {

        protected var _songId:int;
        protected var _songLength:int;
        protected var _songName:String;
        protected var _songCreator:String;
        private var _startPlayHead:Number = 0;

        public function PlayListEntry(k:int, _arg_2:int, _arg_3:String, _arg_4:String);

        public function get id():int;

        public function get length():int;

        public function get name():String;

        public function get creator():String;

        public function get startPlayHeadPos():Number;

        public function set startPlayHeadPos(k:Number):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.sound

