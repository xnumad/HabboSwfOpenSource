package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.incoming.moderation.ChatRecordData;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_6779;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import com.sulake.core.window.events.WindowEvent;

    public class ChatlogCtrl implements IDisposable, ITrackedWindow, IChatLogListener 
    {
        private static var _Str_8544:Array = [];
        private static var _Str_16618:int = 1000;
        private static const _Str_16391:uint = 4293973667;
        private static const _Str_16679:uint = 4288921072;

        private var _type:int;
        private var _id:int;
        private var _msg:IMessageComposer;
        private var _main:ModerationManager;
        private var _frame:IWindowContainer;
        private var _list:IItemListWindow;
        private var _rooms:Array;
        private var _embedded:Boolean;
        private var _disposed:Boolean;
        private var _contentLinePrototype:IWindowContainer;
        private var _roomHeaderPrototype:IWindowContainer;
        private var _hilitedUserIds:Dictionary;
        private var _resizeTimer:Timer;
        private var _chatLogUserIds:Map;
        private var _issue:_Str_2484;
        private var _contentLines:Array;
        private var _headers:Array;

        public function ChatlogCtrl(k:IMessageComposer, _arg_2:ModerationManager, _arg_3:int, _arg_4:int, _arg_5:_Str_2484=null, _arg_6:IWindowContainer=null, _arg_7:IItemListWindow=null, _arg_8:Boolean=false)
        {
            this._contentLines = [];
            this._headers = [];
            super();
            this._main = _arg_2;
            this._type = _arg_3;
            this._id = _arg_4;
            this._msg = k;
            this._chatLogUserIds = new Map();
            this._issue = _arg_5;
            this._frame = _arg_6;
            this._list = _arg_7;
            this._embedded = _arg_8;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            var _local_3:IWindow;
            var k:IFrameWindow = IFrameWindow(this._main.getXmlWindow("evidence_frame"));
            k.visible = false;
            var _local_2:IItemListWindow = IItemListWindow(k.findChildByName("evidence_list"));
            this._roomHeaderPrototype = (_local_2.getListItemAt(0) as IWindowContainer);
            this._contentLinePrototype = (_local_2.getListItemAt(1) as IWindowContainer);
            _local_2.removeListItems();
            this._resizeTimer = new Timer(1000, 1);
            this._resizeTimer.addEventListener(TimerEvent.TIMER, this._Str_3774);
            if (!this._embedded)
            {
                this._frame = k;
                this._frame.procedure = this._Str_7142;
                this._frame.visible = true;
                _local_3 = this._frame.findChildByTag("close");
                _local_3.procedure = this._Str_2392;
                this._list = _local_2;
            }
            else
            {
                k.dispose();
            }
            this._main.connection.send(this._msg);
            this._main.moderationMessageHandler._Str_20295(this);
        }

        public function hide():void
        {
            this.dispose();
        }

        public function _Str_6773(k:String, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:Dictionary):void
        {
            var _local_6:IWindowContainer;
            if ((((!(_arg_2 == this._type)) || (!(_arg_3 == this._id))) || (this._disposed)))
            {
                return;
            }
            for each (_local_6 in this._contentLines)
            {
                this._Str_21790(_local_6);
            }
            for each (_local_6 in this._headers)
            {
                _local_6.dispose();
            }
            this._contentLines = [];
            this._headers = [];
            this._main.moderationMessageHandler._Str_24755(this);
            this._rooms = _arg_4;
            this._hilitedUserIds = _arg_5;
            this.populate();
            this._Str_3774(null);
            if (!this._embedded)
            {
                this._frame.caption = k;
                this._frame.visible = true;
            }
        }

        public function getType():int
        {
            return this._type;
        }

        public function getId():String
        {
            return "" + this._id;
        }

        public function _Str_25842(k:int):void
        {
            this._id = k;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame as IFrameWindow;
        }

        private function populate():void
        {
            var k:ChatRecordData;
            this._list.autoArrangeItems = false;
            this._list.removeListItems();
            for each (k in this._rooms)
            {
                this._Str_23244(k);
            }
            this._list.autoArrangeItems = true;
        }

        private function _Str_23244(k:ChatRecordData):void
        {
            var _local_9:String;
            var _local_10:_Str_6779;
            var _local_2:IWindowContainer = this._Str_23187();
            var _local_3:IWindow = _local_2.findChildByName("text");
            var _local_4:IButtonWindow = IButtonWindow(_local_2.findChildByName("btnHeaderAction"));
            var _local_5:IButtonWindow = IButtonWindow(_local_2.findChildByName("btnHeaderAction2"));
            if (_local_5)
            {
                _local_5.visible = false;
            }
            switch (k.recordType)
            {
                case ChatRecordData.TYPE_ROOM_CHAT:
                    if (k.roomId > 0)
                    {
                        _local_4.caption = "Room tool";
                        if (k.roomName == null)
                        {
                            _local_3.caption = ("Room #" + k.roomId);
                        }
                        else
                        {
                            _local_3.caption = ("Room: " + k.roomName);
                        }
                        _local_5.visible = true;
                        _local_5.caption = "View room";
                        new OpenRoomInSpectatorMode(this._main, _local_5, k.roomId);
                        if (this._embedded)
                        {
                            new OpenRoomTool(null, this._main, _local_4, k.roomId);
                        }
                        else
                        {
                            new OpenRoomTool((this._frame as IFrameWindow), this._main, _local_4, k.roomId);
                        }
                    }
                    break;
                case ChatRecordData.TYPE_IM_SESSION:
                    _local_3.caption = "IM session";
                    break;
                case ChatRecordData.TYPE_DISCUSSION_THREAD:
                    _local_3.caption = "Forum thread";
                    _local_5.visible = true;
                    _local_5.caption = "Open thread";
                    new OpenDiscussionThread(this._main, _local_5, k.groupId, k.threadId);
                    _local_4.caption = "Delete";
                    new HideDiscussionThread(this._main, this, _local_4, k.groupId, k.threadId);
                    break;
                case ChatRecordData.TYPE_DISCUSSION_MESSAGE:
                    _local_3.caption = "Forum message";
                    _local_5.visible = true;
                    _local_5.caption = "Open Message";
                    new OpenDiscussionMessage(this._main, _local_5, k.groupId, k.threadId, k.context.messageIndex);
                    _local_4.caption = "Delete";
                    new HideDiscussionMessage(this._main, this, _local_4, k.groupId, k.threadId, k.messageId);
                    break;
                case ChatRecordData._Str_7751:
                    _local_3.caption = "Selfie report";
                    _local_5.visible = true;
                    _local_5.caption = "View selfie";
                    new OpenExternalLink(this._main, _local_5, k.context.url);
                    _local_4.visible = true;
                    _local_4.caption = "Room tool";
                    if (this._embedded)
                    {
                        new OpenRoomTool(null, this._main, _local_4, k.roomId);
                    }
                    else
                    {
                        new OpenRoomTool((this._frame as IFrameWindow), this._main, _local_4, k.roomId);
                    }
                    break;
                case ChatRecordData._Str_17666:
                    _local_3.caption = "Photo report";
                    _local_5.visible = true;
                    _local_5.caption = "Moderate photo";
                    _local_9 = this._main.getProperty("stories.admin.tool.base.url");
                    if (StringUtil.isEmpty(_local_9))
                    {
                        _local_9 = "https://theallseeingeye.sulake.com/habbo-stories-admin/#/photos/";
                    }
                    _local_9 = (_local_9 + k.context.extraDataId);
                    new OpenExternalLink(this._main, _local_5, _local_9);
                    _local_4.visible = true;
                    _local_4.caption = "Room tool";
                    if (this._embedded)
                    {
                        new OpenRoomTool(null, this._main, _local_4, k.roomId);
                    }
                    else
                    {
                        new OpenRoomTool((this._frame as IFrameWindow), this._main, _local_4, k.roomId);
                    }
                    break;
            }
            this._Str_23835(_local_2);
            var _local_6:Boolean = true;
            var _local_7:int = -1;
            var _local_8:int;
            while (_local_8 < k.chatlog.length)
            {
                _local_10 = k.chatlog[_local_8];
                this._Str_23382(_local_10, _local_6);
                _local_6 = (!(_local_6));
                if (((_local_10._Str_19967) && (_local_7 == -1)))
                {
                    _local_7 = _local_8;
                }
                _local_8++;
            }
            if (_local_7 > -1)
            {
                this._list.autoArrangeItems = true;
                if (this._list.maxScrollV > 0)
                {
                    this._list.scrollV = (this._list.getListItemAt(_local_7).y / this._list.maxScrollV);
                }
            }
        }

        private function _Str_24350(k:IWindowContainer):void
        {
            this._list.addListItem(k);
            this._contentLines.push(k);
        }

        private function _Str_23835(k:IWindowContainer):void
        {
            this._list.addListItem(k);
            this._headers.push(k);
        }

        private function _Str_25638():IWindowContainer
        {
            if (_Str_8544.length > 0)
            {
                return _Str_8544.pop() as IWindowContainer;
            }
            return IWindowContainer(this._contentLinePrototype.clone());
        }

        private function _Str_21790(k:IWindowContainer):void
        {
            var _local_2:ITextWindow;
            if (_Str_8544.length < _Str_16618)
            {
                _local_2 = ITextWindow(k.findChildByName("chatter_txt"));
                _local_2.removeEventListener(WindowMouseEvent.CLICK, this._Str_19641);
                k.width = this._contentLinePrototype.width;
                k.height = (this._contentLinePrototype.height - 10);
                _Str_8544.push(k);
            }
            else
            {
                k.dispose();
            }
        }

        private function _Str_23187():IWindowContainer
        {
            return this._roomHeaderPrototype.clone() as IWindowContainer;
        }

        private function _Str_23382(k:_Str_6779, _arg_2:Boolean):void
        {
            var _local_9:TextFormat;
            var _local_3:IWindowContainer = this._Str_25638();
            var _local_4:IWindow = _local_3.findChildByName("time_txt");
            var _local_5:ITextWindow = ITextWindow(_local_3.findChildByName("chatter_txt"));
            var _local_6:ITextWindow = (_local_3.findChildByName("msg_txt") as ITextWindow);
            _local_4.caption = k.timeStamp;
            var _local_7:* = this._hilitedUserIds[k._Str_13143];
            if (_local_7 != null)
            {
                _local_3.color = (((_local_7 as int) == 0) ? _Str_16391 : _Str_16679);
            }
            else
            {
                _local_3.color = ((_arg_2) ? 4291030266 : 0xFFFFFFFF);
            }
            if (k._Str_19967)
            {
                _local_9 = _local_6.getTextFormat();
                _local_9.bold = true;
                _local_6.setTextFormat(_local_9);
                _local_6.bold = true;
            }
            if (k._Str_13143 > 0)
            {
                _local_5.text = k._Str_18796;
                _local_5.underline = true;
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_19641);
                if (!this._chatLogUserIds.getValue(k._Str_18796))
                {
                    this._chatLogUserIds.add(k._Str_18796, k._Str_13143);
                }
            }
            else
            {
                if (k._Str_13143 == 0)
                {
                    _local_5.text = "Bot / pet";
                    _local_5.underline = false;
                }
                else
                {
                    _local_5.text = "-";
                    _local_5.underline = false;
                }
            }
            _local_5.color = _local_3.color;
            _local_4.color = _local_3.color;
            _local_6.color = _local_3.color;
            _local_6.text = k._Str_23429;
            var _local_8:int = Math.max(_local_4.height, (_local_6.textHeight + 5));
            _local_6.height = _local_8;
            if (_local_6.getTextFormat())
            {
                _local_6.getTextFormat().align = TextFormatAlign.LEFT;
                _local_6.getTextFormat().rightMargin = (_local_6.getTextFormat().rightMargin + 10);
            }
            _local_5.height = _local_8;
            _local_4.height = _local_8;
            _local_3.height = _local_8;
            this._Str_24350(_local_3);
        }

        private function _Str_19641(k:WindowMouseEvent):void
        {
            var _local_2:String = k.target.caption;
            var _local_3:int = this._chatLogUserIds.getValue(_local_2);
            this._main.windowTracker.show(new UserInfoFrameCtrl(this._main, _local_3, this._issue), (this._frame as IFrameWindow), false, false, true);
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.dispose();
        }

        private function _Str_7142(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowEvent.WINDOW_EVENT_RESIZED)) || (!(_arg_2 == this._frame))))
            {
                return;
            }
            this._resizeTimer.reset();
            this._resizeTimer.start();
        }

        private function _Str_3774(k:TimerEvent):void
        {
            this._Str_24989();
            var _local_2:Boolean = this._Str_16245();
        }

        private function _Str_24989():void
        {
            var k:IWindowContainer;
            var _local_2:ITextWindow;
            this._list.autoArrangeItems = false;
            var _local_3:int = this._list.numListItems;
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                k = IWindowContainer(this._list.getListItemAt(_local_4));
                if (k.name == "chatline")
                {
                    _local_2 = ITextWindow(k.findChildByName("msg_txt"));
                    _local_2.width = (k.width - _local_2.x);
                    _local_2.height = (_local_2.textHeight + 5);
                    k.height = _local_2.height;
                }
                _local_4++;
            }
            this._list.autoArrangeItems = true;
        }

        private function _Str_16245():Boolean
        {
            var k:IWindowContainer = IWindowContainer(this._list.parent);
            var _local_2:IWindow = (k.getChildByName("scroller") as IWindow);
            var _local_3:* = (this._list.visibleRegion.height > this._list.height);
            var _local_4:int = 22;
            if (_local_2.visible)
            {
                if (_local_3)
                {
                    return false;
                }
                _local_2.visible = false;
                this._list.width = (this._list.width + _local_4);
                return true;
            }
            if (_local_3)
            {
                _local_2.visible = true;
                this._list.width = (this._list.width - _local_4);
                return true;
            }
            return false;
        }

        public function dispose():void
        {
            var k:IWindowContainer;
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._main = null;
            this._msg = null;
            this._issue = null;
            if (this._list != null)
            {
                this._list.removeListItems();
                this._list.dispose();
                this._list = null;
            }
            if (this._frame != null)
            {
                this._frame.destroy();
                this._frame = null;
            }
            this._rooms = null;
            this._hilitedUserIds = null;
            if (this._resizeTimer != null)
            {
                this._resizeTimer.stop();
                this._resizeTimer.removeEventListener(TimerEvent.TIMER, this._Str_3774);
                this._resizeTimer = null;
            }
            if (!this._embedded)
            {
                for each (k in this._contentLines)
                {
                    this._Str_21790(k);
                }
                for each (k in this._headers)
                {
                    k.dispose();
                }
            }
            this._contentLines = [];
            this._headers = [];
            if (this._contentLinePrototype != null)
            {
                this._contentLinePrototype.dispose();
                this._contentLinePrototype = null;
            }
            if (this._roomHeaderPrototype != null)
            {
                this._roomHeaderPrototype.dispose();
                this._roomHeaderPrototype = null;
            }
        }
    }
}
