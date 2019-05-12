package com.sulake.habbo.friendlist
{
    public class RelationshipStatusEnum 
    {
        public static const NONE:int = 0;
        public static const _Str_9205:int = 1;
        public static const _Str_8388:int = 2;
        public static const _Str_8824:int = 3;
        private static const _Str_17215:Array = ["none", "heart", "smile", "bobba"];
		private static const relationshipColors:Array = [0x6e6b67, 0xFA61A5, 0xEBEB3F, 0xA1A1A1];


        public static function _Str_7401(k:int):String
        {
            return _Str_17215[k];
        }
		
		public static function relationshipColor(k:int):int
		{
			return relationshipColors[k];
		}

        public static function get _Str_15184():Array
        {
            return [_Str_9205, _Str_8388, _Str_8824];
        }

        public static function _Str_25054(k:String):int
        {
            var _local_2:int;
            for each (_local_2 in _Str_15184)
            {
                if (_Str_7401(_local_2) == k)
                {
                    return _local_2;
                }
            }
            return NONE;
        }
    }
}
