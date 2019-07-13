package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.handler.InfoStandWidgetHandler;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentrableBotInfostandUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserTagsUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfostandUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetFigureUpdateEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;

    public class InfoStandWidget extends ConversionTrackingWidget 
    {
        private static const USER_VIEW:String = "infostand_user_view";
        private static const FURNI_VIEW:String = "infostand_furni_view";
        private static const PET_VIEW:String = "infostand_pet_view";
        private static const BOT_VIEW:String = "infostand_bot_view";
        private static const RENTABLE_BOT_VIEW:String = "infostand_rentable_bot_view";
        private static const JUKEBOX_VIEW:String = "infostand_jukebox_view";
        private static const CRACKABLE_FURNI_VIEW:String = "infostand_crackable_furni_view";
        private static const SONGDISK_VIEW:String = "infostand_songdisk_view";
        private static const UPDATE_VIEW_INTERVAL:int = 3000;

        private var _furniView:InfoStandFurniView;
        private var _userView:InfoStandUserView;
        private var _petView:InfoStandPetView;
        private var _botView:InfoStandBotView;
        private var _rentableBotView:InfoStandRentableBotView;
        private var _jukeboxView:InfoStandJukeboxView;
        private var _crackableFurniView:InfoStandCrackableFurniView;
        private var _songDiskView:InfoStandSongDiskView;
        private var _ownTags:Array;
        private var _userData:InfoStandUserData;
        private var _furniData:InfoStandFurniData;
        private var _petData:InfoStandPetData;
        private var _rentableBotdata:InfoStandRentableBotData;
        private var _mainContainer:IWindowContainer;
        private var _updateTimer:Timer;
        private var _config:IHabboConfigurationManager;

        public function InfoStandWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager, _arg_6:IHabboCatalog)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._config = _arg_5;
            this._furniView = new InfoStandFurniView(this, FURNI_VIEW, _arg_6);
            this._userView = new InfoStandUserView(this, USER_VIEW);
            this._petView = new InfoStandPetView(this, PET_VIEW, _arg_6);
            this._botView = new InfoStandBotView(this, BOT_VIEW);
            this._rentableBotView = new InfoStandRentableBotView(this, RENTABLE_BOT_VIEW, _arg_6);
            this._jukeboxView = new InfoStandJukeboxView(this, JUKEBOX_VIEW, _arg_6);
            this._crackableFurniView = new InfoStandCrackableFurniView(this, CRACKABLE_FURNI_VIEW, _arg_6);
            this._songDiskView = new InfoStandSongDiskView(this, SONGDISK_VIEW, _arg_6);
            this._userData = new InfoStandUserData();
            this._furniData = new InfoStandFurniData();
            this._petData = new InfoStandPetData();
            this._rentableBotdata = new InfoStandRentableBotData();
            this._updateTimer = new Timer(UPDATE_VIEW_INTERVAL);
            this._updateTimer.addEventListener(TimerEvent.TIMER, this.refreshPetInfoStand);
            this.mainContainer.visible = false;
            this.handler.widget = this;
        }

        public function get handler():InfoStandWidgetHandler
        {
            return _Str_2470 as InfoStandWidgetHandler;
        }

        public function get _Str_21463():InfoStandFurniView
        {
            return this._furniView;
        }

        override public function get mainWindow():IWindow
        {
            return this.mainContainer;
        }

        public function get config():IHabboConfigurationManager
        {
            return this._config;
        }

        public function get mainContainer():IWindowContainer
        {
            if (this._mainContainer == null)
            {
                this._mainContainer = (windowManager.createWindow("infostand_main_container", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.NULL, WindowParam.WINDOW_PARAM_NULL, new Rectangle(0, 0, 50, 100)) as IWindowContainer);
                this._mainContainer.tags.push("room_widget_infostand");
                this._mainContainer.background = true;
                this._mainContainer.color = 0;
            }
            return this._mainContainer;
        }

        public function _Str_22447(k:int, _arg_2:int, _arg_3:int, _arg_4:String):void
        {
            var _local_6:String;
            if (((!(this.userData)) || (!(this.userData._Str_3313 == k))))
            {
                return;
            }
            if (!this.mainContainer)
            {
                return;
            }
            var _local_5:IWindow = this.mainContainer.findChildByName(USER_VIEW);
            if (((!(_local_5)) || (!(_local_5.visible))))
            {
                return;
            }
            this._userView._Str_21116();
            if (_arg_2 != -1)
            {
                _local_6 = this.handler.container.sessionDataManager.getGroupBadgeId(_arg_2);
                this.userData.groupId = _arg_2;
                this.userData._Str_5235 = _local_6;
                this.userData.groupName = _arg_4;
                this._userView._Str_16673(_local_6);
            }
        }

        public function getXmlWindow(name:String):IWindow
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var window:IWindow;
            try
            {
                asset = assets.getAssetByName(name);
                xmlAsset = XmlAsset(asset);
                window = windowManager.buildFromXML(XML(xmlAsset.content));
            }
            catch(e:Error)
            {
                Logger.log(("[InfoStandWidget] Missing window XML: " + name));
            }
            return window;
        }

        public function setRelationshipStatus(k:int, _arg_2:Map):void
        {
            if (this._userData.userId == k)
            {
                this._userView._Str_25662(_arg_2);
            }
        }

        override public function dispose():void
        {
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
            this._updateTimer = null;
            if (this._userView)
            {
                this._userView.dispose();
            }
            this._userView = null;
            if (this._furniView)
            {
                this._furniView.dispose();
            }
            this._furniView = null;
            if (this._botView)
            {
                this._botView.dispose();
            }
            this._botView = null;
            if (this._rentableBotView)
            {
                this._rentableBotView.dispose();
            }
            this._rentableBotView = null;
            if (this._petView)
            {
                this._petView.dispose();
            }
            this._petView = null;
            if (this._jukeboxView)
            {
                this._jukeboxView.dispose();
            }
            this._jukeboxView = null;
            if (this._crackableFurniView)
            {
                this._crackableFurniView.dispose();
            }
            this._crackableFurniView = null;
            if (this._songDiskView)
            {
                this._songDiskView.dispose();
            }
            this._songDiskView = null;
            super.dispose();
        }

        override public function registerUpdateEvents(eventDispatcher:IEventDispatcher):void
        {
            if (eventDispatcher == null)
            {
                return;
            }
            eventDispatcher.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_SELECTED, this.objectSelectedHandler);
            eventDispatcher.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this.objectDeselectedHandler);
            eventDispatcher.addEventListener(RoomWidgetRoomObjectUpdateEvent.USER_REMOVED, this.objectRemovedHandler);
            eventDispatcher.addEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this.objectRemovedHandler);
            eventDispatcher.addEventListener(RoomWidgetUpdateInfostandUserEvent.OWN_USER, this.userInstandUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetUpdateInfostandUserEvent.PEER, this.userInstandUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetUpdateInfostandUserEvent.BOT, this.botInfostandUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetFurniInfostandUpdateEvent.FURNI, this.furniUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetRentrableBotInfostandUpdateEvent.RENTABLE_BOT, this.rentableBotInfostandUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetUserTagsUpdateEvent.USER_TAGS, this.userTagsUpdatedHandler);
            eventDispatcher.addEventListener(RoomWidgetPetInfostandUpdateEvent.PET_INFO, this.petInfostandUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS, this.petCommandsUpdateHandler);
            eventDispatcher.addEventListener(RoomWidgetPetCommandsUpdateEvent.OPEN_PET_TRAINING, this.openPetTraningHandler);
            eventDispatcher.addEventListener(RoomWidgetPetCommandsUpdateEvent.CLOSE_PET_TRAINING, this.closePetTrainingHandler);
            eventDispatcher.addEventListener(RoomWidgetSongUpdateEvent.PLAYING_CHANGED, this.songUpdatedHandler);
            eventDispatcher.addEventListener(RoomWidgetSongUpdateEvent.DATA_RECEIVED, this.songUpdatedHandler);
            eventDispatcher.addEventListener(RoomWidgetPetFigureUpdateEvent.PET_FIGURE_UPDATE, this.petFigureUpdateHandler);
            super.registerUpdateEvents(eventDispatcher);
        }

        override public function unregisterUpdateEvents(eventDispatcher:IEventDispatcher):void
        {
            if (eventDispatcher == null)
            {
                return;
            }
            eventDispatcher.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_SELECTED, this.objectSelectedHandler);
            eventDispatcher.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this.objectDeselectedHandler);
            eventDispatcher.removeEventListener(RoomWidgetRoomObjectUpdateEvent.USER_REMOVED, this.objectRemovedHandler);
            eventDispatcher.removeEventListener(RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED, this.objectRemovedHandler);
            eventDispatcher.removeEventListener(RoomWidgetUpdateInfostandUserEvent.OWN_USER, this.userInstandUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetUpdateInfostandUserEvent.PEER, this.userInstandUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetUpdateInfostandUserEvent.BOT, this.botInfostandUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetFurniInfostandUpdateEvent.FURNI, this.furniUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetRentrableBotInfostandUpdateEvent.RENTABLE_BOT, this.rentableBotInfostandUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetUserTagsUpdateEvent.USER_TAGS, this.userTagsUpdatedHandler);
            eventDispatcher.removeEventListener(RoomWidgetPetInfostandUpdateEvent.PET_INFO, this.petInfostandUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS, this.petCommandsUpdateHandler);
            eventDispatcher.removeEventListener(RoomWidgetPetCommandsUpdateEvent.OPEN_PET_TRAINING, this.openPetTraningHandler);
            eventDispatcher.removeEventListener(RoomWidgetPetCommandsUpdateEvent.CLOSE_PET_TRAINING, this.closePetTrainingHandler);
            eventDispatcher.removeEventListener(RoomWidgetSongUpdateEvent.PLAYING_CHANGED, this.songUpdatedHandler);
            eventDispatcher.removeEventListener(RoomWidgetSongUpdateEvent.DATA_RECEIVED, this.songUpdatedHandler);
            eventDispatcher.removeEventListener(RoomWidgetPetFigureUpdateEvent.PET_FIGURE_UPDATE, this.petFigureUpdateHandler);
        }

        public function get botData():InfoStandRentableBotData
        {
            return this._rentableBotdata;
        }

        public function get userData():InfoStandUserData
        {
            return this._userData;
        }

        public function get furniData():InfoStandFurniData
        {
            return this._furniData;
        }

        public function get petData():InfoStandPetData
        {
            return this._petData;
        }

        private function refreshPetInfoStand(k:TimerEvent):void
        {
            if (this._petView == null)
            {
                return;
            }
            messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE, this._petView._Str_23859()));
        }

        private function userInstandUpdateHandler(updateEvent:RoomWidgetUpdateInfostandUserEvent):void
        {
            this.userData._Str_5479(updateEvent);
            this._userView.update(updateEvent);
            this._Str_3734(USER_VIEW);
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
        }

        private function botInfostandUpdateHandler(updateEvent:RoomWidgetUpdateInfostandUserEvent):void
        {
            this.userData._Str_5479(updateEvent);
            this._botView.update(updateEvent);
            this._Str_3734(BOT_VIEW);
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
        }

        private function rentableBotInfostandUpdateHandler(updateEvent:RoomWidgetRentrableBotInfostandUpdateEvent):void
        {
            this.botData._Str_5479(updateEvent);
            this._rentableBotView.update(updateEvent);
            this._Str_3734(RENTABLE_BOT_VIEW);
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
        }

        private function furniUpdateHandler(updateEvent:RoomWidgetFurniInfostandUpdateEvent):void
        {
            this.furniData._Str_5479(updateEvent);
            if (updateEvent.extraParam == RoomWidgetEnumItemExtradataParameter.JUKEBOX)
            {
                this._jukeboxView.update(updateEvent);
                this._Str_3734(JUKEBOX_VIEW);
            }
            else
            {
                if (updateEvent.extraParam.indexOf(RoomWidgetEnumItemExtradataParameter.SONGDISK) != -1)
                {
                    this._songDiskView.update(updateEvent);
                    this._Str_3734(SONGDISK_VIEW);
                }
                else
                {
                    if (updateEvent.extraParam.indexOf(RoomWidgetEnumItemExtradataParameter.CRACKABLE_FURNI) != -1)
                    {
                        this._crackableFurniView.update(updateEvent);
                        this._Str_3734(CRACKABLE_FURNI_VIEW);
                    }
                    else
                    {
                        this._furniView.update(updateEvent);
                        this._Str_3734(FURNI_VIEW);
                    }
                }
            }
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
        }

        private function petInfostandUpdateHandler(updateEvent:RoomWidgetPetInfostandUpdateEvent):void
        {
            this.petData._Str_5479(updateEvent);
            this.userData._Str_2985 = updateEvent._Str_2985;
            this._petView.update(this.petData);
            this._Str_3734(PET_VIEW);
            if (this._updateTimer)
            {
                this._updateTimer.start();
            }
        }

        private function petFigureUpdateHandler(updateEvent:RoomWidgetPetFigureUpdateEvent):void
        {
            this._petView._Str_4497(updateEvent._Str_2508, updateEvent.image);
        }

        private function petCommandsUpdateHandler(updateEvent:RoomWidgetPetCommandsUpdateEvent):void
        {
            var _local_2:Array = updateEvent.commands;
            var _local_3:Array = updateEvent.enabledCommands;
            if (((((this.petData.type == PetTypeEnum.DOG) && (!(this._config.getBoolean("nest.breeding.dog.enabled")))) || ((this.petData.type == PetTypeEnum.CAT) && (!(this._config.getBoolean("nest.breeding.cat.enabled"))))) || ((this.petData.type == PetTypeEnum.PIG) && (!(this._config.getBoolean("nest.breeding.pig.enabled"))))))
            {
                if (_local_2.indexOf(46) != -1)
                {
                    _local_2.splice(_local_2.indexOf(46), 1);
                }
                if (_local_3.indexOf(46) != -1)
                {
                    _local_3.splice(_local_3.indexOf(46), 1);
                }
            }
            this._petView._Str_24853(updateEvent.id, new CommandConfiguration(updateEvent.commands, updateEvent.enabledCommands));
        }

        private function openPetTraningHandler(updateEvent:RoomWidgetUpdateEvent):void
        {
            this._petView._Str_19969();
        }

        private function closePetTrainingHandler(updateEvent:RoomWidgetUpdateEvent):void
        {
            this._petView._Str_23384();
        }

        private function userTagsUpdatedHandler(updateEvent:RoomWidgetUserTagsUpdateEvent):void
        {
            if (updateEvent._Str_11453)
            {
                this._ownTags = updateEvent.tags;
            }
            if (updateEvent.userId != this.userData.userId)
            {
                return;
            }
            if (updateEvent._Str_11453)
            {
                this._userView._Str_17290(updateEvent.tags);
            }
            else
            {
                this._userView._Str_17290(updateEvent.tags, this._ownTags);
            }
        }

        public function _Str_17133(id:int, _arg_2:String, _arg_3:int, _arg_4:String, _arg_5:Boolean):void
        {
            if (id != this.userData.userId)
            {
                return;
            }
            if (this.userData._Str_18577())
            {
                this._botView._Str_7907(_arg_2);
            }
            else
            {
                this._userView._Str_7907(_arg_2);
                this._userView._Str_12782(_arg_4, _arg_5);
                if (this.handler._Str_7745)
                {
                    this._userView.activityPoints = _arg_3;
                }
            }
        }

        public function _Str_22739(k:int, _arg_2:Array):void
        {
            var _local_3:String;
            if (k != this.userData.userId)
            {
                return;
            }
            this.userData.badges = _arg_2;
            if (this.userData._Str_18577())
            {
                this._botView._Str_10630();
            }
            else
            {
                this._userView._Str_10630();
            }
            for each (_local_3 in _arg_2)
            {
                this._Str_21919(_local_3);
            }
        }

        public function _Str_21919(k:String):void
        {
            var _local_2:int = this.userData.badges.indexOf(k);
            if (_local_2 >= 0)
            {
                if (this.userData._Str_18577())
                {
                    this._botView._Str_5605(_local_2, k);
                }
                else
                {
                    this._userView._Str_5605(_local_2, k);
                }
                return;
            }
            if (k == this.userData._Str_5235)
            {
                this._userView._Str_16673(k);
            }
        }

        private function objectSelectedHandler(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            var _local_2:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_INFO, k.id, k.category);
            messageListener.processWidgetMessage(_local_2);
        }

        private function objectRemovedHandler(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            var _local_2:Boolean;
            switch (k.type)
            {
                case RoomWidgetRoomObjectUpdateEvent.FURNI_REMOVED:
                    _local_2 = (k.id == this._furniData.id);
                    break;
                case RoomWidgetRoomObjectUpdateEvent.USER_REMOVED:
                    if ((((!(this._userView == null)) && (!(this._userView.window == null))) && (this._userView.window.visible)))
                    {
                        _local_2 = (k.id == this._userData._Str_3313);
                        break;
                    }
                    if ((((!(this._petView == null)) && (!(this._petView.window == null))) && (this._petView.window.visible)))
                    {
                        _local_2 = (k.id == this._petData.roomIndex);
                        break;
                    }
                    if ((((!(this._botView == null)) && (!(this._botView.window == null))) && (this._botView.window.visible)))
                    {
                        _local_2 = (k.id == this._userData._Str_3313);
                        break;
                    }
                    if ((((!(this._rentableBotView == null)) && (!(this._rentableBotView.window == null))) && (this._rentableBotView.window.visible)))
                    {
                        _local_2 = (k.id == this._rentableBotdata._Str_3313);
                        break;
                    }
            }
            if (_local_2)
            {
                this.close();
            }
        }

        private function songUpdatedHandler(k:RoomWidgetSongUpdateEvent):void
        {
            this._jukeboxView._Str_17571(k);
            this._songDiskView._Str_17571(k);
        }

        public function close():void
        {
            this._Str_2930();
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
        }

        private function objectDeselectedHandler(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            this.close();
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
        }

        private function _Str_2930():void
        {
            var k:int;
            if (this._mainContainer != null)
            {
                k = 0;
                while (k < this._mainContainer.numChildren)
                {
                    this._mainContainer.getChildAt(k).visible = false;
                    k++;
                }
            }
        }

        public function _Str_25620():Boolean
        {
            var k:IWindow;
            if (this._mainContainer != null)
            {
                k = (this._mainContainer.getChildByName(FURNI_VIEW) as IWindow);
                if (k != null)
                {
                    return k.visible;
                }
            }
            return false;
        }

        private function _Str_3734(view:String):void
        {
            this._Str_2930();
            var _local_2:IWindow = (this.mainContainer.getChildByName(view) as IWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.visible = true;
            this.mainContainer.visible = true;
            this.mainContainer.width = _local_2.width;
            this.mainContainer.height = _local_2.height;
        }

        public function _Str_10301():void
        {
            var k:IWindow;
            var _local_2:int;
            while (_local_2 < this.mainContainer.numChildren)
            {
                k = this.mainContainer.getChildAt(_local_2);
                if (k.visible)
                {
                    this.mainContainer.width = k.width;
                    this.mainContainer.height = k.height;
                }
                _local_2++;
            }
        }
    }
}
