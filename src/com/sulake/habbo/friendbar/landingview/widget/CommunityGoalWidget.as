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
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_4438;
    import com.sulake.habbo.communication.messages.parser.quest.CommunityGoalProgressParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalWidget implements IUpdateReceiver, ILandingViewWidget, ISettingsAwareWidget 
    {
        private static const _Str_5070:Array = [0, 8, 16, 23];
        private static const _Str_18831:int = 1500;
        private static const _Str_17898:int = 1000;

        protected var _Str_2298:HabboLandingView;
        protected var _Str_3186:IWindowContainer;
        private var _Str_19676:IStaticBitmapWrapperWindow;
        protected var _Str_3597:CommunityGoalProgress;
        private var _Str_17426:Boolean = false;
        private var _Str_16752:Number = 0;
        private var _Str_10390:Number = 0;
        private var _Str_2367:Boolean = false;
        private var _Str_18550:Boolean = true;
        private var _Str_11816:Boolean = false;

        public function CommunityGoalWidget(k:HabboLandingView, _arg_2:Boolean=false)
        {
            this._Str_2298 = k;
            this._Str_11816 = _arg_2;
        }

        public function get container():IWindow
        {
            return this._Str_3186;
        }

        public function dispose():void
        {
            if (((!(this._Str_2298 == null)) && (this._Str_2298.windowManager)))
            {
                Component(this._Str_2298.windowManager).removeUpdateReceiver(this);
            }
            this._Str_2298 = null;
            this._Str_3186 = null;
            this._Str_3597 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_2298 == null;
        }

        public function initialize():void
        {
            var k:IWindow;
            this._Str_2298.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this._Str_5286));
            this._Str_3186 = IWindowContainer(((this._Str_11816) ? (this._Str_2298.getXmlWindow("community_goal_voting")) : this._Str_2298.getXmlWindow("community_goal")));
            this._Str_19676 = IStaticBitmapWrapperWindow(this._Str_3186.findChildByName("meter_needle"));
            if (!this._Str_11816)
            {
                k = this._Str_3186.findChildByName("community_catalog_button");
                this._Str_18550 = this._Str_2298.getBoolean("landing.view.community.interactive");
                k.visible = this._Str_18550;
                k.procedure = this._Str_24653;
            }
            HabboLandingView._Str_9079(this._Str_3186, "community_title", "hdr_line");
        }

        private function _Str_17143(k:IWindow):void
        {
            var _local_2:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(k);
            var _local_3:int = _local_2.assetUri.indexOf(".png");
            _local_2.assetUri = (((_local_2.assetUri.substr(0, _local_3) + "_") + this._Str_3597.goalCode) + ".png");
        }

        protected function _Str_7300(k:String, _arg_2:String):void
        {
            var _local_3:IWindow = this._Str_3186.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.caption = (((("${" + _arg_2) + ".") + this._Str_3597.goalCode) + "}");
            }
        }

        protected function getCurrentNeedleFrame():int
        {
            if (this._Str_3597.communityHighestAchievedLevel >= (_Str_5070.length - 1))
            {
                return _Str_5070[(_Str_5070.length - 1)];
            }
            var k:int = _Str_5070[this._Str_3597.communityHighestAchievedLevel];
            var _local_2:int = (_Str_5070[(this._Str_3597.communityHighestAchievedLevel + 1)] - k);
            return k + Math.floor(((this._Str_3597.percentCompletionTowardsNextLevel * (_local_2 + 0.001)) / 100));
        }

        private function _Str_16817():void
        {
            var k:int;
            if (((!(this._Str_3597 == null)) && (!(this._Str_3597.goalCode == null))))
            {
                k = 0;
                while (k < _Str_5070.length)
                {
                    this._Str_17143(this._Str_3186.findChildByName(("meter_level_" + k)));
                    if (k > 0)
                    {
                        this._Str_17143(this._Str_3186.findChildByName((("meter_level_" + k) + "_icon")));
                        this._Str_17143(this._Str_3186.findChildByName((("meter_level_" + k) + "_icon_locked")));
                    }
                    k++;
                }
                this._Str_7300("community_title", "landing.view.community.headline");
                this._Str_7300("goal_caption", "landing.view.community.caption");
                this._Str_7300("goal_info", "landing.view.community.info");
                this._Str_7300("community_catalog_button", "landing.view.community_catalog_button.text");
                this._Str_2367 = true;
            }
        }

        private function refreshContent():void
        {
            if (this._Str_3597 == null)
            {
                this._Str_3186.visible = false;
                return;
            }
            if (!this._Str_2367)
            {
                this._Str_16817();
            }
            var k:int = 1;
            while (k < _Str_5070.length)
            {
                this._Str_3186.findChildByName(("meter_level_" + k)).visible = false;
                this._Str_3186.findChildByName((("meter_level_" + k) + "_icon")).visible = false;
                this._Str_3186.findChildByName((("meter_level_" + k) + "_icon_locked")).visible = false;
                k++;
            }
            var _local_2:String = "landing.view.community.meter";
            this._Str_2298.localizationManager.registerParameter(_local_2, "userRank", this._Str_3597._Str_10549.toString());
            this._Str_2298.localizationManager.registerParameter(_local_2, "userAmount", this._Str_3597.personalContributionScore.toString());
            this._Str_2298.localizationManager.registerParameter(_local_2, "totalAmount", this._Str_3597._Str_12030.toString());
            if (((!(this._Str_3597 == null)) && (!(this._Str_3597.goalCode == null))))
            {
                this._Str_2298.localizationManager.registerParameter(("landing.view.community.meter." + this._Str_3597.goalCode), "totalAmount", this._Str_3597._Str_12030.toString());
                this._Str_7300("community_total_status", "landing.view.community.meter");
                if (this._Str_11816)
                {
                    this._Str_7300("community_vote_one_button", "landing.view.vote_one_button.text");
                    this._Str_7300("community_vote_two_button", "landing.view.vote_two_button.text");
                }
            }
            var _local_3:ITextWindow = ITextWindow(this._Str_3186.findChildByName("goal_info"));
            _local_3.height = (_local_3.textHeight + 6);
            if (!this._Str_11816)
            {
                this._Str_3186.findChildByName("community_catalog_button").visible = this._Str_18550;
            }
            this._Str_3186.visible = true;
            this._Str_3186.invalidate();
        }

        protected function _Str_17006(k:int, _arg_2:Boolean=true):void
        {
            var _local_4:Boolean;
            var _local_3:int = 1;
            while (_local_3 < _Str_5070.length)
            {
                _local_4 = ((_arg_2) && (k >= _Str_5070[_local_3]));
                this._Str_3186.findChildByName(("meter_level_" + _local_3)).visible = _local_4;
                this._Str_3186.findChildByName((("meter_level_" + _local_3) + "_icon")).visible = _local_4;
                this._Str_3186.findChildByName((("meter_level_" + _local_3) + "_icon_locked")).visible = (!(_local_4));
                _local_3++;
            }
            this._Str_19676.assetUri = ("landing_view_needle_meter_needle" + k);
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
                this._Str_2298.send(new _Str_4438());
                this._Str_17426 = true;
            }
        }

        public function update(k:uint):void
        {
            this._Str_16752 = (this._Str_16752 + k);
            if (this._Str_16752 > _Str_18831)
            {
                this._Str_10390 = (this._Str_10390 + (k / _Str_17898));
                if (this._Str_10390 > 1)
                {
                    this._Str_10390 = 1;
                    Component(this._Str_2298.windowManager).removeUpdateReceiver(this);
                }
                this._Str_17006(Math.floor((this.getCurrentNeedleFrame() * this._Str_10390)));
            }
        }

        private function _Str_5286(k:IMessageEvent):void
        {
            this._Str_3597 = CommunityGoalProgressParser(k.parser).data;
            this._Str_17426 = false;
            this.refreshContent();
            Component(this._Str_2298.windowManager).registerUpdateReceiver(this, 10);
        }

        private function _Str_24653(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._Str_2298.getProperty("landing.view.community.catalog.target");
                this._Str_2298.catalog.openCatalogPage(_local_3);
                this._Str_2298.tracking.trackGoogle("landingView", "click_communityCatalogTarget");
            }
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._Str_3186, k);
        }

        protected function get _Str_6672():CommunityGoalProgress
        {
            return this._Str_3597;
        }
    }
}
