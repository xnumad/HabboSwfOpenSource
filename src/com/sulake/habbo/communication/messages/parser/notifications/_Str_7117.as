package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7117 implements IMessageParser 
    {
        private var _type:String;
        private var _parameters:Map;


        public function flush():Boolean
        {
            this._type = null;
            this._parameters = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:String;
            var _local_5:String;
            this._type = k.readString();
            this._parameters = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readString();
                _local_5 = k.readString();
                this._parameters.add(_local_4, _local_5);
                _local_3++;
            }
            return true;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get parameters():Map
        {
            return this._parameters;
        }
    }
}
