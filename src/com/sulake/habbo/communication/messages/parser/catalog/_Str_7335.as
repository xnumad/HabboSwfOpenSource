package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.TargetedOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7335 implements IMessageParser 
    {
        private var _data:TargetedOfferData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new TargetedOfferData().parse(k);
            return true;
        }

        public function get data():TargetedOfferData
        {
            return this._data;
        }
    }
}
