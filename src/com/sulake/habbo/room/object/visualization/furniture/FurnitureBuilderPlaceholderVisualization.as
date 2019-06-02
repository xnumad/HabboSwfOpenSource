package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureBuilderPlaceholderVisualization extends FurnitureVisualization 
    {
        private var _sizeX:int = -1;
        private var _sizeY:int = -1;


        override protected function updateModel(k:Number):Boolean
        {
            var _local_2:Boolean = super.updateModel(k);
            var _local_3:IRoomObjectModel = object.getModel();
            var _local_4:int = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
            var _local_5:int = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
            if (((!(_local_4 == this._sizeX)) || (!(_local_5 == this._sizeY))))
            {
                this._sizeX = _local_4;
                this._sizeY = _local_5;
                this.instantiateSprites(k);
            }
            return _local_2;
        }

        private function instantiateSprites(k:Number):void
        {
            this.updateLayerCount(data.getLayerCount(k));
            createSprites(((data.getLayerCount(k) * this._sizeX) * this._sizeY));
            updateSprites(k, true, 0);
        }

        override protected function updateLayerCount(k:int):void
        {
            _Str_3416 = k;
            if ((this._sizeX * this._sizeY) > 1)
            {
                _Str_3416 = (_Str_3416 * (this._sizeX * this._sizeY));
            }
        }

        override protected function getAdditionalSpriteCount():int
        {
            return 0;
        }

        override protected function getSpriteTag(k:int, _arg_2:int, _arg_3:int):String
        {
            return super.getSpriteTag(k, _arg_2, this.getIndex(k, _arg_3));
        }

        override protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int
        {
            return super.getSpriteAlpha(k, _arg_2, this.getIndex(k, _arg_3));
        }

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            return super.getSpriteColor(k, this.getIndex(k, _arg_2), _arg_3);
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            return super.getSpriteAssetName(k, this.getIndex(k, _arg_2));
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int = super.getSpriteXOffset(k, _arg_2, this.getIndex(k, _arg_3));
            var _local_5:int = (_arg_3 / data.getLayerCount(k));
            var _local_6:int = (_local_5 % this._sizeY);
            var _local_7:int = (_local_5 / this._sizeY);
            return _local_4 + (((_local_6 - _local_7) * k) / 2);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int = super.getSpriteYOffset(k, _arg_2, this.getIndex(k, _arg_3));
            var _local_5:int = (_arg_3 / data.getLayerCount(k));
            var _local_6:int = (_local_5 % this._sizeY);
            var _local_7:int = (_local_5 / this._sizeY);
            return _local_4 + (((_local_6 + _local_7) * k) / 4);
        }

        override protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            return super.getSpriteMouseCapture(k, _arg_2, this.getIndex(k, _arg_3));
        }

        override protected function getSpriteInk(k:int, _arg_2:int, _arg_3:int):int
        {
            return super.getSpriteInk(k, _arg_2, this.getIndex(k, _arg_3));
        }

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            return super.getSpriteZOffset(k, _arg_2, this.getIndex(k, _arg_3));
        }

        private function getIndex(k:int, _arg_2:int):int
        {
            return (data != null) ? (_arg_2 % data.getLayerCount(k)) : _arg_2;
        }
    }
}
