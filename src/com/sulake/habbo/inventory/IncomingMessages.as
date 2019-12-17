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
    import com.sulake.habbo.communication.messages.incoming.inventory.trading._Str_6742;
    import com.sulake.habbo.communication.messages.parser.inventory.trading._Str_9219;
    import com.sulake.habbo.communication.messages.incoming._Str_433._Str_8269;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_6821;
    import com.sulake.habbo.communication.messages.incoming.inventory.clothes._Str_9041;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4187;
    import com.sulake.habbo.communication.messages.incoming._Str_433._Str_9129;
    import com.sulake.habbo.communication.messages.incoming._Str_87._Str_5147;
    import com.sulake.habbo.communication.messages.incoming.users.UserBadgesEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_5727;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_5714;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_9517;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOtherNotAllowedParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_5581;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAcceptParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsScoreEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9550;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3492;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNotOpenParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_6908;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_5720;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5514;
    import com.sulake.habbo.communication.messages.incoming._Str_433._Str_8892;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni._Str_9359;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenFailedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenFailedEventParser;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading._Str_7375;
    import com.sulake.habbo.communication.messages.parser.inventory.trading._Str_9589;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming._Str_87._Str_8120;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_5946;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_6450;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9259;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListAddOrUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.marketplace._Str_6022;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_3660;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_8524;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_5345;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_6944;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9047;
    import com.sulake.habbo.communication.messages.incoming._Str_87._Str_8980;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_7941;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.InventoryItemParser;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListAddOrUpdateParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_8074;
    import com.sulake.habbo.communication.messages.parser.inventory.furni._Str_7548;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_5511;
    import com.sulake.habbo.inventory.effects.Effect;
    import com.sulake.habbo.inventory.effects.EffectsModel;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_5747;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_7398;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_8175;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_7054;
    import com.sulake.habbo.communication.messages.parser.users._Str_4007;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_6941;
    import com.sulake.habbo.inventory.badges.BadgesModel;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_7446;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_7305;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_5519;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_7491;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsScoreParser;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.inventory.enum.InventorySubCategory;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.inventory.trading.TradingModel;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading._Str_6342;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.inventory.pets.PetsModel;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_8090;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_8182;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_7486;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_7183;
    import com.sulake.habbo.inventory.bots.BotsModel;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_7631;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_7906;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_6995;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationMessageParser;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_7065;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_6596;
    import com.sulake.habbo.communication.messages.parser.marketplace._Str_6774;
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
            this._com.addHabboConnectionMessageEvent(new _Str_6742(this._Str_25320, _Str_9219));
            this._com.addHabboConnectionMessageEvent(new _Str_8269(this._Str_24595));
            this._com.addHabboConnectionMessageEvent(new _Str_6821(this._Str_18656));
            this._com.addHabboConnectionMessageEvent(new _Str_9041(this._Str_25862));
            this._com.addHabboConnectionMessageEvent(new _Str_4187(this._Str_15910));
            this._com.addHabboConnectionMessageEvent(new _Str_9129(this._Str_23613));
            this._com.addHabboConnectionMessageEvent(new _Str_5147(this._Str_18002));
            this._com.addHabboConnectionMessageEvent(new UserBadgesEvent(this.onUserBadges));
            this._com.addHabboConnectionMessageEvent(new _Str_5727(this._Str_16010));
            this._com.addHabboConnectionMessageEvent(new _Str_5714(this._Str_15910));
            this._com.addHabboConnectionMessageEvent(new _Str_9517(this._Str_25747));
            this._com.addHabboConnectionMessageEvent(new TradingOtherNotAllowedEvent(this._Str_22530, TradingOtherNotAllowedParser));
            this._com.addHabboConnectionMessageEvent(new _Str_5581(this._Str_25001));
            this._com.addHabboConnectionMessageEvent(new TradingAcceptEvent(this._Str_23770, TradingAcceptParser));
            this._com.addHabboConnectionMessageEvent(new AchievementsScoreEvent(this._Str_18065));
            this._com.addHabboConnectionMessageEvent(new _Str_9550(this._Str_23427));
            this._com.addHabboConnectionMessageEvent(new _Str_3492(this._Str_23143));
            this._com.addHabboConnectionMessageEvent(new TradingNotOpenEvent(this._Str_23644, TradingNotOpenParser));
            this._com.addHabboConnectionMessageEvent(new _Str_6908(this._Str_25700));
            this._com.addHabboConnectionMessageEvent(new _Str_5720(this._Str_17365));
            this._com.addHabboConnectionMessageEvent(new TradingCloseEvent(this._Str_25275, TradingCloseParser));
            this._com.addHabboConnectionMessageEvent(new _Str_5514(this._Str_16520));
            this._com.addHabboConnectionMessageEvent(new _Str_8892(this._Str_23929));
            this._com.addHabboConnectionMessageEvent(new _Str_9359(this._Str_23887));
            this._com.addHabboConnectionMessageEvent(new TradingOpenFailedEvent(this._Str_23502, TradingOpenFailedEventParser));
            this._com.addHabboConnectionMessageEvent(new _Str_3352(this._Str_15910));
            this._com.addHabboConnectionMessageEvent(new _Str_7375(this._Str_22556, _Str_9589));
            this._com.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this._Str_4297));
            this._com.addHabboConnectionMessageEvent(new _Str_8120(this._Str_23620));
            this._com.addHabboConnectionMessageEvent(new _Str_5946(this._Str_16617));
            this._com.addHabboConnectionMessageEvent(new _Str_6450(this.onAvatarEffects));
            this._com.addHabboConnectionMessageEvent(new _Str_9259(this._Str_24135));
            this._com.addHabboConnectionMessageEvent(new FurniListAddOrUpdateEvent(this._Str_23121));
            this._com.addHabboConnectionMessageEvent(new _Str_6022(this._Str_16181));
            this._com.addHabboConnectionMessageEvent(new _Str_3660(this._Str_25294));
            this._com.addHabboConnectionMessageEvent(new _Str_8524(this._Str_25173));
            this._com.addHabboConnectionMessageEvent(new _Str_5345(this._Str_17996));
            this._com.addHabboConnectionMessageEvent(new _Str_2752(this.onCreditBalance));
            this._com.addHabboConnectionMessageEvent(new _Str_6944(this._Str_18461));
            this._com.addHabboConnectionMessageEvent(new _Str_9047(this._Str_22306));
            this._com.addHabboConnectionMessageEvent(new _Str_8980(this._Str_25648));
        }

        public function dispose():void
        {
            this._inventory = null;
            this._com = null;
        }

        public function _Str_25001(k:_Str_5581):void
        {
            var _local_2:_Str_7941 = k.getParser();
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
                this._furniMsgFragments = new Vector.<Map>(_local_2._Str_7430, true);
            }
            var _local_4:Map = new Map();
            _local_4.concatenate(_local_2._Str_22320);
            var _local_5:Map = this._Str_19767(_local_4, _local_2._Str_7430, _local_2._Str_9600, this._furniMsgFragments);
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
            var _local_6:InventoryItemParser;
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
            var _local_4:Vector.<InventoryItemParser> = _local_2._Str_9248();
            for each (_local_6 in _local_4)
            {
                _local_7 = _local_3._Str_25496(_local_6.itemId);
                if (_local_7)
                {
                    _local_5 = _local_7._Str_2990(_local_6.itemId);
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
            _local_3._Str_2491();
        }

        public function _Str_25700(k:IMessageEvent):void
        {
            var _local_2:_Str_8074 = (k as _Str_6908).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:FurniModel = this._inventory._Str_2834;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_2._Str_17550;
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
            var _local_2:_Str_7548 = (k as _Str_9359).getParser();
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
            var _local_5:int = _local_2._Str_23779;
            _local_3._Str_22816(_local_4, _local_5);
        }

        public function onAvatarEffects(k:IMessageEvent):void
        {
            var _local_6:_Str_5511;
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
            var _local_3:_Str_5747 = (k as _Str_6450).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:Array = _local_3.effects;
            var _local_5:int;
            while (_local_5 < _local_4.length)
            {
                _local_6 = (_local_4[_local_5] as _Str_5511);
                _local_7 = new Effect();
                _local_7.type = _local_6.type;
                _local_7._Str_3882 = _local_6._Str_3882;
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
            var _local_3:_Str_7398 = (k as _Str_6944).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3.type;
            var _local_5:int = _local_3._Str_3882;
            var _local_6:int = _local_3.duration;
            var _local_7:Boolean = _local_3._Str_4010;
            var _local_8:Effect = new Effect();
            _local_8.type = _local_4;
            _local_8._Str_3882 = _local_5;
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
            var _local_3:_Str_8175 = (k as _Str_5720).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3.type;
            _local_2._Str_22417(_local_4);
            this._inventory._Str_7796();
        }

        public function _Str_17996(k:IMessageEvent):void
        {
            var _local_2:EffectsModel = this._inventory._Str_3994;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7054 = (k as _Str_5345).getParser();
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = _local_3.type;
            _local_2._Str_24134(_local_4);
            this._inventory._Str_7796();
        }

        public function _Str_23143(k:IMessageEvent):void
        {
            var _local_2:_Str_4007 = (k as _Str_3492).getParser();
            if (((_local_2.productName == "habbo_club") || (_local_2.productName == "club_habbo")))
            {
                this._inventory._Str_23808(_local_2._Str_17546, _local_2._Str_14465, _local_2._Str_24419, _local_2.isVIP, (_local_2._Str_9379 == _Str_4007._Str_14729), (_local_2._Str_9379 == _Str_4007._Str_15916), _local_2.minutesUntilExpiration, _local_2._Str_6312);
                this._inventory.events.dispatchEvent(new HabboInventoryHabboClubEvent());
            }
        }

        public function _Str_18002(k:IMessageEvent):void
        {
            var _local_4:int;
            var _local_5:String;
            var _local_8:Boolean;
            var _local_9:int;
            var _local_2:_Str_6941 = (k as _Str_5147).getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:BadgesModel = this._inventory._Str_7962;
            if (_local_3 == null)
            {
                return;
            }
            var _local_6:Array = _local_2._Str_21415();
            var _local_7:Array = _local_2._Str_23681();
            for each (_local_5 in _local_6)
            {
                _local_8 = (_local_7.indexOf(_local_5) > -1);
                _local_9 = _local_2.getBadgeId(_local_5);
                _local_3.updateBadge(_local_5, _local_8, _local_9);
            }
            _local_3._Str_22395();
            _local_3._Str_2491();
            this._inventory._Str_5943(InventoryCategory.BADGES);
        }

        public function _Str_25648(k:IMessageEvent):void
        {
            var _local_3:_Str_7446;
            var _local_2:_Str_7305 = (k as _Str_8980).getParser();
            for each (_local_3 in _local_2.data)
            {
                this._inventory.localization._Str_20202(_local_3.badgeId, _local_3.limit);
            }
        }

        public function onUserBadges(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_2:UserBadgesEvent = (k as UserBadgesEvent);
            if (_local_2.userId != this._inventory._Str_2627.userId)
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
            _local_3._Str_2491();
        }

        public function _Str_25294(k:IMessageEvent):void
        {
            var _local_2:_Str_3660 = (k as _Str_3660);
            var _local_3:_Str_5519 = _local_2.getParser();
            var _local_4:BadgesModel = this._inventory._Str_7962;
            if (_local_4 != null)
            {
                _local_4.updateBadge(_local_3.data.badgeCode, false, _local_3.data.badgeId);
                _local_4._Str_24079(_local_3.data._Str_24720);
                _local_4._Str_2491();
            }
        }

        public function _Str_23620(k:IMessageEvent):void
        {
            var _local_2:_Str_7491 = _Str_8120(k).getParser();
            var _local_3:BadgesModel = this._inventory._Str_7962;
            if (_local_3 != null)
            {
                _local_3.updateBadge(_local_2.badgeCode, false, _local_2.badgeId);
                _local_3._Str_2491();
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
            var _local_2:ISessionDataManager = this._inventory._Str_2627;
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
            this._inventory._Str_16351(InventorySubCategory.TRADING);
            var _local_4:_Str_7375 = (k as _Str_7375);
            if (!_local_4)
            {
                ErrorReportStorage.addDebugData("IncomingEvent", (("event is of unknown type:" + k) + "!"));
                return;
            }
            var _local_5:int = _local_4._Str_4963;
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
            var _local_2:_Str_6742 = (k as _Str_6742);
            var _local_3:Map = new Map();
            var _local_4:Map = new Map();
            var _local_5:int = this._inventory._Str_2627.userId;
            var _local_6:FurniModel = this._inventory._Str_2834;
            if (_local_6 == null)
            {
                return;
            }
            if (((this._inventory.getBoolean("trading.warning.enabled")) && (_local_2._Str_9138 > 0)))
            {
                _local_8 = this._inventory._Str_2834._Str_23876(_local_2._Str_9138);
                _local_4.add(CREDIT_GROUPITEM_TYPE_ID, _local_8);
            }
            this._Str_21714(_local_2._Str_17841, _local_3, (_local_2._Str_15162 == _local_5));
            this._Str_21714(_local_2._Str_17465, _local_4, (_local_2._Str_18215 == _local_5));
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
            var _local_9:_Str_6342;
            var _local_10:int;
            var _local_4:uint = k.length;
            _local_10 = 0;
            while (_local_10 < _local_4)
            {
                _local_9 = (k[_local_10] as _Str_6342);
                _local_6 = _local_9.spriteId;
                _local_7 = _local_9.category;
                _local_8 = (_local_9.furniType + String(_local_6));
                if (((!(_local_9.isGroupable)) || (this._Str_20661(_local_9.spriteId))))
                {
                    _local_8 = ("itemid" + _local_9.itemId);
                }
                if (_local_9.category == FurniCategory._Str_5186)
                {
                    _local_8 = ((String(_local_6) + "poster") + _local_9.stuffData.getLegacyString());
                }
                else
                {
                    if (_local_9.category == FurniCategory._Str_12454)
                    {
                        _local_8 = TradingModel._Str_16998(_local_6, _local_9.stuffData);
                    }
                }
                _local_5 = (((_local_9.isGroupable) && (!(this._Str_20661(_local_9.spriteId)))) ? (_arg_2.getValue(_local_8) as GroupItem) : null);
                if (_local_5 == null)
                {
                    _local_5 = this._inventory._Str_2834._Str_18196(_local_6, _local_7, _local_9.stuffData);
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
            this._inventory._Str_2834._Str_13202();
        }

        private function _Str_24135(k:_Str_9259):void
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
            var _local_3:_Str_8090 = k.getParser();
            if (this._petMsgFragments == null)
            {
                this._petMsgFragments = new Vector.<Map>(_local_3._Str_7430, true);
            }
            var _local_4:Map = new Map();
            _local_4.concatenate(_local_3._Str_24388);
            var _local_5:Map = this._Str_19767(_local_4, _local_3._Str_7430, _local_3._Str_9600, this._petMsgFragments);
            if (!_local_5)
            {
                return;
            }
            this._inventory._Str_4524._Str_25168(_local_5);
            this._petMsgFragments = null;
        }

        private function _Str_23427(k:_Str_9550):void
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
            var _local_3:_Str_8182 = k.getParser();
            _local_2._Str_9947(_local_3.pet);
            if (_local_3._Str_19947())
            {
            }
        }

        private function _Str_25173(k:_Str_8524):void
        {
            if (((k == null) || (this._inventory == null)))
            {
                return;
            }
            var _local_2:String = "${gotobreedingnestfailure.getnest}";
            var _local_3:Function = this._Str_23001;
            if (k.getParser().reason == _Str_7486._Str_17785)
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

        private function _Str_22306(k:_Str_9047):void
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
            var _local_3:_Str_7183 = k.getParser();
            _local_2._Str_12321(_local_3._Str_2508);
        }

        private function _Str_23613(k:_Str_9129):void
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
            var _local_3:_Str_7631 = k.getParser();
            _local_2._Str_23563(_local_3.items);
            this._inventory._Str_5943(InventoryCategory.BOTS);
            _local_2._Str_11524();
        }

        private function _Str_24595(k:_Str_8269):void
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
            var _local_3:_Str_7906 = k.getParser();
            _local_2.removeItem(_local_3.itemId);
        }

        private function _Str_23929(k:_Str_8892):void
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
            var _local_3:_Str_6995 = k.getParser();
            _local_2._Str_2822(_local_3.item);
        }

        private function _Str_16010(k:_Str_5727):void
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
            _local_2.enabled = _local_3.enabled;
            _local_2.commission = _local_3.commission;
            _local_2.credits = _local_3.credits;
            _local_2.advertisements = _local_3.advertisements;
            _local_2.minimumPrice = _local_3.minimumPrice;
            _local_2.maximumPrice = _local_3.maximumPrice;
            _local_2.offerTime = _local_3.offerTime;
            _local_2.displayTime = _local_3.displayTime;
            this._inventory._Str_5943(InventoryCategory.MARKETPLACE);
            var _local_4:FurniModel = this._inventory._Str_2834;
            if (_local_4 != null)
            {
                _local_4._Str_2491();
            }
        }

        private function _Str_25747(k:_Str_9517):void
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
            var _local_3:_Str_7065 = k.getParser();
            _local_2._Str_23766(_local_3._Str_3278, _local_3._Str_24601);
        }

        private function _Str_16181(k:_Str_6022):void
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
            var _local_3:_Str_6596 = k.getParser();
            _local_2._Str_24514(_local_3.result);
        }

        private function _Str_16617(k:_Str_5946):void
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
            var _local_3:_Str_6774 = k.getParser();
            _local_2._Str_22836(_local_3._Str_9431, _local_3._Str_8798, _local_3._Str_3925);
        }

        private function _Str_16520(k:_Str_5514):void
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
            _local_2._Str_16520();
        }

        private function _Str_4297(k:IMessageEvent):void
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

        private function _Str_25862(k:_Str_9041):void
        {
            this._inventory._Str_22773(k.getParser()._Str_23010, k.getParser()._parser9);
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            if (this._inventory.getBoolean("effects.reactivate.on.room.entry"))
            {
                this._inventory._Str_3994._Str_24964();
            }
            this._inventory._Str_2834._Str_15723();
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
