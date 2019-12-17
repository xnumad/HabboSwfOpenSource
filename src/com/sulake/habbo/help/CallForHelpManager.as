package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.help._Str_7837;
    import com.sulake.habbo.communication.messages.incoming.help._Str_7620;
    import com.sulake.habbo.communication.messages.incoming.help._Str_8337;
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_11879;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7640;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.window.widgets._Str_2789;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_5697;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7634;
    import com.sulake.habbo.window.enum._Str_3023;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_6133;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_8070;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7656;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7494;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.communication.messages.parser.help._Str_7877;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_7322;
    import com.sulake.habbo.help.enum.CallForHelpResultEnum;
    import com.sulake.habbo.communication.messages.parser.help._Str_7865;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_12224;

    public class CallForHelpManager implements IDisposable 
    {
        private static const _Str_5003:int = 253;
        private static const EMERGENCY_HELP_REQUEST:String = "emergency_help_request";

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _window:IWindowContainer;
        private var _chatReportController:ChatReportController;
        private var _reportedUserId:int = -1;
        private var _reportedUserName:String = "";
        private var _reportedRoomId:int = -1;
        private var _reportedRoomName:String;
        private var _reportedRoomDescription:String;
        private var _reportedGroupId:int = -1;
        private var _reportedThreadId:int = -1;
        private var _reportedMessageId:int = -1;
        private var _reportedExtraDataId:String;
        private var _reportedRoomObjectId:int = -1;
        private var _reportType:int;
        private var _incomingTopic:int;
        private var _topicIndex:int;
        private var _message:String;

        public function CallForHelpManager(k:HabboHelp)
        {
            this._habboHelp = k;
            this._chatReportController = new ChatReportController(this._habboHelp, this._Str_24866);
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_7837(this._Str_25659));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_7620(this._Str_23792));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_8337(this._Str_25598));
        }

        private static function _Str_20529(k:int):String
        {
            if (k == 1)
            {
                return "useless";
            }
            if (k == 2)
            {
                return "abusive";
            }
            return "resolved";
        }


        public function dispose():void
        {
            if (!this._disposed)
            {
                this.closeWindow();
                if (this._chatReportController)
                {
                    this._chatReportController.dispose();
                    this._chatReportController = null;
                }
                this._habboHelp = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_2662():int
        {
            return this._reportedUserId;
        }

        public function get _Str_5842():String
        {
            return this._reportedUserName;
        }

        public function get _Str_3469():int
        {
            return this._reportedRoomId;
        }

        public function get _Str_16366():String
        {
            return this._reportedRoomName;
        }

        public function get _Str_11455():String
        {
            return this._reportedExtraDataId;
        }

        public function get _Str_10658():int
        {
            return this._reportedRoomObjectId;
        }

        public function get _Str_11420():int
        {
            return this._reportedGroupId;
        }

        public function get _Str_10392():int
        {
            return this._reportedThreadId;
        }

        public function get _Str_16155():int
        {
            return this._reportedMessageId;
        }

        public function set _Str_2662(k:int):void
        {
            this._reportedUserId = k;
        }

        public function set _Str_5842(k:String):void
        {
            this._reportedUserName = k;
        }

        public function set _Str_3469(k:int):void
        {
            this._reportedRoomId = k;
        }

        public function set _Str_16366(k:String):void
        {
            this._reportedRoomName = k;
        }

        public function set _Str_11455(k:String):void
        {
            this._reportedExtraDataId = k;
        }

        public function set _Str_10658(k:int):void
        {
            this._reportedRoomObjectId = k;
        }

        public function set _Str_11420(k:int):void
        {
            this._reportedGroupId = k;
        }

        public function set _Str_10392(k:int):void
        {
            this._reportedThreadId = k;
        }

        public function set _Str_16155(k:int):void
        {
            this._reportedMessageId = k;
        }

        public function _Str_17200(k:int, _arg_2:int):void
        {
            if (this._habboHelp._Str_16486)
            {
                this._reportedUserId = k;
                this._reportedRoomId = _arg_2;
                this._habboHelp._Str_24148(_Str_2849._Str_8260);
            }
            else
            {
                this._Str_6694(k, HabboHelp._Str_5723, 123);
            }
        }

        public function _Str_6694(k:int, _arg_2:int, _arg_3:int):void
        {
            this._reportedUserId = k;
            this._reportedRoomId = -1;
            this._incomingTopic = _arg_3;
            this._habboHelp._Str_8128(_arg_2);
        }

        public function reportRoom(k:int, _arg_2:String, _arg_3:String):void
        {
            this._reportedRoomId = k;
            this._reportedRoomName = _arg_2;
            this._reportedRoomDescription = _arg_3;
            this._reportedUserId = -1;
            this._habboHelp._Str_8128(HabboHelp._Str_4786);
        }

        public function _Str_10138(k:int, _arg_2:int):void
        {
            this._reportedGroupId = k;
            this._reportedThreadId = _arg_2;
            this._habboHelp._Str_8128(HabboHelp._Str_4459);
        }

        public function _Str_11424(k:int, _arg_2:int, _arg_3:int):void
        {
            this._reportedGroupId = k;
            this._reportedThreadId = _arg_2;
            this._reportedMessageId = _arg_3;
            this._habboHelp._Str_8128(HabboHelp._Str_4490);
        }

        public function _Str_12812(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            this._habboHelp._Str_2488(new _Str_11879(k, _arg_3, _arg_4, _arg_2, _arg_5));
        }

        public function _Str_14206(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            this._habboHelp._Str_25749(new _Str_7640(k, _arg_3, _arg_4, _arg_2, _arg_5));
            this._habboHelp._Str_8128(HabboHelp._Str_7161);
        }

        public function _Str_22391():void
        {
            this._Str_6694(0, HabboHelp._Str_5723, -1);
        }

        private function _Str_22936():void
        {
            this.closeWindow();
            this._window = (this._habboHelp.getXmlWindow("abusive_notice") as IWindowContainer);
            this._window.center();
            this._window.findChildByName("header_button_close").visible = false;
            this._window.procedure = this._Str_24146;
        }

        public function _Str_25017(k:int):void
        {
            var _local_5:ISelectableWindow;
            var _local_6:ISelectableWindow;
            this.closeWindow();
            this._reportType = k;
            if (this._reportType == HabboHelp._Str_15144)
            {
                this._window = (this._habboHelp.getXmlWindow("bully_report") as IWindowContainer);
                this._window.procedure = this._Str_23738;
            }
            else
            {
                this._window = (this._habboHelp.getXmlWindow("emergency_help_request") as IWindowContainer);
                this._window.procedure = this._Str_22328;
                _Str_2789(IWidgetWindow(this._window.findChildByName("help_message")).widget).maxChars = _Str_5003;
            }
            this._window.center();
            var _local_2:IItemListWindow = (this._window.findChildByName("user_panel") as IItemListWindow);
            var _local_3:IItemListWindow = (this._window.findChildByName("room_panel") as IItemListWindow);
            var _local_4:ISelectorWindow = ISelectorWindow(this._window.findChildByName("topic_selector"));
            if (_local_4 != null)
            {
                _local_5 = _local_4.getSelectableByName(("" + this._incomingTopic));
                if (_local_5 != null)
                {
                    _local_4.setSelected(_local_5);
                }
                _local_6 = _local_4.getSelectableByName("123");
                if (((!(_local_6 == null)) && (this._habboHelp._Str_16486)))
                {
                    _local_6.visible = false;
                }
            }
            switch (this._reportType)
            {
                case HabboHelp._Str_4786:
                    this._Str_13189(false, true);
                    return;
                case HabboHelp._Str_5723:
                    this._Str_13189(true, false);
                    return;
                case HabboHelp._Str_4315:
                    this._Str_13189(false, false);
                    return;
                case HabboHelp._Str_4459:
                case HabboHelp._Str_4490:
                    this._Str_13189(false, false);
                    return;
                case HabboHelp._Str_15144:
                    this._Str_13771();
                    return;
            }
        }

        private function _Str_23535():void
        {
            this.closeWindow();
            this._chatReportController.show(this._habboHelp._Str_6240, this._reportedUserId, this._reportType);
        }

        private function _Str_13189(k:Boolean, _arg_2:Boolean):void
        {
            var _local_3:IItemListWindow = (this._window.findChildByName("user_panel") as IItemListWindow);
            var _local_4:IItemListWindow = (this._window.findChildByName("room_panel") as IItemListWindow);
            var _local_5:Boolean = ((k) || (_arg_2));
            this._window.findChildByName("submit_box_wide").visible = _local_5;
            this._window.findChildByName("submit_box_narrow").visible = (!(_local_5));
            this._window.findChildByName("separator").visible = _local_5;
            _local_4.visible = _arg_2;
            _local_3.visible = k;
            if (_arg_2)
            {
                _local_4.getListItemByName("room_name").caption = ((this._reportedRoomName != null) ? this._reportedRoomName : "");
                _local_4.getListItemByName("room_description").caption = ((this._reportedRoomDescription != null) ? this._reportedRoomDescription : "");
            }
            if (k)
            {
                this._Str_13771();
            }
            if (!_local_5)
            {
                this._window.width = 301;
            }
        }

        private function _Str_13771():void
        {
            var _local_4:UserRegistryItem;
            var _local_5:IWindowContainer;
            var _local_6:Boolean;
            var k:IItemListWindow = (this._window.findChildByName("user_list") as IItemListWindow);
            var _local_2:IWindowContainer = (k.getListItemAt(0) as IWindowContainer);
            k.removeListItems();
            var _local_3:int;
            for each (_local_4 in this._habboHelp._Str_17447._Str_20328())
            {
                _local_5 = (_local_2.clone() as IWindowContainer);
                _local_6 = (_local_4.userId == this._reportedUserId);
                _local_5.name = _local_4.userId.toString();
                _local_5.blend = ((_local_6) ? 1 : 0);
                _local_5.procedure = this._Str_17107;
                _local_5.findChildByName("user_name").caption = _local_4.userName;
                _local_5.findChildByName("room_name").id = _local_4.roomId;
                if (_local_6)
                {
                    this._reportedRoomId = _local_4.roomId;
                }
                _local_5.findChildByName("room_name").caption = ((_local_4.roomName != "") ? this._habboHelp.localization.getLocalizationWithParams("help.emergency.main.step.two.room.name", "", "room_name", _local_4.roomName) : "");
                _Str_2483(IWidgetWindow(_local_5.findChildByName("user_avatar")).widget).figure = _local_4.figure;
                k.addListItemAt(_local_5, _local_3);
                if (_local_6)
                {
                    _local_3 = 1;
                }
            }
        }

        private function _Str_18558():void
        {
            var _local_3:IWindowContainer;
            var k:IItemListWindow = (this._window.findChildByName("user_list") as IItemListWindow);
            var _local_2:int;
            while (_local_2 < k.numListItems)
            {
                _local_3 = IWindowContainer(k.getListItemAt(_local_2));
                _local_3.blend = ((int(_local_3.name) == this._reportedUserId) ? 1 : 0);
                _local_2++;
            }
        }

        public function _Str_23281(k:String):void
        {
            this.closeWindow();
            this._window = (this._habboHelp.getXmlWindow("pending_request") as IWindowContainer);
            this._window.findChildByName("request_message").caption = k;
            this._window.center();
            this._window.procedure = this._Str_18728;
        }

        private function closeWindow():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_24146(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "close_button":
                        this.closeWindow();
                        return;
                }
            }
        }

        private function _Str_22328(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (!this._Str_23329())
                        {
                            return;
                        }
                        this._Str_20589();
                        return;
                    case "header_button_close":
                        this.closeWindow();
                        return;
                }
            }
        }

        private function _Str_23738(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (this._reportedUserId > 0)
                        {
                            this._habboHelp._Str_2488(new _Str_5697(this._reportedUserId));
                            this._habboHelp._Str_2488(new _Str_7634(this._reportedUserId, this._reportedRoomId));
                            this.closeWindow();
                        }
                        else
                        {
                            this._habboHelp.windowManager.alert("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                        }
                        return;
                    case "header_button_close":
                        this.closeWindow();
                        return;
                }
            }
        }

        private function _Str_24866(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (this._chatReportController._Str_9701(this._reportType, -1).length == 0)
                        {
                            this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.chatmissing}", 0, null);
                            return;
                        }
                        this._Str_10791();
                        this._chatReportController.closeWindow();
                        this.closeWindow();
                        return;
                    case "header_button_close":
                        this._chatReportController.closeWindow();
                        return;
                }
            }
        }

        private function _Str_17107(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_17740((_arg_2 as IWindowContainer));
            }
        }

        private function _Str_17740(k:IWindowContainer):void
        {
            if ((((this._window == null) || (!(this._window.name == EMERGENCY_HELP_REQUEST))) || (k == null)))
            {
                return;
            }
            var _local_2:int = int(k.name);
            if (this._reportedUserId == _local_2)
            {
                this._reportedUserId = 0;
                this._reportedRoomId = -1;
            }
            else
            {
                this._reportedUserId = _local_2;
                this._reportedRoomId = k.findChildByName("room_name").id;
            }
            this._Str_18558();
        }

        private function _Str_20589():void
        {
            var k:Boolean = this._Str_23328();
            if (this._reportType == HabboHelp._Str_4315)
            {
                if (!this._habboHelp._Str_3977._Str_23839(this._reportedUserId))
                {
                    this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                }
            }
            else
            {
                if ((((k) && (!(this._habboHelp._Str_3531._Str_20222(this._habboHelp._Str_6240)))) && (this._habboHelp._Str_3531._Str_20222(this._reportedUserId))))
                {
                    this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                    return;
                }
            }
            if (k)
            {
                this._Str_23535();
            }
            else
            {
                this._Str_10791();
            }
        }

        private function _Str_23328():Boolean
        {
            if ((((this._reportType == HabboHelp._Str_4459) || (this._reportType == HabboHelp._Str_4490)) || (this._reportType == HabboHelp._Str_4786)))
            {
                return false;
            }
            return ((this._reportedUserId <= 0) || (this._habboHelp._Str_3531._Str_5150(this._reportedUserId).length > 0)) || (this._reportType == HabboHelp._Str_4315);
        }

        private function _Str_23329(k:Boolean=true):Boolean
        {
            if (((this._window == null) || (!(this._window.name == EMERGENCY_HELP_REQUEST))))
            {
                return false;
            }
            this._message = _Str_2789(IWidgetWindow(this._window.findChildByName("help_message")).widget).message;
            if (((this._message == null) || (this._message == "")))
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nomsg}", 0, null);
                return false;
            }
            if (this._message.length < this._habboHelp.getInteger("help.cfh.length.minimum", 15))
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                return false;
            }
            this._topicIndex = 0;
            var _local_2:ISelectableWindow = ISelectorWindow(this._window.findChildByName("topic_selector")).getSelected();
            if (_local_2 != null)
            {
                this._topicIndex = int(_local_2.name);
            }
            if (this._topicIndex == 0)
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                return false;
            }
            if (((this._reportType == HabboHelp._Str_4490) || (this._reportType == HabboHelp._Str_4459)))
            {
                return true;
            }
            if ((((this._reportedUserId <= 0) && ((!(this._reportType == HabboHelp._Str_4490)) && (this._reportType == HabboHelp._Str_4459))) || ((this._reportType == HabboHelp._Str_4786) && (!(this._habboHelp.getBoolean("room.report.enabled"))))))
            {
                this._habboHelp.windowManager.alert("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                return false;
            }
            if (this._habboHelp.friendList.getFriend(this._reportedUserId) != null)
            {
                this._habboHelp.windowManager.confirm("${help.cfh.unfriend.confirm.title}", "${help.cfh.unfriend.confirm.message}", (_Str_3023.BUTTON_OK | _Str_3023.BUTTON_CANCEL), this._Str_24374);
                return false;
            }
            return true;
        }

        private function _Str_10791():void
        {
            var k:int;
            this.closeWindow();
            switch (this._reportType)
            {
                case HabboHelp._Str_5723:
                case HabboHelp._Str_4786:
                    k = ((this._chatReportController._Str_3469 <= 0) ? this._reportedRoomId : this._chatReportController._Str_3469);
                    this._habboHelp._Str_2488(new _Str_6133(this._message, this._topicIndex, this._reportedUserId, k, this._chatReportController._Str_9701(this._reportType, -1)));
                    break;
                case HabboHelp._Str_4315:
                    this._habboHelp._Str_2488(new _Str_8070(this._message, this._topicIndex, this._reportedUserId, this._chatReportController._Str_9701(HabboHelp._Str_4315, -1)));
                    break;
                case HabboHelp._Str_4459:
                    this._habboHelp._Str_2488(new _Str_7656(this._reportedGroupId, this._reportedThreadId, this._topicIndex, this._message));
                    break;
                case HabboHelp._Str_4490:
                    this._habboHelp._Str_2488(new _Str_7494(this._reportedGroupId, this._reportedThreadId, this._reportedMessageId, this._topicIndex, this._message));
                    break;
            }
            this._habboHelp._Str_19312();
        }

        private function _Str_24374(k:_Str_2418, _arg_2:WindowEvent):void
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this._Str_20589();
            }
            k.dispose();
        }

        private function _Str_18728(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "keep_button":
                    case "header_button_close":
                        this.closeWindow();
                        return;
                    case "discard_button":
                        this._Str_23590();
                        this.closeWindow();
                        return;
                }
            }
        }

        private function _Str_25659(k:IMessageEvent):void
        {
            var _local_2:_Str_7877 = _Str_7837(k).getParser();
            this._habboHelp.windowManager.alert("${help.cfh.reply.title}", _local_2.message, 0, null);
        }

        private function _Str_23792(k:IMessageEvent):void
        {
            var _local_2:_Str_7322 = _Str_7620(k).getParser();
            var _local_3:int = _local_2.resultType;
            var _local_4:String = _local_2._Str_3460;
            switch (_local_3)
            {
                case CallForHelpResultEnum._Str_18080:
                    this._habboHelp._Str_8128(HabboHelp._Str_5723);
                    return;
                case CallForHelpResultEnum._Str_18473:
                    this._Str_22936();
                    return;
                default:
                    if (_local_4 == "")
                    {
                        _local_4 = "${help.cfh.sent.text}";
                    }
                    this._habboHelp.windowManager.alert("${help.cfh.sent.title}", _local_4, 0, null);
            }
        }

        private function _Str_25598(k:_Str_8337):void
        {
            var _local_2:_Str_7865 = k.getParser();
            var _local_3:String = _local_2._Str_3460;
            if (_local_3 == "")
            {
                _local_3 = (("${help.cfh.closed." + _Str_20529(_local_2._Str_25784)) + "}");
            }
            this._habboHelp.windowManager.alert("${mod.alert.title}", _local_3, 0, null);
        }

        private function _Str_23590():void
        {
            this._habboHelp._Str_2488(new _Str_12224());
        }

        public function get _Str_18787():ChatReportController
        {
            return this._chatReportController;
        }
    }
}
