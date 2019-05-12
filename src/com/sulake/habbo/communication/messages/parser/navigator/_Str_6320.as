package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5078;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2632;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5485;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6320 implements IMessageParser 
    {
        private var _data:_Str_5078;
        private var _Str_8807:_Str_2632;
        private var _Str_12284:_Str_5485;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new _Str_5078(k);
            var _local_2:int = k.readInteger();
            if (_local_2 > 0)
            {
                this._Str_8807 = new _Str_2632(k);
            }
            this._Str_12284 = new _Str_5485(k);
            return true;
        }

        public function get data():_Str_5078
        {
            return this._data;
        }

        public function get _Str_5653():_Str_2632
        {
            return this._Str_8807;
        }

        public function get _Str_5482():_Str_5485
        {
            return this._Str_12284;
        }
    }
}
