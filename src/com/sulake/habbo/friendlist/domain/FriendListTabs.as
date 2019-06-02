package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist._Str_2777;
    import com.sulake.habbo.friendlist.FriendsView;
    import com.sulake.habbo.friendlist._Str_11980;
    import com.sulake.habbo.friendlist.SearchView;
    import com.sulake.habbo.friendlist.*;

    public class FriendListTabs 
    {
        private var _deps:_Str_8679;
        private var _tabs:Array;
        private var _lastSelected:_Str_2740;
        private var _tabContentHeight:int = 200;
        private var _lastTabContentHeight:int = 200;
        private var _windowWidth:int = 200;

        public function FriendListTabs(k:_Str_8679)
        {
            this._tabs = new Array();
            super();
            this._deps = k;
            this._tabs.push(new _Str_2740(this._deps._Str_15196(), _Str_2777._Str_4113, new FriendsView(), "${friendlist.friends}", "friends_footer", "hdr_friends"));
            this._tabs.push(new _Str_2740(this._deps._Str_15196(), _Str_2777._Str_3798, new _Str_11980(), "${friendlist.tab.friendrequests}", "friend_requests_footer", "hdr_friend_requests"));
            this._tabs.push(new _Str_2740(this._deps._Str_15196(), _Str_2777._Str_5722, new SearchView(), "${generic.search}", "search_footer", "hdr_search"));
            this._Str_16257(null);
        }

        public function _Str_22082():Array
        {
            return this._tabs;
        }

        public function _Str_4403(k:int):_Str_2740
        {
            var _local_2:_Str_2740;
            for each (_local_2 in this._tabs)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_20836():void
        {
            var k:_Str_2740;
            for each (k in this._tabs)
            {
                k.setSelected(false);
            }
        }

        public function _Str_14015():_Str_2740
        {
            var k:_Str_2740;
            for each (k in this._tabs)
            {
                if (k.selected)
                {
                    return k;
                }
            }
            return null;
        }

        public function _Str_16257(k:_Str_2740):void
        {
            var _local_2:_Str_2740 = this._Str_14015();
            if (_local_2 == null)
            {
                this._tabContentHeight = this._lastTabContentHeight;
                this.setSelected(this._Str_19448(k), true);
            }
            else
            {
                if (((_local_2 == k) || (k == null)))
                {
                    this._lastTabContentHeight = this._tabContentHeight;
                    this._tabContentHeight = 0;
                    this._Str_20836();
                }
                else
                {
                    this.setSelected(this._Str_19448(k), true);
                }
            }
        }

        private function setSelected(k:_Str_2740, _arg_2:Boolean):void
        {
            var _local_3:_Str_2740 = this._Str_14015();
            this._Str_20836();
            k.setSelected(_arg_2);
            if (_arg_2)
            {
                this._lastSelected = k;
            }
        }

        private function _Str_19448(k:_Str_2740):_Str_2740
        {
            if (k != null)
            {
                return k;
            }
            if (this._lastSelected != null)
            {
                return this._lastSelected;
            }
            return this._tabs[0];
        }

        public function get _Str_12266():int
        {
            return this._tabContentHeight;
        }

        public function get _Str_4971():int
        {
            return this._windowWidth;
        }

        public function get _Str_7233():int
        {
            return this._windowWidth - 2;
        }

        public function set _Str_12266(k:int):void
        {
            this._tabContentHeight = k;
        }

        public function set _Str_4971(k:int):void
        {
            this._windowWidth = k;
        }
    }
}
