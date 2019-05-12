package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7324 implements IMessageParser 
    {
        private var _errorCode:int;
        private var _Str_18004:Array;


        public function flush():Boolean
        {
            this._Str_18004 = new Array();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            this._errorCode = k.readInteger();
            if (this._errorCode == 1)
            {
                _local_2 = k.readInteger();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    this._Str_18004.push(k.readInteger());
                    _local_3++;
                }
            }
            return true;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function get _Str_25393():Array
        {
            return this._Str_18004;
        }
    }
}
