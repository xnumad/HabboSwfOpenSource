package com.sulake.habbo.communication.messages.parser._Str_521
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7418 implements IMessageParser 
    {
        private var _Str_8683:Map;
        private var _Str_8623:Map;


        public function flush():Boolean
        {
            if (this._Str_8683)
            {
                this._Str_8683.dispose();
                this._Str_8683 = null;
            }
            if (this._Str_8623)
            {
                this._Str_8623.dispose();
                this._Str_8623 = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:String;
            var _local_2:int = k.readInteger();
            this._Str_8683 = new Map();
            this._Str_8623 = new Map();
            var _local_6:int;
            while (_local_6 < _local_2)
            {
                _local_3 = k.readInteger();
                _local_4 = k.readString();
                _local_5 = k.readString();
                this._Str_8683.add(_local_3, _local_4);
                this._Str_8623.add(_local_3, _local_5);
                _local_6++;
            }
            return true;
        }

        public function get _Str_24757():Map
        {
            return this._Str_8683;
        }

        public function get _Str_24895():Map
        {
            return this._Str_8623;
        }
    }
}
