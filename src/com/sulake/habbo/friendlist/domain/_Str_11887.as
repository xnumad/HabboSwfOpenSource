package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;
    import com.sulake.habbo.friendlist._Str_2777;
    import com.sulake.habbo.friendlist._Str_4097;

    public class _Str_11887 implements _Str_8742 
    {
        private var _habboFriendList:HabboFriendList;

        public function _Str_11887(k:HabboFriendList)
        {
            this._habboFriendList = k;
        }

        public function get view():_Str_4097
        {
            return this._habboFriendList.tabs._Str_4403(_Str_2777._Str_3798)._Str_4621 as _Str_4097;
        }
    }
}
