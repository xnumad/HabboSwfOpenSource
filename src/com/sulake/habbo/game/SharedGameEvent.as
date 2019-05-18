package com.sulake.habbo.game
{
    import flash.events.Event;

    public class SharedGameEvent extends Event 
    {
        public static const API_VERSION:int = 1;
        public static const EVENT_TYPE_TO_HABBO:String = "HabboGameAPIEventToHabbo";
        public static const EVENT_TYPE_TO_GAME:String = "HabboGameAPIEventToGame";

        public var api:int;
        public var name:String;
        public var content:*;

        public function SharedGameEvent(k:String, _arg_2:int, _arg_3:String, _arg_4:*=null)
        {
            super(k);
            this.api = _arg_2;
            this.name = _arg_3;
            this.content = _arg_4;
        }

        public static function createToHabbo(k:String, _arg_2:*=null):SharedGameEvent
        {
            return new SharedGameEvent(EVENT_TYPE_TO_HABBO, API_VERSION, k, _arg_2);
        }

        public static function createToGame(k:String, _arg_2:*=null):SharedGameEvent
        {
            return new SharedGameEvent(EVENT_TYPE_TO_GAME, API_VERSION, k, _arg_2);
        }
    }
}
