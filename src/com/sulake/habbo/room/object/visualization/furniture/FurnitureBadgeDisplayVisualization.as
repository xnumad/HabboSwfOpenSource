package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FurnitureBadgeDisplayVisualization extends FurnitureAnimatedVisualization 
    {
        private static const BADGE:String = "BADGE";

        private var _badgeAssetNameNormalScale:String = "";
        private var _badgeAssetNameSmallScale:String = "";
        private var _badgeVisibleInState:int = -1;


        override protected function updateModel(k:Number):Boolean
        {
            var _local_3:Boolean;
            var _local_2:Boolean = super.updateModel(k);
            if (!isNaN(object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_BADGE_IMAGE_STATUS)))
            {
                _local_3 = (!(object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_BADGE_IMAGE_STATUS) == 0));
                if (((_local_3) && (this._badgeAssetNameNormalScale == "")))
                {
                    this._badgeAssetNameNormalScale = object.getModel().getString(RoomObjectVariableEnum.FURNITURE_BADGE_ASSET_NAME);
                    if (this._badgeAssetNameSmallScale == "")
                    {
                        this._badgeAssetNameSmallScale = (this._badgeAssetNameNormalScale + "_32");
                    }
                    if (object.getModel().hasNumber(RoomObjectVariableEnum.FURNITURE_BADGE_VISIBLE_IN_STATE))
                    {
                        this._badgeVisibleInState = object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_BADGE_VISIBLE_IN_STATE);
                    }
                    _local_2 = true;
                }
            }
            return _local_2;
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_3:String = getSpriteTag(k, direction, _arg_2);
            if (((!(_local_3 == BADGE)) || ((!(this._badgeVisibleInState == -1)) && (!(object.getState(0) == this._badgeVisibleInState)))))
            {
                return super.getSpriteAssetName(k, _arg_2);
            }
            if (k == 32)
            {
                return this._badgeAssetNameSmallScale;
            }
            return this._badgeAssetNameNormalScale;
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_5:IGraphicAsset;
            var _local_4:int = super.getSpriteXOffset(k, _arg_2, _arg_3);
            if (getSpriteTag(k, _arg_2, _arg_3) == BADGE)
            {
                _local_5 = getAsset(((k == 32) ? this._badgeAssetNameSmallScale : this._badgeAssetNameNormalScale), _arg_3);
                if (k == 64)
                {
                    _local_4 = (_local_4 + ((40 - _local_5.width) / 2));
                }
                else
                {
                    _local_4 = (_local_4 + ((20 - _local_5.width) / 2));
                }
            }
            return _local_4;
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_5:IGraphicAsset;
            var _local_4:int = super.getSpriteYOffset(k, _arg_2, _arg_3);
            if (getSpriteTag(k, _arg_2, _arg_3) == BADGE)
            {
                _local_5 = getAsset(((k == 32) ? this._badgeAssetNameSmallScale : this._badgeAssetNameNormalScale), _arg_3);
                if (k == 64)
                {
                    _local_4 = (_local_4 + ((40 - _local_5.height) / 2));
                }
                else
                {
                    _local_4 = (_local_4 + ((20 - _local_5.height) / 2));
                }
            }
            return _local_4;
        }

        override protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            if (_arg_2.tag == BADGE)
            {
                return (("%image.library.url%" + "album1584/") + _arg_2.assetName.replace("badge_", "")) + ".gif";
            }
            return super.getLibraryAssetNameForSprite(k, _arg_2);
        }
    }
}
