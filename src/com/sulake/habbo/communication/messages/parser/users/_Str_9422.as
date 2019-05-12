package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4838;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9422 implements IMessageParser 
    {
        private var _userId:int;
        private var _Str_3998:Map;


        public function flush():Boolean
        {
            if (this._Str_3998)
            {
                this._Str_3998.dispose();
                this._Str_3998 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:_Str_4838;
            this._userId = k.readInteger();
            this._Str_3998 = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_4838(k);
                this._Str_3998.add(_local_4._Str_24791, _local_4);
                _local_3++;
            }
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get _Str_14823():Map
        {
            return this._Str_3998;
        }
    }
}
