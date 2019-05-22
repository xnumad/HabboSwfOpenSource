package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5178;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7459 implements IMessageParser 
    {
        private var _Str_10647:int;
        private var _Str_5369:int;
        private var _offers:Array;
        private var _Str_5759:Map;


        public function flush():Boolean
        {
            if (this._Str_5759)
            {
                this._Str_5759.dispose();
                this._Str_5759 = null;
            }
            this._offers = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:_Str_5178;
            this._Str_10647 = k.readInteger();
            this._Str_5369 = k.readInteger();
            this._offers = new Array();
            var _local_2:int = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._offers.push(new CatalogPageMessageOfferData(k));
                _local_3++;
            }
            this._Str_5759 = new Map();
            _local_2 = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new _Str_5178(k);
                this._Str_5759.add(_local_4.offerId, _local_4);
                _local_3++;
            }
            return true;
        }

        public function get _Str_12860():int
        {
            return this._Str_10647;
        }

        public function get _Str_7574():int
        {
            return this._Str_5369;
        }

        public function get offers():Array
        {
            return this._offers;
        }

        public function get _Str_24398():Map
        {
            return this._Str_5759;
        }
    }
}
