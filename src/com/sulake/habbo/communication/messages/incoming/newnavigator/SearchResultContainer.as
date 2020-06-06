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
            this._searchCodeOriginal = k._Str_4569;
            this._filteringData = k._Str_5610;
            this._resultSet = k;
        }

        public function get _Str_4569():String
        {
            return this._searchCodeOriginal;
        }

        public function get _Str_5610():String
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
