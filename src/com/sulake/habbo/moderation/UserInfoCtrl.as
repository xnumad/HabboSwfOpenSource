package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_5467;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7074;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_11910;
    import com.sulake.core.window.events.WindowEvent;

    public class UserInfoCtrl implements IDisposable, IUserInfoListener 
    {
        private static const _Str_12631:int = 60;
        private static const _Str_12954:int = (60 * 60);//3600
        private static const _Str_13366:int = ((60 * 60) * 24);//86400
        private static const _Str_15239:int = (((60 * 60) * 24) * 365);//31536000

        private var _callerFrame:IFrameWindow;
        private var _main:ModerationManager;
        private var _userId:int;
        private var _issue:_Str_2484;
        private var _data:_Str_5467;
        private var _father:IWindowContainer;
        private var _openToolsBelow:Boolean;
        private var _disposed:Boolean;
        private var _issueHandler:IssueHandler;

        public function UserInfoCtrl(k:IFrameWindow, _arg_2:ModerationManager, _arg_3:_Str_2484, _arg_4:IssueHandler=null, _arg_5:Boolean=false)
        {
            this._callerFrame = k;
            this._main = _arg_2;
            this._issue = _arg_3;
            this._openToolsBelow = _arg_5;
            this._issueHandler = _arg_4;
        }

        public static function _Str_12797(k:int):String
        {
            if (k < (2 * _Str_12631))
            {
                return k + " secs ago";
            }
            if (k < (2 * _Str_12954))
            {
                return Math.round((k / _Str_12631)) + " mins ago";
            }
            if (k < (2 * _Str_13366))
            {
                return Math.round((k / _Str_12954)) + " hours ago";
            }
            if (k < (2 * _Str_15239))
            {
                return Math.round((k / _Str_13366)) + " days ago";
            }
            return Math.round((k / _Str_15239)) + " years ago";
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function load(k:IWindowContainer, _arg_2:int):void
        {
            this._father = k;
            this._userId = _arg_2;
            this._data = null;
            this.refresh();
            this._main.moderationMessageHandler._Str_24536(this);
            this._main.connection.send(new _Str_7074(_arg_2));
        }

        public function _Str_3746(k:_Str_5467):void
        {
            if (k.userId != this._userId)
            {
                return;
            }
            this._data = k;
            this.refresh();
        }

        public function refresh():void
        {
            if (this._father.disposed)
            {
                return;
            }
            var k:IWindowContainer = this.prepare();
            if (this._data == null)
            {
                k.findChildByName("fields").visible = false;
                k.findChildByName("loading_txt").visible = true;
                return;
            }
            k.findChildByName("fields").visible = true;
            k.findChildByName("loading_txt").visible = false;
            this._Str_4044(k, "name_txt", this._data.userName);
            this._Str_4044(k, "registered_txt", _Str_12797((this._data._Str_24334 * 60)));
            this._Str_4044(k, "cfh_count_txt", ("" + this._data._Str_24656));
            this._Str_13036(k, "abusive_cfh_count_txt", this._data._Str_22987);
            this._Str_13036(k, "caution_count_txt", this._data._Str_16987);
            this._Str_13036(k, "ban_count_txt", this._data._Str_20373);
            this._Str_13036(k, "trading_lock_count_txt", this._data._Str_24526);
            this._Str_4044(k, "trading_lock_expiry_txt", this._data._Str_23969, "No active lock");
            this._Str_4044(k, "last_login_txt", _Str_12797((this._data._Str_23276 * 60)));
            this._Str_4044(k, "online_txt", ((this._data.online) ? "Yes" : "No"));
            this._Str_4044(k, "last_purchase_txt", this._data._Str_22786, "No purchases");
            this._Str_4044(k, "email_address_txt", this._data._Str_20219, "No email found");
            this._Str_4044(k, "id_bans_txt", ("" + this._data._Str_22700));
            this._Str_4044(k, "user_class_txt", this._data._Str_22262, "-");
            this._Str_4044(k, "last_sanction_time_txt", this._data._Str_24447);
            if (this._data._Str_19137 <= 48)
            {
                (k.findChildByName("last_sanction_time_txt") as ITextWindow).textColor = (((0xFF * (48 - this._data._Str_19137)) / 48) << 16);
            }
            if (this._data._Str_20219 == "No identity")
            {
                k.findChildByName("modaction_but").disable();
            }
            Logger.log(((((("USER: " + this._data.userName) + ", ") + this._data._Str_20373) + ", ") + this._data._Str_16987));
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._main.moderationMessageHandler._Str_22967(this);
            this._callerFrame = null;
            this._main = null;
            this._data = null;
            this._father = null;
        }

        private function prepare():IWindowContainer
        {
            var k:IWindowContainer = IWindowContainer(this._father.findChildByName("user_info"));
            if (k == null)
            {
                k = IWindowContainer(this._main.getXmlWindow("user_info"));
                this._father.addChild(k);
                if (!this._main._Str_3325._Str_12765)
                {
                    k.findChildByName("chatlog_but").disable();
                }
                if (!this._main._Str_3325._Str_18465)
                {
                    k.findChildByName("message_but").disable();
                }
                if (!(((this._main._Str_3325._Str_18465) || (this._main._Str_3325._Str_20397)) || (this._main._Str_3325._Str_21242)))
                {
                    k.findChildByName("modaction_but").disable();
                }
            }
            k.findChildByName("chatlog_but").procedure = this._Str_16926;
            k.findChildByName("roomvisits_but").procedure = this._Str_24240;
            k.findChildByName("habboinfotool_but").procedure = this._Str_24702;
            k.findChildByName("message_but").procedure = this._Str_24767;
            k.findChildByName("modaction_but").procedure = this._Str_25818;
            k.findChildByName("view_caution_count_txt").procedure = this._Str_24733;
            k.findChildByName("view_ban_count_txt").procedure = this._Str_23167;
            k.findChildByName("view_trading_lock_count_txt").procedure = this._Str_24564;
            k.findChildByName("view_id_bans_txt").procedure = this._Str_22795;
            return k;
        }

        private function _Str_13036(k:IWindowContainer, _arg_2:String, _arg_3:int):void
        {
            var _local_4:IWindow = k.findChildByName(_arg_2);
            var _local_5:IWindow = k.findChildByName(("view_" + _arg_2));
            if (_local_5 != null)
            {
                _local_5.visible = (_arg_3 > 0);
            }
            _local_4.caption = ("" + _arg_3);
        }

        private function _Str_4044(k:IWindowContainer, _arg_2:String, _arg_3:String, _arg_4:String=""):void
        {
            var _local_5:IWindow = ITextWindow(k.findChildByName(_arg_2));
            if (((!(_arg_3)) || (_arg_3.length == 0)))
            {
                _local_5.caption = _arg_4;
            }
            else
            {
                _local_5.caption = _arg_3;
            }
        }

        private function _Str_16926(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("chatLog");
            this._main.windowTracker.show(new ChatlogCtrl(new _Str_11910(this._data.userId), this._main, WindowTracker._Str_15435, this._data.userId), this._callerFrame, this._openToolsBelow, false, true);
        }

        private function _Str_24240(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new RoomVisitsCtrl(this._main, this._data.userId), this._callerFrame, this._openToolsBelow, false, true);
        }

        private function _Str_24702(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("openInfoTool");
            this._main._Str_14414("habboinfotool.url", this._data.userName);
        }

        private function _Str_24767(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("openSendMessage");
            this._main.windowTracker.show(new SendMsgsCtrl(this._main, this._data.userId, this._data.userName, this._issue), this._callerFrame, this._openToolsBelow, false, true);
        }

        private function _Str_25818(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("openModAction");
            this._main.windowTracker.show(new ModActionCtrl(this._main, this._data.userId, this._data.userName, this._issue, this), this._callerFrame, this._openToolsBelow, false, true);
        }

        private function _Str_24733(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("viewCautions");
            this._Str_17807();
        }

        private function _Str_23167(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("viewBans");
            this._Str_17807();
        }

        private function _Str_24564(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("viewTradingLocks");
            this._Str_17807();
        }

        private function _Str_22795(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("viewIdentityInfo");
            this._Str_25391();
        }

        private function _Str_17807():void
        {
            this._main._Str_14414("moderatoractionlog.url", this._data.userName);
        }

        private function _Str_25391():void
        {
            this._main._Str_14414("identityinformationtool.url", ("" + this._data._Str_25657));
        }

        internal function _Str_8724(k:String, _arg_2:String):void
        {
            if (this._main != null)
            {
                this._main._Str_8724(k, _arg_2);
            }
        }

        internal function _Str_3066(k:String):void
        {
            if (((this._issueHandler == null) || (this._issueHandler.disposed)))
            {
                this._main.trackGoogle(("userInfo_" + k));
            }
            else
            {
                if (this == this._issueHandler._Str_22269)
                {
                    this._issueHandler._Str_3066(("callerUserInfo_" + k));
                }
                else
                {
                    if (this == this._issueHandler._Str_25718)
                    {
                        this._issueHandler._Str_3066(("reportedUserInfo_" + k));
                    }
                    else
                    {
                        this._issueHandler._Str_3066(("userInfo_" + k));
                    }
                }
            }
        }
    }
}
