package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorRoomInfoMessageComposer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.incoming.moderation.RoomData;
    import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.moderator.ModeratorActionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.moderator.ModerateRoomMessageComposer;
    import com.sulake.habbo.window.utils.IAlertDialog;

    public class RoomToolCtrl implements IDisposable, ITrackedWindow 
    {
        private var _main:ModerationManager;
        private var _flatId:int;
        private var _data:RoomModerationData;
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

        public static function getLowestPoint(k:IWindowContainer):int
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

        public static function moveChildrenToColumn(k:IWindowContainer, _arg_2:int, _arg_3:int):void
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
            this._main.moderationMessageHandler.addRoomInfoListener(this);
            this._main.connection.send(new GetModeratorRoomInfoMessageComposer(this._flatId));
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

        public function getFrame():IFrameWindow
        {
            return this._frame;
        }

        private function onClose(k:WindowEvent, _arg_2:IWindow):void
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
            this._main.moderationMessageHandler.removeRoomEnterListener(this);
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

        public function onRoomChange():void
        {
            this.setSendButtonState("send_caution_but");
            this.setSendButtonState("send_message_but");
        }

        private function setSendButtonState(k:String):void
        {
            var _local_2:Boolean = ((!(this._data == null)) && (this._data.flatId == this._main.currentFlatId));
            var _local_3:IButtonWindow = IButtonWindow(this._frame.findChildByName(k));
            if (((_local_2) && (this._main.initMsg._Str_24851)))
            {
                _local_3.enable();
            }
            else
            {
                _local_3.disable();
            }
        }

        public function onRoomInfo(k:RoomModerationData):void
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
            this._main.moderationMessageHandler.removeRoomInfoListener(this);
            this._frame.visible = true;
            this._main.moderationMessageHandler.addRoomEnterListener(this);
        }

        public function populate():void
        {
            this._list = IItemListWindow(this._frame.findChildByName("list_cont"));
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this.onClose;
            this._msgInput = ITextFieldWindow(this._frame.findChildByName("message_input"));
            this._msgInput.procedure = this.onInputClick;
            this._msgSelect = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
            this.prepareMsgSelect(this._msgSelect);
            this._msgSelect.procedure = this.onSelectTemplate;
            this._kickCb = ICheckBoxWindow(this._frame.findChildByName("kick_check"));
            this._lockCb = ICheckBoxWindow(this._frame.findChildByName("lock_check"));
            this._changeNameCb = ICheckBoxWindow(this._frame.findChildByName("changename_check"));
            this.refreshRoomData(this._data.room, "room_cont");
            this.setTxt("owner_name_txt", this._data.ownerName);
            this.setTxt("owner_in_room_txt", ((this._data.ownerInRoom) ? "Yes" : "No"));
            this.setTxt("user_count_txt", ("" + this._data.userCount));
            this._frame.findChildByName("enter_room_but").procedure = this.onEnterRoom;
            this._frame.findChildByName("chatlog_but").procedure = this.onChatlog;
            this._frame.findChildByName("edit_in_hk_but").procedure = this.onEditInHk;
            this._frame.findChildByName("send_caution_but").procedure = this.onSendCaution;
            this._frame.findChildByName("send_message_but").procedure = this.onSendMessage;
            if (!this._main.initMsg._Str_12765)
            {
                this._frame.findChildByName("chatlog_but").disable();
            }
            if (!this._main.initMsg._Str_24333)
            {
                this._kickCb.disable();
            }
            this._frame.findChildByName("owner_name_txt").procedure = this.onOwnerName;
            this.onRoomChange();
        }

        private function disposeItemFromList(k:IItemListWindow, _arg_2:IWindow):void
        {
            var _local_3:IWindow = k.removeListItem(_arg_2);
            if (_local_3 != null)
            {
                _local_3.dispose();
            }
        }

        private function refreshRoomData(k:RoomData, _arg_2:String):void
        {
            var _local_3:IWindowContainer = IWindowContainer(this._list.getListItemByName(_arg_2));
            var _local_4:IWindowContainer = IWindowContainer(_local_3.findChildByName("room_data"));
            if (_local_4 == null)
            {
                _local_4 = (_local_3.addChild(this._roomDataPrototype.clone()) as IWindowContainer);
            }
            if (!k.exists)
            {
                this.disposeItemFromList(this._list, _local_3);
                this.disposeItemFromList(this._list, this._list.getListItemByName("event_spacing"));
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
            _local_8.caption = this.getTagsAsString(k.tags);
            _local_8.height = (_local_8.textHeight + 5);
            _local_7.height = _local_8.height;
            if (k.tags.length < 1)
            {
                _local_4.removeChild(_local_7);
            }
            moveChildrenToColumn(_local_4, _local_5.y, 0);
            _local_4.height = getLowestPoint(_local_4);
            _local_3.height = (_local_4.height + (2 * _local_4.y));
            Logger.log(((((((((((("XXXX: " + _local_3.height) + ", ") + _local_4.height) + ", ") + _local_5.height) + ", ") + _local_6.height) + ", ") + _local_7.height) + ", ") + _local_8.height));
        }

        private function getTagsAsString(k:Array):String
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

        private function setTxt(k:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = ITextWindow(this._frame.findChildByName(k));
            _local_3.text = _arg_2;
        }

        private function onOwnerName(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new UserInfoFrameCtrl(this._main, this._data.ownerId), this._frame, false, false, true);
        }

        private function onEnterRoom(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Enter room clicked");
            this._main.goToRoom(this._data.flatId);
        }

        private function onChatlog(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._main.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(0, this._data.flatId), this._main, WindowTracker._Str_10414, this._data.flatId), this._frame, false, false, true);
        }

        private function onEditInHk(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Edit in hk clicked");
            this._main.openHkPage("roomadmin.url", ("" + this._data.flatId));
        }

        private function onSendCaution(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Sending caution...");
            this.act(true);
        }

        private function onSendMessage(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Sending message...");
            this.act(false);
        }

        private function act(k:Boolean):void
        {
            if (((this._includeInfo) || (this._msgInput.text == "")))
            {
                this._main.windowManager.alert("Alert", "You must input a message to the user", 0, this.onAlertClose);
                return;
            }
            var _local_2:int = this.determineAction(k, this._kickCb.Selected);
            this._main.connection.send(new ModeratorActionMessageComposer(_local_2, this._msgInput.text, ""));
            if ((((this._lockCb.Selected) || (this._changeNameCb.Selected)) || (this._kickCb.Selected)))
            {
                this._main.connection.send(new ModerateRoomMessageComposer(this._data.flatId, this._lockCb.Selected, this._changeNameCb.Selected, this._kickCb.Selected));
            }
            this.dispose();
        }

        private function determineAction(k:Boolean, _arg_2:Boolean):int
        {
            if (_arg_2)
            {
                return (k) ? ModeratorActionMessageComposer.ACTION_KICK : ModeratorActionMessageComposer.ACTION_MESSAGE_AND_SOFT_KICK;
            }
            return (k) ? ModeratorActionMessageComposer.ACTION_ALERT : ModeratorActionMessageComposer.ACTION_MESSAGE;
        }

        private function onInputClick(k:WindowEvent, _arg_2:IWindow):void
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

        private function onAlertClose(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function prepareMsgSelect(k:IDropMenuWindow):void
        {
            Logger.log(("MSG TEMPLATES: " + this._main.initMsg._Str_18336.length));
            k.populate(this._main.initMsg._Str_18336);
        }

        private function onSelectTemplate(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_SELECTED)
            {
                return;
            }
            var _local_3:String = this._main.initMsg._Str_18336[this._msgSelect.selection];
            if (_local_3 != null)
            {
                this._includeInfo = false;
                this._msgInput.text = _local_3;
            }
        }
    }
}
