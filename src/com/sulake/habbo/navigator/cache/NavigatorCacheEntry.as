package com.sulake.habbo.navigator.cache
{
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_4173;

    public class NavigatorCacheEntry 
    {
        private var _key:String;
        private var _payload:_Str_4173;
        private var _createdAt:Number;
        private var _expiredAt:Number;

        public function NavigatorCacheEntry(k:String, _arg_2:_Str_4173, _arg_3:Number, _arg_4:Number)
        {
            this._key = k;
            this._payload = _arg_2;
            this._createdAt = _arg_3;
            this._expiredAt = _arg_4;
        }

        public function _Str_19856(k:Number):Boolean
        {
            return k >= this._expiredAt;
        }

        public function get key():String
        {
            return this._key;
        }

        public function get _Str_23130():_Str_4173
        {
            return this._payload;
        }
    }
}
