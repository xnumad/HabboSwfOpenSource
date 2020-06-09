package com.sulake.habbo.notifications.utils
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.room.ImageResult;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.inventory.enum.FurniCategory;

    public class ProductImageUtility implements IGetImageListener 
    {
        private var _roomEngine:IRoomEngine;
        private var _inventory:IHabboInventory;

        public function ProductImageUtility(k:IRoomEngine, _arg_2:IHabboInventory)
        {
            this._roomEngine = k;
            this._inventory = _arg_2;
        }

        public function dispose():void
        {
            this._roomEngine = null;
            this._inventory = null;
        }

        public function _Str_23662(k:String, _arg_2:int, _arg_3:String):BitmapData
        {
            var _local_4:BitmapDataAsset;
            var _local_5:ImageResult;
            var _local_6:BitmapData;
            var _local_7:int;
            switch (k)
            {
                case CatalogPageMessageProductData.PRODUCT_TYPE_STUFF:
                    _local_5 = this._roomEngine.getFurnitureIcon(_arg_2, this);
                    break;
                case CatalogPageMessageProductData.PRODUCT_TYPE_ITEM:
                    _local_7 = this._Str_23700("I", _arg_2);
                    if (_local_7 == 1)
                    {
                        _local_5 = this._roomEngine.getWallItemIcon(_arg_2, this, _arg_3);
                    }
                    else
                    {
                        switch (_local_7)
                        {
                            case FurniCategory.WALL_PAPER:
                                _local_4 = ((this._inventory as Component).assets.getAssetByName("icon_wallpaper_png") as BitmapDataAsset);
                                if (_local_4 != null)
                                {
                                    _local_6 = (_local_4.content as BitmapData).clone();
                                }
                                break;
                            case FurniCategory.LANDSCAPE:
                                _local_4 = ((this._inventory as Component).assets.getAssetByName("icon_landscape_png") as BitmapDataAsset);
                                if (_local_4 != null)
                                {
                                    _local_6 = (_local_4.content as BitmapData).clone();
                                }
                                break;
                            case FurniCategory.FLOOR:
                                _local_4 = ((this._inventory as Component).assets.getAssetByName("icon_floor_png") as BitmapDataAsset);
                                if (_local_4 != null)
                                {
                                    _local_6 = (_local_4.content as BitmapData).clone();
                                }
                                break;
                        }
                        _local_5 = null;
                    }
                    break;
                case CatalogPageMessageProductData.PRODUCT_TYPE_EFFECT:
                    _local_4 = ((this._inventory as Component).assets.getAssetByName((("fx_icon_" + _arg_2) + "_png")) as BitmapDataAsset);
                    if (_local_4 != null)
                    {
                        _local_6 = (_local_4.content as BitmapData).clone();
                    }
                    break;
                default:
                    Logger.log("[HabboNotifications] Can not yet handle this type of product: ");
            }
            if (_local_5 != null)
            {
                _local_6 = _local_5.data;
            }
            return _local_6;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_23700(k:String, _arg_2:int):int
        {
            if (k == "S")
            {
                return 1;
            }
            if (k == "I")
            {
                if (_arg_2 == 3001)
                {
                    return FurniCategory.WALL_PAPER;
                }
                if (_arg_2 == 3002)
                {
                    return FurniCategory.FLOOR;
                }
                if (_arg_2 == 4057)
                {
                    return FurniCategory.LANDSCAPE;
                }
                return 1;
            }
            return 1;
        }
    }
}
