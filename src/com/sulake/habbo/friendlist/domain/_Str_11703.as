package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;

    public class _Str_11703 implements _Str_8679 
    {
        private var _habboFriendList:HabboFriendList;

        public function _Str_11703(k:HabboFriendList)
        {
            this._habboFriendList = k;
        }

        public function _Str_15196():HabboFriendList
        {
            return this._habboFriendList;
        }

        public function _Str_23212():int
        {
            return this._habboFriendList.view.mainWindow.height;
        }
    }
}
