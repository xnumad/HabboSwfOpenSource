package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultSet;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9643 implements IMessageParser 
    {
        private var _Str_16531:SearchResultSet;


        public function flush():Boolean
        {
            this._Str_16531 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16531 = new SearchResultSet(k);
            return true;
        }

        public function get _Str_22419():SearchResultSet
        {
            return this._Str_16531;
        }
    }
}
