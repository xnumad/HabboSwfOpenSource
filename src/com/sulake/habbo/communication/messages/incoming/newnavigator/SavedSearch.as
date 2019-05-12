package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SavedSearch 
    {
        private var _id:int;
        private var _searchCode:String;
        private var _filter:String;
        private var _localization:String;

        public function SavedSearch(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._searchCode = k.readString();
            this._filter = k.readString();
            this._localization = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get searchCode():String
        {
            return this._searchCode;
        }

        public function get filter():String
        {
            return this._filter;
        }

        public function get localization():String
        {
            return this._localization;
        }
    }
}
