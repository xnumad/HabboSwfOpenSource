package com.sulake.habbo.inventory
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingYouAreNotAllowedParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingConfirmationParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCompletedParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingItemListEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingItemListParser;
    import com.sulake.habbo.communication.messages.incoming.bots.BotRemovedFromInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListInvalidateEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.clothes.FigureSetIdsEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.bots.BotInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgesEvent;
    import com.sulake.habbo.communication.messages.incoming.users.UserBadgesEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceConfigurationEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.OpenConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCanMakeOfferResult;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOtherNotAllowedParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAcceptParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsScoreEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetAddedToInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNotOpenParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListRemoveEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectActivatedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.NotEnoughBalanceMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.bots.BotAddedToInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.PostItPlacedEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenFailedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenFailedEventParser;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenParser;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgeReceivedEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceItemStatsEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListAddOrUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceMakeOfferResult;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.GoToBreedingNestFailureEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectExpiredMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectAddedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetRemovedFromInventoryEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgePointLimitsEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListParser;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListAddOrUpdateParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListRemoveParser;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.PostItPlacedParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffect;
    import com.sulake.habbo.inventory.effects.Effect;
    import com.sulake.habbo.inventory.effects.EffectsModel;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectsMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectAddedMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectActivatedMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectExpiredMessageParser;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser;
    import com.sulake.habbo.inventory.badges.BadgesModel;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeAndPointLimit;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgePointLimitsParser;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeReceivedParser;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsScoreParser;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.inventory.enum.InventorySubCategory;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.inventory.trading.TradingModel;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.ItemDataStructure;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.inventory.pets.PetsModel;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetInventoryMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetAddedToInventoryParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.GoToBreedingNestFailureParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetRemovedFromInventoryParser;
    import com.sulake.habbo.inventory.bots.BotsModel;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotInventoryMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotRemovedFromInventoryParser;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotAddedToInventoryParser;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationMessageParser;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCanMakeOfferResultParser;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser;
    import __AS3__.vec.*;

    public class IncomingMessages 
    {
        private static const CREDIT_GROUPITEM_TYPE_ID:String = "credit_groupitem_type_id";

        private var _inventory:HabboInventory;
        private var _com:IHabboCommunicationManager;
        private var _petMsgFragments:Vector.<Map>;
        private var _furniMsgFragments:Vector.<Map>;
        private var _rentedFurniMsgFragments:Vector.<Map>;

        public function IncomingMessages(k:HabboInventory)
        {
            this._inventory = k;
            this._com = this._inventory.communication;
            this._com.addHabboConnectionMessageEvent(new TradingYouAreNotAllowedEvent(this._Str_24409, TradingYouAreNotAllowedParser));
            this._com.addHabboConnectionMessageEvent(new TradingConfirmationEvent(this._Str_25011, TradingConfirmationParser));
            this._com.addHabboConnectionMessageEvent(new TradingCompletedEvent(this._Str_23780, TradingCompletedParser));
            this._com.addHabboConnectionMessageEvent(new TradingItemListEvent(this._Str_25320, TradingItemListParser));
            this._com.addHabboConnectionMessageEvent(new BotRemovedFromInventoryEvent(this._Str_24595));
            this._com.addHabboConnectionMessageEvent(new FurniListInvalidateEvent(this._Str_18656));
            this._com.addHabboConnectionMessageEvent(new FigureSetIdsEvent(this._Str_25862));
            this._com.addHabboConnectionMessageEvent(new FlatAccessDeniedMessageEvent(this._Str_15910));
            this._com.addHabboConnectionMessageEvent(new BotInventoryEvent(this._Str_23613));
            this._com.addHabboConnectionMessageEvent(new BadgesEvent(this.onBadges));
            this._com.addHabboConnectionMessageEvent(new UserBadgesEvent(this.onUserBadges));
            this._com.addHabboConnectionMessageEvent(new MarketplaceConfigurationEvent(this.onMarketplaceConfiguration));
            this._com.addHabboConnectionMessageEvent(new OpenConnectionMessageEvent(this._Str_15910));
            this._com.addHabboConnectionMessageEvent(new MarketplaceCanMakeOfferResult(this._Str_25747));
            this._com.addHabboConnectionMessageEvent(new TradingOtherNotAllowedEvent(this._Str_22530, TradingOtherNotAllowedParser));
            this._com.addHabboConnectionMessageEvent(new FurniListEvent(this._Str_25001));
            this._com.addHabboConnectionMessageEvent(new TradingAcceptEvent(this._Str_23770, TradingAcceptParser));
            this._com.addHabboConnectionMessageEvent(new AchievementsScoreEvent(this._Str_18065));
            this._com.addHabboConnectionMessageEvent(new PetAddedToInventoryEvent(this._Str_23427));
            this._com.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(this.onClubStatus));
            this._com.addHabboConnectionMessageEvent(new TradingNotOpenEvent(this._Str_23644, TradingNotOpenParser));
            this._com.addHabboConnectionMessageEvent(new FurniListRemoveEvent(this._Str_25700));
            this._com.addHabboConnectionMessageEvent(new AvatarEffectActivatedMessageEvent(this._Str_17365));
            this._com.addHabboConnectionMessageEvent(new TradingCloseEvent(this._Str_25275, TradingCloseParser));
            this._com.addHabboConnectionMessageEvent(new NotEnoughBalanceMessageEvent(this.onNotEnoughCredits));
            this._com.addHabboConnectionMessageEvent(new BotAddedToInventoryEvent(this._Str_23929));
            this._com.addHabboConnectionMessageEvent(new PostItPlacedEvent(this._Str_23887));
            this._com.addHabboConnectionMessageEvent(new TradingOpenFailedEvent(this._Str_23502, TradingOpenFailedEventParser));
            this._com.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this._Str_15910));
            this._com.addHabboConnectionMessageEvent(new TradingOpenEvent(this._Str_22556, TradingOpenParser));
            this._com.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
            this._com.addHabboConnectionMessageEvent(new BadgeReceivedEvent(this._Str_23620));
            this._com.addHabboConnectionMessageEvent(new MarketplaceItemStatsEvent(this.onMarketplaceItemStats));
            this._com.addHabboConnectionMessageEvent(new AvatarEffectsMessageEvent(this.onAvatarEffects));
            this._com.addHabboConnectionMessageEvent(new PetInventoryEvent(this._Str_24135));
            this._com.addHabboConnectionMessageEvent(new FurniListAddOrUpdateEvent(this._Str_23121));
            this._com.addHabboConnectionMessageEvent(new MarketplaceMakeOfferResult(this.onMarketplaceMakeOfferResult));
            this._com.addHabboConnectionMessageEvent(new HabboAchievementNotificationMessageEvent(this._Str_25294));
            this._com.addHabboConnectionMessageEvent(new GoToBreedingNestFailureEvent(this._Str_25173));
            this._com.addHabboConnectionMessageEvent(new AvatarEffectExpiredMessageEvent(this.onAvatarEffectExpired));
            this._com.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            this._com.addHabboConnectionMessageEvent(new AvatarEffectAddedMessageEvent(this._Str_18461));
            this._com.addHabboConnectionMessageEvent(new PetRemovedFromInventoryEvent(this._Str_22306));
            this._com.addHabboConnectionMessageEvent(new BadgePointLimitsEvent(this.onBadgePointLimits));
        }

        public function dispose():void
        {
            this._inventory = null;
            this._com = null;
        }

        public function _Str_25001(k:FurniListEvent):void
        {
            var _local_2:FurniListParser = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            if (!this._inventory._Str_23047)
            {
                this._inventory._Str_22707();
            }
            var _local_3:FurniModel = this._inventory._Str_2834;
            if (_local_3 == null)
            {
                return;
            }
            if (this._furniMsgFragments == null)
            {
                this._furniMsgFragments = new Vector.<Map>(_local_2.totalFragments, true);
            }
            var _local_4:Map = new Map();
            _local_4.concatenate(_local_2.furniFragment);
            var _local_5:Map = this._Str_19767(_local_4, _local_2.totalFragments, _local_2.fragmentNo, this._furniMsgFragments);
            if (!_local_5)
            {
                return;
            }
            _local_3._Str_24428(_local_5);
            this._furniMsgFragments = null;
            this._inventory.events.dispatchEvent(new HabboInventoryFurniListParsedEvent(InventoryCategory.FURNI));
        }

        public function _Str_23121(k:IMessageEvent):void
        {
            var _local_5:FurnitureItem;
            var _local_6:FurniData;
            var _local_7:GroupItem;
            var _local_2:FurniListAddOrUpdateParser = (k as FurniListAddOrUpdateEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:FurniModel = this._inventory._Str_2834;
            if (((_local_3 == null) || (!(_local_3._Str_21873()))))
            {
                return;
            }
            var _local_4:Vector.<FurniData> = _local_2.getFurni();
            for each (_local_6 in _local_4)
            {
                _local_7 = _local_3._Str_25496(_local_6.itemId);
                if (_local_7)
                {
                    _local_5 = _local_7.getItem(_local_6.itemId);
                    if (_local_5)
                    {
                        _local_5.update(_local_6);
                        _local_7._Str_6126 = true;
                    }
                }
                else
                {
                    _local_5 = new FurnitureItem(_local_6);
                    _local_3._Str_20455(_local_5, false);
                }
            }
            _local_3._Str_7636();
            _local_3.updateView();
        }

        public function _Str_25700(k:IMessageEvent):void
        {
            var _local_2:FurniListRemoveParser = (k as FurniListRemoveEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:FurniModel = this._inventory._Str_2834;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_2.stripId;
            var _local_5:GroupItem = _local_3._Str_17979(_local_4);
            if (_local_5)
            {
                _local_3._Str_4409();
            }
        }

        public function _Str_18656(k:IMessageEvent):void
        {
            this._inventory._Str_5943(InventoryCategory.FURNI, false);
            this._inventory._Str_5943(InventoryCategory.RENTABLES, false);
        }

        public function _Str_23887(k:IMessageEvent):void
        {
            var _local_2:PostItPlacedParser = (k as PostItPlacedEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:FurniModel = this._inventory._Str_2834;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_2.id;
            var _local_5:int = _local_2.itemsLeft;
            _local_3._Str_22816(_local_4, _local_5);
        }

        public function onAvatarEffects(k:IMessageEvent):void
        {
            var _local_6:AvatarEffect;
            var _local_7:Effect;
            if (this._inventory == null)
            {
                return;
            }
            var _local_2:EffectsModel = this._inventory._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:AvatarEffectsMessageParser = (k as AvatarEffectsMessageEvent).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:Array = _local_3.effects;
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _local_6 = (_local_4[_local_5] as AvatarEffect);
                _local_7 = new Effect();
                _local_7.type = _local_6.type;
                _local_7.subType = _local_6.subType;
                _local_7.duration = _local_6.duration;
                _local_7._Str_4010 = _local_6._Str_4010;
                _local_7._Str_4225 = _local_6._Str_18572;
                if (_local_6._Str_12185 >= 0)
                {
                    _local_7.isActive = true;
                    _local_7._Str_3709 = _local_6._Str_12185;
                    _local_7._Str_4225++;
                }
                else
                {
                    if (_local_6._Str_12185 == -1)
                    {
                        _local_7.isActive = false;
                        _local_7._Str_3709 = _local_6.duration;
                    }
                }
                _local_2._Str_2428(_local_7, false);
                _local_5++;
            }
            this._inventory._Str_5943(InventoryCategory.EFFECTS);
            _local_2._Str_4879();
            this._inventory._Str_7796();
        }

        public function _Str_18461(k:IMessageEvent):void
        {
            var _local_2:EffectsModel = this._inventory._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:AvatarEffectAddedMessageParser = (k as AvatarEffectAddedMessageEvent).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3.type;
            var _local_5:int = _local_3.subType;
            var _local_6:int = _local_3.duration;
            var _local_7:Boolean = _local_3._Str_4010;
            var _local_8:Effect = new Effect();
            _local_8.type = _local_4;
            _local_8.subType = _local_5;
            _local_8.duration = _local_6;
            _local_8._Str_4010 = _local_7;
            _local_8._Str_3709 = _local_6;
            _local_2._Str_2428(_local_8);
            this._inventory._Str_7796();
        }

        public function _Str_17365(k:IMessageEvent):void
        {
            var _local_2:EffectsModel = this._inventory._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:AvatarEffectActivatedMessageParser = (k as AvatarEffectActivatedMessageEvent).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3.type;
            _local_2._Str_22417(_local_4);
            this._inventory._Str_7796();
        }

        public function onAvatarEffectExpired(k:IMessageEvent):void
        {
            var _local_2:EffectsModel = this._inventory._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:AvatarEffectExpiredMessageParser = (k as AvatarEffectExpiredMessageEvent).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3.type;
            _local_2._Str_24134(_local_4);
            this._inventory._Str_7796();
        }

        public function onClubStatus(k:IMessageEvent):void
        {
            var _local_2:ScrSendUserInfoMessageParser = (k as ScrSendUserInfoEvent).getParser();
            if (((_local_2.productName == "habbo_club") || (_local_2.productName == "club_habbo")))
            {
                this._inventory._Str_23808(_local_2.periodsSubscribedAhead, _local_2.daysToPeriodEnd, _local_2.hasEverBeenMember, _local_2.isVIP, (_local_2.responseType == ScrSendUserInfoMessageParser.RESPONSE_TYPE_DISCOUNT_AVAILABLE), (_local_2.responseType == ScrSendUserInfoMessageParser.RESPONSE_TYPE_CITIZENSHIP_DISCOUNT), _local_2.minutesUntilExpiration, _local_2.minutesSinceLastModified);
                this._inventory.events.dispatchEvent(new HabboInventoryHabboClubEvent());
            }
        }

        public function onBadges(k:IMessageEvent):void
        {
            var _local_4:int;
            var _local_5:String;
            var _local_8:Boolean;
            var _local_9:int;
            var _local_2:BadgesParser = (k as BadgesEvent).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:BadgesModel = this._inventory._Str_7962;
            if (_local_3 == null)
            {
                return;
            }
            var _local_6:Array = _local_2.getAllBadgeCodes();
            var _local_7:Array = _local_2.getActiveBadgeCodes();
            for each (_local_5 in _local_6)
            {
                _local_8 = (_local_7.indexOf(_local_5) > -1);
                _local_9 = _local_2.getBadgeId(_local_5);
                _local_3.updateBadge(_local_5, _local_8, _local_9);
            }
            _local_3._Str_22395();
            _local_3.updateView();
            this._inventory._Str_5943(InventoryCategory.BADGES);
        }

        public function onBadgePointLimits(k:IMessageEvent):void
        {
            var _local_3:BadgeAndPointLimit;
            var _local_2:BadgePointLimitsParser = (k as BadgePointLimitsEvent).getParser();
            for each (_local_3 in _local_2.data)
            {
                this._inventory.localization.setBadgePointLimit(_local_3.badgeId, _local_3.limit);
            }
        }

        public function onUserBadges(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_2:UserBadgesEvent = (k as UserBadgesEvent);
            if (_local_2.userId != this._inventory.sessionData.userId)
            {
                return;
            }
            var _local_3:BadgesModel = this._inventory._Str_7962;
            if (_local_3 == null)
            {
                return;
            }
            for each (_local_4 in _local_2.badges)
            {
                _local_3.updateBadge(_local_4, true);
            }
            _local_3.updateView();
        }

        public function _Str_25294(k:IMessageEvent):void
        {
            var _local_2:HabboAchievementNotificationMessageEvent = (k as HabboAchievementNotificationMessageEvent);
            var _local_3:HabboAchievementNotificationMessageParser = _local_2.getParser();
            var _local_4:BadgesModel = this._inventory._Str_7962;
            if (_local_4 != null)
            {
                _local_4.updateBadge(_local_3.data.badgeCode, false, _local_3.data.badgeId);
                _local_4._Str_24079(_local_3.data._Str_24720);
                _local_4.updateView();
            }
        }

        public function _Str_23620(k:IMessageEvent):void
        {
            var _local_2:BadgeReceivedParser = BadgeReceivedEvent(k).getParser();
            var _local_3:BadgesModel = this._inventory._Str_7962;
            if (_local_3 != null)
            {
                _local_3.updateBadge(_local_2.badgeCode, false, _local_2.badgeId);
                _local_3.updateView();
            }
        }

        public function _Str_18065(k:IMessageEvent):void
        {
            var _local_2:AchievementsScoreEvent = (k as AchievementsScoreEvent);
            var _local_3:AchievementsScoreParser = (_local_2.getParser() as AchievementsScoreParser);
            if (_local_3 == null)
            {
                return;
            }
            this._inventory.localization.registerParameter("achievements_score_description", "score", _local_3.score.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " "));
        }

        private function _Str_22556(k:IMessageEvent):void
        {
            var _local_14:int;
            var _local_15:String;
            var _local_16:Boolean;
            if (!this._inventory)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - inventory is null!");
                return;
            }
            var _local_2:ISessionDataManager = this._inventory.sessionData;
            var _local_3:IRoomSession = this._inventory.roomSession;
            if (!_local_2)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - sessionData not available!");
                return;
            }
            if (!_local_3)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - roomSession not available!");
                return;
            }
            this._inventory.toggleInventorySubPage(InventorySubCategory.TRADING);
            var _local_4:TradingOpenEvent = (k as TradingOpenEvent);
            if (!_local_4)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", (("event is of unknown type:" + k) + "!"));
                return;
            }
            var _local_5:int = _local_4.userID;
            var _local_6:RoomUserData = _local_3.userDataManager.getUserData(_local_5);
            if (!_local_6)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - failed to retrieve own user data!");
                return;
            }
            var _local_7:String = _local_6.name;
            var _local_8:* = (_local_4._Str_16764 > 0);
            var _local_9:int = _local_4._Str_17613;
            var _local_10:RoomUserData = _local_3.userDataManager.getUserData(_local_9);
            if (!_local_10)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", "Trading open - failed to retrieve other user data!");
                return;
            }
            var _local_11:String = _local_10.name;
            var _local_12:* = (_local_4._Str_13374 > 0);
            if (_local_9 == _local_2.userId)
            {
                _local_14 = _local_5;
                _local_15 = _local_7;
                _local_16 = _local_8;
                _local_5 = _local_9;
                _local_7 = _local_11;
                _local_8 = _local_12;
                _local_9 = _local_14;
                _local_11 = _local_15;
                _local_12 = _local_16;
            }
            var _local_13:TradingModel = this._inventory._Str_3957;
            if (_local_13 != null)
            {
                _local_13._Str_23457(_local_5, _local_7, _local_8, _local_9, _local_11, _local_12);
            }
        }

        private function _Str_23502(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_25275(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_23780(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_23770(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_25011(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_25320(k:IMessageEvent):void
        {
            var _local_8:GroupItem;
            var _local_2:TradingItemListEvent = (k as TradingItemListEvent);
            var _local_3:Map = new Map();
            var _local_4:Map = new Map();
            var _local_5:int = this._inventory.sessionData.userId;
            var _local_6:FurniModel = this._inventory._Str_2834;
            if (_local_6 == null)
            {
                return;
            }
            if (((this._inventory.getBoolean("trading.warning.enabled")) && (_local_2.secondUserNumCredits > 0)))
            {
                _local_8 = this._inventory._Str_2834.createCreditGroupItem(_local_2.secondUserNumCredits);
                _local_4.add(CREDIT_GROUPITEM_TYPE_ID, _local_8);
            }
            this._Str_21714(_local_2.firstUserItemArray, _local_3, (_local_2.firstUserID == _local_5));
            this._Str_21714(_local_2.secondUserItemArray, _local_4, (_local_2.secondUserID == _local_5));
            var _local_7:TradingModel = this._inventory._Str_3957;
            if (_local_7 != null)
            {
                _local_7._Str_25000(_local_2, _local_3, _local_4);
            }
        }

        private function _Str_21714(k:Array, _arg_2:Map, _arg_3:Boolean):void
        {
            var _local_5:GroupItem;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:ItemDataStructure;
            var _local_10:int;
            var _local_4:uint = k.length;
            _local_10 = 0;
            while (_local_10 < _local_4)
            {
                _local_9 = (k[_local_10] as ItemDataStructure);
                _local_6 = _local_9.spriteId;
                _local_7 = _local_9.category;
                _local_8 = (_local_9.furniType + String(_local_6));
                if (((!(_local_9.isGroupable)) || (this._Str_20661(_local_9.spriteId))))
                {
                    _local_8 = ("itemid" + _local_9.itemId);
                }
                if (_local_9.category == FurniCategory.POSTER)
                {
                    _local_8 = ((String(_local_6) + "poster") + _local_9.stuffData.getLegacyString());
                }
                else
                {
                    if (_local_9.category == FurniCategory.GUILD_FURNI)
                    {
                        _local_8 = TradingModel._Str_16998(_local_6, _local_9.stuffData);
                    }
                }
                _local_5 = (((_local_9.isGroupable) && (!(this._Str_20661(_local_9.spriteId)))) ? (_arg_2.getValue(_local_8) as GroupItem) : null);
                if (_local_5 == null)
                {
                    _local_5 = this._inventory._Str_2834.createGroupItem(_local_6, _local_7, _local_9.stuffData);
                    _arg_2.add(_local_8, _local_5);
                }
                _local_5.push(new FurnitureItem(_local_9));
                _local_10++;
            }
        }

        private function _Str_20661(k:int):Boolean
        {
            var _local_2:IFurnitureData = this._inventory.getFurnitureData(k, ProductTypeEnum.WALL);
            return (_local_2) && (_local_2.isExternalImageType);
        }

        private function _Str_23644(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_22530(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_24409(k:IMessageEvent):void
        {
            var _local_2:TradingModel = this._inventory._Str_3957;
            if (_local_2 != null)
            {
                _local_2._Str_6457(k);
            }
        }

        private function _Str_15910(k:IMessageEvent):void
        {
            this._inventory._Str_13252();
            this._inventory._Str_2834.roomLeft();
        }

        private function _Str_24135(k:PetInventoryEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:PetsModel = this._inventory._Str_4524;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetInventoryMessageParser = k.getParser();
            if (this._petMsgFragments == null)
            {
                this._petMsgFragments = new Vector.<Map>(_local_3.totalFragments, true);
            }
            var _local_4:Map = new Map();
            _local_4.concatenate(_local_3._Str_24388);
            var _local_5:Map = this._Str_19767(_local_4, _local_3.totalFragments, _local_3.fragmentNo, this._petMsgFragments);
            if (!_local_5)
            {
                return;
            }
            this._inventory._Str_4524._Str_25168(_local_5);
            this._petMsgFragments = null;
        }

        private function _Str_23427(k:PetAddedToInventoryEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:PetsModel = this._inventory._Str_4524;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetAddedToInventoryParser = k.getParser();
            _local_2._Str_9947(_local_3.pet);
            if (_local_3._Str_19947())
            {
            }
        }

        private function _Str_25173(k:GoToBreedingNestFailureEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:String = "${gotobreedingnestfailure.getnest}";
            var _local_3:Function = this._Str_23001;
            if (k.getParser().reason == GoToBreedingNestFailureParser._Str_17785)
            {
                _local_2 = "${gotobreedingnestfailure.getfood}";
                _local_3 = this._Str_25255;
            }
            this._inventory.windowManager.simpleAlert("${gotobreedingnestfailure.caption}", "${gotobreedingnestfailure.subtitle}", (("${gotobreedingnestfailure.message." + k.getParser().reason) + "}"), _local_2, "", null, null, _local_3);
        }

        private function _Str_23001():void
        {
            var k:String = this._inventory.getProperty("gotobreedingnestfailure.catalogpage.nests");
            this._inventory.catalog.openCatalogPage(k);
        }

        private function _Str_25255():void
        {
            var k:String = this._inventory.getProperty("gotobreedingnestfailure.catalogpage.food");
            this._inventory.catalog.openCatalogPage(k);
        }

        private function _Str_22306(k:PetRemovedFromInventoryEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:PetsModel = this._inventory._Str_4524;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetRemovedFromInventoryParser = k.getParser();
            _local_2._Str_12321(_local_3.petId);
        }

        private function _Str_23613(k:BotInventoryEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:BotsModel = this._inventory._Str_8302;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:BotInventoryMessageParser = k.getParser();
            _local_2._Str_23563(_local_3.items);
            this._inventory._Str_5943(InventoryCategory.BOTS);
            _local_2._Str_11524();
        }

        private function _Str_24595(k:BotRemovedFromInventoryEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:BotsModel = this._inventory._Str_8302;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:BotRemovedFromInventoryParser = k.getParser();
            _local_2.removeItem(_local_3.itemId);
        }

        private function _Str_23929(k:BotAddedToInventoryEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:BotsModel = this._inventory._Str_8302;
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.items.length >= this._inventory._Str_24829)
            {
                return;
            }
            var _local_3:BotAddedToInventoryParser = k.getParser();
            _local_2.addItem(_local_3.item);
        }

        private function onMarketplaceConfiguration(k:MarketplaceConfigurationEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:MarketplaceModel = this._inventory._Str_6398;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:MarketplaceConfigurationMessageParser = k.getParser();
            _local_2.isEnabled = _local_3.enabled;
            _local_2.commission = _local_3.commission;
            _local_2.tokenBatchPrice = _local_3.credits;
            _local_2.tokenBatchSize = _local_3.advertisements;
            _local_2.offerMinPrice = _local_3.minimumPrice;
            _local_2.offerMaxPrice = _local_3.maximumPrice;
            _local_2.expirationHours = _local_3.offerTime;
            _local_2.averagePricePeriod = _local_3.displayTime;
            this._inventory._Str_5943(InventoryCategory.MARKETPLACE);
            var _local_4:FurniModel = this._inventory._Str_2834;
            if (_local_4 != null)
            {
                _local_4.updateView();
            }
        }

        private function _Str_25747(k:MarketplaceCanMakeOfferResult):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:MarketplaceModel = this._inventory._Str_6398;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:MarketplaceCanMakeOfferResultParser = k.getParser();
            _local_2.proceedOfferMaking(_local_3.resultCode, _local_3._Str_24601);
        }

        private function onMarketplaceMakeOfferResult(k:MarketplaceMakeOfferResult):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:MarketplaceModel = this._inventory._Str_6398;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:MarketplaceMakeOfferResultParser = k.getParser();
            _local_2.endOfferMaking(_local_3.result);
        }

        private function onMarketplaceItemStats(k:MarketplaceItemStatsEvent):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:MarketplaceModel = this._inventory._Str_6398;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:MarketplaceItemStatsParser = k.getParser();
            _local_2.setAveragePrice(_local_3.furniCategoryId, _local_3.furniTypeId, _local_3.averagePrice);
        }

        private function onNotEnoughCredits(k:NotEnoughBalanceMessageEvent):void
        {
            if (((!(k)) || (!(this._inventory))))
            {
                return;
            }
            var _local_2:MarketplaceModel = this._inventory._Str_6398;
            if (_local_2 == null)
            {
                return;
            }
            _local_2.onNotEnoughCredits();
        }

        private function onUserRights(k:IMessageEvent):void
        {
            var _local_2:MarketplaceModel;
            if (this._inventory._Str_18826(InventoryCategory.MARKETPLACE))
            {
                _local_2 = this._inventory._Str_6398;
                if (_local_2 == null)
                {
                    return;
                }
                _local_2._Str_4889();
            }
        }

        private function _Str_25862(k:FigureSetIdsEvent):void
        {
            this._inventory._Str_22773(k.getParser()._Str_23010, k.getParser()._parser9);
        }

        private function onRoomEnter(k:IMessageEvent):void
        {
            if (this._inventory.getBoolean("effects.reactivate.on.room.entry"))
            {
                this._inventory._Str_3994._Str_24964();
            }
            this._inventory._Str_2834.roomEntered();
        }

        private function _Str_19767(k:Map, _arg_2:int, _arg_3:int, _arg_4:Vector.<Map>):Map
        {
            var _local_5:Map;
            var _local_6:Map;
            var _local_7:Map;
            if (_arg_2 == 1)
            {
                return k;
            }
            _arg_4[_arg_3] = k;
            for each (_local_5 in _arg_4)
            {
                if (_local_5 == null)
                {
                    return null;
                }
            }
            _local_6 = new Map();
            for each (_local_7 in _arg_4)
            {
                _local_6.concatenate(_local_7);
                _local_7.dispose();
            }
            _arg_4 = null;
            return _local_6;
        }
    }
}
