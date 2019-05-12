package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class TopLevelContext 
    {
        private var _searchCode:String;
        private var _quickLinks:Vector.<SavedSearch>;

        public function TopLevelContext(k:IMessageDataWrapper)
        {
            this._quickLinks = new Vector.<SavedSearch>(0);
            super();
            this._searchCode = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_21438.push(new SavedSearch(k));
                _local_3++;
            }
        }

        public function get searchCode():String
        {
            return this._searchCode;
        }

        public function get _Str_21438():Vector.<SavedSearch>
        {
            return this._quickLinks;
        }
    }
}
