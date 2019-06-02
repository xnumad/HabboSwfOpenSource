package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.geom.Point;

    public class FurnitureWaterAreaVisualization extends FurnitureAnimatedVisualization 
    {
        private static const SHORE:String = "shore";

        private var _hasSomeBorder:Boolean = true;
        private var _hasBorder:Array;
        private var _borderType:Array;
        private var _createdInstanceMaskSizes:Array;
        private var _needsShoreUpdate:Boolean = false;
        private var _sizeX:int = 0;
        private var _sizeY:int = 0;
        private var _shoreSpriteIndex:int = 0;
        private var _shoreSpriteScale:int = -1;
        private var _shoreSpriteDirection:int = -1;
        private var _maskBitmapData:BitmapData = null;

        public function FurnitureWaterAreaVisualization()
        {
            this._hasBorder = [];
            this._borderType = [];
            this._createdInstanceMaskSizes = [];
            super();
        }

        override public function dispose():void
        {
            var k:int;
            if (assetCollection != null)
            {
                for each (k in this._createdInstanceMaskSizes)
                {
                    ShoreMaskCreatorUtility.disposeInstanceMask(object.getInstanceId(), k, assetCollection);
                }
                this._createdInstanceMaskSizes = [];
            }
            if (this._maskBitmapData != null)
            {
                this._maskBitmapData.dispose();
                this._maskBitmapData = null;
            }
            super.dispose();
        }

        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            if (super.updateObject(k, _arg_2))
            {
                this._needsShoreUpdate = true;
                this.updateBorderData();
                return true;
            }
            return false;
        }

        override protected function updateAnimation(k:Number):int
        {
            var _local_3:int;
            var _local_2:int = super.updateAnimation(k);
            if (this.updateInstanceShoreMask(k))
            {
                _local_3 = this.getShoreSpriteIndex(k);
                _local_2 = (_local_2 | (1 << _local_3));
            }
            return _local_2;
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            if (((k == 1) || (!(_arg_2 == this.getShoreSpriteIndex(k)))))
            {
                return super.getSpriteAssetName(k, _arg_2);
            }
            if (this._hasSomeBorder)
            {
                return ShoreMaskCreatorUtility.getInstanceMaskName(object.getInstanceId(), _Str_3033(k));
            }
            return null;
        }

        private function getShoreSpriteIndex(k:int):int
        {
            if (((this._shoreSpriteScale == k) && (this._shoreSpriteDirection == direction)))
            {
                return this._shoreSpriteIndex;
            }
            var _local_2:int = (spriteCount - 1);
            while (_local_2 >= 0)
            {
                if (getSpriteTag(k, direction, _local_2) == SHORE)
                {
                    this._shoreSpriteIndex = _local_2;
                    this._shoreSpriteScale = k;
                    this._shoreSpriteDirection = direction;
                    return this._shoreSpriteIndex;
                }
                _local_2--;
            }
            return -1;
        }

        private function getShoreAsset(k:int):IGraphicAsset
        {
            var _local_2:String = super.getSpriteAssetName(k, this.getShoreSpriteIndex(k));
            var _local_3:IGraphicAsset = assetCollection.getAsset(_local_2);
            return _local_3;
        }

        private function _Str_18302(k:int):IGraphicAsset
        {
            var _local_2:int = _Str_3033(k);
            var _local_3:IGraphicAsset = ShoreMaskCreatorUtility._Str_18302(object.getInstanceId(), _local_2, assetCollection, this.getShoreAsset(k));
            if (_local_3 != null)
            {
                if (this._createdInstanceMaskSizes.indexOf(_local_2) < 0)
                {
                    this._createdInstanceMaskSizes.push(_local_2);
                }
            }
            return _local_3;
        }

        private function updateBorderData():void
        {
            this.resetBorders();
            var k:int = object.getState(0);
            var _local_2:Array = this.getAreaData();
            var _local_3:int = (this._sizeX + 2);
            var _local_4:int = (this._sizeY + 2);
            var _local_5:int;
            var _local_6:Array = _local_2[(_local_4 - 1)];
            _local_5 = (_local_3 - 1);
            while (_local_5 >= 0)
            {
                if ((k & 0x01))
                {
                    _local_6[_local_5] = true;
                }
                k = (k >> 1);
                _local_5--;
            }
            _local_5 = (_local_4 - 2);
            while (_local_5 >= 1)
            {
                _local_6 = _local_2[_local_5];
                if ((k & 0x01))
                {
                    _local_6[(_local_3 - 1)] = true;
                }
                k = (k >> 1);
                if ((k & 0x01))
                {
                    _local_6[0] = true;
                }
                k = (k >> 1);
                _local_5--;
            }
            _local_6 = _local_2[0];
            _local_5 = (_local_3 - 1);
            while (_local_5 >= 0)
            {
                if ((k & 0x01))
                {
                    _local_6[_local_5] = true;
                }
                k = (k >> 1);
                _local_5--;
            }
            var _local_7:int;
            _local_7 = this.updateTopBorder(_local_2, _local_7);
            _local_7 = this.updateRightBorder(_local_2, _local_7);
            _local_7 = this.updateBottomBorder(_local_2, _local_7);
            _local_7 = this.updateLeftBorder(_local_2, _local_7);
            this._hasSomeBorder = false;
            _local_5 = 0;
            while (_local_5 < this._hasBorder.length)
            {
                if (this._hasBorder[_local_5] == true)
                {
                    this._hasSomeBorder = true;
                }
                _local_5++;
            }
        }

        private function updateTopBorder(k:Array, _arg_2:int):int
        {
            var _local_3:int = (this._sizeX + 2);
            var _local_4:Array = k[0];
            var _local_5:Array = k[1];
            var _local_6:int;
            var _local_7:int;
            var _local_8:int = 1;
            while (_local_8 < (_local_3 - 1))
            {
                if (_local_4[_local_8] == false)
                {
                    this._hasBorder[_arg_2] = true;
                    if (((_local_5[(_local_8 - 1)] == false) && (_local_4[(_local_8 - 1)] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_4[(_local_8 - 1)] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    if (((_local_5[(_local_8 + 1)] == false) && (_local_4[(_local_8 + 1)] == false)))
                    {
                        _local_7 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_4[(_local_8 + 1)] == true)
                        {
                            _local_7 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_7 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_6, _local_7);
                }
                _arg_2++;
                _local_8++;
            }
            return _arg_2;
        }

        private function updateRightBorder(k:Array, _arg_2:int):int
        {
            var _local_3:int = (this._sizeX + 2);
            var _local_4:int = (this._sizeY + 2);
            var _local_5:int;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:int = 1;
            while (_local_10 < (_local_4 - 1))
            {
                _local_7 = k[_local_10];
                _local_8 = k[(_local_10 - 1)];
                _local_9 = k[(_local_10 + 1)];
                if (_local_7[(_local_3 - 1)] == false)
                {
                    this._hasBorder[_arg_2] = true;
                    if (((_local_8[(_local_3 - 2)] == false) && (_local_8[(_local_3 - 1)] == false)))
                    {
                        _local_5 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_8[(_local_3 - 1)] == true)
                        {
                            _local_5 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_5 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    if (((_local_9[(_local_3 - 2)] == false) && (_local_9[(_local_3 - 1)] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_9[(_local_3 - 1)] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_5, _local_6);
                }
                _arg_2++;
                _local_10++;
            }
            return _arg_2;
        }

        private function updateBottomBorder(k:Array, _arg_2:int):int
        {
            var _local_3:int = (this._sizeX + 2);
            var _local_4:int = (this._sizeY + 2);
            var _local_5:int;
            var _local_6:int;
            var _local_7:Array = k[(_local_4 - 1)];
            var _local_8:Array = k[(_local_4 - 2)];
            var _local_9:int = (_local_3 - 2);
            while (_local_9 >= 1)
            {
                if (_local_7[_local_9] == false)
                {
                    this._hasBorder[_arg_2] = true;
                    if (((_local_8[(_local_9 + 1)] == false) && (_local_7[(_local_9 + 1)] == false)))
                    {
                        _local_5 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_7[(_local_9 + 1)] == true)
                        {
                            _local_5 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_5 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    if (((_local_8[(_local_9 - 1)] == false) && (_local_7[(_local_9 - 1)] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_7[(_local_9 - 1)] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_5, _local_6);
                }
                _arg_2++;
                _local_9--;
            }
            return _arg_2;
        }

        private function updateLeftBorder(k:Array, _arg_2:int):int
        {
            var _local_3:int = (this._sizeX + 2);
            var _local_4:int = (this._sizeY + 2);
            var _local_5:int;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:int = (_local_4 - 2);
            while (_local_10 >= 1)
            {
                _local_7 = k[_local_10];
                _local_8 = k[(_local_10 + 1)];
                _local_9 = k[(_local_10 - 1)];
                if (_local_7[0] == false)
                {
                    this._hasBorder[_arg_2] = true;
                    if (((_local_8[1] == false) && (_local_8[0] == false)))
                    {
                        _local_5 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_8[0] == true)
                        {
                            _local_5 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_5 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    if (((_local_9[1] == false) && (_local_9[0] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility.OUTER_CUT;
                    }
                    else
                    {
                        if (_local_9[0] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility.INNER_CUT;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility.STRAIGHT_CUT;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility.getBorderType(_local_5, _local_6);
                }
                _arg_2++;
                _local_10--;
            }
            return _arg_2;
        }

        private function resetBorders():void
        {
            var _local_2:IRoomObjectModel;
            if (((this._sizeX == 0) || (this._sizeY == 0)))
            {
                if (((object == null) || (object.getModel() == null)))
                {
                    return;
                }
                _local_2 = object.getModel();
                this._sizeX = _local_2.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
                this._sizeY = _local_2.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
            }
            this._hasBorder = [];
            this._borderType = [];
            var k:int;
            while (k < ((this._sizeX * 2) + (this._sizeY * 2)))
            {
                this._hasBorder.push(false);
                this._borderType.push(ShoreMaskCreatorUtility.STRAIGHT_CUT);
                k++;
            }
        }

        private function getAreaData():Array
        {
            var k:int = (this._sizeX + 2);
            var _local_2:int = (this._sizeY + 2);
            var _local_3:Array = [];
            var _local_4:Array;
            var _local_5:int;
            var _local_6:int;
            _local_6 = 0;
            while (_local_6 < _local_2)
            {
                _local_4 = [];
                _local_5 = (k - 1);
                while (_local_5 >= 0)
                {
                    _local_4.push(false);
                    _local_5--;
                }
                _local_3.push(_local_4);
                _local_6++;
            }
            _local_6 = 1;
            while (_local_6 < (_local_2 - 1))
            {
                _local_4 = _local_3[_local_6];
                _local_5 = 1;
                while (_local_5 < (k - 1))
                {
                    _local_4[_local_5] = true;
                    _local_5++;
                }
                _local_6++;
            }
            return _local_3;
        }

        private function _Str_18695(k:Number):Boolean
        {
            return ShoreMaskCreatorUtility._Str_18695(_Str_3033(k), assetCollection, this.getShoreAsset(k));
        }

        private function createShoreMask(k:int, _arg_2:int, _arg_3:Number):BitmapData
        {
            if ((((this._maskBitmapData == null) || (this._maskBitmapData.width < k)) || (this._maskBitmapData.height < _arg_2)))
            {
                if (this._maskBitmapData != null)
                {
                    this._maskBitmapData.dispose();
                }
                this._maskBitmapData = ShoreMaskCreatorUtility.createEmptyMask(k, _arg_2);
            }
            return ShoreMaskCreatorUtility.createShoreMask2x2(this._maskBitmapData, _Str_3033(_arg_3), this._hasBorder, this._borderType, assetCollection);
        }

        private function updateInstanceShoreMask(k:Number):Boolean
        {
            var _local_3:BitmapData;
            var _local_4:BitmapData;
            var _local_5:IGraphicAsset;
            var _local_6:BitmapData;
            if (!this._needsShoreUpdate)
            {
                return false;
            }
            var _local_2:IGraphicAsset = this._Str_18302(k);
            if ((((!(_local_2 == null)) && (!(_local_2.asset == null))) && (this._Str_18695(k))))
            {
                _local_3 = (_local_2.asset.content as BitmapData);
                if (_local_3 != null)
                {
                    _local_4 = this.createShoreMask(_local_3.width, _local_3.height, k);
                    _local_5 = this.getShoreAsset(k);
                    if (((!(_local_5 == null)) && (!(_local_5.asset == null))))
                    {
                        _local_6 = (_local_5.asset.content as BitmapData);
                        if (_local_6 != null)
                        {
                            _local_3.fillRect(_local_3.rect, 0);
                            _local_3.copyPixels(_local_6, _local_6.rect, new Point(0, 0), _local_4, new Point(0, 0), true);
                        }
                        this._needsShoreUpdate = false;
                    }
                }
                return true;
            }
            return false;
        }

        override protected function setAnimation(k:int):void
        {
            super.setAnimation(0);
        }
    }
}
