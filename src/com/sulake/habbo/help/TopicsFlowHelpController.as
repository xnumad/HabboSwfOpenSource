package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_3509;
    import com.sulake.habbo.window.widgets._Str_2789;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7640;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_8070;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_6133;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7656;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7494;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7634;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;
    import com.sulake.habbo.help.cfh.registry.chat.ChatRegistryItem;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistryItem;
    import __AS3__.vec.*;

    public class TopicsFlowHelpController implements IDisposable 
    {
        private static const START_CONTAINER:String = "start_container";
        private static const HELP_CONTAINER:String = "help_container";
        private static const USERS_CONTAINER:String = "users_container";
        private static const USER:String = "user";
        private static const REASON_CONTAINER:String = "reason_container";
        private static const TOPIC_CONTAINER:String = "topic_container";
        private static const MESSAGE_CONTAINER:String = "message_container";
        private static const CHAT_CONTAINER:String = "chat_container";
        private static const BACK_BUTTON:String = "back_button";
        private static const SUMMARY_CONTAINER:String = "summary_container";
        private static const CONTINUE_BUTTON:String = "continue_button";
        private static const _Str_19021:Array = [USERS_CONTAINER, MESSAGE_CONTAINER, CHAT_CONTAINER];
        private static const _Str_14416:Array = [REASON_CONTAINER, MESSAGE_CONTAINER, CHAT_CONTAINER, SUMMARY_CONTAINER];
        private static const _Str_5003:int = 253;
        private static const BULLYING:String = "bullying";
        private static const HABBO_NAME:String = "habbo_name";

        private var _habboHelp:HabboHelp;
        private var _disposed:Boolean = false;
        private var _helpDialog:_Str_2784;
        private var _view:IWindowContainer;
        private var _containers:Vector.<String>;
        private var _usersList:IItemListWindow;
        private var _reasonsList:IItemListWindow;
        private var _chatList:IItemListWindow;
        private var _userPrototype:IWindowContainer;
        private var _reasonPrototype:IWindowContainer;
        private var _chatPrototype:IWindowContainer;
        private var _currentContainer:String = "start_container";
        private var _currentTopic:_Str_3509;
        private var _message:String;
        private var _reportedUserName:String;
        private var _contentModerationType:int = -1;
        private var _userNameReporting:Boolean = false;

        public function TopicsFlowHelpController(k:HabboHelp)
        {
            this._habboHelp = k;
            this._containers = new Vector.<String>(0);
            this._containers.push(START_CONTAINER, HELP_CONTAINER, USERS_CONTAINER, USER, REASON_CONTAINER, MESSAGE_CONTAINER, CHAT_CONTAINER, BACK_BUTTON, SUMMARY_CONTAINER);
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this.closeWindow();
            this._habboHelp = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_24232():void
        {
            this._userNameReporting = true;
            this._Str_13370(-1, false);
            this._currentTopic = this._Str_21261(HABBO_NAME);
            this._view.findChildByName("message_phase_title").caption = ((this._habboHelp.localization.getLocalization("generic.reason") + " ") + this._habboHelp.localization.getLocalization(("help.cfh.topic." + this._currentTopic.id)));
            this._Str_3615(MESSAGE_CONTAINER);
        }

        public function _Str_25197():void
        {
            this._Str_13370(-1, true);
            if (!this._Str_25232())
            {
                return;
            }
            this._Str_3615(CHAT_CONTAINER);
            this._Str_22227();
        }

        public function _Str_15173(k:int):Boolean
        {
            this._Str_13370(k, false);
            var _local_2:Boolean = this._Str_24500();
            if (!_local_2)
            {
                this.closeWindow();
            }
            return _local_2;
        }

        public function _Str_23015():void
        {
            this._Str_13370(HabboHelp._Str_4315, false);
            this._Str_3615(CHAT_CONTAINER);
            this._Str_23695();
            if (this._chatList.numListItems == 0)
            {
                this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.no_user_data}", 0, null);
                this.closeWindow();
            }
        }

        private function _Str_13370(k:int, _arg_2:Boolean):void
        {
            this._contentModerationType = k;
            if (this._helpDialog == null)
            {
                this._Str_2826();
            }
            this._view.findChildByName("change_user").visible = _arg_2;
        }

        private function _Str_2826():void
        {
            if (((this._helpDialog == null) && (!(this.disposed))))
            {
                this._helpDialog = this._habboHelp._Str_4804("topics_flow_help");
                this._helpDialog._Str_2429.procedure = this._Str_18394;
                this._view = (this._helpDialog._Str_2429 as IWindowContainer);
                this._usersList = (this._view.findChildByName("user_list") as IItemListWindow);
                this._reasonsList = (this._view.findChildByName("reason_list") as IItemListWindow);
                this._chatList = (this._view.findChildByName("chat_list") as IItemListWindow);
                this._userPrototype = (this._usersList.getListItemAt(0) as IWindowContainer);
                this._reasonPrototype = (this._reasonsList.getListItemAt(0) as IWindowContainer);
                this._chatPrototype = (this._chatList.getListItemAt(0) as IWindowContainer);
                this._usersList.removeListItems();
                this._reasonsList.removeListItems();
                this._chatList.removeListItems();
                _Str_2789(IWidgetWindow(this._view.findChildByName("help_message")).widget).maxChars = _Str_5003;
                this._Str_14598();
            }
        }

        public function closeWindow():void
        {
            if (this._helpDialog != null)
            {
                this._helpDialog.dispose();
                this._helpDialog = null;
            }
            this._currentContainer = START_CONTAINER;
        }

        public function _Str_19572():void
        {
            if (this._helpDialog == null)
            {
                this._contentModerationType = -1;
                this._Str_2826();
                this._Str_3615(START_CONTAINER);
            }
            else
            {
                this.closeWindow();
            }
        }

        private function _Str_3615(k:String):void
        {
            var _local_2:String;
            for each (_local_2 in this._containers)
            {
                this._view.findChildByName(_local_2).visible = false;
            }
            this._view.findChildByName(CONTINUE_BUTTON).visible = (_Str_19021.indexOf(k) > -1);
            this._view.findChildByName(USER).visible = (_Str_14416.indexOf(k) > -1);
            this._currentContainer = k;
            this._Str_21276();
            this._view.findChildByName(k).visible = true;
            if (_Str_14416.indexOf(k) > -1)
            {
                this._Str_17133();
            }
        }

        private function _Str_21276():void
        {
            var k:Boolean = true;
            if (this._currentContainer == START_CONTAINER)
            {
                k = false;
            }
            else
            {
                if (this._contentModerationType == HabboHelp._Str_4315)
                {
                    k = (!(this._currentContainer == CHAT_CONTAINER));
                }
                else
                {
                    if ((this._contentModerationType > -1))
                    {
                        k = (!(this._currentContainer == REASON_CONTAINER));
                    }
                    else
                    {
                        if (this._userNameReporting)
                        {
                            k = (!(this._currentContainer == MESSAGE_CONTAINER));
                        }
                    }
                }
            }
            this._view.findChildByName(BACK_BUTTON).visible = k;
        }

        private function _Str_19840():Boolean
        {
            if (this._habboHelp._Str_2662 == -1)
            {
                this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                return false;
            }
            return true;
        }

        private function _Str_25494():Boolean
        {
            this._message = _Str_2789(IWidgetWindow(this._view.findChildByName("help_message")).widget).message;
            if (((this._message == null) || (this._message == "")))
            {
                this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.nomsg}", 0, null);
                return false;
            }
            if (this._message.length < this._habboHelp.getInteger("help.cfh.length.minimum", 15))
            {
                this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                return false;
            }
            return true;
        }

        private function _Str_23993():Boolean
        {
            var k:Array = this._habboHelp._Str_5721._Str_18787._Str_9701(this._contentModerationType, this._habboHelp._Str_2662);
            if (((k == null) || (k.length == 0)))
            {
                this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.chatmissing}", 0, null);
                return false;
            }
            return true;
        }

        private function _Str_18394(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((this.disposed) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.closeWindow();
                    return;
                case BACK_BUTTON:
                    switch (this._currentContainer)
                    {
                        case REASON_CONTAINER:
                            this._Str_3615(CHAT_CONTAINER);
                            break;
                        case TOPIC_CONTAINER:
                        case MESSAGE_CONTAINER:
                            this._Str_3615(REASON_CONTAINER);
                            this._Str_18243();
                            break;
                        case CHAT_CONTAINER:
                            if (this._Str_16001())
                            {
                                this._Str_3615(USERS_CONTAINER);
                            }
                            else
                            {
                                this._Str_3615(START_CONTAINER);
                            }
                            break;
                        case SUMMARY_CONTAINER:
                            this._Str_3615(MESSAGE_CONTAINER);
                            break;
                        default:
                            this._Str_3615(START_CONTAINER);
                    }
                    return;
                case "continue_button":
                    switch (this._currentContainer)
                    {
                        case USERS_CONTAINER:
                            if (this._Str_19840())
                            {
                                this._Str_3615(CHAT_CONTAINER);
                                this._Str_22227();
                            }
                            break;
                        case MESSAGE_CONTAINER:
                            if (this._Str_25494())
                            {
                                this._Str_3615(SUMMARY_CONTAINER);
                            }
                            break;
                        case CHAT_CONTAINER:
                            if (this._Str_23993())
                            {
                                this._Str_3615(REASON_CONTAINER);
                                this._Str_18243();
                            }
                            break;
                        default:
                            this._Str_3615(START_CONTAINER);
                    }
                    return;
                case "button_habbo_help":
                    this._Str_3615(HELP_CONTAINER);
                    return;
                case "button_user_report":
                case "change_user":
                    if (this._Str_16001())
                    {
                        this._Str_3615(USERS_CONTAINER);
                    }
                    else
                    {
                        this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                    }
                    return;
                case "button_account":
                    HabboWebTools.openWebPage(this._habboHelp.getProperty("zendesk.url"), "habboMain");
                    this._habboHelp.trackGoogle("helpWindow", "click_selfHelp");
                    this.closeWindow();
                    return;
                case "tour_button":
                    this._habboHelp._Str_21711._Str_6255(((this._habboHelp._Str_7478) ? _Str_2849._Str_4268 : _Str_2849._Str_4749));
                    this._habboHelp.trackGoogle("helpWindow", "click_userTour");
                    this.closeWindow();
                    return;
                case "bully_button":
                    this.closeWindow();
                    this._habboHelp._Str_14807();
                    this._habboHelp.trackGoogle("helpWindow", "click_reportBully");
                    return;
                case "instructions_button":
                    this._habboHelp._Str_21711._Str_6255(_Str_2849._Str_7052);
                    this._habboHelp.trackGoogle("helpWindow", "click_instructions");
                    this.closeWindow();
                    return;
                case "safetybooklet_link":
                    this._habboHelp._Str_8723();
                    this._habboHelp.trackGoogle("helpWindow", "click_showSafetyBooklet");
                    this.closeWindow();
                    return;
                case "habboway_link":
                    if (this._habboHelp.getBoolean("habboway.enabled"))
                    {
                        this._habboHelp.showHabboWay();
                    }
                    else
                    {
                        HabboWebTools.openWebPage(this._habboHelp.getProperty("habboway.url"), "habboMain");
                    }
                    this._habboHelp.trackGoogle("helpWindow", "click_habboWay");
                    this.closeWindow();
                    return;
                case "faq_link":
                    this._habboHelp._Str_19088();
                    return;
                case "sanction_info_link":
                    this._habboHelp._Str_19612(false);
                    this.closeWindow();
                    return;
                case "submit_button":
                    if (this._currentTopic)
                    {
                        this._Str_10791(true);
                        this.closeWindow();
                    }
                    else
                    {
                        this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                    }
                    return;
            }
        }

        public function _Str_10791(k:Boolean):void
        {
            if ((((!(this._message)) || (!(this._currentTopic))) || (!(this._habboHelp))))
            {
                return;
            }
            this._habboHelp._Str_19312();
            switch (this._contentModerationType)
            {
                case HabboHelp._Str_7161:
                    this._habboHelp._Str_2488(new _Str_7640(this._habboHelp._Str_11455, this._habboHelp._Str_3469, this._habboHelp._Str_2662, this._currentTopic.id, this._habboHelp._Str_10658));
                    return;
                case HabboHelp._Str_4315:
                    this._habboHelp._Str_2488(new _Str_8070(this._message, this._currentTopic.id, this._habboHelp._Str_2662, this._habboHelp._Str_5721._Str_18787._Str_9701(HabboHelp._Str_4315, this._habboHelp._Str_2662)));
                    return;
                case HabboHelp._Str_4786:
                    this._habboHelp._Str_2488(new _Str_6133(this._message, this._currentTopic.id, -1, this._habboHelp._Str_3469, []));
                    return;
                case HabboHelp._Str_4459:
                    this._habboHelp._Str_2488(new _Str_7656(this._habboHelp._Str_5721._Str_11420, this._habboHelp._Str_5721._Str_10392, this._currentTopic.id, this._message));
                    return;
                case HabboHelp._Str_4490:
                    this._habboHelp._Str_2488(new _Str_7494(this._habboHelp._Str_5721._Str_11420, this._habboHelp._Str_5721._Str_10392, this._habboHelp._Str_5721._Str_16155, this._currentTopic.id, this._message));
                    return;
                default:
                    if (((((k) && (this._currentTopic.name == BULLYING)) && (this._habboHelp.getBoolean("guides.enabled"))) && (this._habboHelp._Str_16486)))
                    {
                        this._habboHelp._Str_2488(new _Str_7634(this._habboHelp._Str_2662, this._habboHelp._Str_3469));
                    }
                    else
                    {
                        this._habboHelp._Str_2488(new _Str_6133(this._message, this._currentTopic.id, this._habboHelp._Str_2662, this._habboHelp._Str_3469, this._habboHelp._Str_5721._Str_18787._Str_9701(HabboHelp._Str_5723, -1)));
                    }
            }
        }

        private function _Str_16001():Boolean
        {
            var _local_3:UserRegistryItem;
            var _local_4:Vector.<ChatRegistryItem>;
            var _local_5:IWindowContainer;
            var _local_6:Boolean;
            this._usersList.removeListItems();
            var k:int;
            var _local_2:Boolean;
            for each (_local_3 in this._habboHelp._Str_17447._Str_20328())
            {
                _local_4 = this._habboHelp._Str_3531._Str_5150(_local_3.userId);
                if (_local_4.length == 0)
                {
                }
                else
                {
                    _local_5 = (this._userPrototype.clone() as IWindowContainer);
                    _local_6 = (_local_3.userId == this._habboHelp._Str_2662);
                    _local_5.name = _local_3.userId.toString();
                    _local_5.findChildByName("user_bg").blend = ((_local_6) ? 1 : 0);
                    _local_5.procedure = this._Str_17107;
                    _local_5.findChildByName("user_name").caption = _local_3.userName;
                    _local_5.findChildByName("room_name").id = _local_3.roomId;
                    if (_local_6)
                    {
                        this._habboHelp._Str_3469 = _local_3.roomId;
                    }
                    _local_5.findChildByName("room_name").caption = ((_local_3.roomName != "") ? this._habboHelp.localization.getLocalizationWithParams("help.emergency.main.step.two.room.name", "", "room_name", _local_3.roomName) : "");
                    _Str_2483(IWidgetWindow(_local_5.findChildByName("user_avatar")).widget).figure = _local_3.figure;
                    this._usersList.addListItemAt(_local_5, k);
                    if (_local_6)
                    {
                        k = 1;
                        _local_2 = true;
                    }
                }
            }
            if (!_local_2)
            {
                this._habboHelp._Str_2662 = -1;
                this._habboHelp._Str_3469 = -1;
            }
            return this._usersList.numListItems > 0;
        }

        private function _Str_18558():void
        {
            var _local_2:IWindowContainer;
            var k:int;
            while (k < this._usersList.numListItems)
            {
                _local_2 = IWindowContainer(this._usersList.getListItemAt(k));
                _local_2.findChildByName("user_bg").blend = ((int(_local_2.name) == this._habboHelp._Str_2662) ? 1 : 0);
                k++;
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
            var _local_2:int = int(k.name);
            this._habboHelp._Str_2662 = _local_2;
            this._habboHelp._Str_3469 = k.findChildByName("room_name").id;
            this._Str_18558();
        }

        private function _Str_18243():void
        {
            var k:CallForHelpCategoryData;
            var _local_2:IWindowContainer;
            this._reasonsList.destroyListItems();
            for each (k in this._habboHelp._Str_9001)
            {
                _local_2 = (this._reasonPrototype.clone() as IWindowContainer);
                _local_2.findChildByName("name").caption = (("${help.cfh.reason." + k.name) + "}");
                _local_2.name = k.name;
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_24412);
                this._reasonsList.addListItem(_local_2);
            }
        }

        private function _Str_24412(k:WindowEvent):void
        {
            var _local_2:IWindow = k.target;
            this._Str_23777(_local_2.name);
        }

        private function _Str_23777(k:String):Boolean
        {
            var _local_2:Vector.<_Str_3509>;
            var _local_3:CallForHelpCategoryData;
            var _local_4:int;
            var _local_5:_Str_3509;
            var _local_6:IWindowContainer;
            var _local_7:ITextWindow;
            for each (_local_3 in this._habboHelp._Str_9001)
            {
                if (_local_3.name == k)
                {
                    _local_2 = _local_3._Str_14841;
                    break;
                }
            }
            if (((_local_2) && (_local_2.length > 0)))
            {
                this._reasonsList.destroyListItems();
                _local_4 = this._reasonsList.height;
                this._reasonsList.height = 0;
                this._reasonsList.height = _local_4;
                for each (_local_5 in _local_2)
                {
                    _local_6 = (this._reasonPrototype.clone() as IWindowContainer);
                    this._habboHelp.localization.registerParameter(("help.cfh.topic." + _local_5.id), "name", this._reportedUserName);
                    _local_7 = (_local_6.findChildByName("name") as ITextWindow);
                    _local_7.caption = (("${help.cfh.topic." + _local_5.id) + "}");
                    if (_local_7.height < _local_7.textHeight)
                    {
                        _local_7.height = (_local_7.textHeight + 5);
                    }
                    if (_local_6.height < ((_local_7.height + (_local_7.y * 2)) + 5))
                    {
                        _local_6.height = ((_local_7.height + (_local_7.y * 2)) + 5);
                    }
                    _local_6.name = _local_5.name;
                    _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_24731);
                    this._reasonsList.addListItem(_local_6);
                }
                this._currentContainer = TOPIC_CONTAINER;
                this._Str_21276();
            }
            else
            {
                return false;
            }
            return true;
        }

        private function _Str_22227():void
        {
            var _local_2:ChatRegistryItem;
            var _local_3:IWindowContainer;
            var _local_4:ITextLinkWindow;
            var _local_5:ICheckBoxWindow;
            this._chatList.removeListItems();
            this._habboHelp._Str_3531._Str_7724 = true;
            var k:Vector.<ChatRegistryItem> = ((this._habboHelp._Str_2662 > 0) ? this._habboHelp._Str_3531._Str_5150(this._habboHelp._Str_2662) : this._habboHelp._Str_3531._Str_6828());
            Logger.log(((("Found chat items: " + k.length) + " from user:") + this._habboHelp._Str_2662));
            for each (_local_2 in k)
            {
                if (_local_2.userId == this._habboHelp._Str_6240)
                {
                }
                else
                {
                    _local_3 = (this._chatPrototype.clone() as IWindowContainer);
                    _local_4 = (_local_3.findChildByName("chat_text") as ITextLinkWindow);
                    _local_4.caption = _local_2.text;
                    if (_local_4.height < _local_4.textHeight)
                    {
                        _local_4.height = (_local_4.textHeight + 5);
                    }
                    if (_local_3.height < (_local_4.height + (_local_4.y * 2)))
                    {
                        _local_3.height = (_local_4.height + (_local_4.y * 2));
                    }
                    _local_3.id = _local_2.index;
                    _local_3.procedure = this._Str_18834;
                    _local_5 = (_local_3.findChildByName("chat_check") as ICheckBoxWindow);
                    _local_5._Str_2365 = _local_2.selected;
                    this._chatList.addListItem(_local_3);
                }
            }
        }

        private function _Str_14598():void
        {
            var k:Vector.<InstantMessageRegistryItem>;
            var _local_2:ChatRegistryItem;
            var _local_3:InstantMessageRegistryItem;
            for each (k in this._habboHelp._Str_3977._Str_6828())
            {
                for each (_local_3 in k)
                {
                    _local_3.selected = false;
                }
            }
            for each (_local_2 in this._habboHelp._Str_3531._Str_6828())
            {
                _local_2.selected = false;
            }
        }

        private function _Str_18834(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:ICheckBoxWindow;
            var _local_5:ChatRegistryItem;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = _arg_2.id;
                if ((_arg_2 is ITextLinkWindow))
                {
                    _local_3 = _arg_2.parent.id;
                    _local_4 = ((_arg_2.parent as IWindowContainer).findChildByName("chat_check") as ICheckBoxWindow);
                }
                if ((_arg_2 is ICheckBoxWindow))
                {
                    _local_3 = _arg_2.parent.id;
                    _local_4 = (_arg_2 as ICheckBoxWindow);
                }
                _local_5 = this._habboHelp._Str_3531._Str_2990(_local_3);
                if (!_local_5)
                {
                    return;
                }
                if (((!(_local_5.selected)) && (!(_local_5.roomId == this._habboHelp._Str_3469))))
                {
                    this._habboHelp._Str_3469 = _local_5.roomId;
                }
                _local_5.selected = (!(_local_5.selected));
                _local_4._Str_2365 = _local_5.selected;
            }
        }

        private function _Str_23695():void
        {
            var _local_2:InstantMessageRegistryItem;
            var _local_3:IWindowContainer;
            var _local_4:ICheckBoxWindow;
            this._chatList.removeListItems();
            this._habboHelp._Str_3977._Str_7724 = true;
            var k:Vector.<InstantMessageRegistryItem> = this._habboHelp._Str_3977._Str_5150(this._habboHelp._Str_2662);
            for each (_local_2 in k)
            {
                _local_3 = (this._chatPrototype.clone() as IWindowContainer);
                _local_3.findChildByName("chat_text").caption = _local_2.text;
                _local_3.id = _local_2.index;
                _local_3.procedure = this._Str_17227;
                _local_4 = (_local_3.findChildByName("chat_check") as ICheckBoxWindow);
                _local_4._Str_2365 = _local_2.selected;
                this._chatList.addListItem(_local_3);
            }
        }

        private function _Str_17227(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:ICheckBoxWindow;
            var _local_5:InstantMessageRegistryItem;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = _arg_2.id;
                if ((_arg_2 is ITextLinkWindow))
                {
                    _local_3 = _arg_2.parent.id;
                    _local_4 = ((_arg_2.parent as IWindowContainer).findChildByName("chat_check") as ICheckBoxWindow);
                }
                else
                {
                    if ((_arg_2 is ICheckBoxWindow))
                    {
                        _local_3 = _arg_2.parent.id;
                        _local_4 = (_arg_2 as ICheckBoxWindow);
                    }
                }
                _local_5 = this._habboHelp._Str_3977._Str_2990(this._habboHelp._Str_2662, _local_3);
                if (_local_5)
                {
                    _local_5.selected = (!(_local_5.selected));
                    _local_4._Str_2365 = _local_5.selected;
                }
            }
        }

        private function _Str_24731(k:WindowEvent=null):void
        {
            if (this._helpDialog == null)
            {
                this._Str_2826();
            }
            this._currentTopic = this._Str_21261(k.target.name);
            this._Str_3615(MESSAGE_CONTAINER);
        }

        private function _Str_24715():Boolean
        {
            return ((this._contentModerationType == HabboHelp._Str_4786) || (this._contentModerationType == HabboHelp._Str_4459)) || (this._contentModerationType == HabboHelp._Str_4490);
        }

        private function _Str_24500():Boolean
        {
            if (((this._Str_24715()) || (this._Str_19840())))
            {
                this._Str_3615(REASON_CONTAINER);
                this._Str_18243();
                return true;
            }
            return false;
        }

        private function _Str_25232():Boolean
        {
            this._Str_16001();
            if (this._habboHelp._Str_2662 <= 0)
            {
                this._habboHelp.windowManager._Str_5947("${generic.alert.title}", "${help.cfh.error.no_user_data}", 0, null);
                this.closeWindow();
                return false;
            }
            return true;
        }

        private function _Str_21261(k:String):_Str_3509
        {
            var _local_2:CallForHelpCategoryData;
            var _local_3:_Str_3509;
            for each (_local_2 in this._habboHelp._Str_9001)
            {
                for each (_local_3 in _local_2._Str_14841)
                {
                    if (_local_3.name == k)
                    {
                        return _local_3;
                    }
                }
            }
            return null;
        }

        private function _Str_17133():void
        {
            var k:UserRegistryItem;
            switch (this._contentModerationType)
            {
                case HabboHelp._Str_4786:
                    this._view.findChildByName("reported_user_avatar").visible = false;
                    this._view.findChildByName("user_info_title").visible = false;
                    this._view.findChildByName("reported_user_name").caption = this._habboHelp._Str_5721._Str_16366;
                    return;
                case HabboHelp._Str_4459:
                case HabboHelp._Str_4490:
                    this._view.findChildByName("reported_user_avatar").visible = false;
                    this._view.findChildByName("user_info_title").visible = false;
                    this._view.findChildByName("reported_user_name").visible = false;
                    return;
                default:
                    if (this._habboHelp._Str_2662 > 0)
                    {
                        k = this._habboHelp._Str_17447._Str_4666(this._habboHelp._Str_2662);
                        if (k)
                        {
                            this._reportedUserName = k.userName;
                            _Str_2483(IWidgetWindow(this._view.findChildByName("reported_user_avatar")).widget).figure = k.figure;
                        }
                        else
                        {
                            this._view.findChildByName("reported_user_avatar").visible = false;
                            this._reportedUserName = this._habboHelp._Str_5842;
                        }
                        this._view.findChildByName("reported_user_name").caption = this._reportedUserName;
                    }
            }
        }
    }
}
