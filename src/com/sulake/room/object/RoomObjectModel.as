package com.sulake.room.object
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;

    public class RoomObjectModel implements IRoomObjectModelController 
    {
        private static const ROMC_MAP_KEYS_:String = "ROMC_MAP_KEYS_";
        private static const ROMC_MAP_VALUES_:String = "ROMC_MAP_VALUES_";

        private var _numberDataList:Dictionary;
        private var _stringDataList:Dictionary;
        private var _numberArrayDataList:Dictionary;
        private var _stringArrayDataList:Dictionary;
        private var _numberReadOnlyList:Array;
        private var _stringReadOnlyList:Array;
        private var _numberArrayReadOnlyList:Array;
        private var _stringArrayReadOnlyList:Array;
        private var _updateID:int;

        public function RoomObjectModel()
        {
            this._numberDataList = new Dictionary();
            this._stringDataList = new Dictionary();
            this._numberArrayDataList = new Dictionary();
            this._stringArrayDataList = new Dictionary();
            this._numberReadOnlyList = [];
            this._stringReadOnlyList = [];
            this._numberArrayReadOnlyList = [];
            this._stringArrayReadOnlyList = [];
            this._updateID = 0;
        }

        public function dispose():void
        {
            var k:String;
            if (this._numberDataList != null)
            {
                for (k in this._numberDataList)
                {
                    delete this._numberDataList[k];
                }
                this._numberDataList = null;
            }
            if (this._stringDataList != null)
            {
                for (k in this._stringDataList)
                {
                    delete this._stringDataList[k];
                }
                this._stringDataList = null;
            }
            if (this._numberArrayDataList != null)
            {
                for (k in this._numberArrayDataList)
                {
                    delete this._numberArrayDataList[k];
                }
                this._numberArrayDataList = null;
            }
            if (this._stringArrayDataList != null)
            {
                for (k in this._stringArrayDataList)
                {
                    delete this._stringArrayDataList[k];
                }
                this._stringArrayDataList = null;
            }
            this._stringReadOnlyList = [];
            this._numberReadOnlyList = [];
            this._stringArrayReadOnlyList = [];
            this._numberArrayReadOnlyList = [];
        }

        public function hasNumber(k:String):Boolean
        {
            return !(this._numberDataList[k] == null);
        }

        public function hasNumberArray(k:String):Boolean
        {
            return !(this._numberArrayDataList[k] == null);
        }

        public function hasString(k:String):Boolean
        {
            return !(this._stringDataList[k] == null);
        }

        public function hasStringArray(k:String):Boolean
        {
            return !(this._stringArrayDataList[k] == null);
        }

        public function getNumber(k:String):Number
        {
            return this._numberDataList[k];
        }

        public function getString(k:String):String
        {
            return this._stringDataList[k];
        }

        public function getNumberArray(k:String):Array
        {
            var _local_2:Array = this._numberArrayDataList[k];
            if (_local_2 != null)
            {
                _local_2 = _local_2.slice();
            }
            return _local_2;
        }

        public function getStringArray(k:String):Array
        {
            var _local_2:Array = this._stringArrayDataList[k];
            if (_local_2 != null)
            {
                _local_2 = _local_2.slice();
            }
            return _local_2;
        }

        public function getStringToStringMap(k:String):Map
        {
            var _local_5:int;
            var _local_2:Map = new Map();
            var _local_3:Array = this.getStringArray((ROMC_MAP_KEYS_ + k));
            var _local_4:Array = this.getStringArray((ROMC_MAP_VALUES_ + k));
            if ((((!(_local_3 == null)) && (!(_local_4 == null))) && (_local_3.length == _local_4.length)))
            {
                _local_5 = 0;
                while (_local_5 < _local_3.length)
                {
                    _local_2.add(_local_3[_local_5], _local_4[_local_5]);
                    _local_5++;
                }
            }
            return _local_2;
        }

        public function setNumber(k:String, _arg_2:Number, _arg_3:Boolean=false):void
        {
            if (this._numberReadOnlyList.indexOf(k) >= 0)
            {
                return;
            }
            if (_arg_3)
            {
                this._numberReadOnlyList.push(k);
            }
            if (this._numberDataList[k] != _arg_2)
            {
                this._numberDataList[k] = _arg_2;
                this._updateID++;
            }
        }

        public function setString(k:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            if (this._stringReadOnlyList.indexOf(k) >= 0)
            {
                return;
            }
            if (_arg_3)
            {
                this._stringReadOnlyList.push(k);
            }
            if (this._stringDataList[k] != _arg_2)
            {
                this._stringDataList[k] = _arg_2;
                this._updateID++;
            }
        }

        public function setNumberArray(k:String, _arg_2:Array, _arg_3:Boolean=false):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (this._numberArrayReadOnlyList.indexOf(k) >= 0)
            {
                return;
            }
            if (_arg_3)
            {
                this._numberArrayReadOnlyList.push(k);
            }
            var _local_4:Array = [];
            var _local_5:int;
            _local_5 = 0;
            while (_local_5 < _arg_2.length)
            {
                if ((_arg_2[_local_5] is Number))
                {
                    _local_4.push(_arg_2[_local_5]);
                }
                _local_5++;
            }
            var _local_6:Array = this._numberArrayDataList[k];
            var _local_7:Boolean = true;
            if (((!(_local_6 == null)) && (_local_6.length == _local_4.length)))
            {
                _local_5 = (_local_4.length - 1);
                while (_local_5 >= 0)
                {
                    if ((_local_4[_local_5] as Number) != (_local_6[_local_5] as Number))
                    {
                        _local_7 = false;
                        break;
                    }
                    _local_5--;
                }
            }
            else
            {
                _local_7 = false;
            }
            if (_local_7)
            {
                return;
            }
            this._numberArrayDataList[k] = _local_4;
            this._updateID++;
        }

        public function setStringArray(k:String, _arg_2:Array, _arg_3:Boolean=false):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            if (this._stringArrayReadOnlyList.indexOf(k) >= 0)
            {
                return;
            }
            if (_arg_3)
            {
                this._stringArrayReadOnlyList.push(k);
            }
            var _local_4:Array = [];
            var _local_5:int;
            _local_5 = 0;
            while (_local_5 < _arg_2.length)
            {
                if ((_arg_2[_local_5] is String))
                {
                    _local_4.push(_arg_2[_local_5]);
                }
                _local_5++;
            }
            var _local_6:Array = this._stringArrayDataList[k];
            var _local_7:Boolean = true;
            if (((!(_local_6 == null)) && (_local_6.length == _local_4.length)))
            {
                _local_5 = (_local_4.length - 1);
                while (_local_5 >= 0)
                {
                    if ((_local_4[_local_5] as String) != (_local_6[_local_5] as String))
                    {
                        _local_7 = false;
                        break;
                    }
                    _local_5--;
                }
            }
            else
            {
                _local_7 = false;
            }
            if (_local_7)
            {
                return;
            }
            this._stringArrayDataList[k] = _local_4;
            this._updateID++;
        }

        public function setStringToStringMap(k:String, _arg_2:Map, _arg_3:Boolean=false):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            this.setStringArray((ROMC_MAP_KEYS_ + k), _arg_2.getKeys(), _arg_3);
            this.setStringArray((ROMC_MAP_VALUES_ + k), _arg_2.getValues(), _arg_3);
        }

        public function getUpdateID():int
        {
            return this._updateID;
        }
    }
}
