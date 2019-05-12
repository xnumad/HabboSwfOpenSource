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
            if (_Str_2697 != null)
            {
                for each (k in this._createdInstanceMaskSizes)
                {
                    ShoreMaskCreatorUtility._Str_23481(object.getInstanceId(), k, _Str_2697);
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
                this._Str_24870();
                return true;
            }
            return false;
        }

        override protected function updateAnimation(k:Number):int
        {
            var _local_3:int;
            var _local_2:int = super.updateAnimation(k);
            if (this._Str_22976(k))
            {
                _local_3 = this._Str_18416(k);
                _local_2 = (_local_2 | (1 << _local_3));
            }
            return _local_2;
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            if (((k == 1) || (!(_arg_2 == this._Str_18416(k)))))
            {
                return super.getSpriteAssetName(k, _arg_2);
            }
            if (this._hasSomeBorder)
            {
                return ShoreMaskCreatorUtility._Str_11218(object.getInstanceId(), _Str_3033(k));
            }
            return null;
        }

        private function _Str_18416(k:int):int
        {
            if (((this._shoreSpriteScale == k) && (this._shoreSpriteDirection == direction)))
            {
                return this._shoreSpriteIndex;
            }
            var _local_2:int = (_Str_3008 - 1);
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

        private function _Str_18133(k:int):IGraphicAsset
        {
            var _local_2:String = super.getSpriteAssetName(k, this._Str_18416(k));
            var _local_3:IGraphicAsset = _Str_2697.getAsset(_local_2);
            return _local_3;
        }

        private function _Str_18302(k:int):IGraphicAsset
        {
            var _local_2:int = _Str_3033(k);
            var _local_3:IGraphicAsset = ShoreMaskCreatorUtility._Str_18302(object.getInstanceId(), _local_2, _Str_2697, this._Str_18133(k));
            if (_local_3 != null)
            {
                if (this._createdInstanceMaskSizes.indexOf(_local_2) < 0)
                {
                    this._createdInstanceMaskSizes.push(_local_2);
                }
            }
            return _local_3;
        }

        private function _Str_24870():void
        {
            this._Str_23260();
            var k:int = object.getState(0);
            var _local_2:Array = this._Str_24926();
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
            _local_7 = this._Str_24566(_local_2, _local_7);
            _local_7 = this._Str_22423(_local_2, _local_7);
            _local_7 = this._Str_24789(_local_2, _local_7);
            _local_7 = this._Str_24121(_local_2, _local_7);
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

        private function _Str_24566(k:Array, _arg_2:int):int
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
                        _local_6 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_4[(_local_8 - 1)] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    if (((_local_5[(_local_8 + 1)] == false) && (_local_4[(_local_8 + 1)] == false)))
                    {
                        _local_7 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_4[(_local_8 + 1)] == true)
                        {
                            _local_7 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_7 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility._Str_3514(_local_6, _local_7);
                }
                _arg_2++;
                _local_8++;
            }
            return _arg_2;
        }

        private function _Str_22423(k:Array, _arg_2:int):int
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
                        _local_5 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_8[(_local_3 - 1)] == true)
                        {
                            _local_5 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_5 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    if (((_local_9[(_local_3 - 2)] == false) && (_local_9[(_local_3 - 1)] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_9[(_local_3 - 1)] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility._Str_3514(_local_5, _local_6);
                }
                _arg_2++;
                _local_10++;
            }
            return _arg_2;
        }

        private function _Str_24789(k:Array, _arg_2:int):int
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
                        _local_5 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_7[(_local_9 + 1)] == true)
                        {
                            _local_5 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_5 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    if (((_local_8[(_local_9 - 1)] == false) && (_local_7[(_local_9 - 1)] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_7[(_local_9 - 1)] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility._Str_3514(_local_5, _local_6);
                }
                _arg_2++;
                _local_9--;
            }
            return _arg_2;
        }

        private function _Str_24121(k:Array, _arg_2:int):int
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
                        _local_5 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_8[0] == true)
                        {
                            _local_5 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_5 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    if (((_local_9[1] == false) && (_local_9[0] == false)))
                    {
                        _local_6 = ShoreMaskCreatorUtility._Str_4832;
                    }
                    else
                    {
                        if (_local_9[0] == true)
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3534;
                        }
                        else
                        {
                            _local_6 = ShoreMaskCreatorUtility._Str_3641;
                        }
                    }
                    this._borderType[_arg_2] = ShoreMaskCreatorUtility._Str_3514(_local_5, _local_6);
                }
                _arg_2++;
                _local_10--;
            }
            return _arg_2;
        }

        private function _Str_23260():void
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
                this._borderType.push(ShoreMaskCreatorUtility._Str_3641);
                k++;
            }
        }

        private function _Str_24926():Array
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
            return ShoreMaskCreatorUtility._Str_18695(_Str_3033(k), _Str_2697, this._Str_18133(k));
        }

        private function _Str_22891(k:int, _arg_2:int, _arg_3:Number):BitmapData
        {
            if ((((this._maskBitmapData == null) || (this._maskBitmapData.width < k)) || (this._maskBitmapData.height < _arg_2)))
            {
                if (this._maskBitmapData != null)
                {
                    this._maskBitmapData.dispose();
                }
                this._maskBitmapData = ShoreMaskCreatorUtility._Str_22325(k, _arg_2);
            }
            return ShoreMaskCreatorUtility._Str_25776(this._maskBitmapData, _Str_3033(_arg_3), this._hasBorder, this._borderType, _Str_2697);
        }

        private function _Str_22976(k:Number):Boolean
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
                    _local_4 = this._Str_22891(_local_3.width, _local_3.height, k);
                    _local_5 = this._Str_18133(k);
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
