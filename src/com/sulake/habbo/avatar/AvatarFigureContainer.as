package com.sulake.habbo.avatar
{
    import com.sulake.core.utils.Map;

    public class AvatarFigureContainer implements IAvatarFigureContainer 
    {
        private var _parts:Map;

        public function AvatarFigureContainer(k:String)
        {
            this._parts = new Map();
            this.parseAvatarFigure(k);
        }

        public function _Str_1016():Array
        {
            return this.partSets().getKeys();
        }

        public function _Str_744(k:String):Boolean
        {
            return !(this.partSets().getValue(k) == null);
        }

        public function getPartSetId(k:String):int
        {
            var _local_2:Map = (this.partSets().getValue(k) as Map);
            if (_local_2 != null)
            {
                return _local_2.getValue("setid") as int;
            }
            return 0;
        }

        public function _Str_815(k:String):Array
        {
            var _local_2:Map = (this.partSets().getValue(k) as Map);
            if (_local_2 != null)
            {
                return _local_2.getValue("colorids") as Array;
            }
            return null;
        }

        public function _Str_830(k:String, _arg_2:int, _arg_3:Array):void
        {
            var _local_4:Map = new Map();
            _local_4.add("type", k);
            _local_4.add("setid", _arg_2);
            _local_4.add("colorids", _arg_3);
            var _local_5:Map = this.partSets();
            _local_5.remove(k);
            _local_5.add(k, _local_4);
        }

        public function _Str_923(k:String):void
        {
            this.partSets().remove(k);
        }

        public function getFigureString():String
        {
            var _local_2:String;
            var _local_3:Array;
            var k:Array = [];
            for each (_local_2 in this.partSets().getKeys())
            {
                _local_3 = [];
                _local_3.push(_local_2);
                _local_3.push(this.getPartSetId(_local_2));
                _local_3 = _local_3.concat(this._Str_815(_local_2));
                k.push(_local_3.join("-"));
            }
            return k.join(".");
        }

        private function partSets():Map
        {
            if (this._parts == null)
            {
                this._parts = new Map();
            }
            return this._parts;
        }

        private function parseAvatarFigure(k:String):void
        {
            var _local_2:String;
            var _local_3:Array;
            var _local_4:String;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:int;
            if (k == null)
            {
                k = "";
            }
            for each (_local_2 in k.split("."))
            {
                _local_3 = _local_2.split("-");
                if (_local_3.length >= 2)
                {
                    _local_4 = String(_local_3[0]);
                    _local_5 = parseInt(_local_3[1]);
                    _local_6 = new Array();
                    _local_7 = 2;
                    while (_local_7 < _local_3.length)
                    {
                        _local_6.push(parseInt(_local_3[_local_7]));
                        _local_7++;
                    }
                    this._Str_830(_local_4, _local_5, _local_6);
                }
            }
        }
    }
}
