package com.sulake.habbo.game.events
{
    import flash.events.Event;

    public class GameChatEvent extends Event 
    {
        public static const GCE_GAME_CHAT:String = "gce_game_chat";

        private var _userId:int;
        private var _message:String;
        private var _locX:int;
        private var _color:uint;
        private var _figure:String;
        private var _gender:String;
        private var _name:String;
        private var _notify:Boolean;

        public function GameChatEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:uint, _arg_6:String, _arg_7:String, _arg_8:String, _arg_9:Boolean, _arg_10:Boolean=false, _arg_11:Boolean=false)
        {
            super(k, _arg_10, _arg_11);
            this._userId = _arg_2;
            this._message = _arg_3;
            this._locX = _arg_4;
            this._color = _arg_5;
            this._figure = _arg_6;
            this._gender = _arg_7;
            this._name = _arg_8;
            this._notify = _arg_9;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get message():String
        {
            return this._message;
        }

        public function get _Str_19907():int
        {
            return this._locX;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get notify():Boolean
        {
            return this._notify;
        }
    }
}
