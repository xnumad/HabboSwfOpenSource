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
        private static const _IDS:Dictionary = new Dictionary();

        {
            _IDS[USER] = 1;
            _IDS[PET] = 2;
            _IDS[BOT] = 3;
            _IDS[RENTABLE_BOT] = 4;
        }


        public static function _Str_19576(k:String):int
        {
            return _IDS[k];
        }

        public static function getName(k:int):String
        {
            var _local_2:String;
            for (_local_2 in _IDS)
            {
                if (_IDS[_local_2] == k)
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
