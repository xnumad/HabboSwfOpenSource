package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.Util;

    public class _Str_9210 
    {
        private var _Str_3339:_Str_8742;
        private var _requests:Array;
        private var _limit:int;
        private var _Str_20540:int;

        public function _Str_9210(k:_Str_8742, _arg_2:int, _arg_3:int)
        {
            this._requests = new Array();
            super();
            this._Str_3339 = k;
            this._limit = _arg_2;
            this._Str_20540 = _arg_3;
        }

        public function _Str_20199(k:Boolean):void
        {
            var _local_3:FriendRequest;
            var _local_4:FriendRequest;
            var _local_2:Array = new Array();
            for each (_local_3 in this._requests)
            {
                if (((!(k)) || (!(_local_3.state == FriendRequest._Str_5035))))
                {
                    _local_2.push(_local_3);
                }
            }
            for each (_local_4 in _local_2)
            {
                Util.remove(this._requests, _local_4);
                if (this._Str_3339.view != null)
                {
                    this._Str_3339.view._Str_7667(_local_4);
                }
                _local_4.dispose();
            }
            this._Str_6988();
        }

        public function _Str_25626(k:int):void
        {
            var _local_2:FriendRequest = this._Str_24640(k);
            if (_local_2 == null)
            {
                Logger.log((("Failed to accept friend request from " + k) + ", error retrieving the friendrequest."));
                return;
            }
            _local_2.state = FriendRequest._Str_15312;
            this._Str_3339.view._Str_6657(_local_2);
        }

        public function _Str_8472(k:FriendRequest):void
        {
            this._requests.push(k);
        }

        public function _Str_24807(k:FriendRequest):void
        {
            this._requests.push(k);
            this._Str_3339.view._Str_8472(k);
        }

        public function _Str_19101(k:int):FriendRequest
        {
            var _local_2:FriendRequest;
            for each (_local_2 in this._requests)
            {
                if (_local_2.requestId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_24640(k:int):FriendRequest
        {
            var _local_2:FriendRequest;
            for each (_local_2 in this._requests)
            {
                if (_local_2.requesterUserId == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_6988():void
        {
            var _local_2:FriendRequest;
            var k:Boolean = true;
            for each (_local_2 in this._requests)
            {
                k = (!(k));
                this._Str_3339.view._Str_6988(_local_2, k);
            }
        }

        public function _Str_19367():int
        {
            var _local_2:FriendRequest;
            var k:int;
            for each (_local_2 in this.requests)
            {
                if (_local_2.state == FriendRequest._Str_5035)
                {
                    k++;
                }
            }
            return k;
        }

        public function get requests():Array
        {
            return this._requests;
        }

        public function get limit():int
        {
            return this._limit;
        }

        public function get _Str_17940():int
        {
            return this._Str_20540;
        }

        public function set limit(k:int):void
        {
            this._limit = k;
        }
    }
}
