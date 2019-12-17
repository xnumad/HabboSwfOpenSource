package com.sulake.habbo.campaign
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.campaign.calendar.CalendarView;
    import com.sulake.habbo.communication.messages.parser.campaign.CampaignCalendarData;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDRoomEngine;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.campaign._Str_9003;
    import com.sulake.habbo.communication.messages.incoming.campaign._Str_9045;
    import com.sulake.habbo.communication.messages.parser.campaign._Str_7028;
    import com.sulake.habbo.communication.messages.parser.campaign._Str_7637;
    import com.sulake.habbo.communication.messages.outgoing._Str_96._Str_12472;
    import com.sulake.habbo.communication.messages.outgoing._Str_96._Str_12173;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.IGetImageListener;

    public class HabboCampaigns extends Component implements ILinkEventTracker 
    {
        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _windowManager:IHabboWindowManager;
        private var _catalog:IHabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _calendarView:CalendarView;
        private var _calendarData:CampaignCalendarData;
        private var _dayAttempted:int = -1;
        private var _useFakeData:Boolean = false;

        public function HabboCampaigns(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_9003(this._Str_25846));
            this._communicationManager.addHabboConnectionMessageEvent(new _Str_9045(this._Str_24922));
            context.addLinkEventTracker(this);
        }

        private function _Str_25846(k:_Str_9003):void
        {
            var _local_2:_Str_7028 = k.getParser();
            this._calendarData = _local_2.getCampaignCalenderData();
        }

        private function _Str_24922(k:_Str_9045):void
        {
            var _local_2:_Str_7637 = k.getParser();
            if (_local_2._Str_22341)
            {
                this._Str_16700(_local_2.productName, _local_2.customImage, _local_2._Str_8979);
            }
        }

        public function _Str_23249(k:int):void
        {
            this._dayAttempted = k;
            this._communicationManager.connection.send(new _Str_12472(this._calendarData._Str_11123, k));
        }

        public function _Str_22750(k:int):void
        {
            this._dayAttempted = k;
            this._communicationManager.connection.send(new _Str_12173(this._calendarData._Str_11123, k));
        }

        private function _Str_16700(k:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:IProductData = this._sessionDataManager.getProductData(k);
            if (_local_4 != null)
            {
                this._calendarData._Str_10724.push(this._dayAttempted);
                this._dayAttempted = -1;
                if (((_arg_2) && (!(_arg_2 == ""))))
                {
                    this._calendarView._Str_22076(_local_4, (this._Str_25051() + _arg_2));
                }
                else
                {
                    if (((_arg_3) && (!(_arg_3 == ""))))
                    {
                        this._calendarView._Str_22076(_local_4);
                        this._Str_6402(this._calendarView, _arg_3);
                    }
                }
            }
        }

        private function _Str_6402(k:IGetImageListener, _arg_2:String):ImageResult
        {
            var _local_3:ImageResult;
            var _local_4:IFurnitureData;
            _local_4 = this._sessionDataManager.getFloorItemDataByName(_arg_2);
            if (_local_4)
            {
                _local_3 = this._roomEngine.getFurnitureIcon(_local_4.id, k);
            }
            else
            {
                _local_4 = this._sessionDataManager.getWallItemDataByName(_arg_2);
                if (_local_4)
                {
                    _local_3 = this._roomEngine.getWallItemIcon(_local_4.id, k);
                }
            }
            if (((_local_3) && (_local_3.data)))
            {
                k.imageReady(_local_3.id, _local_3.data);
            }
            return _local_3;
        }

        public function get eventUrlPrefix():String
        {
            return "openView/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            if (_local_2[1] == "calendar")
            {
                this._Str_21422();
            }
        }

        private function _Str_21422():void
        {
            if (((!(this._calendarView)) && (this._calendarData)))
            {
                this._calendarView = new CalendarView(this, this._windowManager);
            }
        }

        public function _Str_24884():void
        {
            if (this._calendarView)
            {
                this._calendarView.dispose();
                this._calendarView = null;
            }
        }

        private function _Str_25051():String
        {
            return getProperty("image.library.url");
        }

        public function get _Str_6223():CampaignCalendarData
        {
            return this._calendarData;
        }

        public function get isGodMode():Boolean
        {
            return this._sessionDataManager.isGodMode;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return this._localizationManager;
        }
    }
}
