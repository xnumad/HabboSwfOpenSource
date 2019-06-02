package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7701 implements IMessageParser 
    {
        private var _Str_9564:Map;
        private var _Str_8285:int = 0;

        public function _Str_7701()
        {
            this._Str_9564 = new Map();
            super();
        }

        public function get _Str_22264():int
        {
            return this._Str_8285;
        }

        public function flush():Boolean
        {
            this._Str_9564.reset();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:_Str_5002;
            var _local_6:String;
            var _local_7:int;
            var _local_8:int;
            this._Str_9564.reset();
            var _local_2:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                _local_6 = k.readString();
                _local_7 = k.readInteger();
                if (_local_5 == 0)
                {
                    this._Str_8285 = _local_7;
                }
                _local_4 = new _Str_5002(_local_6, _local_7);
                _local_3 = k.readInteger();
                _local_8 = 0;
                while (_local_8 < _local_3)
                {
                    _local_4.addQueue(k.readString(), k.readInteger());
                    _local_8++;
                }
                this._Str_9564.add(_local_4.target, _local_4);
                _local_5++;
            }
            return true;
        }

        public function _Str_23931():Array
        {
            return this._Str_9564.getKeys();
        }

        public function _Str_25714(k:int):_Str_5002
        {
            return this._Str_9564.getValue(k) as _Str_5002;
        }
    }
}
