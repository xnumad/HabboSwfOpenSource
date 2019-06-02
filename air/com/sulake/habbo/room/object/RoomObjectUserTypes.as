//com.sulake.habbo.room.object.RoomObjectUserTypes

package com.sulake.habbo.room.object{
    import flash.utils.Dictionary;

    public class RoomObjectUserTypes {

        public static const USER:String;
        public static const PET:String;
        public static const BOT:String;
        public static const RENTABLE_BOT:String;
        public static const MONSTERPLANT:String;
        private static const _IDS:Dictionary;

        public function RoomObjectUserTypes();

        public static function getTypeId(k:String):int;

        public static function getName(k:int):String;

        public static function getVisualizationType(k:String):String;


    }
}//package com.sulake.habbo.room.object

