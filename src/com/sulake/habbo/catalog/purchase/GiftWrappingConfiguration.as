package com.sulake.habbo.catalog.purchase
{
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7223;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_7597;

    public class GiftWrappingConfiguration 
    {
        private var _isEnabled:Boolean = false;
        private var _price:int;
        private var _stuffTypes:Array;
        private var _boxTypes:Array;
        private var _ribbonTypes:Array;
        private var _defaultStuffTypes:Array;

        public function GiftWrappingConfiguration(k:_Str_7597)
        {
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_7223 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            this._isEnabled = _local_2._Str_25735;
            this._price = _local_2._Str_23413;
            this._stuffTypes = _local_2._Str_17761;
            this._boxTypes = _local_2._Str_17162;
            this._ribbonTypes = _local_2._Str_17780;
            this._defaultStuffTypes = _local_2._Str_11034;
        }

        public function get _Str_5065():Boolean
        {
            return this._isEnabled;
        }

        public function get price():int
        {
            return this._price;
        }

        public function get _Str_17761():Array
        {
            return this._stuffTypes;
        }

        public function get _Str_17162():Array
        {
            return this._boxTypes;
        }

        public function get _Str_17780():Array
        {
            return this._ribbonTypes;
        }

        public function get _Str_11034():Array
        {
            return this._defaultStuffTypes;
        }
    }
}
