package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import __AS3__.vec.*;

    public class SearchResultSet 
    {
        private var _searchCodeOriginal:String;
        private var _filteringData:String;
        private var _blocks:Vector.<SearchResultList>;

        public function SearchResultSet(k:IMessageDataWrapper, _arg_2:SearchResultList=null)
        {
            var _local_3:int;
            var _local_4:int;
            this._blocks = new Vector.<SearchResultList>(0);
            super();
            if (_arg_2 != null)
            {
                this._searchCodeOriginal = _arg_2.searchCode;
                this._filteringData = _arg_2.text;
                this._blocks.push(_arg_2);
            }
            else
            {
                this._searchCodeOriginal = k.readString();
                this._filteringData = k.readString();
                _local_3 = k.readInteger();
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    this._blocks.push(new SearchResultList(k));
                    _local_4++;
                }
            }
        }

        public function get _Str_4569():String
        {
            return this._searchCodeOriginal;
        }

        public function get _Str_5610():String
        {
            return this._filteringData;
        }

        public function get _Str_7385():Vector.<SearchResultList>
        {
            return this._blocks;
        }

        public function _Str_6684(k:int):_Str_2370
        {
            var _local_2:SearchResultList;
            var _local_3:_Str_2370;
            for each (_local_2 in this._blocks)
            {
                _local_3 = _local_2._Str_6684(k);
                if (_local_3 != null)
                {
                    return _local_3;
                }
            }
            return null;
        }
    }
}
