package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_5709;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_12129;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_3169;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7731;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_5691;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_12412;
    import com.sulake.habbo.window.utils._Str_2418;

    public class RoomToolCtrl implements IDisposable, ITrackedWindow 
    {
        private var _main:ModerationManager;
        private var _flatId:int;
        private var _data:_Str_5709;
        private var _frame:IFrameWindow;
        private var _list:IItemListWindow;
        private var _disposed:Boolean;
        private var _msgSelect:IDropMenuWindow;
        private var _msgInput:ITextFieldWindow;
        private var _includeInfo:Boolean = true;
        private var _kickCb:ICheckBoxWindow;
        private var _lockCb:ICheckBoxWindow;
        private var _changeNameCb:ICheckBoxWindow;
        private var _roomDataPrototype:IWindowContainer;

        public function RoomToolCtrl(k:ModerationManager, _arg_2:int)
        {
            this._main = k;
            this._flatId = _arg_2;
        }

        public static function _Str_2647(k:IWindowContainer):int
        {
            var _local_4:IWindow;
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.numChildren)
            {
                _local_4 = k.getChildAt(_local_3);
                if (_local_4.visible)
                {
                    _local_2 = Math.max(_local_2, (_local_4.y + _local_4.height));
                }
                _local_3++;
            }
            return _local_2;
        }

        public static function _Str_4679(k:IWindowContainer, _arg_2:int, _arg_3:int):void
        {
            var _local_5:IWindow;
            var _local_4:int;
            while (_local_4 < k.numChildren)
            {
                _local_5 = k.getChildAt(_local_4);
                if ((((!(_local_5 == null)) && (_local_5.visible)) && (_local_5.height > 0)))
                {
                    _local_5.y = _arg_2;
                    _arg_2 = (_arg_2 + (_local_5.height + _arg_3));
                }
                _local_4++;
            }
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            this._frame = IFrameWindow(this._main.getXmlWindow("roomtool_frame"));
            var k:IItemListWindow = (this._frame.findChildByName("list_cont") as IItemListWindow);
            var _local_2:IWindowContainer = (k.getListItemByName("room_cont") as IWindowContainer);
            this._roomDataPrototype = (_local_2.findChildByName("room_data") as IWindowContainer);
            _local_2.removeChild(this._roomDataPrototype);
            this._main.moderationMessageHandler._Str_25444(this);
            this._main.connection.send(new _Str_12129(this._flatId));
            Logger.log(("BEGINNING TO SHOW: " + this._flatId));
        }

        public function getType():int
        {
            return WindowTracker._Str_16350;
        }

        public function getId():String
        {
            return "" + this._flatId;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame;
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.dispose();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._main.moderationMessageHandler._Str_14234(this);
            if (this._frame != null)
            {
                this._frame.destroy();
                this._frame = null;
            }
            if (this._data != null)
            {
                this._data.dispose();
                this._data = null;
            }
            this._main = null;
            this._list = null;
            this._msgSelect = null;
            this._msgInput = null;
            this._kickCb = null;
            this._lockCb = null;
            this._changeNameCb = null;
        }

        public function _Str_17211():void
        {
            this._Str_20264("send_caution_but");
            this._Str_20264("send_message_but");
        }

        private function _Str_20264(k:String):void
        {
            var _local_2:Boolean = ((!(this._data == null)) && (this._data.flatId == this._main._Str_14758));
            var _local_3:IButtonWindow = IButtonWindow(this._frame.findChildByName(k));
            if (((_local_2) && (this._main._Str_3325._Str_24851)))
            {
                _local_3.enable();
            }
            else
            {
                _local_3.disable();
            }
        }

        public function _Str_4428(k:_Str_5709):void
        {
            if (this._disposed)
            {
                return;
            }
            Logger.log(((("GOT ROOM INFO: " + k.flatId) + ", ") + this._flatId));
            if (k.flatId != this._flatId)
            {
                Logger.log(((("NOT THE SAME FLAT: " + k.flatId) + ", ") + this._flatId));
                return;
            }
            this._data = k;
            this.populate();
            this._main.moderationMessageHandler._Str_22435(this);
            this._frame.visible = true;
            this._main.moderationMessageHandler._Str_22442(this);
        }

        public function populate():void
        {
            this._list = IItemListWindow(this._frame.findChildByName("list_cont"));
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this._Str_2392;
            this._msgInput = ITextFieldWindow(this._frame.findChildByName("message_input"));
            this._msgInput.procedure = this._Str_12396;
            this._msgSelect = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
            this._Str_23705(this._msgSelect);
            this._msgSelect.procedure = this._Str_19008;
            this._kickCb = ICheckBoxWindow(this._frame.findChildByName("kick_check"));
            this._lockCb = ICheckBoxWindow(this._frame.findChildByName("lock_check"));
            this._changeNameCb = ICheckBoxWindow(this._frame.findChildByName("changename_check"));
            this._Str_23414(this._data.room, "room_cont");
            this._Str_4044("owner_name_txt", this._data.ownerName);
            this._Str_4044("owner_in_room_txt", ((this._data._Str_24479) ? "Yes" : "No"));
            this._Str_4044("user_count_txt", ("" + this._data.userCount));
            this._frame.findChildByName("enter_room_but").procedure = this._Str_22364;
            this._frame.findChildByName("chatlog_but").procedure = this._Str_6773;
            this._frame.findChildByName("edit_in_hk_but").procedure = this._Str_24149;
            this._frame.findChildByName("send_caution_but").procedure = this._Str_23752;
            this._frame.findChildByName("send_message_but").procedure = this._Str_24627;
            if (!this._main._Str_3325._Str_12765)
            {
                this._frame.findChildByName("chatlog_but").disable();
            }
            if (!this._main._Str_3325._Str_24333)
            {
                this._kickCb.disable();
            }
            this._frame.findChildByName("owner_name_txt").procedure = this._Str_10211;
            this._Str_17211();
        }

        private function _Str_20408(k:IItemListWindow, _arg_2:IWindow):void
        {
            var _local_3:IWindow = k.removeListItem(_arg_2);
            if (_local_3 != null)
            {
                _local_3.dispose();
            }
        }

        private function _Str_23414(k:_Str_3169, _arg_2:String):void
        {
            var _local_3:IWindowContainer = IWindowContainer(this._list.getListItemByName(_arg_2));
            var _local_4:IWindowContainer = IWindowContainer(_local_3.findChildByName("room_data"));
            if (_local_4 == null)
            {
                _local_4 = (_local_3.addChild(this._roomDataPrototype.clone()) as IWindowContainer);
            }
            if (!k._Str_2811)
            {
                this._Str_20408(this._list, _local_3);
                this._Str_20408(this._list, this._list.getListItemByName("event_spacing"));
                //return;
            }
            var _local_5:ITextWindow = ITextWindow(_local_4.findChildByName("name"));
            _local_5.caption = k.name;
            _local_5.height = (_local_5.textHeight + 5);
            var _local_6:ITextWindow = ITextWindow(_local_4.findChildByName("desc"));
            _local_6.caption = k.desc;
            _local_6.height = (_local_6.textHeight + 5);
            var _local_7:IWindowContainer = IWindowContainer(_local_4.findChildByName("tags_cont"));
            var _local_8:ITextWindow = ITextWindow(_local_7.findChildByName("tags_txt"));
            _local_8.caption = this._Str_25247(k.tags);
            _local_8.height = (_local_8.textHeight + 5);
            _local_7.height = _local_8.height;
            if (k.tags.length < 1)
            {
                _local_4.removeChild(_local_7);
            }
            _Str_4679(_local_4, _local_5.y, 0);
            _local_4.height = _Str_2647(_local_4);
            _local_3.height = (_local_4.height + (2 * _local_4.y));
            Logger.log(((((((((((("XXXX: " + _local_3.height) + ", ") + _local_4.height) + ", ") + _local_5.height) + ", ") + _local_6.height) + ", ") + _local_7.height) + ", ") + _local_8.height));
        }

        private function _Str_25247(k:Array):String
        {
            var _local_3:String;
            var _local_2:String = "";
            for each (_local_3 in k)
            {
                if (_local_2 == "")
                {
                    _local_2 = _local_3;
                }
                else
                {
                    _local_2 = ((_local_2 + ", ") + _local_3);
                }
            }
            return _local_2;
        }

        private function _Str_4044(k:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = ITextWindow(this._frame.findChildByName(k));
            _local_3.text = _arg_2;
        }

        private function _Str_10211(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new UserInfoFrameCtrl(this._main, this._data.ownerId), this._frame, false, false, true);
        }

        private function _Str_22364(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Enter room clicked");
            this._main.goToRoom(this._data.flatId);
        }

        private function _Str_6773(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new ChatlogCtrl(new _Str_7731(0, this._data.flatId), this._main, WindowTracker._Str_10414, this._data.flatId), this._frame, false, false, true);
        }

        private function _Str_24149(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Edit in hk clicked");
            this._main._Str_14414("roomadmin.url", ("" + this._data.flatId));
        }

        private function _Str_23752(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Sending caution...");
            this._Str_20346(true);
        }

        private function _Str_24627(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Sending message...");
            this._Str_20346(false);
        }

        private function _Str_20346(k:Boolean):void
        {
            if (((this._includeInfo) || (this._msgInput.text == "")))
            {
                this._main.windowManager.alert("Alert", "You must input a message to the user", 0, this._Str_3168);
                return;
            }
            var _local_2:int = this._Str_25499(k, this._kickCb._Str_2365);
            this._main.connection.send(new _Str_5691(_local_2, this._msgInput.text, ""));
            if ((((this._lockCb._Str_2365) || (this._changeNameCb._Str_2365)) || (this._kickCb._Str_2365)))
            {
                this._main.connection.send(new _Str_12412(this._data.flatId, this._lockCb._Str_2365, this._changeNameCb._Str_2365, this._kickCb._Str_2365));
            }
            this.dispose();
        }

        private function _Str_25499(k:Boolean, _arg_2:Boolean):int
        {
            if (_arg_2)
            {
                return (k) ? _Str_5691._Str_17489 : _Str_5691._Str_16816;
            }
            return (k) ? _Str_5691._Str_18408 : _Str_5691._Str_18637;
        }

        private function _Str_12396(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_FOCUSED)
            {
                return;
            }
            if (!this._includeInfo)
            {
                return;
            }
            this._msgInput.text = "";
            this._includeInfo = false;
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_23705(k:IDropMenuWindow):void
        {
            Logger.log(("MSG TEMPLATES: " + this._main._Str_3325._Str_18336.length));
            k.populate(this._main._Str_3325._Str_18336);
        }

        private function _Str_19008(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_SELECTED)
            {
                return;
            }
            var _local_3:String = this._main._Str_3325._Str_18336[this._msgSelect.selection];
            if (_local_3 != null)
            {
                this._includeInfo = false;
                this._msgInput.text = _local_3;
            }
        }
    }
}
