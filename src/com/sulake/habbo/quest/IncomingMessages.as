package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.SeasonalQuestsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.competition.CompetitionEntrySubmitResultEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectRemoveMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionProgressMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.competition.CompetitionVotingInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsScoreEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSavedEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionCompletedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectAddMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.IsFirstLoginOfDayEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestCompletedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications.ActivityPointsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestCancelledMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestCompletedParser;
    import com.sulake.habbo.quest.events.QuestCompletedEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestsParser;
    import com.sulake.habbo.quest.events.QuestsListEvent;
    import com.sulake.habbo.communication.messages.parser.quest.SeasonalQuestsParser;
    import com.sulake.habbo.communication.messages.parser.quest.QuestParser;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionsMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionProgressMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionCompletedMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementParser;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsScoreParser;
    import com.sulake.habbo.communication.messages.parser.notifications.HabboAchievementNotificationMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.parser.handshake.IsFirstLoginOfDayParser;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;

    public class IncomingMessages implements IDisposable 
    {
        private var _questEngine:HabboQuestEngine;
        private var _alertDialog:IAlertDialog;
        private var _isDisposed:Boolean = false;

        public function IncomingMessages(k:HabboQuestEngine)
        {
            this._questEngine = k;
            var _local_2:IHabboCommunicationManager = this._questEngine.communication;
            _local_2.addHabboConnectionMessageEvent(new QuestMessageEvent(this._Str_4750));
            _local_2.addHabboConnectionMessageEvent(new AchievementEvent(this._Str_12011));
            _local_2.addHabboConnectionMessageEvent(new SeasonalQuestsMessageEvent(this._Str_12986));
            _local_2.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
            _local_2.addHabboConnectionMessageEvent(new CompetitionEntrySubmitResultEvent(this._Str_17737));
            _local_2.addHabboConnectionMessageEvent(new ObjectRemoveMessageEvent(this._Str_19159));
            _local_2.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
            _local_2.addHabboConnectionMessageEvent(new AchievementResolutionProgressMessageEvent(this._Str_23911));
            _local_2.addHabboConnectionMessageEvent(new CompetitionVotingInfoMessageEvent(this._Str_16392));
            _local_2.addHabboConnectionMessageEvent(new AchievementResolutionsMessageEvent(this._Str_23908));
            _local_2.addHabboConnectionMessageEvent(new AchievementsScoreEvent(this._Str_18065));
            _local_2.addHabboConnectionMessageEvent(new QuestsMessageEvent(this._Str_8212));
            _local_2.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(this.onSubscriptionUserInfoEvent));
            _local_2.addHabboConnectionMessageEvent(new RoomSettingsSavedEvent(this.onRoomSettingsSaved));
            _local_2.addHabboConnectionMessageEvent(new AchievementResolutionCompletedMessageEvent(this._Str_24464));
            _local_2.addHabboConnectionMessageEvent(new HabboAchievementNotificationMessageEvent(this.onLevelUp));
            _local_2.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(this._Str_24427));
            _local_2.addHabboConnectionMessageEvent(new ObjectAddMessageEvent(this._Str_19159));
            _local_2.addHabboConnectionMessageEvent(new IsFirstLoginOfDayEvent(this._Str_22814));
            _local_2.addHabboConnectionMessageEvent(new QuestCompletedMessageEvent(this._Str_5657));
            _local_2.addHabboConnectionMessageEvent(new ActivityPointsMessageEvent(this.onActivityPoints));
            _local_2.addHabboConnectionMessageEvent(new AchievementsEvent(this._Str_17329));
            _local_2.addHabboConnectionMessageEvent(new QuestCancelledMessageEvent(this._Str_5242));
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        private function _Str_5657(k:IMessageEvent):void
        {
            var _local_2:QuestCompletedParser = (k as QuestCompletedMessageEvent).getParser();
            Logger.log(((("Quest Completed: " + _local_2._Str_8257._Str_6549) + " quest: ") + _local_2._Str_8257.id));
            this._questEngine._Str_3398._Str_5657(_local_2._Str_8257, _local_2._Str_23243);
            if (this._questEngine._Str_7575(_local_2._Str_8257))
            {
                this._questEngine.events.dispatchEvent(new QuestCompletedEvent(QuestCompletedEvent.QCE_SEASONAL, _local_2._Str_8257));
            }
        }

        private function _Str_5242(k:IMessageEvent):void
        {
            Logger.log("Quest Cancelled: ");
            this._questEngine._Str_3398._Str_5242();
            if (QuestCancelledMessageEvent(k).getParser().expired)
            {
                this._questEngine.windowManager.alert("${quests.expired.title}", "${quests.expired.body}", 0, null);
            }
        }

        private function _Str_8212(k:IMessageEvent):void
        {
            var _local_2:QuestsParser = (k as QuestsMessageEvent).getParser();
            Logger.log(((("Got Quests: " + _local_2.quests) + ", ") + _local_2.openWindow));
            this._questEngine.events.dispatchEvent(new QuestsListEvent(QuestsListEvent.QUESTS, _local_2.quests, _local_2.openWindow));
        }

        private function _Str_12986(k:IMessageEvent):void
        {
            var _local_2:SeasonalQuestsParser = (k as SeasonalQuestsMessageEvent).getParser();
            Logger.log(("Got seasonal Quests: " + _local_2.quests));
            this._questEngine.events.dispatchEvent(new QuestsListEvent(QuestsListEvent.QE_QUESTS_SEASONAL, _local_2.quests, true));
        }

        private function _Str_4750(k:IMessageEvent):void
        {
            var _local_2:QuestParser = (k as QuestMessageEvent).getParser();
            Logger.log(("Got Quest: " + _local_2.quest));
            this._questEngine._Str_3398._Str_4750(_local_2.quest);
        }

        public function dispose():void
        {
            if (this._alertDialog)
            {
                this._alertDialog.dispose();
                this._alertDialog = null;
            }
            this._isDisposed = true;
        }

        private function onRoomEnter(k:RoomEntryInfoMessageEvent):void
        {
            this._questEngine._Str_8189.onRoomEnter(k);
            this._questEngine._Str_6927 = true;
        }

        private function onRoomExit(k:IMessageEvent):void
        {
            this._questEngine._Str_3398.onRoomExit();
            this._questEngine._Str_17659.onRoomExit();
            this._questEngine._Str_8189.onRoomExit();
            this._questEngine._Str_6927 = false;
        }

        private function _Str_19159(k:IMessageEvent):void
        {
            this._questEngine._Str_8189._Str_21523();
        }

        private function onRoomSettingsSaved(k:IMessageEvent):void
        {
            this._questEngine._Str_8189._Str_21523();
        }

        private function _Str_17329(k:IMessageEvent):void
        {
            var _local_2:AchievementsEvent = (k as AchievementsEvent);
            var _local_3:AchievementsParser = (_local_2.getParser() as AchievementsParser);
            this._questEngine._Str_17659._Str_17329(_local_3.achievements, _local_3.defaultCategory);
        }

        private function _Str_23908(k:AchievementResolutionsMessageEvent):void
        {
            var _local_2:AchievementResolutionsMessageParser = k.getParser();
            this._questEngine._Str_10255._Str_23538(_local_2.stuffId, _local_2.achievements, _local_2._Str_17028);
        }

        private function _Str_23911(k:AchievementResolutionProgressMessageEvent):void
        {
            var _local_2:AchievementResolutionProgressMessageParser = k.getParser();
            this._questEngine._Str_10255._Str_24205(_local_2.stuffId, _local_2.achievementId, _local_2.requiredLevelBadgeCode, _local_2.userProgress, _local_2._Str_18600, _local_2._Str_17028);
        }

        private function _Str_24464(k:AchievementResolutionCompletedMessageEvent):void
        {
            var _local_2:AchievementResolutionCompletedMessageParser = k.getParser();
            this._questEngine._Str_10255._Str_25733(_local_2.badgeCode, _local_2.stuffCode);
        }

        private function _Str_12011(k:IMessageEvent):void
        {
            var _local_2:AchievementEvent = (k as AchievementEvent);
            var _local_3:AchievementParser = (_local_2.getParser() as AchievementParser);
            this._questEngine._Str_17659._Str_12011(_local_3.achievement);
            this._questEngine._Str_10255._Str_12011(_local_3.achievement);
        }

        private function _Str_18065(k:IMessageEvent):void
        {
            var _local_2:AchievementsScoreEvent = (k as AchievementsScoreEvent);
            var _local_3:AchievementsScoreParser = (_local_2.getParser() as AchievementsScoreParser);

            this._questEngine.localization.registerParameter("achievements.categories.score", "score", _local_3.score.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " "));
        }

        private function formattingNumber(number: String): String
        {
            var result: String = "";
            for(var i: Number = number.length; i > 0; i--)
            {
                var char: String = number.charAt(number.length - i);

                if(i % 3 === 0 && i != number.length) result += " " + char;
                
                else result += char;
            }

            return result;
        }

        private function onLevelUp(k:IMessageEvent):void
        {
            var _local_2:HabboAchievementNotificationMessageEvent = (k as HabboAchievementNotificationMessageEvent);
            var _local_3:HabboAchievementNotificationMessageParser = _local_2.getParser();
            var _local_4:String = this._questEngine.localization.getBadgeBaseName(_local_3.data.badgeCode);
            this._questEngine.send(new EventLogMessageComposer("Achievements", _local_4, "Leveled", "", _local_3.data.level));
            this._questEngine._Str_10255.onLevelUp(_local_3.data);
        }

        private function _Str_22814(k:IMessageEvent):void
        {
            var _local_2:IsFirstLoginOfDayParser = (k as IsFirstLoginOfDayEvent).getParser();
            this._questEngine._Str_25830(_local_2._Str_18128);
        }

        private function _Str_17737(k:CompetitionEntrySubmitResultEvent):void
        {
            this._questEngine._Str_8189._Str_17737(k);
        }

        private function _Str_16392(k:CompetitionVotingInfoMessageEvent):void
        {
            this._questEngine._Str_8189._Str_16392(k);
        }

        private function onSubscriptionUserInfoEvent(k:ScrSendUserInfoEvent):void
        {
            if (((k.getParser().isVIP) && (k.getParser().responseType == ScrSendUserInfoMessageParser.RESPONSE_TYPE_PURCHASE)))
            {
                this._questEngine._Str_8189.sendRoomCompetitionInit();
            }
        }

        private function onActivityPoints(k:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_2:Dictionary = ActivityPointsMessageEvent(k).points;
            for each (_local_3 in ActivityPointTypeEnum.values())
            {
                this._questEngine._Str_3398.onActivityPoints(_local_3, 0);
            }
            for (_local_4 in _local_2)
            {
                this._questEngine._Str_3398.onActivityPoints(int(_local_4), _local_2[_local_4]);
            }
        }

        private function _Str_24427(k:HabboActivityPointNotificationMessageEvent):void
        {
            this._questEngine._Str_3398.onActivityPoints(k.type, k.amount);
        }
    }
}
