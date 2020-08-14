package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5335;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboClubExtendOfferMessageParser implements IMessageParser
    {
        private var _offer:_Str_5335;


        public function flush():Boolean
        {
            this._offer = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._offer = new _Str_5335(k);
            return true;
        }

        public function offer():_Str_5335
        {
            return this._offer;
        }
    }
}
