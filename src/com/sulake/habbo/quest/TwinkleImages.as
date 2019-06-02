package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;

    public class TwinkleImages implements IDisposable 
    {
        private static const _Str_17361:int = 6;

        private var _questEngine:HabboQuestEngine;

        public function TwinkleImages(k:HabboQuestEngine)
        {
            this._questEngine = k;
            var _local_2:int = 1;
            while (_local_2 <= _Str_17361)
            {
                this._questEngine.windowManager.resourceManager.retrieveAsset(_Str_15489(_local_2), null);
                _local_2++;
            }
        }

        private static function _Str_15489(k:int):String
        {
            return ("${image.library.questing.url}ach_twinkle" + k) + ".png";
        }


        public function getImage(k:int):BitmapData
        {
            var _local_2:IAsset;
            if (this._questEngine != null)
            {
                _local_2 = Component(this._questEngine.windowManager).assets.getAssetByName(this._questEngine.interpolate(_Str_15489(k)));
                if (((!(_local_2 == null)) && (_local_2 is BitmapDataAsset)))
                {
                    return _local_2.content as BitmapData;
                }
            }
            return null;
        }

        public function dispose():void
        {
            this._questEngine = null;
        }

        public function get disposed():Boolean
        {
            return !(this._questEngine == null);
        }
    }
}
