package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;

    public class SearchResultContainer
    {
        private var _searchCodeOriginal:String;
        private var _Str_8699:String;
        private var _Str_13083:SearchResultSet;

        public function SearchResultContainer(k:SearchResultSet)
        {
            this._searchCodeOriginal = k._Str_4569;
            this._Str_8699 = k._Str_5610;
            this._Str_13083 = k;
        }

        public function get _Str_4569():String
        {
            return this._searchCodeOriginal;
        }

        public function get _Str_5610():String
        {
            return this._Str_8699;
        }

        public function get _Str_11413():SearchResultSet
        {
            return this._Str_13083;
        }

        public function _Str_6684(k:int):GuestRoomData
        {
            if (this._Str_13083 != null)
            {
                return this._Str_13083._Str_6684(k);
            }
            return null;
        }
    }
}
