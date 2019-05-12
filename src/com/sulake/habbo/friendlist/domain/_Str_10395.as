package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;
    import com.sulake.habbo.friendlist._Str_2777;
    import com.sulake.habbo.friendlist._Str_7814;

    public class _Str_10395 implements _Str_8493 
    {
        private var _habboFriendList:HabboFriendList;

        public function _Str_10395(k:HabboFriendList)
        {
            this._habboFriendList = k;
        }

        public function get view():_Str_7814
        {
            return this._habboFriendList.tabs._Str_4403(_Str_2777._Str_5722)._Str_4621 as _Str_7814;
        }
    }
}
