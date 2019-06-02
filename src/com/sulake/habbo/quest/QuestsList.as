package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.habbo.utils._Str_3942;
    import com.sulake.habbo.quest.events.QuestsListEvent;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.help.enum.WelcomeNotificationAlignment;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7532;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7454;
    import com.sulake.habbo.window.utils._Str_2418;

    public class QuestsList implements IDisposable 
    {
        private static const _Str_18107:int = 5;
        private static const _Str_17206:int = 10;
        private static const _Str_16045:int = 10;
        private static const _Str_18653:int = 30;

        private var _questEngine:HabboQuestEngine;
        private var _window:IFrameWindow;
        private var _list:IItemListWindow;
        private var _scrollV:IScrollbarWindow;
        private var _showToolbarNotification:Boolean = true;
        private var _hasActiveQuest:Boolean;
        private var _toggle:_Str_3942;
        private var _quests:Array;
        private var _msecsToRefresh:int = 1000;

        public function QuestsList(k:HabboQuestEngine)
        {
            this._quests = new Array();
            super();
            this._questEngine = k;
            this._questEngine.events.addEventListener(QuestsListEvent.QUESTS, this._Str_20007);
        }

        public function dispose():void
        {
            if (this._questEngine)
            {
                this._questEngine.events.removeEventListener(QuestsListEvent.QUESTS, this._Str_20007);
                this._questEngine = null;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._toggle)
            {
                this._toggle.dispose();
                this._toggle = null;
            }
            this._list = null;
            this._scrollV = null;
            this._quests = null;
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function isVisible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        public function _Str_2960():void
        {
            this.close();
        }

        public function onToolbarClick():void
        {
            if (!this._window)
            {
                this._questEngine._Str_18428();
                return;
            }
            if (((!(this._toggle)) || (this._toggle.disposed)))
            {
                this._toggle = new _Str_3942(this._window, this._window.desktop, this._questEngine._Str_18428, this.close);
            }
            this._toggle.toggle();
            this._showToolbarNotification = false;
        }

        private function _Str_20007(k:QuestsListEvent):void
        {
            this._Str_8212(k.quests, true);
        }

        private function _Str_8212(k:Array, _arg_2:Boolean):void
        {
            this._quests = [];
            var _local_3:_Str_2455;
            for each (_local_3 in k)
            {
                if (!this._questEngine._Str_7575(_local_3))
                {
                    this._quests.push(_local_3);
                }
            }
            if (((!(this.isVisible())) && (!(_arg_2))))
            {
                return;
            }
            this.refresh(false);
            this._window.visible = true;
            this._window.activate();
            this._hasActiveQuest = false;
            for each (_local_3 in k)
            {
                if (_local_3.accepted)
                {
                    this._hasActiveQuest = true;
                }
            }
        }

        private function refresh(k:Boolean):void
        {
            var _local_3:Boolean;
            this._Str_2755();
            this._list.autoArrangeItems = false;
            var _local_2:int;
            while (true)
            {
                if (_local_2 < this._quests.length)
                {
                    this._Str_2966(true, _local_2, this._quests[_local_2], k);
                }
                else
                {
                    _local_3 = this._Str_2966(false, _local_2, null, k);
                    if (_local_3)
                    {
                        break;
                    }
                }
                _local_2++;
            }
            this._list.autoArrangeItems = true;
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._questEngine.getXmlWindow("Quests"));
            this._window.findChildByTag("close").procedure = this._Str_3046;
            this._list = IItemListWindow(this._window.findChildByName("quest_list"));
            this._scrollV = IScrollbarWindow(this._window.findChildByName("scroller"));
            this._window.center();
            this._list.spacing = _Str_17206;
        }

        private function _Str_2966(k:Boolean, _arg_2:int, _arg_3:_Str_2455, _arg_4:Boolean):Boolean
        {
            var _local_5:IWindowContainer = IWindowContainer(this._list.getListItemAt(_arg_2));
            var _local_6:Boolean;
            if (_local_5 == null)
            {
                if (!k)
                {
                    return true;
                }
                _local_5 = this._Str_19203(this._Str_17443, this._Str_8215);
                this._list.addListItem(_local_5);
                _local_6 = true;
            }
            if (k)
            {
                if (_arg_4)
                {
                    this._Str_17692(_local_5, _arg_3);
                }
                else
                {
                    this.refreshEntryDetails(_local_5, _arg_3);
                }
                _local_5.visible = true;
            }
            else
            {
                _local_5.visible = false;
            }
            return false;
        }

        public function _Str_19203(k:Function, _arg_2:Function):IWindowContainer
        {
            var _local_3:IWindowContainer = IWindowContainer(this._questEngine.getXmlWindow("QuestEntry"));
            var _local_4:IWindowContainer = IWindowContainer(this._questEngine.getXmlWindow("Campaign"));
            var _local_5:IWindowContainer = IWindowContainer(this._questEngine.getXmlWindow("Quest"));
            var _local_6:IWindowContainer = IWindowContainer(this._questEngine.getXmlWindow("EntryArrows"));
            var _local_7:IWindowContainer = IWindowContainer(this._questEngine.getXmlWindow("CampaignCompleted"));
            _local_3.addChild(_local_4);
            _local_3.addChild(_local_5);
            _local_3.addChild(_local_7);
            _local_3.addChild(_local_6);
            _local_5.findChildByName("accept_button").procedure = k;
            _local_5.findChildByName("cancel_region").procedure = _arg_2;
            _local_3.findChildByName("hint_txt").visible = false;
            _local_3.findChildByName("link_region").visible = false;
            var _local_8:IWindow = _local_3.findChildByName("cancel_region");
            var _local_9:IWindow = _local_3.findChildByName("cancel_txt");
            _local_8.width = _local_9.width;
            _local_8.x = ((_local_5.width - _local_8.width) - _Str_16045);
            _local_5.x = ((_local_4.x + _local_4.width) + _Str_18107);
            _local_3.width = (_local_5.x + _local_5.width);
            _local_7.x = _local_5.x;
            this._Str_19570(_local_3);
            return _local_3;
        }

        public function _Str_19570(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = IWindowContainer(k.findChildByName("campaign_container"));
            var _local_3:IWindowContainer = IWindowContainer(k.findChildByName("quest_container"));
            var _local_4:IWindowContainer = IWindowContainer(k.findChildByName("entry_arrows_cont"));
            _local_2.height = _local_3.height;
            k.height = _local_3.height;
            _local_4.x = ((_local_2.x + _local_2.width) - 2);
            _local_4.y = (Math.floor(((_local_2.height - _local_4.height) / 2)) + 1);
            _local_2.findChildByName("completion_txt").y = (_local_2.height - _Str_18653);
            var _local_5:int = 2;
            var _local_6:IWindow = _local_2.findChildByName("bg_bottom");
            _local_6.height = Math.floor(((_local_2.height - (2 * _local_5)) / 2));
            _local_6.y = (_local_5 + _local_6.height);
        }

        public function refreshEntryDetails(k:IWindowContainer, _arg_2:_Str_2455):void
        {
            k.findChildByName("campaign_header_txt").caption = this._questEngine._Str_15926(_arg_2);
            k.findChildByName("completion_txt").caption = ((_arg_2._Str_18579 + "/") + _arg_2._Str_25129);
            this._questEngine._Str_19396(k, _arg_2, true);
            this.setColor(k, "bg", _arg_2.accepted, 4290944315, 4284769380);
            this.setColor(k, "bg_top", _arg_2.accepted, 0xFFFFD788, 4290427578);
            this.setColor(k, "bg_bottom", _arg_2.accepted, 0xFFFFC758, 4289440683);
            k.findChildByName("completion_bg_red_bitmap").visible = ((!(_arg_2._Str_6695)) && (_arg_2._Str_18579 < 1));
            k.findChildByName("completion_bg_blue_bitmap").visible = ((!(_arg_2._Str_6695)) && (_arg_2._Str_18579 > 0));
            k.findChildByName("completion_bg_green_bitmap").visible = _arg_2._Str_6695;
            k.findChildByName("arrow_0").visible = (!(_arg_2.accepted));
            k.findChildByName("arrow_1").visible = _arg_2.accepted;
            k.findChildByName("quest_container").visible = (!(_arg_2._Str_6695));
            k.findChildByName("campaign_completed_container").visible = _arg_2._Str_6695;
            if (!_arg_2._Str_6695)
            {
                this._Str_19824(IWindowContainer(k.findChildByName("quest_container")), _arg_2);
                this._Str_17692(k, _arg_2);
            }
        }

        private function _Str_19824(k:IWindowContainer, _arg_2:_Str_2455):void
        {
            k.findChildByName("quest_header_txt").caption = this._questEngine._Str_23055(_arg_2);
            k.findChildByName("desc_txt").caption = this._questEngine._Str_20120(_arg_2);
            k.findChildByName("cancel_txt").visible = _arg_2.accepted;
            k.findChildByName("cancel_region").visible = _arg_2.accepted;
            k.findChildByName("accept_button").visible = (!(_arg_2.accepted));
            k.findChildByName("accept_button").id = _arg_2.id;
            this.setColor(k, null, _arg_2.accepted, 15982264, 0xC8C8C8);
            this.setColor(k, "quest_header", _arg_2.accepted, 15577658, 0x8D8D8D);
            ITextWindow(k.findChildByName("quest_header_txt")).textColor = ((_arg_2.accepted) ? 0xFFFFFFFF : 4281808695);
            this._questEngine._Str_19955(k, _arg_2);
            this._questEngine._Str_19816((_arg_2._Str_3935 < 1), k, _arg_2.activityPointType, _arg_2._Str_12939);
            k.findChildByName("delay_desc_txt").visible = (_arg_2._Str_3935 > 0);
            k.findChildByName("delay_txt").visible = (_arg_2._Str_3935 > 0);
            k.findChildByName("desc_txt").visible = (_arg_2._Str_3935 < 1);
        }

        public function _Str_17692(k:IWindowContainer, _arg_2:_Str_2455):Boolean
        {
            var _local_3:int;
            var _local_4:String;
            if (k.findChildByName("delay_desc_txt").visible)
            {
                _local_3 = _arg_2._Str_3935;
                if (_local_3 > 0)
                {
                    _local_4 = FriendlyTime.format(this._questEngine.localization, _local_3);
                    k.findChildByName("delay_txt").caption = _local_4;
                }
                else
                {
                    this._Str_19824(k, _arg_2);
                    return true;
                }
            }
            return false;
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
                _local_3 = (this._questEngine.getInteger("new.identity", 0) > 0);
                if ((((_local_3) && (this._showToolbarNotification)) && (!(this._hasActiveQuest))))
                {
                    this._showToolbarNotification = false;
                    this._questEngine._Str_2602._Str_8205(HabboToolbarIconEnum.QUESTS, "quests.rejectnotification", WelcomeNotificationAlignment.LEFT);
                }
            }
        }

        private function _Str_17443(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:int = _arg_2.id;
            Logger.log(("Accept quest: " + _local_3));
            this._questEngine.send(new _Str_7532(_local_3));
            this._window.visible = false;
        }

        private function _Str_8215(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Reject quest");
            this._questEngine.send(new _Str_7454());
        }

        private function setColor(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:uint, _arg_5:uint):void
        {
            ((_arg_2 == null) ? k : k.findChildByName(_arg_2)).color = ((_arg_3) ? _arg_4 : _arg_5);
        }

        public function _Str_21745(k:_Str_2418, _arg_2:WindowEvent):void
        {
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) || (_arg_2.type == WindowEvent.WINDOW_EVENT_CANCEL)))
            {
                k.dispose();
            }
        }

        public function update(k:uint):void
        {
            if (((this._window == null) || (!(this._window.visible))))
            {
                return;
            }
            this._msecsToRefresh = (this._msecsToRefresh - k);
            if (this._msecsToRefresh > 0)
            {
                return;
            }
            this._msecsToRefresh = NextQuestTimer._Str_10934;
            this.refresh(true);
        }
    }
}
