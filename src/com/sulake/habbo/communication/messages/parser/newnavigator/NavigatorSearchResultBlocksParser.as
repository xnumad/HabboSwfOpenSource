package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.SearchResultSet;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NavigatorSearchResultBlocksParser implements IMessageParser
    {
        private var _searchResult:SearchResultSet;


        public function flush():Boolean
        {
            this._searchResult = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._searchResult = new SearchResultSet(k);
            return true;
        }

        public function get searchResult():SearchResultSet
        {
            return this._searchResult;
        }
    }
}
