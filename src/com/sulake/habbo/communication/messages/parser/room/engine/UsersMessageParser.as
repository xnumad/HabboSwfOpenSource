package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3548;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UsersMessageParser implements IMessageParser 
    {
        private var _users:Array;

        public function UsersMessageParser()
        {
            this._users = [];
            super();
        }

        public static function convertOldPetFigure(k:String):String
        {
            var _local_8:int;
            var _local_9:int;
            var _local_2:Array = new Array("FF7B3A", "FF9763", "FFCDB3", "F59500", "FBBD5C", "FEE4B2", "EDD400", "F5E759", "FBF8B1", "84A95F", "B0C993", "DBEFC7", "65B197", "91C7B5", "C5EDDE", "7F89B2", "98A1C5", "CAD2EC", "A47FB8", "C09ED5", "DBC7E9", "BD7E9D", "DA9DBD", "ECC6DB", "DD7B7D", "F08B90", "F9BABF", "ABABAB", "D4D4D4", "FFFFFF", "D98961", "DFA281", "F1D2C2", "D5B35F", "DAC480", "FCFAD3", "EAA7AF", "86BC40", "E8CE25", "8E8839", "888F67", "5E9414", "84CE84", "96E75A", "88E70D", "B99105", "C8D71D", "838851", "C08337", "83A785", "E6AF26", "ECFF99", "94FFF9", "ABC8E5", "F2E5CC", "D2FF00");
            var _local_3:Array = k.split(" ");
            if (_local_3.length < 3)
            {
                return "";
            }
            var _local_4:int = int(_local_3[0]);
            var _local_5:int = (int(_local_3[1]) + 1);
            var _local_6:String = String(_local_3[2]);
            _local_6 = _local_6.substr((_local_6.length - 6), 6);
            var _local_7:int = 25;
            if (_local_4 <= 1)
            {
                _local_8 = ((_local_7 * _local_4) + _local_5);
            }
            else
            {
                _local_8 = 64;
            }
            _local_9 = (_local_2.indexOf(_local_6.toUpperCase()) + 1);
            var _local_10:String = "";
            _local_10 = (_local_10 + ((("phd-" + _local_8) + "-") + _local_9));
            _local_10 = (_local_10 + (((".pbd-" + _local_8) + "-") + _local_9));
            _local_10 = (_local_10 + (((".ptl-" + _local_8) + "-") + _local_9));
            return _local_10;
        }


        public function flush():Boolean
        {
            this._users = [];
            return true;
        }

        public function getUserCount():int
        {
            return this._users.length;
        }

        public function _Str_5126(k:int):_Str_3548
        {
            if (((k < 0) || (k >= this.getUserCount())))
            {
                return null;
            }
            var _local_2:_Str_3548 = (this._users[k] as _Str_3548);
            if (_local_2 != null)
            {
                _local_2._Str_4710();
            }
            return _local_2;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:String;
            var _local_12:int;
            var _local_13:int;
            var _local_14:_Str_3548;
            var _local_15:String;
            var _local_16:int;
            var _local_17:Array;
            var _local_18:int;
            this._users = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readString();
                _local_6 = k.readString();
                _local_7 = k.readString();
                _local_8 = k.readInteger();
                _local_9 = k.readInteger();
                _local_10 = k.readInteger();
                _local_11 = k.readString();
                _local_12 = k.readInteger();
                _local_13 = k.readInteger();
                _local_14 = new _Str_3548(_local_8);
                _local_14.dir = _local_12;
                _local_14.name = _local_5;
                _local_14.custom = _local_6;
                _local_14.x = _local_9;
                _local_14.y = _local_10;
                _local_14.z = Number(_local_11);
                this._users.push(_local_14);
                if (_local_13 == 1)
                {
                    _local_14._Str_2394 = _local_4;
                    _local_14._Str_2908 = RoomObjectTypeEnum.HABBO;
                    _local_14._Str_3344 = this.resolveSex(k.readString());
                    _local_14._Str_4592 = ("" + k.readInteger());
                    _local_14._Str_7043 = k.readInteger();
                    _local_14.groupName = k.readString();
                    _local_15 = k.readString();
                    if (_local_15 != "")
                    {
                        _local_7 = this.convertSwimFigure(_local_15, _local_7, _local_14._Str_3344);
                    }
                    _local_14.figure = _local_7;
                    _local_14.activityPoints = k.readInteger();
                    _local_14._Str_3853 = k.readBoolean();
                }
                else
                {
                    if (_local_13 == 2)
                    {
                        _local_14._Str_2908 = RoomObjectTypeEnum.PET;
                        _local_14.figure = _local_7;
                        _local_14._Str_2394 = _local_4;
                        _local_14._Str_3882 = k.readInteger().toString();
                        _local_14.ownerId = k.readInteger();
                        _local_14.ownerName = k.readString();
                        _local_14.rarityLevel = k.readInteger();
                        _local_14._Str_4799 = k.readBoolean();
                        _local_14.isRiding = k.readBoolean();
                        _local_14.canBreed = k.readBoolean();
                        _local_14.canHarvest = k.readBoolean();
                        _local_14.canRevive = k.readBoolean();
                        _local_14.hasBreedingPermission = k.readBoolean();
                        _local_14._Str_3897 = k.readInteger();
                        _local_14._Str_16593 = k.readString();
                    }
                    else
                    {
                        if (_local_13 == 3)
                        {
                            _local_14._Str_2908 = RoomObjectTypeEnum.BOT;
                            _local_14._Str_2394 = (_local_8 * -1);
                            if (_local_7.indexOf("/") == -1)
                            {
                                _local_14.figure = _local_7;
                            }
                            else
                            {
                                _local_14.figure = "hr-100-.hd-180-1.ch-876-66.lg-270-94.sh-300-64";
                            }
                            _local_14._Str_3344 = _Str_3548.M;
                        }
                        else
                        {
                            if (_local_13 == 4)
                            {
                                _local_14._Str_2908 = RoomObjectTypeEnum.RENTABLE_BOT;
                                _local_14._Str_2394 = _local_4;
                                _local_14._Str_3344 = this.resolveSex(k.readString());
                                _local_14.figure = _local_7;
                                _local_14.ownerId = k.readInteger();
                                _local_14.ownerName = k.readString();
                                _local_16 = k.readInteger();
                                if (_local_16 > 0)
                                {
                                    _local_17 = new Array();
                                    _local_18 = 0;
                                    while (_local_18 < _local_16)
                                    {
                                        _local_17.push(k.readShort());
                                        _local_18++;
                                    }
                                    _local_14._Str_2899 = _local_17;
                                }
                            }
                        }
                    }
                }
                _local_3++;
            }
            return true;
        }

        private function resolveSex(k:String):String
        {
            if (k.substr(0, 1).toLowerCase() == "f")
            {
                return _Str_3548.F;
            }
            return _Str_3548.M;
        }

        private function convertSwimFigure(k:String, _arg_2:String, _arg_3:String):String
        {
            var _local_13:String;
            var _local_14:Array;
            var _local_15:String;
            var _local_16:Array;
            var _local_17:String;
            var _local_18:String;
            var _local_19:int;
            var _local_4:Array = _arg_2.split(".");
            var _local_5:int = 1;
            var _local_6:int = 1;
            var _local_7:int = 1;
            var _local_8:* = 10000;
            var _local_9:int;
            while (_local_9 < _local_4.length)
            {
                _local_13 = _local_4[_local_9];
                _local_14 = _local_13.split("-");
                if (_local_14.length > 2)
                {
                    _local_15 = _local_14[0];
                    if (_local_15 == "hd")
                    {
                        _local_5 = int(_local_14[2]);
                    }
                }
                _local_9++;
            }
            var _local_10:Array = ["238,238,238", "250,56,49", "253,146,160", "42,199,210", "53,51,44", "239,255,146", "198,255,152", "255,146,90", "157,89,126", "182,243,255", "109,255,51", "51,120,201", "255,182,49", "223,161,233", "249,251,50", "202,175,143", "197,198,197", "71,98,61", "138,131,97", "255,140,51", "84,198,39", "30,108,153", "152,79,136", "119,200,255", "255,192,142", "60,75,135", "124,44,71", "215,255,227", "143,63,28", "255,99,147", "31,155,121", "253,255,51"];
            var _local_11:Array = k.split("=");
            if (_local_11.length > 1)
            {
                _local_16 = (_local_11[1] as String).split("/");
                _local_17 = _local_16[0];
                _local_18 = _local_16[1];
                if (_arg_3 == "F")
                {
                    _local_7 = 10010;
                }
                else
                {
                    _local_7 = 10011;
                }
                _local_19 = _local_10.indexOf(_local_18);
                _local_6 = ((_local_8 + _local_19) + 1);
            }
            var _local_12:String = (((((".bds-10001-" + _local_5) + ".ss-") + _local_7) + "-") + _local_6);
            return _arg_2 + _local_12;
        }
    }
}
