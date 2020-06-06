package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;

    public class SearchResultContainer
    {
        private var _searchCodeOriginal:String;
        private var _filteringData:String;
        private var _resultSet:SearchResultSet;

        public function SearchResultContainer(k:SearchResultSet)
        {
            this._searchCodeOriginal = k.searchCodeOriginal;
            this._filteringData = k.filteringData;
            this._resultSet = k;
        }

        public function get searchCodeOriginal():String
        {
            return this._searchCodeOriginal;
        }

        public function get filteringData():String
        {
            return this._filteringData;
        }

        public function get _Str_11413():SearchResultSet
        {
            return this._resultSet;
        }

        public function _Str_6684(k:int):GuestRoomData
        {
            if (this._resultSet != null)
            {
                return this._resultSet._Str_6684(k);
            }
            return null;
        }
    }
}
