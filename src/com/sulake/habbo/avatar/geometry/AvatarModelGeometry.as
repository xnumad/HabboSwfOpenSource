package com.sulake.habbo.avatar.geometry
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import com.sulake.habbo.avatar.IAvatarImage;

    public class AvatarModelGeometry 
    {
        private var _avatarSet:AvatarSet;
        private var _geometryTypes:Dictionary;
        private var _itemIdToBodyPartMap:Dictionary;
        private var _transformation:Matrix4x4;
        private var _camera:Vector3D;
        private var _canvases:Dictionary;

        public function AvatarModelGeometry(k:XML)
        {
            var _local_3:XML;
            var _local_4:XML;
            var _local_5:AvatarCanvas;
            var _local_6:XML;
            var _local_7:Dictionary;
            var _local_8:Dictionary;
            var _local_9:XML;
            var _local_10:GeometryBodyPart;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:String;
            var _local_15:Dictionary;
            var _local_16:String;
            this._camera = new Vector3D(0, 0, 10);
            super();
            this._transformation = new Matrix4x4();
            this._geometryTypes = new Dictionary();
            this._itemIdToBodyPartMap = new Dictionary();
            this._avatarSet = new AvatarSet(k.avatarset[0]);
            this._canvases = new Dictionary();
            var _local_2:XML = k.camera[0];
            if (_local_2 != null)
            {
                _local_11 = parseFloat(_local_2.x.text());
                _local_12 = parseFloat(_local_2.y.text());
                _local_13 = parseFloat(_local_2.z.text());
                this._camera.x = _local_11;
                this._camera.y = _local_12;
                this._camera.z = _local_13;
            }
            for each (_local_3 in k.canvas)
            {
                _local_14 = String(_local_3.@scale);
                _local_15 = new Dictionary();
                for each (_local_4 in _local_3.geometry)
                {
                    _local_5 = new AvatarCanvas(_local_4, _local_14);
                    _local_15[String(_local_4.@id)] = _local_5;
                }
                this._canvases[_local_14] = _local_15;
            }
            for each (_local_6 in k.type)
            {
                _local_7 = new Dictionary();
                _local_8 = new Dictionary();
                for each (_local_9 in _local_6.bodypart)
                {
                    _local_10 = new GeometryBodyPart(_local_9);
                    _local_7[String(_local_9.@id)] = _local_10;
                    for each (_local_16 in _local_10.getPartIds(null))
                    {
                        _local_8[_local_16] = _local_10;
                    }
                }
                this._geometryTypes[String(_local_6.@id)] = _local_7;
                this._itemIdToBodyPartMap[String(_local_6.@id)] = _local_8;
            }
        }

        public function _Str_2101(k:IAvatarImage):void
        {
            var _local_2:Dictionary;
            var _local_3:GeometryBodyPart;
            for each (_local_2 in this._geometryTypes)
            {
                for each (_local_3 in _local_2)
                {
                    _local_3.removeDynamicParts(k);
                }
            }
        }

        public function getBodyPartIdsInAvatarSet(k:String):Array
        {
            var _local_2:Array = [];
            var _local_3:AvatarSet = this._avatarSet.findAvatarSet(k);
            if (_local_3 != null)
            {
                _local_2 = _local_3.getBodyParts();
            }
            return _local_2;
        }

        public function _Str_1939(k:String):Boolean
        {
            var _local_2:AvatarSet = this._avatarSet.findAvatarSet(k);
            if (_local_2 != null)
            {
                return _local_2.isMain;
            }
            return false;
        }

        public function getCanvas(k:String, _arg_2:String):AvatarCanvas
        {
            var _local_4:AvatarCanvas;
            var _local_3:Dictionary = this._canvases[k];
            if (_local_3 != null)
            {
                _local_4 = (_local_3[_arg_2] as AvatarCanvas);
            }
            return _local_4;
        }

        private function typeExists(k:String):Boolean
        {
            return !(this._geometryTypes[k] == null);
        }

        private function hasBodyPart(k:String, _arg_2:String):Boolean
        {
            var _local_3:Dictionary;
            if (this.typeExists(k))
            {
                _local_3 = (this._geometryTypes[k] as Dictionary);
                return !(_local_3[_arg_2] == null);
            }
            return false;
        }

        private function getBodyPartIDs(k:String):Array
        {
            var _local_4:String;
            var _local_2:Dictionary = this.getBodyPartsOfType(k);
            var _local_3:Array = new Array();
            for (_local_4 in this._geometryTypes)
            {
                _local_3.push(_local_4);
            }
            return _local_3;
        }

        private function getBodyPartsOfType(k:String):Dictionary
        {
            if (this.typeExists(k))
            {
                return this._geometryTypes[k] as Dictionary;
            }
            return new Dictionary();
        }

        public function getBodyPart(k:String, _arg_2:String):GeometryBodyPart
        {
            var _local_3:Dictionary = this.getBodyPartsOfType(k);
            return _local_3[_arg_2];
        }

        public function getBodyPartOfItem(k:String, _arg_2:String, _arg_3:IAvatarImage):GeometryBodyPart
        {
            var _local_5:GeometryBodyPart;
            var _local_6:Dictionary;
            var _local_4:Dictionary = this._itemIdToBodyPartMap[k];
            if (_local_4 != null)
            {
                _local_5 = _local_4[_arg_2];
                if (_local_5 != null)
                {
                    return _local_5;
                }
                _local_6 = this.getBodyPartsOfType(k);
                for each (_local_5 in _local_6)
                {
                    if (_local_5.hasPart(_arg_2, _arg_3))
                    {
                        return _local_5;
                    }
                }
            }
            return null;
        }

        private function getBodyPartsInAvatarSet(k:Dictionary, _arg_2:String):Array
        {
            var _local_5:GeometryBodyPart;
            var _local_6:String;
            var _local_3:Array = [];
            var _local_4:Array = this.getBodyPartIdsInAvatarSet(_arg_2);
            for each (_local_6 in _local_4)
            {
                _local_5 = k[_local_6];
                if (_local_5 != null)
                {
                    _local_3.push(_local_5);
                }
            }
            return _local_3;
        }

        public function _Str_2250(k:String, _arg_2:uint, _arg_3:String):Array
        {
            var _local_7:GeometryBodyPart;
            var _local_9:Number;
            var _local_10:Array;
            if (_arg_3 == null)
            {
                Logger.log("[AvatarModelGeometry] ERROR: Geometry ID not found for action: ");
                return [];
            }
            var _local_4:Dictionary = this.getBodyPartsOfType(_arg_3);
            var _local_5:Array = this.getBodyPartsInAvatarSet(_local_4, k);
            var _local_6:Array = new Array();
            var _local_8:Array = new Array();
            this._transformation = Matrix4x4.getYRotationMatrix(_arg_2);
            for each (_local_7 in _local_5)
            {
                _local_7.applyTransform(this._transformation);
                _local_9 = _local_7.getDistance(this._camera);
                _local_6.push([_local_9, _local_7]);
            }
            _local_6.sort(this.orderByDistance);
            for each (_local_10 in _local_6)
            {
                _local_7 = (_local_10[1] as GeometryBodyPart);
                _local_8.push(_local_7.id);
            }
            return _local_8;
        }

        public function _Str_713(k:String, _arg_2:String, _arg_3:uint, _arg_4:Array, _arg_5:IAvatarImage):Array
        {
            var _local_6:GeometryBodyPart;
            if (this.hasBodyPart(k, _arg_2))
            {
                _local_6 = (this.getBodyPartsOfType(k)[_arg_2] as GeometryBodyPart);
                this._transformation = Matrix4x4.getYRotationMatrix(_arg_3);
                return _local_6._Str_713(this._transformation, this._camera, _arg_4, _arg_5);
            }
            return [];
        }

        private function orderByDistance(k:Array, _arg_2:Array):Number
        {
            var _local_3:Number = (k[0] as Number);
            var _local_4:Number = (_arg_2[0] as Number);
            if (_local_3 < _local_4)
            {
                return -1;
            }
            if (_local_3 > _local_4)
            {
                return 1;
            }
            return 0;
        }
    }
}
