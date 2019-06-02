package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2853 
    {
        public static const I:String = "i";
        public static const S:String = "s";
        public static const E:String = "e";
        public static const B:String = "b";

        private var _Str_3032:String;
        private var _Str_20686:int;
        private var _Str_3194:String;
        private var _productCount:int;
        private var _Str_16693:Boolean;
        private var _uniqueLimitedItemSeriesSize:int;
        private var _uniqueLimitedItemsLeft:int;

        public function _Str_2853(k:IMessageDataWrapper)
        {
            this._Str_3032 = k.readString();
            switch (this._Str_3032)
            {
                case B:
                    this._Str_3194 = k.readString();
                    this._productCount = 1;
                    return;
                default:
                    this._Str_20686 = k.readInteger();
                    this._Str_3194 = k.readString();
                    this._productCount = k.readInteger();
                    this._Str_16693 = k.readBoolean();
                    if (this._Str_16693)
                    {
                        this._uniqueLimitedItemSeriesSize = k.readInteger();
                        this._uniqueLimitedItemsLeft = k.readInteger();
                    }
            }
        }

        public function get productType():String
        {
            return this._Str_3032;
        }

        public function get _Str_6164():int
        {
            return this._Str_20686;
        }

        public function get extraParam():String
        {
            return this._Str_3194;
        }

        public function get productCount():int
        {
            return this._productCount;
        }

        public function get _Str_18468():Boolean
        {
            return this._Str_16693;
        }

        public function get uniqueLimitedItemSeriesSize():int
        {
            return this._uniqueLimitedItemSeriesSize;
        }

        public function get uniqueLimitedItemsLeft():int
        {
            return this._uniqueLimitedItemsLeft;
        }
    }
}
