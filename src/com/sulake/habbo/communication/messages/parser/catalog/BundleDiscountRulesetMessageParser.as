package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_4615;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BundleDiscountRulesetMessageParser implements IMessageParser
    {
        private var _bundleDiscountRuleset:_Str_4615;


        public function get bundleDiscountRuleset():_Str_4615
        {
            return this._bundleDiscountRuleset;
        }

        public function flush():Boolean
        {
            this._bundleDiscountRuleset = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._bundleDiscountRuleset = new _Str_4615(k);
            return true;
        }
    }
}
