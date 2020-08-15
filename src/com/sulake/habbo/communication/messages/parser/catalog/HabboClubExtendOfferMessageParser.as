package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboClubExtendOfferMessageParser implements IMessageParser
    {
        private var _offer:ClubOfferExtendData;


        public function flush():Boolean
        {
            this._offer = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._offer = new ClubOfferExtendData(k);
            return true;
        }

        public function offer():ClubOfferExtendData
        {
            return this._offer;
        }
    }
}
