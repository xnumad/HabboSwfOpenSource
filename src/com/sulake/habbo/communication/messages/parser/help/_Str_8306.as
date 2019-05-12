package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8306 implements IMessageParser 
    {
        private var _Str_9619:Map;
        private var _Str_8840:Map;


        public function get _Str_26124():Map
        {
            return this._Str_9619;
        }

        public function get _Str_26404():Map
        {
            return this._Str_8840;
        }

        public function flush():Boolean
        {
            if (this._Str_9619 != null)
            {
                this._Str_9619.dispose();
            }
            this._Str_9619 = null;
            if (this._Str_8840 != null)
            {
                this._Str_8840.dispose();
            }
            this._Str_8840 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:int;
            var _local_5:int;
            this._Str_9619 = new Map();
            this._Str_8840 = new Map();
            _local_5 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_5)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._Str_9619.add(_local_2, _local_3);
                _local_4++;
            }
            _local_5 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_5)
            {
                _local_2 = k.readInteger();
                _local_3 = k.readString();
                this._Str_8840.add(_local_2, _local_3);
                _local_4++;
            }
            return true;
        }
    }
}
