package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class SearchResultList 
    {
        public static const _Str_20426:int = 0;
        public static const _Str_14200:int = 1;
        public static const _Str_15183:int = 2;

        private var _searchCode:String;
        private var _text:String;
        private var _actionAllowed:int;
        private var _forceClosed:Boolean;
        private var _viewMode:int;
        private var _guestRooms:Vector.<_Str_2370>;

        public function SearchResultList(k:IMessageDataWrapper)
        {
            this._guestRooms = new Vector.<_Str_2370>(0);
            super();
            this._searchCode = k.readString();
            this._text = k.readString();
            this._actionAllowed = k.readInteger();
            this._forceClosed = k.readBoolean();
            this._viewMode = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._guestRooms.push(new _Str_2370(k));
                _local_3++;
            }
        }

        public function get guestRooms():Vector.<_Str_2370>
        {
            return this._guestRooms;
        }

        public function get searchCode():String
        {
            return this._searchCode;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get actionAllowed():int
        {
            return this._actionAllowed;
        }

        public function get _Str_25561():Boolean
        {
            return this._forceClosed;
        }

        public function get viewMode():int
        {
            return this._viewMode;
        }

        public function set viewMode(k:int):void
        {
            this._viewMode = k;
        }

        public function _Str_6684(k:int):_Str_2370
        {
            var _local_2:_Str_2370;
            for each (_local_2 in this._guestRooms)
            {
                if (_local_2.flatId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }
    }
}
