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

        public function get resultSet():SearchResultSet
        {
            return this._resultSet;
        }

        public function findGuestRoom(k:int):GuestRoomData
        {
            if (this._resultSet != null)
            {
                return this._resultSet.findGuestRoom(k);
            }
            return null;
        }
    }
}
