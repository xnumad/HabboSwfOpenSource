package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GiftWrappingConfigurationParser implements IMessageParser
    {
        private var _wrappingEnabled:Boolean;
        private var _Str_19335:int;
        private var _Str_5208:Array;
        private var _Str_3691:Array;
        private var _Str_4062:Array;
        private var _Str_8259:Array;


        public function get _Str_25735():Boolean
        {
            return this._wrappingEnabled;
        }

        public function get _Str_23413():int
        {
            return this._Str_19335;
        }

        public function get stuffTypes():Array
        {
            return this._Str_5208;
        }

        public function get boxTypes():Array
        {
            return this._Str_3691;
        }

        public function get ribbonTypes():Array
        {
            return this._Str_4062;
        }

        public function get defaultStuffTypes():Array
        {
            return this._Str_8259;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            this._Str_5208 = [];
            this._Str_3691 = [];
            this._Str_4062 = [];
            this._Str_8259 = [];
            this._wrappingEnabled = k.readBoolean();
            this._Str_19335 = k.readInteger();
            var _local_3:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._Str_5208.push(k.readInteger());
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._Str_3691.push(k.readInteger());
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._Str_4062.push(k.readInteger());
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._Str_8259.push(k.readInteger());
                _local_2++;
            }
            return true;
        }
    }
}
