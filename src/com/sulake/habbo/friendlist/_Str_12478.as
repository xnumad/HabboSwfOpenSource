package com.sulake.habbo.friendlist
{
    import com.sulake.habbo.friendlist.domain.Friend;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.RemoveFriendMessageComposer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class _Str_12478 extends AlertView 
    {
        private var _Str_1007:Array;

        public function _Str_12478(k:HabboFriendList)
        {
            super(k, "friend_remove_confirm");
            this._Str_1007 = k.categories._Str_8217();
        }

        override public function dispose():void
        {
            this._Str_1007 = null;
            super.dispose();
        }

        override internal function setupContent(k:IWindowContainer):void
        {
            var _local_3:Friend;
            var _local_4:String;
            var _local_5:Dictionary;
            k.findChildByName("cancel").procedure = _Str_2392;
            k.findChildByName("ok").procedure = this._Str_22491;
            var _local_2:Array = new Array();
            for each (_local_3 in this._Str_1007)
            {
                _local_2.push(_local_3.name);
            }
            _local_4 = Util.arrayToString(_local_2);
            _local_5 = new Dictionary();
            friendList.registerParameter("friendlist.removefriendconfirm.userlist", "user_names", _local_4);
        }

        private function _Str_22491(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:Friend;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Remove Ok clicked");
            var _local_3:RemoveFriendMessageComposer = new RemoveFriendMessageComposer();
            for each (_local_4 in this._Str_1007)
            {
                _local_3.addRemovedFriend(_local_4.id);
            }
            friendList.send(_local_3);
            this.dispose();
        }
    }
}
