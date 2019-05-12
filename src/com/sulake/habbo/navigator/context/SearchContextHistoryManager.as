package com.sulake.habbo.navigator.context
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import __AS3__.vec.*;

    public class SearchContextHistoryManager 
    {
        private var _contextHistory:Vector.<SearchContext>;
        private var _browsingOffset:int = -1;

        public function SearchContextHistoryManager(k:HabboNewNavigator)
        {
            this._contextHistory = new Vector.<SearchContext>(0);
            super();
        }

        public function _Str_23951(k:SearchContext):int
        {
            if (this._contextHistory.length > (this._browsingOffset + 1))
            {
                this._contextHistory.splice((this._browsingOffset + 1), (this._contextHistory.length - this._browsingOffset));
            }
            this._contextHistory.push(k);
            return ++this._browsingOffset;
        }

        public function _Str_24998():SearchContext
        {
            if (this._Str_22168)
            {
                return this._contextHistory[--this._browsingOffset];
            }
            return null;
        }

        public function _Str_26215():SearchContext
        {
            if (this._Str_24763)
            {
                return this._contextHistory[++this._browsingOffset];
            }
            return null;
        }

        public function get _Str_24763():Boolean
        {
            return (this._browsingOffset + 1) < this._contextHistory.length;
        }

        public function get _Str_22168():Boolean
        {
            return (this._browsingOffset > 0) && (this._contextHistory.length > 0);
        }

        public function toString():String
        {
            var k:String = "history: [";
            var _local_2:int;
            while (_local_2 < this._contextHistory.length)
            {
                k = (k + this._contextHistory[_local_2].toString());
                if (_local_2 < (this._contextHistory.length - 1))
                {
                    k = (k = (k + ","));
                }
                _local_2++;
            }
            k = ((k + "] browsing offset: ") + this._browsingOffset);
            return k;
        }
    }
}
