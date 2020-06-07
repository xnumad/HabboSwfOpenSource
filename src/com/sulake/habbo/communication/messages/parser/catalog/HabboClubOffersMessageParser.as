package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboClubOffersMessageParser implements IMessageParser
    {
        private var _offers:Array;
        private var _source:int;


        public function flush():Boolean
        {
            this._offers = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._offers = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._offers.push(new ClubOfferData(k));
                _local_3++;
            }
            this._source = k.readInteger();
            return true;
        }

        public function get offers():Array
        {
            return this._offers;
        }

        public function get source():int
        {
            return this._source;
        }
    }
}
