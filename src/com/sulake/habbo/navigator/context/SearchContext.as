package com.sulake.habbo.navigator.context
{
    public class SearchContext 
    {
        private var _searchCode:String;
        private var _filtering:String;

        public function SearchContext(k:String, _arg_2:String)
        {
            this._searchCode = k;
            this._filtering = _arg_2;
        }

        public function get searchCode():String
        {
            return this._searchCode;
        }

        public function get filtering():String
        {
            return this._filtering;
        }

        public function toString():String
        {
            return (this._searchCode + " : ") + this._filtering;
        }
    }
}
