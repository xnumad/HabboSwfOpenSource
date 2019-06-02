package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FurnitureBrandedImageVisualization extends FurnitureVisualization 
    {
        private static const BRANDED_IMAGE:String = "branded_image";
        private static const STATE_0:int = 0;
        private static const STATE_1:int = 1;
        private static const STATE_2:int = 2;
        private static const STATE_3:int = 3;

        protected var _Str_2991:String;
        protected var _Str_11348:Boolean = false;
        protected var offsetX:int;
        protected var offsetY:int;
        protected var offsetZ:int;
        private var _dynamicAssetName:String;


        override public function dispose():void
        {
            if (((this._dynamicAssetName) && (assetCollection)))
            {
                assetCollection.disposeAsset(this._dynamicAssetName);
                this._dynamicAssetName = null;
            }
            super.dispose();
            this._Str_2991 = null;
        }

        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            if (super.updateObject(k, _arg_2))
            {
                if (this._Str_11348)
                {
                    this._Str_19978(k);
                }
                return true;
            }
            return false;
        }

        override protected function updateModel(k:Number):Boolean
        {
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_2:Boolean = super.updateModel(k);
            if (_local_2)
            {
                _local_3 = object;
                if (_local_3 != null)
                {
                    _local_4 = _local_3.getModel();
                    if (_local_4 != null)
                    {
                        this.offsetX = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_BRANDING_OFFSET_X);
                        this.offsetY = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_BRANDING_OFFSET_Y);
                        this.offsetZ = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_BRANDING_OFFSET_Z);
                    }
                }
            }
            if (!this._Str_11348)
            {
                this._Str_11348 = this._Str_25045();
                if (this._Str_11348)
                {
                    this._Str_19978(k);
                    return true;
                }
            }
            else
            {
                if (this._Str_23675())
                {
                    this._Str_11348 = false;
                    this._Str_2991 = null;
                    return true;
                }
            }
            return _local_2;
        }

        protected function _Str_23675():Boolean
        {
            var _local_2:IRoomObjectModel;
            var _local_3:String;
            var k:IRoomObject = object;
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = _local_2.getString(RoomObjectVariableEnum.FURNITURE_BRANDING_IMAGE_URL);
                    if (((!(_local_3 == null)) && (!(_local_3 == this._Str_2991))))
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        protected function _Str_25045():Boolean
        {
            var _local_2:IRoomObjectModel;
            var _local_3:String;
            var _local_4:Number;
            var _local_5:IGraphicAsset;
            var _local_6:BitmapData;
            var k:IRoomObject = object;
            if (k != null)
            {
                _local_2 = k.getModel();
                if (_local_2 != null)
                {
                    _local_3 = _local_2.getString(RoomObjectVariableEnum.FURNITURE_BRANDING_IMAGE_URL);
                    if (_local_3 != null)
                    {
                        if (((this._Str_2991 == null) || (!(this._Str_2991 == _local_3))))
                        {
                            _local_4 = _local_2.getNumber(RoomObjectVariableEnum.FURNITURE_BRANDING_IMAGE_STATUS);
                            if (_local_4 == 1)
                            {
                                _local_5 = assetCollection.getAsset(_local_3);
                                if (_local_5 != null)
                                {
                                    _local_6 = (_local_5.asset.content as BitmapData);
                                    if (_local_6 != null)
                                    {
                                        this.imageReady(_local_6, _local_3);
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return false;
        }

        override protected function updateSprites(k:int, _arg_2:Boolean, _arg_3:int):void
        {
            super.updateSprites(k, _arg_2, _arg_3);
        }

        protected function imageReady(k:BitmapData, _arg_2:String):void
        {
            Logger.log(("billboard visualization got image from url = " + _arg_2));
            if (k != null)
            {
                this._Str_2991 = _arg_2;
            }
            else
            {
                this._Str_2991 = null;
            }
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_7:int;
            var _local_3:int = _Str_3033(k);
            var _local_4:String = type;
            var _local_5:String = "";
            if (_arg_2 < (spriteCount - 1))
            {
                _local_5 = String.fromCharCode(("a".charCodeAt() + _arg_2));
            }
            else
            {
                _local_5 = "sd";
            }
            if (_local_3 == 1)
            {
                _local_4 = (_local_4 + ("_icon_" + _local_5));
            }
            else
            {
                _local_7 = getFrameNumber(k, _arg_2);
                _local_4 = (_local_4 + ((((((("_" + _local_3) + "_") + _local_5) + "_") + direction) + "_") + _local_7));
            }
            var _local_6:String = getSpriteTag(k, direction, _arg_2);
            if (((!(this._Str_2991 == null)) && (_local_6 == BRANDED_IMAGE)))
            {
                return (((this._Str_2991 + "_") + _local_3) + "_") + object.getState(0);
            }
            return _local_4;
        }

        private function _Str_19978(k:int):void
        {
            var _local_9:BitmapData;
            var _local_15:Matrix;
            if (((object == null) || (this._Str_2991 == null)))
            {
                return;
            }
            var _local_2:IGraphicAsset = assetCollection.getAsset(this._Str_2991);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:int = object.getState(0);
            var _local_4:int = _Str_3033(k);
            var _local_5:String = ((((this._Str_2991 + "_") + _local_4) + "_") + _local_3);
            var _local_6:IGraphicAsset = assetCollection.getAsset(_local_5);
            if (_local_6 != null)
            {
                return;
            }
            var _local_7:BitmapData = (_local_2.asset.content as BitmapData);
            if (_local_7 == null)
            {
                Logger.log(("could not find bitmap data for image " + _local_5));
                return;
            }
            var _local_8:Boolean = true;
            if (this._Str_2991.indexOf("noscale") > -1)
            {
                _local_8 = false;
            }
            if (((_local_4 == 32) && (_local_8)))
            {
                _local_15 = new Matrix();
                _local_15.scale(0.5, 0.5);
                _local_9 = new BitmapData((_local_7.width / 2), (_local_7.height / 2), true, 0xFFFFFF);
                _local_9.draw(_local_7, _local_15);
            }
            else
            {
                _local_9 = _local_7.clone();
            }
            var _local_10:int;
            var _local_11:int;
            var _local_12:Boolean;
            var _local_13:Boolean;
            switch (_local_3)
            {
                case STATE_0:
                    _local_10 = 0;
                    _local_11 = 0;
                    _local_12 = false;
                    _local_13 = false;
                    break;
                case STATE_1:
                    _local_10 = -(_local_9.width);
                    _local_11 = 0;
                    _local_12 = true;
                    _local_13 = false;
                    break;
                case STATE_2:
                    _local_10 = -(_local_9.width);
                    _local_11 = -(_local_9.height);
                    _local_12 = true;
                    _local_13 = true;
                    break;
                case STATE_3:
                    _local_10 = 0;
                    _local_11 = -(_local_9.height);
                    _local_12 = false;
                    _local_13 = true;
                    break;
                default:
                    Logger.log(("could not handle unknown state " + _local_3));
            }
            if (this._dynamicAssetName)
            {
                assetCollection.disposeAsset(this._dynamicAssetName);
            }
            this._dynamicAssetName = _local_5;
            var _local_14:Boolean = assetCollection.addAsset(_local_5, _local_9, true, _local_10, _local_11, _local_12, _local_13);
            if (!_local_14)
            {
                Logger.log(("could not add asset for image " + _local_5));
            }
        }

        override protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            var _local_3:String;
            if (_arg_2.tag != BRANDED_IMAGE)
            {
                return super.getLibraryAssetNameForSprite(k, _arg_2);
            }
            if (object)
            {
                _local_3 = object.getModel().getString(RoomObjectVariableEnum.FURNITURE_BRANDING_IMAGE_URL);
            }
            if (((_local_3) && (_local_3.length > 0)))
            {
                return _local_3;
            }
            return super.getLibraryAssetNameForSprite(k, _arg_2);
        }
    }
}
