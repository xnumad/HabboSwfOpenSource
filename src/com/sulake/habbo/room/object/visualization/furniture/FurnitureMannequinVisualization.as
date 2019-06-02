package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureMannequinVisualization extends FurnitureVisualization implements IAvatarImageListener 
    {
        private static const AVATAR_IMAGE:String = "avatar_image";
        private static var _customPlaceholders:Dictionary;
        private static var _instanceCount:int;

        private const _Str_20434:String = "hd-99999-99998";

        private var _figure:String;
        private var _gender:String;
        private var _scale:int;
        private var _needsUpdate:Boolean = false;
        private var _dynamicAssetName:String;
        private var _data:FurnitureMannequinVisualizationData;
        private var _disposed:Boolean = false;

        public function FurnitureMannequinVisualization()
        {
            _instanceCount++;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        override public function dispose():void
        {
            var k:IAvatarImage;
            if (!this._disposed)
            {
                this._data = null;
                this._disposed = true;
                if (((this._dynamicAssetName) && (assetCollection)))
                {
                    assetCollection.disposeAsset(this._dynamicAssetName);
                    this._dynamicAssetName = null;
                }
                super.dispose();
                _instanceCount--;
                if (((_instanceCount == 0) && (_customPlaceholders)))
                {
                    for each (k in _customPlaceholders)
                    {
                        k.dispose();
                    }
                    _customPlaceholders = null;
                }
            }
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this._data = (k as FurnitureMannequinVisualizationData);
            super.initialize(k);
            return true;
        }

        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            var _local_3:Boolean = super.updateObject(k, _arg_2);
            if (_local_3)
            {
                if (this._scale != k)
                {
                    this._scale = k;
                    this.addAvatarAsset();
                }
            }
            return _local_3;
        }

        private function addAvatarAsset(k:Boolean=false):void
        {
            var _local_2:IAvatarImage;
            var _local_3:IAvatarImage;
            if (((!(this.isAvatarAssetReady())) || (k)))
            {
                _local_2 = this._data._Str_8991(this._figure, this._scale, this._gender, this);
                if (_local_2)
                {
                    if (_local_2.isPlaceholder())
                    {
                        _local_2.dispose();
                        _local_3 = this.getCustomPlaceholder(this._scale);
                        _local_3.setDirection(AvatarSetType.FULL, direction);
                        assetCollection.addAsset(this.getAvatarAssetName(), _local_3.getImage(AvatarSetType.FULL, true), true);
                        this._needsUpdate = true;
                        return;
                    }
                    _local_2.setDirection(AvatarSetType.FULL, direction);
                    if (this._dynamicAssetName)
                    {
                        assetCollection.disposeAsset(this._dynamicAssetName);
                    }
                    assetCollection.addAsset(this.getAvatarAssetName(), _local_2.getImage(AvatarSetType.FULL, true), true);
                    this._dynamicAssetName = this.getAvatarAssetName();
                    this._needsUpdate = true;
                    _local_2.dispose();
                }
            }
        }

        override public function getSpriteList():Array
        {
            var k:IAvatarImage = this._data._Str_8991(this._figure, this._scale, this._gender, this);
            if (k == null)
            {
                return super.getSpriteList();
            }
            k.setDirection(AvatarSetType.FULL, direction);
            return k._Str_1009();
        }

        private function getCustomPlaceholder(k:int):IAvatarImage
        {
            if (!_customPlaceholders)
            {
                _customPlaceholders = new Dictionary();
            }
            var _local_2:IAvatarImage = _customPlaceholders[k];
            if (_local_2 == null)
            {
                _local_2 = this._data._Str_8991(this._Str_20434, k, null, null);
                _customPlaceholders[k] = _local_2;
            }
            return _local_2;
        }

        override protected function updateModel(k:Number):Boolean
        {
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:String;
            var _local_2:Boolean = super.updateModel(k);
            if (_local_2)
            {
                _local_3 = object;
                if (_local_3 != null)
                {
                    _local_4 = _local_3.getModel();
                    if (_local_4 != null)
                    {
                        _local_5 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_FIGURE);
                        if (_local_5)
                        {
                            this._gender = _local_4.getString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_GENDER);
                            this._figure = ((_local_5 + ".") + this._Str_20434);
                            this.addAvatarAsset();
                        }
                    }
                }
            }
            _local_2 = ((_local_2) || (this._needsUpdate));
            this._needsUpdate = false;
            return _local_2;
        }

        private function isAvatarAssetReady():Boolean
        {
            return (this._figure) && (!(getAsset(this.getAvatarAssetName()) == null));
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_3:String = getSpriteTag(k, direction, _arg_2);
            if ((((!(this._figure == null)) && (_local_3 == AVATAR_IMAGE)) && (this.isAvatarAssetReady())))
            {
                return this.getAvatarAssetName();
            }
            return super.getSpriteAssetName(k, _arg_2);
        }

        private function getAvatarAssetName():String
        {
            var k:IRoomObject = object;
            if (!k)
            {
                return null;
            }
            return (((((("mannequin_" + this._figure) + "_") + this._scale) + "_") + direction) + "_") + k.getId();
        }

        public function _Str_840(k:String):void
        {
            if (k == this._figure)
            {
                this.addAvatarAsset(true);
            }
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(k, _arg_2, _arg_3);
            if (((_local_4 == AVATAR_IMAGE) && (this.isAvatarAssetReady())))
            {
                return -(getSprite(_arg_3).width) / 2;
            }
            return super.getSpriteXOffset(k, _arg_2, _arg_3);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(k, _arg_2, _arg_3);
            if (((_local_4 == AVATAR_IMAGE) && (this.isAvatarAssetReady())))
            {
                return -(getSprite(_arg_3).height);
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3);
        }
    }
}
