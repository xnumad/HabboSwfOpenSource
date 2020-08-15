package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalHallOfFameData;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalHallOfFameMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.competition.CurrentTimingCodeMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.competition.GetCurrentTimingCodeMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.quest.HallOfFameEntryData;
    import com.sulake.habbo.communication.messages.incoming.quest.ILandingPageUserEntry;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.outgoing.competition.ForwardToACompetitionRoomMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.quest.GetCommunityGoalHallOfFameMessageComposer;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalHallOfFameWidget extends UserListWidget 
    {
        private var _data:CommunityGoalHallOfFameData;
        private var _schedulingStr:String;

        public function CommunityGoalHallOfFameWidget(k:HabboLandingView)
        {
            super(k);
        }

        override public function initialize():void
        {
            super.initialize();
            this._schedulingStr = landingView.getProperty("landing.view.dynamic.slot.6.conf");
        }

        override protected function registerMessageListeners():void
        {
            landingView.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalHallOfFameMessageEvent(this.onCommunityGoalHallOfFame));
            landingView.communicationManager.addHabboConnectionMessageEvent(new CurrentTimingCodeMessageEvent(this.onTimingCode));
        }

        override public function refresh():void
        {
            landingView.send(new GetCurrentTimingCodeMessageComposer(this._schedulingStr));
        }

        override protected function get users():Array
        {
            return (this._data == null) ? null : this._data.hof;
        }

        override protected function refreshPopup(k:ILandingPageUserEntry, _arg_2:IWindowContainer):void
        {
            var _local_3:HallOfFameEntryData = HallOfFameEntryData(k);
            _arg_2.findChildByName("user_name_txt").caption = _local_3.userName;
            var _local_4:String = "landing.view.competition.hof.points";
            landingView.localizationManager.registerParameter(_local_4, "points", ("" + _local_3._Str_7605));
            _arg_2.findChildByName("score_txt").caption = getText(_local_4);
            _arg_2.findChildByName("rank_desc_txt").caption = getText((("landing.view.competition.hof." + this._data.goalCode) + ".rankdesc.leader"));
        }

        override protected function getPopupXml():String
        {
            return "competition_user_popup";
        }

        private function onCommunityGoalHallOfFame(k:CommunityGoalHallOfFameMessageEvent):void
        {
            this._data = k.getParser().data;
            refreshContent();
        }

        override protected function hasExtraLink():Boolean
        {
            return landingView.getBoolean("landing.view.communitygoalhof.hasroomlink");
        }

        override protected function extraLinkClicked(k:ILandingPageUserEntry):void
        {
            landingView.send(new ForwardToACompetitionRoomMessageComposer(this._data.goalCode, k.userId));
        }

        private function onTimingCode(k:CurrentTimingCodeMessageEvent):void
        {
            var _local_2:String = k.getParser().code;
            if ((((k.getParser().schedulingStr == this._schedulingStr) && (!(_local_2 == ""))) && (!(disposed))))
            {
                this.loadConfigurationOverrides(_local_2);
                landingView.send(new GetCommunityGoalHallOfFameMessageComposer(k.getParser().code));
            }
        }

        private function loadConfigurationOverrides(k:String):void
        {
            var _local_3:Array;
            var _local_6:int;
            var _local_2:* = (("landing.view." + k) + ".avatarlist.yoffsets.array");
            if (landingView.propertyExists(_local_2))
            {
                _local_3 = landingView.getProperty(_local_2).split(",");
                _local_6 = 0;
                while (_local_6 < _local_3.length)
                {
                    _local_3[_local_6] = parseInt(_local_3[_local_6]);
                    _local_6++;
                }
                _Str_21503 = _local_3;
            }
            var _local_4:* = (("landing.view." + k) + ".avatarlist.widths.array");
            if (landingView.propertyExists(_local_4))
            {
                _local_3 = landingView.getProperty(_local_4).split(",");
                _local_6 = 0;
                while (_local_6 < _local_3.length)
                {
                    _local_3[_local_6] = parseInt(_local_3[_local_6]);
                    _local_6++;
                }
                _Str_20102 = _local_3;
            }
            var _local_5:* = (("landing.view." + k) + ".avatarlist.startoffset");
            if (landingView.propertyExists(_local_5))
            {
                _Str_19229 = parseInt(landingView.getProperty(_local_5));
            }
        }
    }
}
