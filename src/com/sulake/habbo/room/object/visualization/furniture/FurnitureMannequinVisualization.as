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
        private static var _Str_5674:Dictionary;
        private static var _Str_7646:int;

        private const _Str_20434:String = "hd-99999-99998";

        private var _Str_1710:String;
        private var _Str_625:String;
        private var _Str_842:int;
        private var _Str_15405:Boolean = false;
        private var _Str_4571:String;
        private var _Str_594:FurnitureMannequinVisualizationData;
        private var _disposed:Boolean = false;

        public function FurnitureMannequinVisualization()
        {
            _Str_7646++;
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
                this._Str_594 = null;
                this._disposed = true;
                if (((this._Str_4571) && (_Str_2697)))
                {
                    _Str_2697.disposeAsset(this._Str_4571);
                    this._Str_4571 = null;
                }
                super.dispose();
                _Str_7646--;
                if (((_Str_7646 == 0) && (_Str_5674)))
                {
                    for each (k in _Str_5674)
                    {
                        k.dispose();
                    }
                    _Str_5674 = null;
                }
            }
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this._Str_594 = (k as FurnitureMannequinVisualizationData);
            super.initialize(k);
            return true;
        }

        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            var _local_3:Boolean = super.updateObject(k, _arg_2);
            if (_local_3)
            {
                if (this._Str_842 != k)
                {
                    this._Str_842 = k;
                    this._Str_15978();
                }
            }
            return _local_3;
        }

        private function _Str_15978(k:Boolean=false):void
        {
            var _local_2:IAvatarImage;
            var _local_3:IAvatarImage;
            if (((!(this._Str_13016())) || (k)))
            {
                _local_2 = this._Str_594._Str_8991(this._Str_1710, this._Str_842, this._Str_625, this);
                if (_local_2)
                {
                    if (_local_2.isPlaceholder())
                    {
                        _local_2.dispose();
                        _local_3 = this._Str_23643(this._Str_842);
                        _local_3.setDirection(AvatarSetType.FULL, direction);
                        _Str_2697.addAsset(this._Str_10185(), _local_3.getImage(AvatarSetType.FULL, true), true);
                        this._Str_15405 = true;
                        return;
                    }
                    _local_2.setDirection(AvatarSetType.FULL, direction);
                    if (this._Str_4571)
                    {
                        _Str_2697.disposeAsset(this._Str_4571);
                    }
                    _Str_2697.addAsset(this._Str_10185(), _local_2.getImage(AvatarSetType.FULL, true), true);
                    this._Str_4571 = this._Str_10185();
                    this._Str_15405 = true;
                    _local_2.dispose();
                }
            }
        }

        override public function getSpriteList():Array
        {
            var k:IAvatarImage = this._Str_594._Str_8991(this._Str_1710, this._Str_842, this._Str_625, this);
            if (k == null)
            {
                return super.getSpriteList();
            }
            k.setDirection(AvatarSetType.FULL, direction);
            return k._Str_1009();
        }

        private function _Str_23643(k:int):IAvatarImage
        {
            if (!_Str_5674)
            {
                _Str_5674 = new Dictionary();
            }
            var _local_2:IAvatarImage = _Str_5674[k];
            if (_local_2 == null)
            {
                _local_2 = this._Str_594._Str_8991(this._Str_20434, k, null, null);
                _Str_5674[k] = _local_2;
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
                            this._Str_625 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_MANNEQUIN_GENDER);
                            this._Str_1710 = ((_local_5 + ".") + this._Str_20434);
                            this._Str_15978();
                        }
                    }
                }
            }
            _local_2 = ((_local_2) || (this._Str_15405));
            this._Str_15405 = false;
            return _local_2;
        }

        private function _Str_13016():Boolean
        {
            return (this._Str_1710) && (!(getAsset(this._Str_10185()) == null));
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_3:String = getSpriteTag(k, direction, _arg_2);
            if ((((!(this._Str_1710 == null)) && (_local_3 == AVATAR_IMAGE)) && (this._Str_13016())))
            {
                return this._Str_10185();
            }
            return super.getSpriteAssetName(k, _arg_2);
        }

        private function _Str_10185():String
        {
            var k:IRoomObject = object;
            if (!k)
            {
                return null;
            }
            return (((((("mannequin_" + this._Str_1710) + "_") + this._Str_842) + "_") + direction) + "_") + k.getId();
        }

        public function _Str_840(k:String):void
        {
            if (k == this._Str_1710)
            {
                this._Str_15978(true);
            }
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(k, _arg_2, _arg_3);
            if (((_local_4 == AVATAR_IMAGE) && (this._Str_13016())))
            {
                return -(_Str_2505(_arg_3).width) / 2;
            }
            return super.getSpriteXOffset(k, _arg_2, _arg_3);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(k, _arg_2, _arg_3);
            if (((_local_4 == AVATAR_IMAGE) && (this._Str_13016())))
            {
                return -(_Str_2505(_arg_3).height);
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3);
        }
    }
}
