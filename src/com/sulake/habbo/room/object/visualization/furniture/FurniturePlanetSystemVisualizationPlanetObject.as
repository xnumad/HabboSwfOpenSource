package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.utils.Vector3d;

    public class FurniturePlanetSystemVisualizationPlanetObject 
    {
        private static const SYSTEM_TEMPO:Number = 30;

        private var _index:int;
        private var _name:String;
        private var _radius:Number;
        private var _arcSpeed:Number;
        private var _arcOffset:Number;
        private var _height:Number;
        private var _position:Number;
        private var _positionVector:Vector3d;
        private var _children:Array;

        public function FurniturePlanetSystemVisualizationPlanetObject(k:String, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number)
        {
            this._positionVector = new Vector3d(0, 0, 0);
            this._children = new Array();
            super();
            this._name = k;
            this._index = _arg_2;
            this._radius = _arg_3;
            this._arcSpeed = (((_arg_4 * Math.PI) * 2) / 360);
            this._arcOffset = (((_arg_5 * Math.PI) * 2) / 360);
            this._height = _arg_6;
            this._position = 0;
        }

        public function get name():String
        {
            return this._name;
        }

        public function dispose():void
        {
            var k:FurniturePlanetSystemVisualizationPlanetObject;
            while (this._children.length > 0)
            {
                k = this._children.shift();
                if (k != null)
                {
                    k.dispose();
                }
            }
        }

        public function update(k:Array, _arg_2:Vector3d, _arg_3:Number):void
        {
            var _local_4:FurniturePlanetSystemVisualizationPlanetObject;
            this._position = (this._position + (this._arcSpeed / SYSTEM_TEMPO));
            k[this._index] = this.getPositionVector(_arg_2, _arg_3);
            var _local_5:int;
            while (_local_5 < this._children.length)
            {
                _local_4 = this._children[_local_5];
                _local_4.update(k, this._positionVector, _arg_3);
                _local_5++;
            }
        }

        public function getPositionVector(k:Vector3d, _arg_2:Number):Vector3d
        {
            var _local_3:Number = (this._radius * Math.cos((this._position + this._arcOffset)));
            var _local_4:Number = (this._radius * Math.sin((this._position + this._arcOffset)));
            var _local_5:Number = this._height;
            this._positionVector.x = ((_local_3 - _local_4) * (_arg_2 / 2));
            this._positionVector.y = ((((_local_4 + _local_3) * (_arg_2 / 2)) * 0.5) - (this._height * (_arg_2 / 2)));
            this._positionVector.z = -(int(((4 * (_local_3 + _local_4)) - 0.7)));
            if (k != null)
            {
                this._positionVector.add(k);
            }
            return this._positionVector;
        }

        public function addChild(k:FurniturePlanetSystemVisualizationPlanetObject):void
        {
            if (this._children.indexOf(k) < 0)
            {
                this._children.push(k);
            }
        }

        public function hasChild(k:String):Boolean
        {
            var _local_2:FurniturePlanetSystemVisualizationPlanetObject;
            var _local_3:int;
            while (_local_3 < this._children.length)
            {
                _local_2 = this._children[_local_3];
                if (_local_2.name == k)
                {
                    return true;
                }
                if (_local_2.hasChild(k))
                {
                    return true;
                }
                _local_3++;
            }
            return false;
        }

        public function getChild(k:String):FurniturePlanetSystemVisualizationPlanetObject
        {
            var _local_2:FurniturePlanetSystemVisualizationPlanetObject;
            var _local_3:int;
            while (_local_3 < this._children.length)
            {
                _local_2 = this._children[_local_3];
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
