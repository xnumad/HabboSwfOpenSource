package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist.HabboFriendList;
    import com.sulake.habbo.friendlist._Str_2777;
    import com.sulake.habbo.friendlist._Str_6567;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.notifications.IHabboNotifications;

    public class _Str_10966 implements _Str_9454 
    {
        private var _habboFriendList:HabboFriendList;

        public function _Str_10966(k:HabboFriendList)
        {
            this._habboFriendList = k;
        }

        public function get view():_Str_6567
        {
            return this._habboFriendList.tabs._Str_4403(_Str_2777._Str_4113)._Str_4621 as _Str_6567;
        }

        public function get messenger():IHabboMessenger
        {
            return this._habboFriendList.messenger;
        }

        public function get notifications():IHabboNotifications
        {
            return this._habboFriendList.notifications;
        }
    }
}
