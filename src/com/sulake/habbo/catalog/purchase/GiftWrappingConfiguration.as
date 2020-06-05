package com.sulake.habbo.catalog.purchase
{
    import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;

    public class GiftWrappingConfiguration 
    {
        private var _isEnabled:Boolean = false;
        private var _price:int;
        private var _stuffTypes:Array;
        private var _boxTypes:Array;
        private var _ribbonTypes:Array;
        private var _defaultStuffTypes:Array;

        public function GiftWrappingConfiguration(k:GiftWrappingConfigurationEvent)
        {
            if (k == null)
            {
                return;
            }
            var _local_2:GiftWrappingConfigurationParser = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            this._isEnabled = _local_2.isWrappingEnabled;
            this._price = _local_2.wrappingPrice;
            this._stuffTypes = _local_2.stuffTypes;
            this._boxTypes = _local_2.boxTypes;
            this._ribbonTypes = _local_2.ribbonTypes;
            this._defaultStuffTypes = _local_2.defaultStuffTypes;
        }

        public function get isEnabled():Boolean
        {
            return this._isEnabled;
        }

        public function get price():int
        {
            return this._price;
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
    }
}
