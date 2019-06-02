package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3079;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ItemDataParser 
    {


        public static function _Str_9484(k:IMessageDataWrapper):_Str_3079
        {
            var _local_14:String;
            var _local_15:String;
            var _local_16:int;
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_20:String;
            var _local_21:Array;
            var _local_22:Number;
            var _local_23:Number;
            var _local_24:Number;
            var _local_2:int = int(k.readString());
            var _local_3:int = k.readInteger();
            var _local_4:String = k.readString();
            var _local_5:String = k.readString();
            var _local_6:int = k.readInteger();
            var _local_7:int = k.readInteger();
            var _local_8:int = k.readInteger();
            var _local_9:int;
            var _local_10:Number = parseFloat(_local_5);
            if (!isNaN(_local_10))
            {
                _local_9 = int(_local_5);
            }
            Logger.log("\n\n PARSING WALL ITEM: ");
            Logger.log(("wallItemId: " + _local_2));
            Logger.log(("wallItemTypeId: " + _local_3));
            Logger.log(("location: " + _local_4));
            Logger.log(("dataStr: " + _local_5));
            Logger.log(("secondsToExpiration: " + _local_6));
            Logger.log(("state: " + _local_9));
            var _local_11:_Str_3079;
            var _local_12:Array;
            var _local_13:String;
            if (_local_4.indexOf(":") == 0)
            {
                _local_11 = new _Str_3079(_local_2, _local_3, false);
                _local_12 = _local_4.split(" ");
                if (_local_12.length >= 3)
                {
                    _local_14 = String(_local_12[0]);
                    _local_15 = String(_local_12[1]);
                    _local_13 = String(_local_12[2]);
                    if (((_local_14.length > 3) && (_local_15.length > 2)))
                    {
                        _local_14 = _local_14.substr(3);
                        _local_15 = _local_15.substr(2);
                        _local_12 = _local_14.split(",");
                        if (_local_12.length >= 2)
                        {
                            _local_16 = int(_local_12[0]);
                            _local_17 = int(_local_12[1]);
                            _local_12 = _local_15.split(",");
                            if (_local_12.length >= 2)
                            {
                                _local_18 = int(_local_12[0]);
                                _local_19 = int(_local_12[1]);
                                _local_11._Str_15139 = _local_16;
                                _local_11._Str_15569 = _local_17;
                                _local_11.localX = _local_18;
                                _local_11.localY = _local_19;
                                _local_11.dir = _local_13;
                                _local_11.data = _local_5;
                                _local_11.state = _local_9;
                            }
                        }
                    }
                }
            }
            else
            {
                _local_11 = new _Str_3079(_local_2, _local_3, true);
                _local_12 = _local_4.split(" ");
                if (_local_12.length >= 2)
                {
                    _local_13 = String(_local_12[0]);
                    if (((_local_13 == "rightwall") || (_local_13 == "frontwall")))
                    {
                        _local_13 = "r";
                    }
                    else
                    {
                        _local_13 = "l";
                    }
                    _local_20 = String(_local_12[1]);
                    _local_21 = _local_20.split(",");
                    if (_local_21.length >= 3)
                    {
                        _local_22 = 0;
                        _local_23 = parseFloat(_local_21[0]);
                        _local_24 = parseFloat(_local_21[1]);
                        _local_11.y = _local_23;
                        _local_11.z = _local_24;
                        _local_11.dir = _local_13;
                        _local_11.data = _local_5;
                        _local_11.state = _local_9;
                    }
                }
            }
            _local_11.usagePolicy = _local_7;
            _local_11.ownerId = _local_8;
            _local_11.secondsToExpiration = _local_6;
            return _local_11;
        }
    }
}
