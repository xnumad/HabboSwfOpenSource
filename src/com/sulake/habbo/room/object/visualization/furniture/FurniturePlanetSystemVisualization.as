package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurniturePlanetSystemVisualization extends FurnitureAnimatedVisualization 
    {
        private var _planetIndex:Array;
        private var _planetNameIndex:Array;
        private var _offsetArray:Array;
        private var _rootPosition:Vector3d;

        public function FurniturePlanetSystemVisualization()
        {
            this._offsetArray = new Array();
            this._rootPosition = new Vector3d(0, 0, 0);
            super();
        }

        override public function dispose():void
        {
            var k:FurniturePlanetSystemVisualizationPlanetObject;
            if (this._planetIndex != null)
            {
                while (this._planetIndex.length > 0)
                {
                    k = this._planetIndex.shift();
                    k.dispose();
                }
            }
            this._planetIndex = null;
            this._planetNameIndex = null;
        }

        override protected function updateAnimation(k:Number):int
        {
            var _local_2:FurniturePlanetSystemVisualizationPlanetObject;
            var _local_3:int;
            if (((this._planetIndex == null) && (spriteCount > 0)))
            {
                if (!this._Str_18684())
                {
                    return 0;
                }
            }
            if (this._planetIndex != null)
            {
                _local_3 = 0;
                while (_local_3 < this._planetIndex.length)
                {
                    _local_2 = this._planetIndex[_local_3];
                    _local_2.update(this._offsetArray, this._rootPosition, k);
                    _local_3++;
                }
                return super.updateAnimation(k);
            }
            return 0;
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (_arg_3 < this._offsetArray.length)
            {
                return this._offsetArray[_arg_3].x;
            }
            return super.getSpriteXOffset(k, _arg_2, _arg_3);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (_arg_3 < this._offsetArray.length)
            {
                return this._offsetArray[_arg_3].y;
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3);
        }

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            if (_arg_3 < this._offsetArray.length)
            {
                return this._offsetArray[_arg_3].z;
            }
            return super.getSpriteZOffset(k, _arg_2, _arg_3);
        }

        private function _Str_18684():Boolean
        {
            var _local_7:IRoomObjectSprite;
            var _local_9:XML;
            var k:IRoomObject = object;
            if (k == null)
            {
                return false;
            }
            var _local_2:IRoomObjectModel = k.getModel();
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:String = _local_2.getString(RoomObjectVariableEnum.FURNITURE_PLANETSYSTEM_DATA);
            var _local_4:XMLList = XMLList(_local_3);
            var _local_5:XMLList = _local_4.children();
            var _local_6:int = _local_5.length();
            this._planetIndex = new Array();
            this._planetNameIndex = new Array();
            var _local_8:int;
            while (_local_8 < _local_6)
            {
                _local_9 = _local_5[_local_8];
                _local_7 = getSprite(_local_8);
                if (_local_7 != null)
                {
                    this.addPlanet(_local_9.@name, _local_8, _local_9.@parent, Number(_local_9.@radius), Number(_local_9.@arcspeed), Number(_local_9.@arcoffset), Number(_local_9.@height));
                }
                _local_8++;
            }
            return true;
        }

        private function addPlanet(k:String, _arg_2:int, _arg_3:String, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number):void
        {
            var _local_9:FurniturePlanetSystemVisualizationPlanetObject;
            if (this._planetIndex == null)
            {
                return;
            }
            var _local_8:FurniturePlanetSystemVisualizationPlanetObject = new FurniturePlanetSystemVisualizationPlanetObject(k, _arg_2, _arg_4, _arg_5, _arg_6, _arg_7);
            _local_9 = this.getPlanet(_arg_3);
            if (_local_9 != null)
            {
                _local_9.addChild(_local_8);
            }
            else
            {
                this._planetIndex.push(_local_8);
                this._planetNameIndex.push(k);
            }
        }

        private function getPlanet(k:String):FurniturePlanetSystemVisualizationPlanetObject
        {
            var _local_2:FurniturePlanetSystemVisualizationPlanetObject;
            var _local_3:int;
            while (_local_3 < this._planetIndex.length)
            {
                _local_2 = this._planetIndex[_local_3];
                if (_local_2.name == k)
                {
                    return _local_2;
                }
                if (_local_2.hasChild(k))
                {
                    return _local_2.getChild(k);
                }
                _local_3++;
            }
            return null;
        }
    }
}
