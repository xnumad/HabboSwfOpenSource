package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8595 implements IMessageParser 
    {
        private var _Str_2629:int;
        private var _description:String;
        private var _data:Map;


        public function get _Str_2712():int
        {
            return this._Str_2629;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get data():Map
        {
            return this._data;
        }

        public function flush():Boolean
        {
            if (this._data != null)
            {
                this._data.dispose();
            }
            this._data = null;
            this._Str_2629 = -1;
            this._description = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:String;
            this._data = new Map();
            this._Str_2629 = k.readInteger();
            this._description = k.readString();
            var _local_2:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_2)
            {
                _local_3 = k.readInteger();
                _local_4 = k.readString();
                this._data.add(_local_3, _local_4);
                _local_5++;
            }
            return true;
        }
    }
}
