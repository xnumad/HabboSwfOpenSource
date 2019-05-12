package com.sulake.habbo.sound.trax
{
    import com.sulake.core.utils.Map;

    public class TraxData 
    {
        private var _channels:Array;
        private var _metaData:Map;

        public function TraxData(k:String)
        {
            var _local_2:Array;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            var _local_10:int;
            var _local_11:Array;
            var _local_12:TraxChannel;
            var _local_13:int;
            var _local_14:Array;
            var _local_15:int;
            var _local_16:int;
            this._metaData = new Map();
            super();
            this._channels = [];
            var _local_3:Array = k.split(":");
            var _local_4:String = String(_local_3[(_local_3.length - 1)]);
            if (_local_4.indexOf("meta") != -1)
            {
                _local_6 = _local_4.split(";");
                _local_7 = 0;
                while (_local_7 < _local_6.length)
                {
                    _local_8 = String(_local_6[_local_7]).split(",")[0];
                    _local_9 = String(_local_6[_local_7]).split(",")[1];
                    this._metaData.add(_local_8, _local_9);
                    _local_7++;
                }
                _local_2 = _local_3.slice(0, (_local_3.length - 1));
            }
            else
            {
                _local_2 = _local_3;
            }
            var _local_5:int;
            while (_local_5 < (_local_2.length / 2))
            {
                if (_local_2[(_local_5 * 2)].toString().length > 0)
                {
                    _local_10 = int(_local_2[(_local_5 * 2)]);
                    _local_11 = _local_2[((_local_5 * 2) + 1)].toString().split(";");
                    _local_12 = new TraxChannel(_local_10);
                    _local_13 = 0;
                    while (_local_13 < _local_11.length)
                    {
                        _local_14 = _local_11[_local_13].toString().split(",");
                        if (_local_14.length != 2)
                        {
                            Logger.log("Trax load error: invalid song data string");
                            return;
                        }
                        _local_15 = int(_local_14[0]);
                        _local_16 = int(_local_14[1]);
                        _local_12._Str_25570(new TraxChannelItem(_local_15, _local_16));
                        _local_13++;
                    }
                    this._channels.push(_local_12);
                }
                _local_5++;
            }
        }

        public function get _Str_15653():Array
        {
            return this._channels;
        }

        public function _Str_18878():Array
        {
            var _local_3:TraxChannel;
            var _local_4:int;
            var _local_5:TraxChannelItem;
            var k:Array = [];
            var _local_2:int;
            while (_local_2 < this._channels.length)
            {
                _local_3 = (this._channels[_local_2] as TraxChannel);
                _local_4 = 0;
                while (_local_4 < _local_3._Str_11307)
                {
                    _local_5 = _local_3._Str_2990(_local_4);
                    if (k.indexOf(_local_5.id) == -1)
                    {
                        k.push(_local_5.id);
                    }
                    _local_4++;
                }
                _local_2++;
            }
            return k;
        }

        public function get _Str_25573():Boolean
        {
            return !(this._metaData["meta"] == null);
        }

        public function get _Str_22931():Boolean
        {
            return this._metaData["c"] == "1";
        }

        public function get _Str_26274():int
        {
            return this._metaData["t"] as int;
        }
    }
}
