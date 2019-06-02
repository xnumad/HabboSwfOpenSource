package com.sulake.habbo.friendlist
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.ui.Keyboard;
    import com.sulake.habbo.friendlist.domain.Friend;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.SendRoomInviteMessageComposer;

    public class _Str_11876 extends AlertView 
    {
        private var _Str_1007:Array;
        private var _Str_8618:ITextFieldWindow;

        public function _Str_11876(k:HabboFriendList)
        {
            super(k, "room_invite_confirm");
            this._Str_1007 = k.categories._Str_8217();
        }

        override public function dispose():void
        {
            this._Str_1007 = null;
            this._Str_8618 = null;
            super.dispose();
        }

        override internal function setupContent(k:IWindowContainer):void
        {
            friendList.registerParameter("friendlist.invite.summary", "count", ("" + this._Str_1007.length));
            this._Str_8618 = ITextFieldWindow(k.findChildByName("message_input"));
            this._Str_8618.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_23962);
            k.findChildByName("cancel").procedure = _Str_2392;
            k.findChildByName("ok").procedure = this._Str_23191;
        }

        private function _Str_23191(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Invite Ok clicked");
            this._Str_21622();
            this.dispose();
        }

        private function _Str_23962(k:WindowKeyboardEvent):void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_2:IWindow = IWindow(k.target);
            Logger.log(((((("Test key event " + k) + ", ") + k.type) + " ") + _local_2.name));
            if (k.charCode == Keyboard.ENTER)
            {
                this._Str_21622();
            }
            else
            {
                _local_3 = 120;
                _local_4 = this._Str_8618.text;
                if (_local_4.length > _local_3)
                {
                    this._Str_8618.text = _local_4.substring(0, _local_3);
                }
            }
        }

        private function _Str_21622():void
        {
            var _local_3:Friend;
            var k:String = this._Str_8618.text;
            Logger.log(("Send msg: " + k));
            if (k == "")
            {
                friendList.simpleAlert("${friendlist.invite.emptyalert.title}", "${friendlist.invite.emptyalert.text}");
                return;
            }
            var _local_2:SendRoomInviteMessageComposer = new SendRoomInviteMessageComposer(k);
            for each (_local_3 in this._Str_1007)
            {
                _local_2.addInvitedFriend(_local_3.id);
            }
            friendList.resetLastRoomInvitationTime();
            friendList.send(_local_2);
            this.dispose();
        }
    }
}
