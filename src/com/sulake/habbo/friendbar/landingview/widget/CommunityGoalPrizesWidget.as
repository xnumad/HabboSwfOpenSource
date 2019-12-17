package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgress;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3084;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalPrizesWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _data:CommunityGoalProgress;
        private var _figure:String;

        public function CommunityGoalPrizesWidget(k:HabboLandingView)
        {
            this._landingView = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._container = null;
            this._data = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("achievement_competition_prizes"));
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this._Str_5286));
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this._Str_3241));
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new _Str_3084(this._Str_5174));
        }

        public function refresh():void
        {
            this.refreshContent();
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        private function refreshContent():void
        {
            if (this._data == null)
            {
                this._container.visible = false;
                return;
            }
            this._container.visible = true;
            this._Str_15938(1);
            this._Str_15938(2);
            this._Str_15938(3);
            this._landingView.localizationManager.registerParameter(this._Str_20594("yourrankinfo"), "points", ("" + this._data.personalContributionScore));
            this._container.findChildByName("caption_txt").caption = this._Str_6273("caption");
            this._container.findChildByName("info_txt").caption = this._Str_6273("info");
            this._container.findChildByName("reward_name_txt").caption = this._Str_6273("rewardname");
            this._container.findChildByName("reward_info_txt").caption = this._Str_6273("rewardinfo");
            this._container.findChildByName("rank_1_txt").caption = this._Str_6273("rank1");
            this._container.findChildByName("rank_2_txt").caption = this._Str_6273("rank2");
            this._container.findChildByName("rank_3_txt").caption = this._Str_6273("rank3");
            this._container.findChildByName("user_rank_border").visible = ((!(this._data._Str_13028)) || (this._data._Str_10549 > 0));
            var k:String = ((this._data._Str_13028) ? "yourfinalrank" : ((this._data._Str_10549 > 0) ? "yourrank" : "youarenotranked"));
            this._landingView.localizationManager.registerParameter(this._Str_1196(k), "rank", ("" + this._data._Str_10549));
            this._container.findChildByName("user_rank_txt").caption = this.getText(k);
            this._container.findChildByName("user_rank_info_txt").visible = (!(this._data._Str_13028));
            this._container.findChildByName("user_rank_info_txt").caption = this._Str_6273(((this._data._Str_10549 > 0) ? "yourrankinfo" : "youarenotrankedinfo"));
            IStaticBitmapWrapperWindow(this._container.findChildByName("reward_image")).assetUri = (("${image.library.url}reception/" + this._data.goalCode) + "Reward.png");
        }

        private function _Str_15938(k:int):void
        {
            var _local_2:int = this._Str_24483(k);
            var _local_3:int = this._Str_24585(k);
            var _local_4:String = ((_local_2 == _local_3) ? this._Str_1196("rank") : this._Str_1196("ranks"));
            this._landingView.localizationManager.registerParameter(_local_4, "start", ("" + _local_2));
            this._landingView.localizationManager.registerParameter(_local_4, "end", ("" + _local_3));
            this._container.findChildByName((("rank_" + k) + "_info_txt")).caption = (("${" + _local_4) + "}");
        }

        private function _Str_24483(k:int):int
        {
            var _local_2:int = this._data._Str_20155[(k - 2)];
            return _local_2 + 1;
        }

        private function _Str_24585(k:int):int
        {
            return this._data._Str_20155[(k - 1)];
        }

        private function _Str_5286(k:CommunityGoalProgressMessageEvent):void
        {
            this._data = k.getParser().data;
            this.refreshContent();
        }

        private function _Str_1196(k:String):String
        {
            return "landing.view.competition.prizes." + k;
        }

        private function _Str_20594(k:String):String
        {
            return this._Str_1196(((this._data.goalCode + ".") + k));
        }

        private function _Str_6273(k:String):String
        {
            var _local_2:String = this._Str_20594(k);
            return ("${" + _local_2) + "}";
        }

        private function getText(k:String):String
        {
            var _local_2:String = this._Str_1196(k);
            return ("${" + _local_2) + "}";
        }

        private function _Str_3241(k:UserObjectEvent):void
        {
            this._figure = k.getParser().figure;
            this._Str_7815();
        }

        private function _Str_5174(k:_Str_3084):void
        {
            if (((!(k == null)) && (k.id == -1)))
            {
                this._figure = k.figure;
                this._Str_7815();
            }
        }

        private function _Str_7815():void
        {
            var k:IWidgetWindow = IWidgetWindow(this._container.findChildByName("avatar_image"));
            var _local_2:_Str_2483 = _Str_2483(k.widget);
            _local_2.figure = this._figure;
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }
    }
}


