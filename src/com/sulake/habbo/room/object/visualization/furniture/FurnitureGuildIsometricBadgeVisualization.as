package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FurnitureGuildIsometricBadgeVisualization extends FurnitureThumbnailVisualization 
    {
        private static const PRIMARY_COLOUR_SPRITE_TAG:String = "COLOR1";
        private static const SECONDARY_COLOUR_SPRITE_TAG:String = "COLOR2";
        private static const DEFAULT_COLOR_1:int = 0xEEEEEE;
        private static const DEFAULT_COLOR_2:int = 0x4B4B4B;

        private var _color1:int;
        private var _color2:int;


        override protected function updateModel(k:Number):Boolean
        {
            var _local_5:String;
            var _local_2:Boolean = super.updateModel(k);
            if (!_Str_23660)
            {
                _local_5 = object.getModel().getString(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_ASSET_NAME);
                if (_local_5 != null)
                {
                    _Str_6645(this.safeGetBitmapAsset(_local_5), this.safeGetBitmapAsset((_local_5 + "_32")));
                }
            }
            var _local_3:Number = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_COLOR_1);
            this._color1 = ((isNaN(_local_3)) ? DEFAULT_COLOR_1 : (_local_3 as int));
            var _local_4:Number = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_COLOR_2);
            this._color2 = ((isNaN(_local_3)) ? DEFAULT_COLOR_2 : (_local_4 as int));
            return _local_2;
        }

        private function safeGetBitmapAsset(k:String):BitmapData
        {
            var _local_2:IGraphicAsset = assetCollection.getAsset(k);
            if (((_local_2 == null) || (_local_2.asset == null)))
            {
                return null;
            }
            return BitmapData(_local_2.asset.content);
        }

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(k, direction, _arg_2);
            switch (_local_4)
            {
                case PRIMARY_COLOUR_SPRITE_TAG:
                    return this._color1;
                case SECONDARY_COLOUR_SPRITE_TAG:
                    return this._color2;
            }
            return super.getSpriteColor(k, _arg_2, _arg_3);
        }

        override protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            if (_arg_2.tag == THUMBNAIL)
            {
                if (((object) && (object.getModel().getString(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_ASSET_NAME))))
                {
                    return "%group.badge.url%" + object.getModel().getString(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_ASSET_NAME).replace("badge_", "");
                }
            }
            return super.getLibraryAssetNameForSprite(k, _arg_2);
        }
    }
}
