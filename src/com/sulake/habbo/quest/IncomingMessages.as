package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.SeasonalQuestsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.competition.CompetitionEntrySubmitResultEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4408;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionProgressMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_7630;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsScoreEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3492;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_5081;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.AchievementResolutionCompletedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_3660;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_4508;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_5843;
    import com.sulake.habbo.communication.messages.incoming.handshake.IsFirstLoginOfDayEvent;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestCompletedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_5159;
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
    import com.sulake.habbo.communication.messages.parser.notifications._Str_5519;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_7264;
    import com.sulake.habbo.communication.messages.parser.users._Str_4007;
    import flash.utils.Dictionary;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;

    public class IncomingMessages implements IDisposable 
    {
        private var _questEngine:HabboQuestEngine;
        private var _alertDialog:_Str_2418;
        private var _isDisposed:Boolean = false;

        public function IncomingMessages(k:HabboQuestEngine)
        {
            this._questEngine = k;
            var _local_2:IHabboCommunicationManager = this._questEngine.communication;
            _local_2.addHabboConnectionMessageEvent(new QuestMessageEvent(this._Str_4750));
            _local_2.addHabboConnectionMessageEvent(new AchievementEvent(this._Str_12011));
            _local_2.addHabboConnectionMessageEvent(new SeasonalQuestsMessageEvent(this._Str_12986));
            _local_2.addHabboConnectionMessageEvent(new _Str_3352(this._Str_2960));
            _local_2.addHabboConnectionMessageEvent(new CompetitionEntrySubmitResultEvent(this._Str_17737));
            _local_2.addHabboConnectionMessageEvent(new _Str_4408(this._Str_19159));
            _local_2.addHabboConnectionMessageEvent(new _Str_2752(this.onCreditBalance));
            _local_2.addHabboConnectionMessageEvent(new AchievementResolutionProgressMessageEvent(this._Str_23911));
            _local_2.addHabboConnectionMessageEvent(new _Str_7630(this._Str_16392));
            _local_2.addHabboConnectionMessageEvent(new AchievementResolutionsMessageEvent(this._Str_23908));
            _local_2.addHabboConnectionMessageEvent(new AchievementsScoreEvent(this._Str_18065));
            _local_2.addHabboConnectionMessageEvent(new QuestsMessageEvent(this._Str_8212));
            _local_2.addHabboConnectionMessageEvent(new _Str_3492(this._Str_24584));
            _local_2.addHabboConnectionMessageEvent(new _Str_5081(this._Str_12021));
            _local_2.addHabboConnectionMessageEvent(new AchievementResolutionCompletedMessageEvent(this._Str_24464));
            _local_2.addHabboConnectionMessageEvent(new _Str_3660(this._Str_11598));
            _local_2.addHabboConnectionMessageEvent(new _Str_4508(this._Str_24427));
            _local_2.addHabboConnectionMessageEvent(new _Str_5843(this._Str_19159));
            _local_2.addHabboConnectionMessageEvent(new IsFirstLoginOfDayEvent(this._Str_22814));
            _local_2.addHabboConnectionMessageEvent(new QuestCompletedMessageEvent(this._Str_5657));
            _local_2.addHabboConnectionMessageEvent(new _Str_5159(this._Str_4970));
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
            Logger.log(((("Got Quests: " + _local_2.quests) + ", ") + _local_2._Str_2826));
            this._questEngine.events.dispatchEvent(new QuestsListEvent(QuestsListEvent.QUESTS, _local_2.quests, _local_2._Str_2826));
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

        private function onCreditBalance(k:_Str_2752):void
        {
            this._questEngine._Str_8189.onCreditBalance(k);
            this._questEngine._Str_6927 = true;
        }

        private function _Str_2960(k:IMessageEvent):void
        {
            this._questEngine._Str_3398._Str_2960();
            this._questEngine._Str_17659._Str_2960();
            this._questEngine._Str_8189._Str_2960();
            this._questEngine._Str_6927 = false;
        }

        private function _Str_19159(k:IMessageEvent):void
        {
            this._questEngine._Str_8189._Str_21523();
        }

        private function _Str_12021(k:IMessageEvent):void
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

        private function _Str_11598(k:IMessageEvent):void
        {
            var _local_2:_Str_3660 = (k as _Str_3660);
            var _local_3:_Str_5519 = _local_2.getParser();
            var _local_4:String = this._questEngine.localization._Str_21634(_local_3.data.badgeCode);
            this._questEngine.send(new EventLogMessageComposer("Achievements", _local_4, "Leveled", "", _local_3.data.level));
            this._questEngine._Str_10255._Str_11598(_local_3.data);
        }

        private function _Str_22814(k:IMessageEvent):void
        {
            var _local_2:_Str_7264 = (k as IsFirstLoginOfDayEvent).getParser();
            this._questEngine._Str_25830(_local_2._Str_18128);
        }

        private function _Str_17737(k:CompetitionEntrySubmitResultEvent):void
        {
            this._questEngine._Str_8189._Str_17737(k);
        }

        private function _Str_16392(k:_Str_7630):void
        {
            this._questEngine._Str_8189._Str_16392(k);
        }

        private function _Str_24584(k:_Str_3492):void
        {
            if (((k.getParser().isVIP) && (k.getParser()._Str_9379 == _Str_4007._Str_12890)))
            {
                this._questEngine._Str_8189._Str_25159();
            }
        }

        private function _Str_4970(k:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_2:Dictionary = _Str_5159(k).points;
            for each (_local_3 in ActivityPointTypeEnum.values())
            {
                this._questEngine._Str_3398._Str_4970(_local_3, 0);
            }
            for (_local_4 in _local_2)
            {
                this._questEngine._Str_3398._Str_4970(int(_local_4), _local_2[_local_4]);
            }
        }

        private function _Str_24427(k:_Str_4508):void
        {
            this._questEngine._Str_3398._Str_4970(k.type, k.amount);
        }
    }
}
