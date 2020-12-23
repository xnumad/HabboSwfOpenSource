package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FaqClientFaqsMessageParser implements IMessageParser
    {
        private var _urgentData:Map;
        private var _normalData:Map;


        public function get _Str_26124():Map
        {
            return this._urgentData;
        }

        public function get _Str_26404():Map
        {
            return this._normalData;
        }

        public function flush():Boolean
        {
            if (this._urgentData != null)
            {
                this._urgentData.dispose();
            }
            this._urgentData = null;
            if (this._normalData != null)
            {
                this._normalData.dispose();
            }
            this._normalData = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:int;
            var _local_5:int;
            this._urgentData = new Map();
            this._normalData = new Map();
            _local_5 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_5)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._urgentData.add(_local_2, _local_3);
                _local_4++;
            }
            _local_5 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_5)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._normalData.add(_local_2, _local_3);
                _local_4++;
            }
            return true;
        }
    }
}
