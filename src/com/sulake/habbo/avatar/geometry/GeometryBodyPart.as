package com.sulake.habbo.avatar.geometry
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.IAvatarImage;

    public class GeometryBodyPart extends Node3D 
    {
        private var _id:String;
        private var _parts:Dictionary;
        private var _radius:Number;
        private var _dynamicParts:Dictionary;

        public function GeometryBodyPart(k:XML)
        {
            var _local_2:XML;
            var _local_3:GeometryItem;
            super(parseFloat(k.@x), parseFloat(k.@y), parseFloat(k.@z));
            this._radius = parseFloat(k.@radius);
            this._id = String(k.@id);
            this._parts = new Dictionary();
            this._dynamicParts = new Dictionary(true);
            for each (_local_2 in k..item)
            {
                _local_3 = new GeometryItem(_local_2);
                this._parts[String(_local_2.@id)] = _local_3;
            }
        }

        public function getDynamicParts(k:IAvatarImage):Array
        {
            var _local_3:GeometryItem;
            var _local_2:Array = [];
            if (this._dynamicParts[k] !== undefined)
            {
                for each (_local_3 in this._dynamicParts[k])
                {
                    if (_local_3 != null)
                    {
                        _local_2.push(_local_3);
                    }
                }
            }
            return _local_2;
        }

        public function getPartIds(k:IAvatarImage):Array
        {
            var _local_2:GeometryItem;
            var _local_3:Array = [];
            for each (_local_2 in this._parts)
            {
                if (_local_2 != null)
                {
                    _local_3.push(_local_2.id);
                }
            }
            if (this._dynamicParts[k] !== undefined)
            {
                for each (_local_2 in this._dynamicParts[k])
                {
                    if (_local_2 != null)
                    {
                        _local_3.push(_local_2.id);
                    }
                }
            }
            return _local_3;
        }

        public function removeDynamicParts(k:IAvatarImage):Boolean
        {
            var _local_2:String;
            if (this._dynamicParts[k] !== undefined)
            {
                for (_local_2 in this._dynamicParts[k])
                {
                    delete this._dynamicParts[k][_local_2];
                }
                this._dynamicParts[k] = null;
                delete this._dynamicParts[k];
            }
            return true;
        }

        public function addPart(k:XML, _arg_2:IAvatarImage):Boolean
        {
            var _local_3:String = String(k.@id);
            if (this.hasPart(_local_3, _arg_2))
            {
                return false;
            }
            if (this._dynamicParts[_arg_2] === undefined)
            {
                this._dynamicParts[_arg_2] = new Dictionary();
            }
            this._dynamicParts[_arg_2][_local_3] = new GeometryItem(k, true);
            return true;
        }

        public function hasPart(k:String, _arg_2:IAvatarImage):Boolean
        {
            var _local_3:GeometryItem = this._parts[k];
            if (((_local_3 == null) && (!(this._dynamicParts[_arg_2] === undefined))))
            {
                _local_3 = this._dynamicParts[_arg_2][k];
            }
            return !(_local_3 == null);
        }

        public function _Str_713(k:Matrix4x4, _arg_2:Vector3D, _arg_3:Array, _arg_4:IAvatarImage):Array
        {
            var _local_5:Number;
            var _local_6:GeometryItem;
            var _local_9:Array;
            var _local_7:Array = new Array();
            var _local_8:Array = new Array();
            for each (_local_6 in this._parts)
            {
                if (_local_6 != null)
                {
                    _local_6.applyTransform(k);
                    _local_5 = _local_6.getDistance(_arg_2);
                    _local_7.push([_local_5, _local_6]);
                }
            }
            for each (_local_6 in this._dynamicParts[_arg_4])
            {
                if (_local_6 != null)
                {
                    _local_6.applyTransform(k);
                    _local_5 = _local_6.getDistance(_arg_2);
                    _local_7.push([_local_5, _local_6]);
                }
            }
            _local_7.sort(this.orderParts);
            for each (_local_9 in _local_7)
            {
                _local_6 = (_local_9[1] as GeometryItem);
                _local_8.push(_local_6.id);
            }
            return _local_8;
        }

        public function getDistance(k:Vector3D):Number
        {
            var _local_2:Number = Math.abs(((k.z - this.transformedLocation.z) - this._radius));
            var _local_3:Number = Math.abs(((k.z - this.transformedLocation.z) + this._radius));
            return Math.min(_local_2, _local_3);
        }

        public function get id():String
        {
            return this._id;
        }

        private function orderParts(k:Array, _arg_2:Array):Number
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

        public function get radius():Number
        {
            return this._radius;
        }
    }
}
