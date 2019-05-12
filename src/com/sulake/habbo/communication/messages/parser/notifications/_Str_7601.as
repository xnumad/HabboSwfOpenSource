package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7601 implements IMessageParser 
    {
        private var _Str_1636:Map;


        public function flush():Boolean
        {
            if (this._Str_1636)
            {
                this._Str_1636.dispose();
                this._Str_1636 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:Array;
            var _local_6:int;
            var _local_7:int;
            this._Str_1636 = new Map();
            var _local_4:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_2 = k.readInteger();
                _local_3 = [];
                _local_6 = k.readInteger();
                _local_7 = 0;
                while (_local_7 < _local_6)
                {
                    _local_3.push(k.readInteger());
                    _local_7++;
                }
                this._Str_1636.add(_local_2, _local_3);
                _local_5++;
            }
            return true;
        }

        public function _Str_17858():Array
        {
            return this._Str_1636.getKeys();
        }

        public function _Str_24396(k:int):Array
        {
            return this._Str_1636.getValue(k);
        }
    }
}
