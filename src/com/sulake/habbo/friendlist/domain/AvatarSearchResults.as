package com.sulake.habbo.friendlist.domain
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3696;

    public class AvatarSearchResults 
    {
        private var _deps:_Str_8493;
        private var _friends:Array;
        private var _others:Array;
        private var _sentRequests:Dictionary;

        public function AvatarSearchResults(k:_Str_8493)
        {
            this._sentRequests = new Dictionary();
            super();
            this._deps = k;
        }

        public function _Str_21135(k:int):_Str_3696
        {
            var _local_2:_Str_3696;
            var _local_3:_Str_3696;
            for each (_local_2 in this._friends)
            {
                if (_local_2._Str_3251 == k)
                {
                    return _local_2;
                }
            }
            for each (_local_3 in this._others)
            {
                if (_local_3._Str_3251 == k)
                {
                    return _local_3;
                }
            }
            return null;
        }

        public function _Str_22668(k:Array, _arg_2:Array):void
        {
            this._friends = k;
            this._others = _arg_2;
            this._deps.view._Str_3836();
        }

        public function get friends():Array
        {
            return this._friends;
        }

        public function get others():Array
        {
            return this._others;
        }

        public function _Str_25695(k:int):void
        {
            this._sentRequests[k] = "yes";
        }

        public function isRequestFriend(k:int):Boolean
        {
            return !(this._sentRequests[k] == null);
        }
    }
}
