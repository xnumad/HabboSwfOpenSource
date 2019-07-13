package com.sulake.habbo.campaign.calendar
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.campaign.HabboCampaigns;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.Stage;
    import flash.events.Event;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.session.product.IProductData;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.parser.campaign.CampaignCalendarData;

    public class CalendarView implements IGetImageListener 
    {
        private static const _Str_3226:int = 75;

        private var _controller:HabboCampaigns;
        private var _modal:_Str_2784;
        private var _selectedIndex:int = -1;
        private var _itemsOnScreen:int;

        public function CalendarView(k:HabboCampaigns, _arg_2:IHabboWindowManager)
        {
            var _local_7:IWindowContainer;
            super();
            this._controller = k;
            this._modal = _arg_2.buildModalDialogFromXML(XML(this._controller.assets.getAssetByName("campaign_calendar_xml").content));
            if ((((!(this._modal)) || (!(this._modal._Str_2429))) || (!(this.itemList))))
            {
                return;
            }
            var _local_3:IWindowContainer = (this.itemList.getListItemAt(0) as IWindowContainer);
            this.itemList.removeListItems();
            this.itemList.disableAutodrag = true;
            var _local_4:int = this._Str_6223._Str_8399;
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_7 = CalendarItem._Str_15147(_local_3, this._Str_6223, _local_5);
                _local_7.procedure = this._Str_3055;
                this.itemList.addListItem(_local_7);
                _local_5++;
            }
            this.itemList.scrollStepH = (_local_3.width / this.itemList.maxScrollH);
            var _local_6:Stage = this._controller.context.displayObjectContainer.stage;
            _local_6.addEventListener(Event.RESIZE, this.onResize);
            this.window.procedure = this._Str_3055;
            this.onResize(null);
            this._Str_10170(this._controller._Str_6223._Str_5472);
        }

        public function dispose():void
        {
            var k:Stage;
            if (this._modal != null)
            {
                k = this._controller.context.displayObjectContainer.stage;
                k.removeEventListener(Event.RESIZE, this.onResize);
                this._modal.dispose();
                this._modal = null;
            }
        }

        public function _Str_22076(k:IProductData, _arg_2:String=null):void
        {
            this._Str_5311("${campaign.calendar.heading.product.received}", k.name);
            this._Str_13922(_arg_2);
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            this._Str_13922(_arg_2);
        }

        private function _Str_13922(k:Object):void
        {
            var _local_2:IWindowContainer = (this.itemList.getListItemAt(this._selectedIndex) as IWindowContainer);
            if (!_local_2)
            {
                return;
            }
            CalendarItem._Str_13922(_local_2, k);
        }

        public function imageFailed(k:int):void
        {
        }

        public function hide():void
        {
            this._controller._Str_24884();
        }

        private function onResize(k:Event):void
        {
            var _local_2:Stage = this._controller.context.displayObjectContainer.stage;
            this._itemsOnScreen = Math.floor(((_local_2.stageWidth - (_Str_3226 * 2)) / (this._Str_13395 + this._Str_18214)));
            this._modal._Str_2429.width = this._Str_18893(this._itemsOnScreen);
            var _local_3:IWindow = this.window.findChildByName("btn_forward");
            if (_local_3)
            {
                _local_3.x = ((this._Str_8780 - this.window.findChildByName("btn_back").x) - _local_3.width);
            }
            _local_3 = this.window.findChildByName("calendar_scrollbar");
            if (_local_3)
            {
                _local_3.width = this._Str_8780;
            }
            this.window.center();
            if (this._selectedIndex > -1)
            {
                this._Str_10170(this._selectedIndex);
            }
        }

        private function _Str_3055(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (k.type != WindowMouseEvent.DOWN)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "btn_present":
                    _local_3 = this.itemList.getListItemIndex(k.target.parent);
                    if (_local_3 < 0)
                    {
                        return;
                    }
                    if (_local_3 != this._selectedIndex)
                    {
                        this._Str_10170(_local_3);
                    }
                    else
                    {
                        this._controller._Str_23249(this._selectedIndex);
                    }
                    return;
                case "btn_back":
                    this._Str_10170((this._selectedIndex - 1));
                    return;
                case "btn_forward":
                    this._Str_10170((this._selectedIndex + 1));
                    return;
                case "btn_force_open":
                    this._controller._Str_22750(this._selectedIndex);
                    return;
                case "header_button_close":
                    this.hide();
                    return;
            }
        }

        private function _Str_10170(k:int):void
        {
            var _local_3:IButtonWindow;
            var _local_5:IWindowContainer;
            var _local_6:String;
            var _local_7:String;
            if (((k < 0) || (k >= this._Str_6223._Str_8399)))
            {
                return;
            }
            this._selectedIndex = k;
            this.itemList.scrollH = this._Str_24961(this._selectedIndex);
            var _local_2:int;
            while (_local_2 < this._Str_6223._Str_8399)
            {
                _local_5 = (this.itemList.getListItemAt(_local_2) as IWindowContainer);
                CalendarItem._Str_3820(_local_5, this._Str_6223, _local_2, k);
                _local_2++;
            }
            CalendarSpinnerUtil._Str_25753(this, this._selectedIndex);
            if (this._controller.isGodMode)
            {
                _local_3 = (this.window.findChildByName("btn_force_open") as IButtonWindow);
                _local_3.visible = true;
            }
            var _local_4:int = CalendarItem._Str_9903(this._Str_6223, k);
            if (this._selectedIndex < 0)
            {
                this._Str_5311(null, null);
                if (_local_3)
                {
                    _local_3.disable();
                }
            }
            else
            {
                switch (_local_4)
                {
                    case CalendarItem._Str_8424:
                        _local_6 = "${campaign.calendar.info.available.desktop}";
                        break;
                    case CalendarItem._Str_10321:
                        _local_6 = "${campaign.calendar.info.expired}";
                        break;
                    case CalendarItem._Str_10951:
                        _local_6 = "${campaign.calendar.info.future}";
                        break;
                    case CalendarItem._Str_5399:
                        _local_6 = "${campaign.calendar.info.unlocked}";
                        break;
                }
                _local_7 = ((this._controller.localizationManager.getLocalization("campaign.calendar.heading.day")) || (""));
                _local_7 = _local_7.replace("%number%", (this._selectedIndex + 1));
                this._Str_5311(_local_7, _local_6);
                if (_local_3)
                {
                    if (_local_4 != CalendarItem._Str_5399)
                    {
                        _local_3.enable();
                    }
                    else
                    {
                        _local_3.disable();
                    }
                }
            }
        }

        private function _Str_5311(k:String, _arg_2:String):void
        {
            (this.window.findChildByName("info_heading") as ITextWindow).text = ((k) || (""));
            (this.window.findChildByName("info_body") as ITextWindow).text = ((_arg_2) || (""));
        }

        private function _Str_26047(k:int):void
        {
        }

        public function get window():IFrameWindow
        {
            return (this._modal) ? (this._modal._Str_2429 as IFrameWindow) : null;
        }

        private function _Str_26368(k:int):int
        {
            return Math.floor((((this.itemList.scrollH * this.itemList.maxScrollH) + k) / ((this.itemList.maxScrollH + this._Str_8780) / this.itemList.numListItems)));
        }

        private function _Str_24961(k:int):Number
        {
            return (this._Str_18893(k) - ((this._Str_8780 - this._Str_13395) * 0.5)) / this.itemList.maxScrollH;
        }

        public function _Str_18893(k:int):Number
        {
            return (k * this._Str_13395) + (Math.max(0, (k - 1)) * this._Str_18214);
        }

        public function get itemList():IItemListWindow
        {
            return (this.window) ? (this.window.findChildByName("calendar_itemlist") as IItemListWindow) : null;
        }

        public function get _Str_13395():int
        {
            return ((this.itemList) && (this.itemList.numListItems > 0)) ? this.itemList.getListItemAt(0).width : 0;
        }

        public function get _Str_18214():int
        {
            return (this.itemList) ? this.itemList.spacing : 0;
        }

        public function get _Str_8780():int
        {
            return ((this.window) && (this.window.content)) ? this.window.content.width : 0;
        }

        private function get _Str_6223():CampaignCalendarData
        {
            return this._controller._Str_6223;
        }
    }
}
