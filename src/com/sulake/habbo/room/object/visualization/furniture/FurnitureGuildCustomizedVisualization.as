package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FurnitureGuildCustomizedVisualization extends FurnitureAnimatedVisualization 
    {
        public static const _Str_7116:String = "COLOR1";
        public static const _Str_8203:String = "COLOR2";
        public static const DEFAULT_COLOR_1:int = 0xEEEEEE;
        public static const DEFAULT_COLOR_2:int = 0x4B4B4B;
        private static const BADGE:String = "BADGE";

        private var _color1:int;
        private var _color2:int;
        private var _Str_5025:String = "";
        private var _Str_6767:String = "";


        override protected function updateModel(k:Number):Boolean
        {
            var _local_5:String;
            var _local_2:Boolean = super.updateModel(k);
            if (this._Str_5025 == "")
            {
                _local_5 = object.getModel().getString(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_ASSET_NAME);
                if (_local_5 != null)
                {
                    this._Str_5025 = _local_5;
                    this._Str_6767 = (this._Str_5025 + "_32");
                }
            }
            var _local_3:Number = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_COLOR_1);
            this._color1 = ((isNaN(_local_3)) ? DEFAULT_COLOR_1 : (_local_3 as int));
            var _local_4:Number = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_COLOR_2);
            this._color2 = ((isNaN(_local_3)) ? DEFAULT_COLOR_2 : (_local_4 as int));
            return _local_2;
        }

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(k, direction, _arg_2);
            switch (_local_4)
            {
                case _Str_7116:
                    return this._color1;
                case _Str_8203:
                    return this._color2;
            }
            return super.getSpriteColor(k, _arg_2, _arg_3);
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_3:String = getSpriteTag(k, direction, _arg_2);
            if (_local_3 == BADGE)
            {
                if (k == 32)
                {
                    return this._Str_6767;
                }
                return this._Str_5025;
            }
            return super.getSpriteAssetName(k, _arg_2);
        }

        override protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            if (_arg_2.tag == BADGE)
            {
                return "%group.badge.url%" + _arg_2.assetName.replace("badge_", "");
            }
            return super.getLibraryAssetNameForSprite(k, _arg_2);
        }
    }
}
