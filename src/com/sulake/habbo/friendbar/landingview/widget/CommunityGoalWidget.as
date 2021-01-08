package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.outgoing.quest.GetCommunityGoalProgressMessageComposer;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalProgressParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalWidget implements IUpdateReceiver, ILandingViewWidget, ISettingsAwareWidget 
    {
        private static const CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES:Array = [0, 8, 16, 23];
        private static const METER_INITIAL_DELAY_MS:int = 1500;
        private static const METER_BUILDUP_TIME_MS:int = 1000;

        protected var _landingView:HabboLandingView;
        protected var _communityGoalContainer:IWindowContainer;
        private var _meterNeedle:IStaticBitmapWrapperWindow;
        protected var _communityProgress:CommunityGoalData;
        private var _communityProgressRequested:Boolean = false;
        private var _buildupDelay:Number = 0;
        private var _buildupProgress:Number = 0;
        private var _isInitialized:Boolean = false;
        private var _isInteractive:Boolean = true;
        private var _withVoting:Boolean = false;

        public function CommunityGoalWidget(k:HabboLandingView, _arg_2:Boolean=false)
        {
            this._landingView = k;
            this._withVoting = _arg_2;
        }

        public function get container():IWindow
        {
            return this._communityGoalContainer;
        }

        public function dispose():void
        {
            if (((!(this._landingView == null)) && (this._landingView.windowManager)))
            {
                Component(this._landingView.windowManager).removeUpdateReceiver(this);
            }
            this._landingView = null;
            this._communityGoalContainer = null;
            this._communityProgress = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function initialize():void
        {
            var k:IWindow;
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this.onCommunityGoalProgress));
            this._communityGoalContainer = IWindowContainer(((this._withVoting) ? (this._landingView.getXmlWindow("community_goal_voting")) : this._landingView.getXmlWindow("community_goal")));
            this._meterNeedle = IStaticBitmapWrapperWindow(this._communityGoalContainer.findChildByName("meter_needle"));
            if (!this._withVoting)
            {
                k = this._communityGoalContainer.findChildByName("community_catalog_button");
                this._isInteractive = this._landingView.getBoolean("landing.view.community.interactive");
                k.visible = this._isInteractive;
                k.procedure = this.onCommunityCatalogButtonClick;
            }
            HabboLandingView._Str_9079(this._communityGoalContainer, "community_title", "hdr_line");
        }

        private function campaignizeMeterElementAssetUri(k:IWindow):void
        {
            var _local_2:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(k);
            var _local_3:int = _local_2.assetUri.indexOf(".png");
            _local_2.assetUri = (((_local_2.assetUri.substr(0, _local_3) + "_") + this._communityProgress.goalCode) + ".png");
        }

        protected function setCampaignLocalization(k:String, _arg_2:String):void
        {
            var _local_3:IWindow = this._communityGoalContainer.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.caption = (((("${" + _arg_2) + ".") + this._communityProgress.goalCode) + "}");
            }
        }

        protected function getCurrentNeedleFrame():int
        {
            if (this._communityProgress.communityHighestAchievedLevel >= (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length - 1))
            {
                return CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[(CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length - 1)];
            }
            var k:int = CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[this._communityProgress.communityHighestAchievedLevel];
            var _local_2:int = (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[(this._communityProgress.communityHighestAchievedLevel + 1)] - k);
            return k + Math.floor(((this._communityProgress.percentCompletionTowardsNextLevel * (_local_2 + 0.001)) / 100));
        }

        private function initializeLocalizations():void
        {
            var k:int;
            if (((!(this._communityProgress == null)) && (!(this._communityProgress.goalCode == null))))
            {
                k = 0;
                while (k < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
                {
                    this.campaignizeMeterElementAssetUri(this._communityGoalContainer.findChildByName(("meter_level_" + k)));
                    if (k > 0)
                    {
                        this.campaignizeMeterElementAssetUri(this._communityGoalContainer.findChildByName((("meter_level_" + k) + "_icon")));
                        this.campaignizeMeterElementAssetUri(this._communityGoalContainer.findChildByName((("meter_level_" + k) + "_icon_locked")));
                    }
                    k++;
                }
                this.setCampaignLocalization("community_title", "landing.view.community.headline");
                this.setCampaignLocalization("goal_caption", "landing.view.community.caption");
                this.setCampaignLocalization("goal_info", "landing.view.community.info");
                this.setCampaignLocalization("community_catalog_button", "landing.view.community_catalog_button.text");
                this._isInitialized = true;
            }
        }

        private function refreshContent():void
        {
            if (this._communityProgress == null)
            {
                this._communityGoalContainer.visible = false;
                return;
            }
            if (!this._isInitialized)
            {
                this.initializeLocalizations();
            }
            var k:int = 1;
            while (k < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
            {
                this._communityGoalContainer.findChildByName(("meter_level_" + k)).visible = false;
                this._communityGoalContainer.findChildByName((("meter_level_" + k) + "_icon")).visible = false;
                this._communityGoalContainer.findChildByName((("meter_level_" + k) + "_icon_locked")).visible = false;
                k++;
            }
            var _local_2:String = "landing.view.community.meter";
            this._landingView.localizationManager.registerParameter(_local_2, "userRank", this._communityProgress._Str_10549.toString());
            this._landingView.localizationManager.registerParameter(_local_2, "userAmount", this._communityProgress.personalContributionScore.toString());
            this._landingView.localizationManager.registerParameter(_local_2, "totalAmount", this._communityProgress._Str_12030.toString());
            if (((!(this._communityProgress == null)) && (!(this._communityProgress.goalCode == null))))
            {
                this._landingView.localizationManager.registerParameter(("landing.view.community.meter." + this._communityProgress.goalCode), "totalAmount", this._communityProgress._Str_12030.toString());
                this.setCampaignLocalization("community_total_status", "landing.view.community.meter");
                if (this._withVoting)
                {
                    this.setCampaignLocalization("community_vote_one_button", "landing.view.vote_one_button.text");
                    this.setCampaignLocalization("community_vote_two_button", "landing.view.vote_two_button.text");
                }
            }
            var _local_3:ITextWindow = ITextWindow(this._communityGoalContainer.findChildByName("goal_info"));
            _local_3.height = (_local_3.textHeight + 6);
            if (!this._withVoting)
            {
                this._communityGoalContainer.findChildByName("community_catalog_button").visible = this._isInteractive;
            }
            this._communityGoalContainer.visible = true;
            this._communityGoalContainer.invalidate();
        }

        protected function updateMeter(k:int, _arg_2:Boolean=true):void
        {
            var _local_4:Boolean;
            var _local_3:int = 1;
            while (_local_3 < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
            {
                _local_4 = ((_arg_2) && (k >= CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[_local_3]));
                this._communityGoalContainer.findChildByName(("meter_level_" + _local_3)).visible = _local_4;
                this._communityGoalContainer.findChildByName((("meter_level_" + _local_3) + "_icon")).visible = _local_4;
                this._communityGoalContainer.findChildByName((("meter_level_" + _local_3) + "_icon_locked")).visible = (!(_local_4));
                _local_3++;
            }
            this._meterNeedle.assetUri = ("landing_view_needle_meter_needle" + k);
        }

        public function refresh():void
        {
            this.requestCommunityGoalProgress();
            this.refreshContent();
        }

        private function requestCommunityGoalProgress():void
        {
            if (!this._communityProgressRequested)
            {
                this._landingView.send(new GetCommunityGoalProgressMessageComposer());
                this._communityProgressRequested = true;
            }
        }

        public function update(k:uint):void
        {
            this._buildupDelay = (this._buildupDelay + k);
            if (this._buildupDelay > METER_INITIAL_DELAY_MS)
            {
                this._buildupProgress = (this._buildupProgress + (k / METER_BUILDUP_TIME_MS));
                if (this._buildupProgress > 1)
                {
                    this._buildupProgress = 1;
                    Component(this._landingView.windowManager).removeUpdateReceiver(this);
                }
                this.updateMeter(Math.floor((this.getCurrentNeedleFrame() * this._buildupProgress)));
            }
        }

        private function onCommunityGoalProgress(k:IMessageEvent):void
        {
            this._communityProgress = CommunityGoalProgressParser(k.parser).data;
            this._communityProgressRequested = false;
            this.refreshContent();
            Component(this._landingView.windowManager).registerUpdateReceiver(this, 10);
        }

        private function onCommunityCatalogButtonClick(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._landingView.getProperty("landing.view.community.catalog.target");
                this._landingView.catalog.openCatalogPage(_local_3);
                this._landingView.tracking.trackGoogle("landingView", "click_communityCatalogTarget");
            }
        }

        public function set settings(k:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(this._communityGoalContainer, k);
        }

        protected function get communityProgress():CommunityGoalData
        {
            return this._communityProgress;
        }
    }
}
