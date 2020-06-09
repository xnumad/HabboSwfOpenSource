package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgress;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.outgoing.quest._Str_4438;
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
        protected var _Str_3597:CommunityGoalProgress;
        private var _Str_17426:Boolean = false;
        private var _Str_16752:Number = 0;
        private var _Str_10390:Number = 0;
        private var _isInitialized:Boolean = false;
        private var _Str_18550:Boolean = true;
        private var _Str_11816:Boolean = false;

        public function CommunityGoalWidget(k:HabboLandingView, _arg_2:Boolean=false)
        {
            this._landingView = k;
            this._Str_11816 = _arg_2;
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
            this._Str_3597 = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function initialize():void
        {
            var k:IWindow;
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this._Str_5286));
            this._communityGoalContainer = IWindowContainer(((this._Str_11816) ? (this._landingView.getXmlWindow("community_goal_voting")) : this._landingView.getXmlWindow("community_goal")));
            this._meterNeedle = IStaticBitmapWrapperWindow(this._communityGoalContainer.findChildByName("meter_needle"));
            if (!this._Str_11816)
            {
                k = this._communityGoalContainer.findChildByName("community_catalog_button");
                this._Str_18550 = this._landingView.getBoolean("landing.view.community.interactive");
                k.visible = this._Str_18550;
                k.procedure = this._Str_24653;
            }
            HabboLandingView._Str_9079(this._communityGoalContainer, "community_title", "hdr_line");
        }

        private function _Str_17143(k:IWindow):void
        {
            var _local_2:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(k);
            var _local_3:int = _local_2.assetUri.indexOf(".png");
            _local_2.assetUri = (((_local_2.assetUri.substr(0, _local_3) + "_") + this._Str_3597.goalCode) + ".png");
        }

        protected function _Str_7300(k:String, _arg_2:String):void
        {
            var _local_3:IWindow = this._communityGoalContainer.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.caption = (((("${" + _arg_2) + ".") + this._Str_3597.goalCode) + "}");
            }
        }

        protected function getCurrentNeedleFrame():int
        {
            if (this._Str_3597.communityHighestAchievedLevel >= (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length - 1))
            {
                return CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[(CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length - 1)];
            }
            var k:int = CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[this._Str_3597.communityHighestAchievedLevel];
            var _local_2:int = (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[(this._Str_3597.communityHighestAchievedLevel + 1)] - k);
            return k + Math.floor(((this._Str_3597.percentCompletionTowardsNextLevel * (_local_2 + 0.001)) / 100));
        }

        private function _Str_16817():void
        {
            var k:int;
            if (((!(this._Str_3597 == null)) && (!(this._Str_3597.goalCode == null))))
            {
                k = 0;
                while (k < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
                {
                    this._Str_17143(this._communityGoalContainer.findChildByName(("meter_level_" + k)));
                    if (k > 0)
                    {
                        this._Str_17143(this._communityGoalContainer.findChildByName((("meter_level_" + k) + "_icon")));
                        this._Str_17143(this._communityGoalContainer.findChildByName((("meter_level_" + k) + "_icon_locked")));
                    }
                    k++;
                }
                this._Str_7300("community_title", "landing.view.community.headline");
                this._Str_7300("goal_caption", "landing.view.community.caption");
                this._Str_7300("goal_info", "landing.view.community.info");
                this._Str_7300("community_catalog_button", "landing.view.community_catalog_button.text");
                this._isInitialized = true;
            }
        }

        private function refreshContent():void
        {
            if (this._Str_3597 == null)
            {
                this._communityGoalContainer.visible = false;
                return;
            }
            if (!this._isInitialized)
            {
                this._Str_16817();
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
            this._landingView.localizationManager.registerParameter(_local_2, "userRank", this._Str_3597._Str_10549.toString());
            this._landingView.localizationManager.registerParameter(_local_2, "userAmount", this._Str_3597.personalContributionScore.toString());
            this._landingView.localizationManager.registerParameter(_local_2, "totalAmount", this._Str_3597._Str_12030.toString());
            if (((!(this._Str_3597 == null)) && (!(this._Str_3597.goalCode == null))))
            {
                this._landingView.localizationManager.registerParameter(("landing.view.community.meter." + this._Str_3597.goalCode), "totalAmount", this._Str_3597._Str_12030.toString());
                this._Str_7300("community_total_status", "landing.view.community.meter");
                if (this._Str_11816)
                {
                    this._Str_7300("community_vote_one_button", "landing.view.vote_one_button.text");
                    this._Str_7300("community_vote_two_button", "landing.view.vote_two_button.text");
                }
            }
            var _local_3:ITextWindow = ITextWindow(this._communityGoalContainer.findChildByName("goal_info"));
            _local_3.height = (_local_3.textHeight + 6);
            if (!this._Str_11816)
            {
                this._communityGoalContainer.findChildByName("community_catalog_button").visible = this._Str_18550;
            }
            this._communityGoalContainer.visible = true;
            this._communityGoalContainer.invalidate();
        }

        protected function _Str_17006(k:int, _arg_2:Boolean=true):void
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
            this._Str_25827();
            this.refreshContent();
        }

        private function _Str_25827():void
        {
            if (!this._Str_17426)
            {
                this._landingView.send(new _Str_4438());
                this._Str_17426 = true;
            }
        }

        public function update(k:uint):void
        {
            this._Str_16752 = (this._Str_16752 + k);
            if (this._Str_16752 > METER_INITIAL_DELAY_MS)
            {
                this._Str_10390 = (this._Str_10390 + (k / METER_BUILDUP_TIME_MS));
                if (this._Str_10390 > 1)
                {
                    this._Str_10390 = 1;
                    Component(this._landingView.windowManager).removeUpdateReceiver(this);
                }
                this._Str_17006(Math.floor((this.getCurrentNeedleFrame() * this._Str_10390)));
            }
        }

        private function _Str_5286(k:IMessageEvent):void
        {
            this._Str_3597 = CommunityGoalProgressParser(k.parser).data;
            this._Str_17426 = false;
            this.refreshContent();
            Component(this._landingView.windowManager).registerUpdateReceiver(this, 10);
        }

        private function _Str_24653(k:WindowEvent, _arg_2:IWindow):void
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
            WidgetContainerLayout._Str_5630(this._communityGoalContainer, k);
        }

        protected function get _Str_6672():CommunityGoalProgress
        {
            return this._Str_3597;
        }
    }
}
