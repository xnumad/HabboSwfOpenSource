package com.sulake.habbo.window.utils.floorplaneditor
{
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4279;
    import com.sulake.habbo.communication.messages.parser.room.layout._Str_6361;
    import com.sulake.habbo.communication.messages.incoming._Str_446._Str_6566;

    public class FloorPlanCache 
    {
        private const _Str_23615:uint = 0x0400;
        private const _Str_19864:uint = 64;

        private var _bcFloorPlanEditor:BCFloorPlanEditor;
        private var _floorWidth:int;
        private var _floorHeight:int;
        private var _floorPlanCache:Array;
        private var _reservedTiles:Array;
        private var _entryPoint:Point;
        private var _entryPointDir:uint;

        public function FloorPlanCache(k:BCFloorPlanEditor)
        {
            this._bcFloorPlanEditor = k;
        }

        public function onFloorHeightMap(k:_Str_4279):void
        {
            this._Str_22644(k.getParser().text);
        }

        public function _Str_18596(k:_Str_6566):void
        {
            var _local_2:_Str_6361;
            var _local_3:Object;
            if (this._floorPlanCache)
            {
                _local_2 = k.getParser();
                this._Str_24995();
                for each (_local_3 in _local_2._Str_24835)
                {
                    this._reservedTiles[_local_3.y][_local_3.x] = true;
                }
            }
        }

        private function _Str_24995():void
        {
            var _local_2:int;
            this._reservedTiles = [];
            var k:int;
            while (k < this.floorHeight)
            {
                this._reservedTiles.push([]);
                _local_2 = 0;
                while (_local_2 < this._Str_17437)
                {
                    this._reservedTiles[k].push(false);
                    _local_2++;
                }
                k++;
            }
        }

        private function _Str_22644(k:String=""):void
        {
            var _local_3:String;
            var _local_2:Array = k.split("\r");
            this._floorPlanCache = [];
            for each (_local_3 in _local_2)
            {
                if (_local_3.length > 0)
                {
                    this._floorPlanCache.push(_local_3);
                }
            }
            this._Str_22943();
        }

        private function _Str_22943():Boolean
        {
            var _local_3:String;
            this._floorWidth = -1;
            this._floorHeight = -1;
            if (this._floorPlanCache.length == 0)
            {
                return false;
            }
            var k:int = String(this._floorPlanCache[0]).length;
            var _local_2:int;
            for each (_local_3 in this._floorPlanCache)
            {
                if (_local_3.length == 0)
                {
                    break;
                }
                _local_2++;
            }
            this._floorWidth = k;
            this._floorHeight = _local_2;
            return true;
        }

        private function _Str_22360(k:int, _arg_2:int):Boolean
        {
            if ((((((this._floorPlanCache == null) || (k < 0)) || (k > this._floorWidth)) || (_arg_2 < 0)) || (_arg_2 > this._floorHeight)))
            {
                return false;
            }
            if (((k == 0) || (_arg_2 == 0)))
            {
                return this._Str_24682(k, _arg_2);
            }
            return true;
        }

        private function _Str_24682(k:int, _arg_2:int):Boolean
        {
            return (this._Str_23261(k, _arg_2)) && (this._Str_23356(k, _arg_2));
        }

        private function _Str_23261(k:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            while (_local_3 < this._floorHeight)
            {
                if (((!(_local_3 == _arg_2)) && (!(this._floorPlanCache[_local_3].substr(0, 1) == "x"))))
                {
                    return false;
                }
                _local_3++;
            }
            return true;
        }

        private function _Str_23356(k:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            while (_local_3 < this._floorWidth)
            {
                if (((!(_local_3 == k)) && (!(this._floorPlanCache[0].substr(_local_3, 1) == "x"))))
                {
                    return false;
                }
                _local_3++;
            }
            return true;
        }

        public function _Str_13296(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            if (!this._Str_22360(k, _arg_2))
            {
                return false;
            }
            if (k == this._floorWidth)
            {
                if (!this._Str_23451())
                {
                    return false;
                }
            }
            if (_arg_2 == this._floorHeight)
            {
                if (!this._Str_23525())
                {
                    return false;
                }
            }
            /*if (this._Str_19261(k, _arg_2))
            {
                return false;
            }*/
            this._floorPlanCache[_arg_2] = this._Str_25835(String(this._floorPlanCache[_arg_2]), ((_arg_3 < 0) ? "x" : _arg_3.toString(33)), k);
            return true;
        }

        public function _Str_4203(k:int, _arg_2:int):int
        {
            if ((((((this._floorPlanCache == null) || (k < 0)) || (k >= this._floorWidth)) || (_arg_2 < 0)) || (_arg_2 >= this._floorHeight)))
            {
                return -1;
            }
            var _local_3:String = String(this._floorPlanCache[_arg_2]).charAt(k);
            return (_local_3 == "x") ? -1 : parseInt(_local_3, 33);
        }

        private function _Str_25835(k:String, _arg_2:String, _arg_3:int):String
        {
            return (k.substr(0, _arg_3) + _arg_2) + k.substr((_arg_3 + 1));
        }

        public function get _Str_17437():int
        {
            return this._floorWidth;
        }

        public function get floorHeight():int
        {
            return this._floorHeight;
        }

        public function _Str_21406():String
        {
            var k:String = "";
            var _local_2:int;
            while (_local_2 < this._floorPlanCache.length)
            {
                k = ((k + this._floorPlanCache[_local_2]) + "\r");
                _local_2++;
            }
            return k;
        }

        public function _Str_19261(k:int, _arg_2:int):Boolean
        {
            if (!this._reservedTiles)
            {
                return false;
            }
            if (this._reservedTiles.length < (_arg_2 + 1))
            {
                return false;
            }
            if (this._reservedTiles[_arg_2].length < (k + 1))
            {
                return false;
            }
            return this._reservedTiles[_arg_2][k];
        }

        public function _Str_21855(k:int, _arg_2:int):Boolean
        {
            if (!this._entryPoint)
            {
                return false;
            }
            return (this._entryPoint.x == k) && (this._entryPoint.y == _arg_2);
        }

        public function get _Str_7642():Point
        {
            return this._entryPoint;
        }

        public function set _Str_7642(k:Point):void
        {
            this._entryPoint = k;
        }

        public function get _Str_6184():int
        {
            return this._entryPointDir;
        }

        public function set _Str_6184(k:int):void
        {
            if (k < 0)
            {
                k = 7;
            }
            if (k > 7)
            {
                k = 0;
            }
            this._entryPointDir = k;
        }

        private function _Str_23451():Boolean
        {
            if (!this._Str_20778((this._floorWidth + 1), this._floorHeight))
            {
                this._bcFloorPlanEditor.windowManager.simpleAlert("${floor.plan.editor.alert}", null, "${floor.plan.editor.size.limit.exceeded}");
                this._bcFloorPlanEditor._Str_20752._Str_22137 = false;
                return false;
            }
            var k:int;
            while (k < this._floorHeight)
            {
                if (String(this._floorPlanCache[k]).length > 0)
                {
                    this._floorPlanCache[k] = (this._floorPlanCache[k] + "x");
                    this._reservedTiles[k].push(false);
                }
                k++;
            }
            this._floorWidth = (this._floorWidth + 1);
            return true;
        }

        private function _Str_23525():Boolean
        {
            if (!this._Str_20778(this._floorWidth, (this._floorHeight + 1)))
            {
                this._bcFloorPlanEditor.windowManager.simpleAlert("${floor.plan.editor.alert}", null, "${floor.plan.editor.size.limit.exceeded}");
                this._bcFloorPlanEditor._Str_20752._Str_22137 = false;
                return false;
            }
            var k:String = "";
            var _local_2:int;
            while (_local_2 < this._floorWidth)
            {
                k = (k + "x");
                _local_2++;
            }
            this._floorPlanCache.push(k);
            var _local_3:Array = [];
            _local_2 = 0;
            while (_local_2 < this._floorWidth)
            {
                _local_3.push(false);
                _local_2++;
            }
            this._reservedTiles.push(_local_3);
            this._floorHeight = (this._floorHeight + 1);
            return true;
        }

        private function _Str_20778(k:uint, _arg_2:uint):Boolean
        {
            return !((((!(this._bcFloorPlanEditor._Str_22461)) && ((k * _arg_2) > this._Str_23615)) || (k > this._Str_19864)) || (_arg_2 > this._Str_19864));
        }
    }
}
