package com.sulake.habbo.catalog.recycler
{
    import com.sulake.habbo.catalog.viewer.ProductGridItem;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.viewer.IGridItem;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.ImageResult;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.room.IRoomEngine;

    public class PrizeItemContainer extends ProductGridItem implements IGetImageListener, IGridItem 
    {
        public function PrizeItemContainer(k:HabboCatalog)
        {
            super(k);
        }

        protected function initProductIcon(k:IRoomEngine, _arg_2:String, _arg_3:int, _arg_4:String=""):void
        {
            var _local_6:ImageResult;
            var _local_5:BitmapData;
            switch (_arg_2)
            {
                case ProductTypeEnum.FLOOR:
                    _local_6 = k.getFurnitureIcon(_arg_3, this);
                    break;
                case ProductTypeEnum.WALL:
                    _local_6 = k.getWallItemIcon(_arg_3, this, _arg_4);
                    break;
                default:
                    Logger.log(("[PrizeItemContainer] Can not yet handle this type of product: " + _arg_2));
                    return;
            }
            if (_local_6 != null)
            {
                _local_5 = _local_6.data;
                setIconImage(_local_5, true);
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (disposed)
            {
                return;
            }
            setIconImage(_arg_2, true);
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
