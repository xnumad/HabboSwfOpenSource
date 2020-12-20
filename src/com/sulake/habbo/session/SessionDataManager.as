package com.sulake.habbo.session
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.product.ProductDataParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.furniture.FurnitureDataParser;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import flash.events.Event;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPublishedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.FigureUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.AccountSafetyLockStatusChangeMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.mysterybox.MysteryBoxKeysMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.UserTagsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.NoobnessLevelMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.InClientLinkMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.preferences.AccountPreferencesEvent;
    import com.sulake.habbo.communication.messages.incoming.users.EmailStatusResultEvent;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import com.sulake.habbo.communication.enum.NoobnessLevelEnum;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
    import com.sulake.habbo.session.events.UserNameUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
    import com.sulake.habbo.communication.messages.parser.mysterybox.MysteryBoxKeysMessageParser;
    import com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionUserTagsEvent;
    import com.sulake.habbo.communication.messages.parser.preferences.AccountPreferencesParser;
    import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
    import com.sulake.habbo.communication.messages.parser.users.EmailStatusParser;
    import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
    import com.sulake.habbo.communication.messages.parser.users.AccountSafetyLockStatusChangeMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.preferences.SetUIFlagsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.WhiperGroupComposer;
    import flash.display.BitmapData;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.window.utils.IConfirmDialog;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.session.talent.TalentEnum;
    import __AS3__.vec.*;
    import com.sulake.iid.*;

    public class SessionDataManager extends Component implements ISessionDataManager 
    {
        public static const SETUP_WITHOUT_COMMUNICATION:uint = 1;

        private var _communicationManager:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _perkManager:PerkManager;
        private var _userId:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _realName:String;
        private var _respectTotal:int = 0;
        private var _respectLeft:int = 0;
        private var _petRespectLeft:int = 0;
        private var _nameChangeAllowed:Boolean = true;
        private var _rights:Array;
        private var _systemOpen:Boolean;
        private var _systemShutDown:Boolean;
        private var _isAuthenticHabbo:Boolean;
        private var _products:Dictionary;
        private var _productParser:ProductDataParser;
        private var _floorItems:Map;
        private var _wallItems:Map;
        private var _furnitureIds:Map;
        private var _furnitureParser:FurnitureDataParser;
        private var _Str_7432:_Str_8883;
        private var _badgeImageManager:BadgeImageManager;
        private var _habboGroupInfoManager:HabboGroupInfoManager;
        private var _ignoredUsersManager:IgnoredUsersManager;
        private var _localizationManager:IHabboLocalizationManager;
        private var _productDataReady:Boolean = false;
        private var _Str_8233:Array;
        private var _Str_6042:Array;
        private var _clubLevel:int;
        private var _securityLevel:int;
        private var _topSecurityLevel:int = 0;
        private var _noobnessLevel:int = -1;
        private var _isAmbassador:Boolean;
        private var _isEmailVerified:Boolean;
        private var _isRoomCameraFollowDisabled:Boolean;
        private var _uiFlags:int;
        private var _accountSafetyLocked:Boolean = false;
        private var _mysteryBoxColor:String;
        private var _mysteryKeyColor:String;
        private var _Str_20020:Boolean = false;
        private var _Str_12845:Boolean = false;
        private var _Str_8108:Timer = null;
        private var _Str_8546:String = null;

        public function SessionDataManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, ((flags & SETUP_WITHOUT_COMMUNICATION) == 0)), new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, false)]));
        }

        private function onConfigurationComplete(k:Event):void
        {
            this._products = new Dictionary();
            this._floorItems = new Map();
            this._wallItems = new Map();
            this._furnitureIds = new Map();
            this.initFurnitureData();
            this.initProductData();
            this.initBadgeImageManager();
        }

        override protected function initComponent():void
        {
            if (this._communicationManager)
            {
                this._communicationManager.addHabboConnectionMessageEvent(new CatalogPublishedMessageEvent(this.onCatalogPublished));
                this._communicationManager.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
                this._communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
                this._communicationManager.addHabboConnectionMessageEvent(new FigureUpdateEvent(this.onFigureUpdate));
                this._communicationManager.addHabboConnectionMessageEvent(new UserChangeMessageEvent(this.onUserChange));
                this._communicationManager.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
                this._communicationManager.addHabboConnectionMessageEvent(new ChangeUserNameResultMessageEvent(this.onChangeUserNameResult));
                this._communicationManager.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(this.onAvailabilityStatus));
                this._communicationManager.addHabboConnectionMessageEvent(new PetRespectFailedEvent(this.onPetRespectFailed));
                this._communicationManager.addHabboConnectionMessageEvent((new RoomReadyMessageEvent(this.onRoomReady) as IMessageEvent));
                this._communicationManager.addHabboConnectionMessageEvent(new AccountSafetyLockStatusChangeMessageEvent(this.onAccountSafetyLockStatusChanged));
                this._communicationManager.addHabboConnectionMessageEvent(new MysteryBoxKeysMessageEvent(this.onMysteryBoxKeys));
                this._communicationManager.addHabboConnectionMessageEvent(new UserTagsMessageEvent(this._Str_7983));
                this._communicationManager.addHabboConnectionMessageEvent(new NoobnessLevelMessageEvent(this.onNoobnessLevelEvent));
                this._communicationManager.addHabboConnectionMessageEvent(new InClientLinkMessageEvent(this.onInClientLink));
                this._communicationManager.addHabboConnectionMessageEvent(new AccountPreferencesEvent(this.onAccountPreferences));
                this._communicationManager.addHabboConnectionMessageEvent(new EmailStatusResultEvent(this.onEmailStatus));
            }
            this._rights = [];
            this._Str_7432 = new _Str_8883(this);
            this._habboGroupInfoManager = new HabboGroupInfoManager(this);
            this._ignoredUsersManager = new IgnoredUsersManager(this);
            this._perkManager = new PerkManager(this);
            this._Str_8233 = [];
            this._Str_6042 = [];
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._Str_7432 != null)
            {
                this._Str_7432.dispose();
                this._Str_7432 = null;
            }
            if (this._floorItems)
            {
                this._floorItems.dispose();
                this._floorItems = null;
            }
            if (this._furnitureIds)
            {
                this._furnitureIds.dispose();
                this._furnitureIds = null;
            }
            if (this._perkManager)
            {
                this._perkManager.dispose();
                this._perkManager = null;
            }
            this._Str_6042 = null;
            if (this._furnitureParser)
            {
                this._furnitureParser.removeEventListener(FurnitureDataParser.FDP_FURNITURE_DATA_READY, this.onFurnitureReady);
                this._furnitureParser.dispose();
                this._furnitureParser = null;
            }
            if (this._productParser)
            {
                this._productParser.removeEventListener(ProductDataParser.PDP_PRODUCT_DATA_READY, this._Str_18413);
                this._productParser.dispose();
                this._productParser = null;
            }
            super.dispose();
        }

        private function initBadgeImageManager():void
        {
            if (this._badgeImageManager != null)
            {
                return;
            }
            this._badgeImageManager = new BadgeImageManager(assets, events, this);
        }

        private function initFurnitureData():void
        {
            var k:String;
            var _local_2:int;
            var _local_3:String;
            if (this._furnitureParser)
            {
                this._furnitureParser.dispose();
                this._furnitureParser = null;
            }
            this._furnitureParser = new FurnitureDataParser(this._floorItems, this._wallItems, this._furnitureIds, this._localizationManager);
            this._furnitureParser.addEventListener(FurnitureDataParser.FDP_FURNITURE_DATA_READY, this.onFurnitureReady);
            if (propertyExists("furnidata.load.url"))
            {
                k = getProperty("furnidata.load.url");
                if (this._Str_8546 != null)
                {
                    _local_2 = k.lastIndexOf("/");
                    _local_3 = k.substring(0, _local_2);
                    this._furnitureParser.loadData(((_local_3 + "/") + this._Str_8546));
                }
                else
                {
                    this._furnitureParser.loadData(k);
                }
            }
        }

        private function initProductData():void
        {
            if (this._productParser)
            {
                this._productParser.dispose();
                this._productParser = null;
            }
            var k:String = getProperty("productdata.load.url");
            this._productParser = new ProductDataParser(k, this._products);
            this._productParser.addEventListener(ProductDataParser.PDP_PRODUCT_DATA_READY, this._Str_18413);
        }

        private function onFurnitureReady(k:Event=null):void
        {
            var _local_2:IFurniDataListener;
            this._furnitureParser.removeEventListener(FurnitureDataParser.FDP_FURNITURE_DATA_READY, this.onFurnitureReady);
            this._Str_20020 = true;
            if (((this.isAuthenticHabbo) && (!(this._Str_12845))))
            {
                this._Str_12845 = true;
                for each (_local_2 in this._Str_6042)
                {
                    _local_2.furniDataReady();
                }
            }
        }

        private function onUserRights(k:IMessageEvent):void
        {
            var _local_2:UserRightsMessageEvent = UserRightsMessageEvent(k);
            this._clubLevel = _local_2.clubLevel;
            this._securityLevel = _local_2.securityLevel;
            this._topSecurityLevel = Math.max(this._topSecurityLevel, _local_2.securityLevel);
            this._isAmbassador = _local_2.isAmbassador;
        }

        private function onNoobnessLevelEvent(k:NoobnessLevelMessageEvent):void
        {
            this._noobnessLevel = k.noobnessLevel;
            if (this._noobnessLevel != NoobnessLevelEnum.OLD_IDENTITY)
            {
                context.configuration.setProperty("new.identity", "1");
            }
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectEvent = (k as UserObjectEvent);
            var _local_3:UserObjectMessageParser = _local_2.getParser();
            this._userId = _local_3.id;
            this._name = _local_3.name;
            this._respectTotal = _local_3.respectTotal;
            this._respectLeft = _local_3.respectLeft;
            this._petRespectLeft = _local_3.petRespectLeft;
            this._figure = _local_3.figure;
            this._gender = _local_3.sex;
            this._realName = _local_3.realName;
            this._nameChangeAllowed = _local_3.nameChangeAllowed;
            this._accountSafetyLocked = _local_3.accountSafetyLocked;
            this._ignoredUsersManager.initIgnoreList();
        }

        private function onUserChange(k:IMessageEvent):void
        {
            var _local_2:UserChangeMessageEvent = (k as UserChangeMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.id == -1)
            {
                this._figure = _local_2.figure;
                this._gender = _local_2.sex;
            }
        }

        private function onFigureUpdate(k:IMessageEvent):void
        {
            var _local_2:FigureUpdateEvent = (k as FigureUpdateEvent);
            if (_local_2 == null)
            {
                return;
            }
            this._figure = _local_2.figure;
            this._gender = _local_2.gender;
            HabboWebTools.updateFigure(this._figure);
        }

        private function onUserNameChange(k:IMessageEvent):void
        {
            var _local_2:UserNameChangedMessageEvent = (k as UserNameChangedMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:UserNameChangedMessageParser = _local_2.getParser();
            if (_local_3.webId == this._userId)
            {
                this._name = _local_3.newName;
                this._nameChangeAllowed = false;
                events.dispatchEvent(new UserNameUpdateEvent(this._name));
            }
        }

        private function onChangeUserNameResult(k:ChangeUserNameResultMessageEvent):void
        {
            var _local_2:ChangeUserNameResultMessageParser = k.getParser();
            if (_local_2.resultCode == ChangeUserNameResultMessageEvent.NAME_OK)
            {
                this._nameChangeAllowed = false;
                events.dispatchEvent(new UserNameUpdateEvent(_local_2.name));
            }
        }

        private function onMysteryBoxKeys(k:MysteryBoxKeysMessageEvent):void
        {
            var _local_2:MysteryBoxKeysMessageParser = k.getParser();
            this._mysteryBoxColor = _local_2.boxColor;
            this._mysteryKeyColor = _local_2.keyColor;
            events.dispatchEvent(new MysteryBoxKeysUpdateEvent(this._mysteryBoxColor, this._mysteryKeyColor));
        }

        private function _Str_7983(k:UserTagsMessageEvent):void
        {
            if (this._Str_7432)
            {
                this._Str_7432._Str_25163(k.userId, k.tags);
            }
            events.dispatchEvent(new RoomSessionUserTagsEvent(this.userId, k.tags.slice()));
        }

        private function onInClientLink(k:InClientLinkMessageEvent):void
        {
            context.createLinkEvent(k.link);
        }

        private function onAccountPreferences(k:AccountPreferencesEvent):void
        {
            var _local_2:AccountPreferencesParser = (k.getParser() as AccountPreferencesParser);
            this._isRoomCameraFollowDisabled = _local_2.roomCameraFollowDisabled;
            this._uiFlags = _local_2.uiFlags;
            events.dispatchEvent(new SessionDataPreferencesEvent(this._uiFlags));
        }

        private function onEmailStatus(k:EmailStatusResultEvent):void
        {
            var _local_2:EmailStatusParser = (k.getParser() as EmailStatusParser);
            this._isEmailVerified = _local_2.isVerified;
        }

        private function onAvailabilityStatus(k:IMessageEvent):void
        {
            var _local_3:IFurniDataListener;
            var _local_2:AvailabilityStatusMessageParser = (k as AvailabilityStatusMessageEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            this._systemOpen = _local_2.isOpen;
            this._systemShutDown = _local_2.onShutDown;
            this._isAuthenticHabbo = _local_2.isAuthenticHabbo;
            if ((((this.isAuthenticHabbo) && (this._Str_20020)) && (!(this._Str_12845))))
            {
                this._Str_12845 = true;
                for each (_local_3 in this._Str_6042)
                {
                    _local_3.furniDataReady();
                }
            }
        }

        private function onPetRespectFailed(k:PetRespectFailedEvent):void
        {
            if (k == null)
            {
                return;
            }
            this._petRespectLeft++;
        }

        private function onAccountSafetyLockStatusChanged(k:AccountSafetyLockStatusChangeMessageEvent):void
        {
            var _local_2:AccountSafetyLockStatusChangeMessageParser = k.getParser();
            this._accountSafetyLocked = (_local_2.status == AccountSafetyLockStatusChangeMessageParser.SAFETY_LOCK_STATUS_LOCKED);
        }

        public function get systemOpen():Boolean
        {
            return this._systemOpen;
        }

        public function get systemShutDown():Boolean
        {
            return this._systemShutDown;
        }

        public function get isAuthenticHabbo():Boolean
        {
            if (((((false) || (false)) || (false)) || (false)))
            {
                return true;
            }
            return this._isAuthenticHabbo;
        }

        public function hasSecurity(k:int):Boolean
        {
            return this._securityLevel >= k;
        }

        public function get topSecurityLevel():int
        {
            return this._topSecurityLevel;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get isNoob():Boolean
        {
            return !(this._noobnessLevel == NoobnessLevelEnum.OLD_IDENTITY);
        }

        public function get isRealNoob():Boolean
        {
            return this._noobnessLevel == NoobnessLevelEnum.REAL_NOOB;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._name;
        }

        public function get realName():String
        {
            return this._realName;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get isAnyRoomController():Boolean
        {
            return this._securityLevel >= SecurityLevelEnum.MODERATOR;
        }

        public function get isAmbassador():Boolean
        {
            return this._isAmbassador;
        }

        public function get isEmailVerified():Boolean
        {
            return this._isEmailVerified;
        }

        public function setRoomCameraFollowDisabled(k:Boolean):void
        {
            this._isRoomCameraFollowDisabled = k;
        }

        public function get isRoomCameraFollowDisabled():Boolean
        {
            return this._isRoomCameraFollowDisabled;
        }

        public function setFriendBarState(k:Boolean):void
        {
            this.setUIFlag(UIFlags.FRIEND_BAR_OPEN, k);
        }

        public function setRoomToolsState(k:Boolean):void
        {
            this.setUIFlag(UIFlags.ROOM_TOOLS_OPEN, k);
        }

        public function get uiFlags():int
        {
            return this._uiFlags;
        }

        private function setUIFlag(k:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                if ((this._uiFlags & k))
                {
                    return;
                }
                this._uiFlags = (this._uiFlags | k);
            }
            else
            {
                if (!(this._uiFlags & k))
                {
                    return;
                }
                this._uiFlags = (this._uiFlags & (~(k)));
            }
            this._communicationManager.connection.send(new SetUIFlagsMessageComposer(this._uiFlags));
        }

        public function getUserTags(k:int):Array
        {
            return this._Str_7432._Str_24368(k);
        }

        public function getBadgeImage(k:String):BitmapData
        {
            return this._badgeImageManager.getBadgeImage(k);
        }

        public function getBadgeSmallImage(k:String):BitmapData
        {
            return this._badgeImageManager.getSmallBadgeImage(k);
        }

        public function getBadgeImageAssetName(k:String):String
        {
            return this._badgeImageManager.getBadgeImageAssetName(k);
        }

        public function getBadgeImageSmallAssetName(k:String):String
        {
            return this._badgeImageManager.getSmallScaleBadgeAssetName(k);
        }

        public function requestBadgeImage(k:String):BitmapData
        {
            return this._badgeImageManager.getBadgeImage(k, BadgeImageManager.NORMAL_BADGE, false);
        }

        public function getBadgeImageWithInfo(k:String):BadgeInfo
        {
            return this._badgeImageManager.getBadgeImageWithInfo(k);
        }

        private function onAlertClose(k:IAlertDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        public function getGroupBadgeId(k:int):String
        {
            return this._habboGroupInfoManager.getBadgeId(k);
        }

        public function send(k:IMessageComposer):void
        {
            this._communicationManager.connection.send(k);
        }

        public function getGroupBadgeImage(k:String):BitmapData
        {
            return this._badgeImageManager.getBadgeImage(k, BadgeImageManager.GROUP_BADGE);
        }

        public function getGroupBadgeSmallImage(k:String):BitmapData
        {
            return this._badgeImageManager.getSmallBadgeImage(k, BadgeImageManager.GROUP_BADGE);
        }

        public function getGroupBadgeAssetName(k:String):String
        {
            return this._badgeImageManager.getBadgeImageAssetName(k, BadgeImageManager.GROUP_BADGE);
        }

        public function getGroupBadgeSmallAssetName(k:String):String
        {
            return this._badgeImageManager.getSmallScaleBadgeAssetName(k, BadgeImageManager.GROUP_BADGE);
        }

        public function isAccountSafetyLocked():Boolean
        {
            return this._accountSafetyLocked;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function whiperGroup(name:String):void
        {
            this.send(new WhiperGroupComposer(name));
        }

        public function isIgnored(k:String):Boolean
        {
            return this._ignoredUsersManager.isIgnored(k);
        }

        public function ignoreUser(k:String):void
        {
            this._ignoredUsersManager.ignoreUser(k);
        }

        public function unignoreUser(k:String):void
        {
            this._ignoredUsersManager.unignoreUser(k);
        }

        public function get respectLeft():int
        {
            return this._respectLeft;
        }

        public function get petRespectLeft():int
        {
            return this._petRespectLeft;
        }

        public function giveRespect(k:int):void
        {
            if (((k >= 0) && (this._respectLeft > 0)))
            {
                this.send(new RespectUserMessageComposer(k));
                this._respectLeft = (this._respectLeft - 1);
            }
        }

        public function giveRespectFailed():void
        {
            this._respectLeft = (this._respectLeft + 1);
        }

        public function givePetRespect(k:int):void
        {
            if (((k >= 0) && (this._petRespectLeft > 0)))
            {
                this.send(new RespectPetMessageComposer(k));
                this._petRespectLeft = (this._petRespectLeft - 1);
            }
        }

        public function getProductData(k:String):IProductData
        {
            if (!this._productDataReady)
            {
                this.loadProductData();
            }
            return this._products[k];
        }

        public function getFloorItemData(k:int):IFurnitureData
        {
            if (this._floorItems == null)
            {
                return null;
            }
            return this._floorItems.getValue(k.toString());
        }

        public function getFloorItemsDataByCategory(k:int):Array
        {
            var _local_3:IFurnitureData;
            var _local_2:Array = [];
            if (this._floorItems != null)
            {
                for each (_local_3 in this._floorItems)
                {
                    if (_local_3.category == k)
                    {
                        _local_2.push(_local_3);
                    }
                }
            }
            return _local_2;
        }

        public function getWallItemData(k:int):IFurnitureData
        {
            if (this._wallItems == null)
            {
                return null;
            }
            return this._wallItems.getValue(k.toString());
        }

        public function getFloorItemDataByName(k:String, _arg_2:int=0):IFurnitureData
        {
            var _local_4:int;
            if (this._furnitureIds == null)
            {
                return null;
            }
            var _local_3:Array = this._furnitureIds.getValue(k);
            if (((!(_local_3 == null)) && (_arg_2 <= (_local_3.length - 1))))
            {
                _local_4 = _local_3[_arg_2];
                return this.getFloorItemData(_local_4);
            }
            return null;
        }

        public function getWallItemDataByName(k:String, _arg_2:int=0):IFurnitureData
        {
            var _local_4:int;
            if (this._furnitureIds == null)
            {
                return null;
            }
            var _local_3:Array = this._furnitureIds.getValue(k);
            if (((!(_local_3 == null)) && (_arg_2 <= (_local_3.length - 1))))
            {
                _local_4 = _local_3[_arg_2];
                return this.getWallItemData(_local_4);
            }
            return null;
        }

        public function openHabboHomePage(userId:int, userName:String):void
        {
            var urlString:String;
            if (propertyExists("link.format.userpage"))
            {
                urlString = getProperty("link.format.userpage");
                urlString = urlString.replace("%ID%", String(userId));
                urlString = urlString.replace("%username%", userName);
                try
                {
                    HabboWebTools.navigateToURL(urlString, "habboMain");
                }
                catch(e:Error)
                {
                    Logger.log("Error occurred!");
                }
            }
        }

        public function pickAllFurniture(roomId:int):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var session:IRoomSession = this._roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            }
            if ((((session.isRoomOwner) || (this.isAnyRoomController)) || (session.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                this._windowManager.confirm("${generic.alert.title}", "${room.confirm.pick_all}", 0, function (k:IConfirmDialog, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        sendSpecialCommandMessage(":pickall");
                    }
                });
            }
        }

        public function ejectAllFurniture(roomId:int, message:String):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var session:IRoomSession = this._roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            }
            if ((((session.isRoomOwner) || (this.isAnyRoomController)) || (session.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                this._windowManager.confirm("${generic.alert.title}", "${room.confirm.eject_all}", 0, function (k:IConfirmDialog, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        sendSpecialCommandMessage(message);
                    }
                });
            }
        }

        public function ejectPets(k:int):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var _local_2:IRoomSession = this._roomSessionManager.getSession(k);
            if (_local_2 == null)
            {
                return;
            }
            if (((_local_2.isRoomOwner) || (this.isAnyRoomController)))
            {
                this.sendSpecialCommandMessage(":ejectpets");
            }
        }

        public function pickAllBuilderFurniture(roomId:int):void
        {
            if (((this._roomSessionManager == null) || (this._windowManager == null)))
            {
                return;
            }
            var session:IRoomSession = this._roomSessionManager.getSession(roomId);
            if (session == null)
            {
                return;
            }
            if ((((session.isRoomOwner) || (this.isAnyRoomController)) || (session.roomControllerLevel >= RoomControllerLevel.GUEST)))
            {
                this._windowManager.confirm("${generic.alert.title}", "${room.confirm.pick_all_bc}", 0, function (k:IConfirmDialog, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        sendSpecialCommandMessage(":pickallbc");
                    }
                });
            }
        }

        public function loadProductData(k:IProductDataListener=null):Boolean
        {
            if (this._productDataReady)
            {
                return true;
            }
            if (((k) && (this._Str_8233.indexOf(k) == -1)))
            {
                this._Str_8233.push(k);
            }
            return false;
        }

        public function addProductsReadyEventListener(k:IProductDataListener):void
        {
            if (this._productDataReady)
            {
                k.productDataReady();
                return;
            }
            if (((k) && (this._Str_8233.indexOf(k) == -1)))
            {
                this._Str_8233.push(k);
            }
        }

        private function _Str_18413(k:Event):void
        {
            var _local_2:IProductDataListener;
            this._productParser.removeEventListener(ProductDataParser.PDP_PRODUCT_DATA_READY, this._Str_18413);
            this._productDataReady = true;
            for each (_local_2 in this._Str_8233)
            {
                if (((!(_local_2 == null)) && (!(_local_2.disposed))))
                {
                    _local_2.productDataReady();
                }
            }
            this._Str_8233 = [];
        }

        private function onRoomReady(k:IMessageEvent):void
        {
            var _local_2:RoomReadyMessageEvent = (k as RoomReadyMessageEvent);
            if ((((_local_2 == null) || (_local_2.getParser() == null)) || (k.connection == null)))
            {
                return;
            }
            var _local_3:RoomReadyMessageParser = _local_2.getParser();
            HabboWebTools.roomVisited(_local_3.roomId);
        }

        public function sendSpecialCommandMessage(k:String):void
        {
            this.send(new ChatMessageComposer(k));
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get gender():String
        {
            return this._gender;
        }

        private function onCatalogPublished(k:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_2:CatalogPublishedMessageEvent = (k as CatalogPublishedMessageEvent);
            if (_local_2._Str_12669 != null)
            {
                this._Str_8546 = _local_2._Str_12669;
            }
            if (_local_2._Str_17070)
            {
                this._Str_18167(null);
            }
            else
            {
                _local_3 = getInteger("catalogue.published.min.refresh.interval", 5);
                _local_4 = getInteger("catalogue.published.max.refresh.interval", 20);
                _local_5 = (Math.floor((Math.random() * ((_local_4 - _local_3) + 1))) + _local_3);
                if (this._Str_8108 == null)
                {
                    this._Str_8108 = new Timer((_local_5 * 3000));
                    this._Str_8108.addEventListener(TimerEvent.TIMER, this._Str_18167);
                    this._Str_8108.start();
                }
            }
        }

        private function _Str_18167(k:TimerEvent):void
        {
            if (this._Str_8108 != null)
            {
                this._Str_8108.removeEventListener(TimerEvent.TIMER, this._Str_18167);
                this._Str_8108 = null;
            }
            this._floorItems = new Map();
            this._wallItems = new Map();
            this._furnitureIds = new Map();
            this.initFurnitureData();
        }

        public function removeFurniDataListener(k:IFurniDataListener):void
        {
            if (!this._Str_6042)
            {
                return;
            }
            var _local_2:int = this._Str_6042.indexOf(k);
            if (_local_2 > -1)
            {
                this._Str_6042.splice(_local_2, 1);
            }
        }

        public function getFurniData(k:IFurniDataListener):Vector.<IFurnitureData>
        {
            if (((this._floorItems == null) || (this._floorItems.length == 0)))
            {
                if (this._Str_6042.indexOf(k) == -1)
                {
                    this._Str_6042.push(k);
                }
                return null;
            }
            return Vector.<IFurnitureData>(this._floorItems.getValues().concat(this._wallItems.getValues()));
        }

        public function getXmlWindow(k:String):IWindow
        {
            var _local_3:IAsset;
            var _local_4:XmlAsset;
            var _local_2:IWindow;
            try
            {
                _local_3 = assets.getAssetByName(k);
                _local_4 = XmlAsset(_local_3);
                _local_2 = this._windowManager.buildFromXML(XML(_local_4.content));
            }
            catch(e:Error)
            {
            }
            return _local_2;
        }

        public function getButtonImage(k:String):BitmapData
        {
            var _local_2:String = k;
            var _local_3:IAsset = assets.getAssetByName(_local_2);
            var _local_4:BitmapDataAsset = BitmapDataAsset(_local_3);
            var _local_5:BitmapData = BitmapData(_local_4.content);
            var _local_6:BitmapData = new BitmapData(_local_5.width, _local_5.height, true, 0);
            _local_6.draw(_local_5);
            return _local_6;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get nameChangeAllowed():Boolean
        {
            return this._nameChangeAllowed;
        }

        public function get perksReady():Boolean
        {
            return (!(this._perkManager == null)) && (this._perkManager.isReady);
        }

        public function isPerkAllowed(k:String):Boolean
        {
            return this._perkManager.isPerkAllowed(k);
        }

        public function getPerkErrorMessage(k:String):String
        {
            return this._perkManager.getPerkErrorMessage(k);
        }

        public function get currentTalentTrack():String
        {
            return ((getBoolean("talent.track.citizenship.enabled")) && (!(this.isPerkAllowed(PerkEnum.CITIZEN)))) ? TalentEnum.CITIZENSHIP : TalentEnum.HELPER;
        }

        public function get mysteryBoxColor():String
        {
            return this._mysteryBoxColor;
        }

        public function get mysteryKeyColor():String
        {
            return this._mysteryKeyColor;
        }
    }
}
