package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.communication.messages.incoming._Str_530._Str_9665;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class CommunityGoalVsModeWidgetWithVoting extends CommunityGoalVsModeWidget
    {
        private var _voteOptionOneButton:IWindow;
        private var _voteOptionTwoButton:IWindow;
        private var _voteOption:String;

        public function CommunityGoalVsModeWidgetWithVoting(k:HabboLandingView)
        {
            super(k, true);
        }

        override public function initialize():void
        {
            super.initialize();
            this._voteOptionOneButton = _Str_3186.findChildByName("community_vote_one_button");
            this._voteOptionOneButton.procedure = this.onVoteOptionOneClick;
            this._voteOptionTwoButton = _Str_3186.findChildByName("community_vote_two_button");
            this._voteOptionTwoButton.procedure = this.onVoteOptionTwoClick;
            _Str_2298.communicationManager.addHabboConnectionMessageEvent(new _Str_9665(this.onInfo));
        }

        override public function refresh():void
        {
            super.refresh();
            if (_Str_6672 != null)
            {
                if (this._voteOptionOneButton != null)
                {
                    this._voteOptionOneButton.visible = (_Str_6672.personalContributionScore == 0);
                }
                if (this._voteOptionTwoButton != null)
                {
                    this._voteOptionTwoButton.visible = (_Str_6672.personalContributionScore == 0);
                }
            }
        }

        private function onVoteOptionOneClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.hideVoteButtons();
                _Str_2298.communityGoalVote(1);
                _Str_2298.tracking.trackGoogle("landingView", "click_voteoption_one");
            }
        }

        private function onVoteOptionTwoClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.hideVoteButtons();
                _Str_2298.communityGoalVote(2);
                _Str_2298.tracking.trackGoogle("landingView", "click_voteoption_two");
            }
        }

        private function onInfo(k:_Str_9665):void
        {
            if (k.getParser()._Str_23568)
            {
                this.hideVoteButtons();
            }
        }

        private function hideVoteButtons():void
        {
            this._voteOptionOneButton.visible = false;
            this._voteOptionTwoButton.visible = false;
        }
    }
}

