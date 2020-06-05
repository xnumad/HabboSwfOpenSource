package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GiftWrappingConfigurationParser implements IMessageParser
    {
        private var _wrappingEnabled:Boolean;
        private var _wrappingPrice:int;
        private var _stuffTypes:Array;
        private var _boxTypes:Array;
        private var _ribbonTypes:Array;
        private var _defaultStuffTypes:Array;


        public function get isWrappingEnabled():Boolean
        {
            return this._wrappingEnabled;
        }

        public function get wrappingPrice():int
        {
            return this._wrappingPrice;
        }

        public function get stuffTypes():Array
        {
            return this._stuffTypes;
        }

        public function get boxTypes():Array
        {
            return this._boxTypes;
        }

        public function get ribbonTypes():Array
        {
            return this._ribbonTypes;
        }

        public function get defaultStuffTypes():Array
        {
            return this._defaultStuffTypes;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            this._stuffTypes = [];
            this._boxTypes = [];
            this._ribbonTypes = [];
            this._defaultStuffTypes = [];
            this._wrappingEnabled = k.readBoolean();
            this._wrappingPrice = k.readInteger();
            var _local_3:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._stuffTypes.push(k.readInteger());
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._boxTypes.push(k.readInteger());
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._ribbonTypes.push(k.readInteger());
                _local_2++;
            }
            _local_3 = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._defaultStuffTypes.push(k.readInteger());
                _local_2++;
            }
            return true;
        }
    }
}
