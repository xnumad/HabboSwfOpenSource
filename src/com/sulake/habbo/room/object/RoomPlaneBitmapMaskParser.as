package com.sulake.habbo.room.object
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.room.utils.IVector3d;

    public class RoomPlaneBitmapMaskParser 
    {
        private var _masks:Map = null;

        public function RoomPlaneBitmapMaskParser()
        {
            this._masks = new Map();
        }

        public function get _Str_6845():int
        {
            return this._masks.length;
        }

        public function dispose():void
        {
            if (this._masks != null)
            {
                this.reset();
                this._masks.dispose();
                this._masks = null;
            }
        }

        public function initialize(k:XML):Boolean
        {
            var _local_7:XML;
            var _local_8:String;
            var _local_9:String;
            var _local_10:Vector3d;
            var _local_11:String;
            var _local_12:XMLList;
            var _local_13:XML;
            var _local_14:RoomPlaneBitmapMaskData;
            if (k == null)
            {
                return false;
            }
            this._masks.reset();
            var _local_2:Array = ["id", "type", "category"];
            var _local_3:Array = ["x", "y", "z"];
            var _local_4:XMLList;
            var _local_5:XMLList = k.planeMask;
            var _local_6:int;
            while (_local_6 < _local_5.length())
            {
                _local_7 = _local_5[_local_6];
                if (!XMLValidator.checkRequiredAttributes(_local_7, _local_2))
                {
                    return false;
                }
                _local_8 = _local_7.@id;
                _local_9 = _local_7.@type;
                _local_10 = null;
                _local_11 = _local_7.@category;
                _local_12 = _local_7.location;
                if (_local_12.length() != 1)
                {
                    return false;
                }
                _local_13 = _local_12[0];
                if (!XMLValidator.checkRequiredAttributes(_local_13, _local_3))
                {
                    return false;
                }
                _local_10 = new Vector3d(Number(_local_13.@x), Number(_local_13.@y), Number(_local_13.@z));
                _local_14 = new RoomPlaneBitmapMaskData(_local_9, _local_10, _local_11);
                this._masks.add(_local_8, _local_14);
                _local_6++;
            }
            return true;
        }

        public function reset():void
        {
            var _local_2:RoomPlaneBitmapMaskData;
            var k:int;
            while (k < this._masks.length)
            {
                _local_2 = (this._masks.getWithIndex(k) as RoomPlaneBitmapMaskData);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                }
                k++;
            }
            this._masks.reset();
        }

        public function addMask(k:String, _arg_2:String, _arg_3:IVector3d, _arg_4:String):void
        {
            var _local_5:RoomPlaneBitmapMaskData = new RoomPlaneBitmapMaskData(_arg_2, _arg_3, _arg_4);
            this._masks.remove(k);
            this._masks.add(k, _local_5);
        }

        public function removeMask(k:String):Boolean
        {
            var _local_2:RoomPlaneBitmapMaskData = (this._masks.remove(k) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                _local_2.dispose();
                return true;
            }
            return false;
        }

        public function _Str_5598():XML
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:XML;
            var _local_6:IVector3d;
            var k:XML = <planeMasks/>
            ;
            var _local_2:int;
            while (_local_2 < this._Str_6845)
            {
                _local_3 = this.getMaskType(_local_2);
                _local_4 = this.getMaskCategory(_local_2);
                _local_5 = new (XML)((((((('<planeMask id="' + _local_2) + '" type="') + _local_3) + '" category="') + _local_4) + '"/>'));
                _local_6 = this.getMaskLocation(_local_2);
                if (_local_6 != null)
                {
                    _local_5.appendChild(new (XML)((((((('<location x="' + _local_6.x) + '" y="') + _local_6.y) + '" z="') + _local_6.z) + '"/>')));
                    k.appendChild(_local_5);
                }
                _local_2++;
            }
            return k;
        }

        public function getMaskLocation(k:int):IVector3d
        {
            if (((k < 0) || (k >= this._Str_6845)))
            {
                return null;
            }
            var _local_2:RoomPlaneBitmapMaskData = (this._masks.getWithIndex(k) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                return _local_2.loc;
            }
            return null;
        }

        public function getMaskType(k:int):String
        {
            if (((k < 0) || (k >= this._Str_6845)))
            {
                return null;
            }
            var _local_2:RoomPlaneBitmapMaskData = (this._masks.getWithIndex(k) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                return _local_2.type;
            }
            return null;
        }

        public function getMaskCategory(k:int):String
        {
            if (((k < 0) || (k >= this._Str_6845)))
            {
                return null;
            }
            var _local_2:RoomPlaneBitmapMaskData = (this._masks.getWithIndex(k) as RoomPlaneBitmapMaskData);
            if (_local_2 != null)
            {
                return _local_2.category;
            }
            return null;
        }
    }
}
