package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_5499;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_8180;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserUpdateMessageParser implements IMessageParser 
    {
        private var _users:Array;

        public function UserUpdateMessageParser()
        {
            this._users = [];
            super();
        }

        public function get userUpdateCount():int
        {
            return this._users.length;
        }

        public function flush():Boolean
        {
            this._users = [];
            return true;
        }

        public function _Str_24400(k:int):_Str_5499
        {
            if (((k < 0) || (k >= this.userUpdateCount)))
            {
                return null;
            }
            return this._users[k];
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:int;
            var _local_10:int;
            var _local_11:String;
            var _local_12:Boolean;
            var _local_13:int;
            var _local_14:int;
            var _local_15:Array;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Boolean;
            var _local_20:Array;
            var _local_21:int;
            var _local_22:_Str_5499;
            var _local_23:String;
            var _local_24:Array;
            var _local_25:String;
            var _local_26:String;
            var _local_27:Array;
            var _local_28:Number;
            var _local_29:Number;
            if (k == null)
            {
                return false;
            }
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = k.readInteger();
                _local_7 = Number(k.readString());
                _local_8 = 0;
                _local_9 = k.readInteger();
                _local_10 = k.readInteger();
                _local_11 = k.readString();
                _local_12 = false;
                _local_13 = ((_local_9 % 8) * 45);
                _local_14 = ((_local_10 % 8) * 45);
                _local_15 = [];
                _local_16 = 0;
                _local_17 = 0;
                _local_18 = 0;
                _local_19 = false;
                _local_20 = _local_11.split("/");
                _local_21 = 0;
                while (_local_21 < _local_20.length)
                {
                    _local_23 = (_local_20[_local_21] as String);
                    _local_24 = _local_23.split(" ");
                    _local_25 = String(_local_24[0]);
                    _local_26 = "";
                    if (_local_25 == "")
                    {
                    }
                    else
                    {
                        if (_local_24.length >= 2)
                        {
                            _local_26 = String(_local_24[1]);
                            switch (_local_25)
                            {
                                case "mv":
                                    _local_27 = _local_26.split(",");
                                    if (_local_27.length >= 3)
                                    {
                                        _local_16 = int(_local_27[0]);
                                        _local_17 = int(_local_27[1]);
                                        _local_18 = Number(_local_27[2]);
                                        _local_19 = true;
                                    }
                                    break;
                                case "sit":
                                    _local_28 = Number(_local_26);
                                    if (_local_24.length >= 3)
                                    {
                                        _local_12 = (_local_24[2] == "1");
                                    }
                                    _local_8 = _local_28;
                                    break;
                                case "lay":
                                    _local_29 = Number(_local_26);
                                    if (_local_29 < 0)
                                    {
                                    }
                                    _local_8 = Math.abs(_local_29);
                                    break;
                            }
                        }
                        _local_15.push(new _Str_8180(_local_25, _local_26));
                    }
                    _local_21++;
                }
                _local_22 = new _Str_5499(_local_4, _local_5, _local_6, _local_7, _local_8, _local_14, _local_13, _local_16, _local_17, _local_18, _local_19, _local_12, _local_15);
                this._users.push(_local_22);
                _local_3++;
            }
            return true;
        }
    }
}
