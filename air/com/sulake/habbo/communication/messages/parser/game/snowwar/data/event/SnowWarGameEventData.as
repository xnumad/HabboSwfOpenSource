//com.sulake.habbo.communication.messages.parser.game.snowwar.data.event.SnowWarGameEventData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameEventData {

        public static const EVENT_HUMAN_LEFT_GAME:int;
        public static const EVENT_NEW_MOVE_TARGET:int;
        public static const EVENT_THROWS_SNOWBALL_AT_HUMAN:int;
        public static const EVENT_THROWS_SNOWBALL_AT_POSITION:int;
        public static const EVENT_HUMAN_STARTS_TO_MAKE_A_SNOWBALL:int;
        public static const EVENT_CREATE_SNOWBALL:int;
        public static const EVENT_MACHINE_CREATES_SNOWBALL:int;
        public static const EVENT_HUMAN_GETS_SNOWBALL_FROM_MACHINE:int;

        private var _id:int;

        public function SnowWarGameEventData(k:int);

        public static function create(k:int):SnowWarGameEventData;


        public function get id():int;

        public function set id(k:int):void;

        public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.event

