package com.sulake.habbo.utils
{
    import flash.utils.Dictionary;

    public class FigureDataContainer 
    {
        public static const M:String = "M";
        public static const F:String = "F";
        public static const U:String = "U";
        public static const H:String = "h";
        public static const STD:String = "std";
        public static const _Str_2028:String = "0";
        public static const HD:String = "hd";
        public static const HR:String = "hr";
        public static const HA:String = "ha";
        public static const HE:String = "he";
        public static const EA:String = "ea";
        public static const FA:String = "fa";
        public static const CC:String = "cc";
        public static const CH:String = "ch";
        public static const CA:String = "ca";
        public static const CP:String = "cp";
        public static const LG:String = "lg";
        public static const SH:String = "sh";
        public static const WA:String = "wa";
        private static const _Str_1329:Array = [28, 29, 30, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 68];

        private var _data:Dictionary;
        private var _colors:Dictionary;
        private var _gender:String = "M";
        private var _isDisposed:Boolean;
        private var _avatarEffectType:int = -1;


        public function _Str_2153(k:String, _arg_2:String):void
        {
            this._data = new Dictionary();
            this._colors = new Dictionary();
            this._gender = _arg_2;
            this._Str_958(k);
        }

        public function dispose():void
        {
            this._data = null;
            this._colors = null;
            this._isDisposed = true;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        private function _Str_958(k:String):void
        {
            var _local_2:String;
            var _local_3:Array;
            var _local_4:String;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:int;
            if (k == null)
            {
                return;
            }
            for each (_local_2 in k.split("."))
            {
                _local_3 = _local_2.split("-");
                if (_local_3.length > 0)
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
                    if (_local_6.length == 0)
                    {
                        _local_6.push(0);
                    }
                    this._Str_1876(_local_4, _local_5, false);
                    this.savePartSetColourId(_local_4, _local_6, false);
                }
            }
        }

        public function _Str_2131(k:String):Boolean
        {
            return !(this._data[k] == null);
        }

        public function getPartSetId(k:String):int
        {
            if (this._data[k] != null)
            {
                return this._data[k];
            }
            return -1;
        }

        public function getColourIds(k:String):Array
        {
            if (this._colors[k] != null)
            {
                return this._colors[k];
            }
            return [];
        }

        public function getFigureString():String
        {
            var _local_3:String;
            var _local_4:int;
            var _local_5:String;
            var _local_6:Array;
            var _local_7:String;
            var _local_8:int;
            var k:String = "";
            var _local_2:Array = [];
            for (_local_3 in this._data)
            {
                if (this._data[_local_3] != null)
                {
                    _local_5 = this._data[_local_3];
                    _local_6 = (this._colors[_local_3] as Array);
                    _local_7 = ((_local_3 + "-") + _local_5);
                    if (_local_6)
                    {
                        _local_8 = 0;
                        while (_local_8 < _local_6.length)
                        {
                            _local_7 = (_local_7 + ("-" + _local_6[_local_8]));
                            _local_8++;
                        }
                    }
                    _local_2.push(_local_7);
                }
            }
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                k = (k + _local_2[_local_4]);
                if (_local_4 < (_local_2.length - 1))
                {
                    k = (k + ".");
                }
                _local_4++;
            }
            return k;
        }

        public function _Str_2088(k:String, _arg_2:int, _arg_3:Array, _arg_4:Boolean=false):void
        {
            this._Str_1876(k, _arg_2, _arg_4);
            this.savePartSetColourId(k, _arg_3, _arg_4);
        }

        private function _Str_1876(k:String, _arg_2:int, _arg_3:Boolean=true):void
        {
            switch (k)
            {
                case HD:
                case HR:
                case HA:
                case HE:
                case EA:
                case FA:
                case CH:
                case CC:
                case CA:
                case CP:
                case LG:
                case SH:
                case WA:
                    if (_arg_2 >= 0)
                    {
                        this._data[k] = _arg_2;
                    }
                    else
                    {
                        delete this._data[k];
                    }
                    return;
                default:
                    Logger.log(((("[FigureData] Unknown partset: " + k) + ", can not store id: ") + _arg_2));
            }
        }

        public function savePartSetColourId(k:String, _arg_2:Array, _arg_3:Boolean=true):void
        {
            switch (k)
            {
                case HD:
                case HR:
                case HA:
                case HE:
                case EA:
                case FA:
                case CH:
                case CC:
                case CA:
                case CP:
                case LG:
                case SH:
                case WA:
                    this._colors[k] = _arg_2;
                    return;
                default:
                    Logger.log((("[FigureData] Unknown partset: " + k) + ", can not store color-ids"));
            }
        }

        public function getFigureStringWithFace(k:int):String
        {
            var _local_5:String;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:int;
            var _local_2:Array = [];
            _local_2.push(HD);
            var _local_3:String = "";
            var _local_4:Array = [];
            for each (_local_5 in _local_2)
            {
                if (this._colors[_local_5] != null)
                {
                    _local_7 = this._data[_local_5];
                    _local_8 = (this._colors[_local_5] as Array);
                    if (_local_5 == HD)
                    {
                        _local_7 = k;
                    }
                    _local_9 = ((_local_5 + "-") + _local_7);
                    if (_local_7 >= 0)
                    {
                        _local_10 = 0;
                        while (_local_10 < _local_8.length)
                        {
                            _local_9 = (_local_9 + ("-" + _local_8[_local_10]));
                            _local_10++;
                        }
                    }
                    _local_4.push(_local_9);
                }
            }
            _local_6 = 0;
            while (_local_6 < _local_4.length)
            {
                _local_3 = (_local_3 + _local_4[_local_6]);
                if (_local_6 < (_local_4.length - 1))
                {
                    _local_3 = (_local_3 + ".");
                }
                _local_6++;
            }
            return _local_3;
        }

        public function get gender():String
        {
            return this._gender;
        }
    }
}
