package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.communication.messages.incoming._Str_530._Str_9665;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class CommunityGoalVsModeVoteWidget extends CommunityGoalVsModeWidget 
    {
        private var _Str_11930:IWindow;
        private var _Str_11586:IWindow;
        private var _Str_16156:String;

        public function CommunityGoalVsModeVoteWidget(k:HabboLandingView)
        {
            super(k, true);
        }

        override public function initialize():void
        {
            super.initialize();
            this._Str_11930 = _Str_3186.findChildByName("community_vote_one_button");
            this._Str_11930.procedure = this._Str_22940;
            this._Str_11586 = _Str_3186.findChildByName("community_vote_two_button");
            this._Str_11586.procedure = this._Str_23139;
            _Str_2298.communicationManager.addHabboConnectionMessageEvent(new _Str_9665(this._Str_9863));
        }

        override public function refresh():void
        {
            super.refresh();
            if (_Str_6672 != null)
            {
                if (this._Str_11930 != null)
                {
                    this._Str_11930.visible = (_Str_6672.personalContributionScore == 0);
                }
                if (this._Str_11586 != null)
                {
                    this._Str_11586.visible = (_Str_6672.personalContributionScore == 0);
                }
            }
        }

        private function _Str_22940(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_16270();
                _Str_2298.communityGoalVote(1);
                _Str_2298.tracking.trackGoogle("landingView", "click_voteoption_one");
            }
        }

        private function _Str_23139(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_16270();
                _Str_2298.communityGoalVote(2);
                _Str_2298.tracking.trackGoogle("landingView", "click_voteoption_two");
            }
        }

        private function _Str_9863(k:_Str_9665):void
        {
            if (k.getParser()._Str_23568)
            {
                this._Str_16270();
            }
        }

        private function _Str_16270():void
        {
            this._Str_11930.visible = false;
            this._Str_11586.visible = false;
        }
    }
}

