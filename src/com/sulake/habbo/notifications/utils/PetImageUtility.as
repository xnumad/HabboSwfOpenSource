package com.sulake.habbo.notifications.utils
{
    import com.sulake.habbo.room.IRoomEngine;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;

    public class PetImageUtility 
    {
        private static var _Str_2280:IRoomEngine;

        public function PetImageUtility(k:IRoomEngine)
        {
            _Str_2280 = k;
        }

        public function dispose():void
        {
            _Str_2280 = null;
        }

        public function getPetImage(k:int, _arg_2:int, _arg_3:String, _arg_4:int=3, _arg_5:Boolean=false, _arg_6:int=32, _arg_7:String=null):BitmapData
        {
            if (_Str_2280 == null)
            {
                Logger.log("Pet Image Utility; Pet image creation failed: Room engine is not defined");
                return null;
            }
            var _local_8:BitmapData;
            if (((k < 0) || (_arg_2 < 0)))
            {
                return _local_8;
            }
            var _local_9:uint = parseInt(_arg_3, 16);
            var _local_10:uint;
            var _local_11:ImageResult = _Str_2280.getPetImage(k, _arg_2, _local_9, new Vector3d((45 * _arg_4)), _arg_6, null, _arg_5, _local_10, null, _arg_7);
            if (_local_11 != null)
            {
                _local_8 = _local_11.data;
            }
            return _local_8;
        }
    }
}
