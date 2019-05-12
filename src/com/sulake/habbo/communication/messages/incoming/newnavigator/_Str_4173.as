package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;

    public class _Str_4173 
    {
        private var _Str_8772:String;
        private var _Str_8699:String;
        private var _Str_13083:SearchResultSet;

        public function _Str_4173(k:SearchResultSet)
        {
            this._Str_8772 = k._Str_4569;
            this._Str_8699 = k._Str_5610;
            this._Str_13083 = k;
        }

        public function get _Str_4569():String
        {
            return this._Str_8772;
        }

        public function get _Str_5610():String
        {
            return this._Str_8699;
        }

        public function get _Str_11413():SearchResultSet
        {
            return this._Str_13083;
        }

        public function _Str_6684(k:int):_Str_2370
        {
            if (this._Str_13083 != null)
            {
                return this._Str_13083._Str_6684(k);
            }
            return null;
        }
    }
}
