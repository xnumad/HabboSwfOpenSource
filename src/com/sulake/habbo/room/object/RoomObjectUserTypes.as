package com.sulake.habbo.room.object
{
    import flash.utils.Dictionary;

    public class RoomObjectUserTypes 
    {
        public static const USER:String = "user";
        public static const PET:String = "pet";
        public static const BOT:String = "bot";
        public static const RENTABLE_BOT:String = "rentable_bot";
        public static const MONSTERPLANT:String = "monsterplant";
        private static const _Str_5794:Dictionary = new Dictionary();

        {
            _Str_5794[USER] = 1;
            _Str_5794[PET] = 2;
            _Str_5794[BOT] = 3;
            _Str_5794[RENTABLE_BOT] = 4;
        }


        public static function _Str_19576(k:String):int
        {
            return _Str_5794[k];
        }

        public static function _Str_4290(k:int):String
        {
            var _local_2:String;
            for (_local_2 in _Str_5794)
            {
                if (_Str_5794[_local_2] == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public static function getVisualizationType(k:String):String
        {
            switch (k)
            {
                case BOT:
                case RENTABLE_BOT:
                    return USER;
                default:
                    return k;
            }
        }
    }
}
