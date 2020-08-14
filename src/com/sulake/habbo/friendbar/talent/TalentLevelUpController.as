package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.talent.TalentLevelUpEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentLevelUpMessageParser;
    import com.sulake.habbo.session.talent.TalentEnum;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackRewardPerk;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackRewardProduct;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.talent.GetTalentTrackMessageComposer;
    import com.sulake.core.window.events.WindowEvent;

    public class TalentLevelUpController implements IDisposable 
    {
        private var _habboTalent:HabboTalent;
        private var _disposed:Boolean;
        private var _window:IWindowContainer;
        private var _track:String;
        private var _rewardProductTemplate:IWindow;
        private var _rewardVipTemplate:IWindow;
        private var _rewardPerkTemplate:IWindow;

        public function TalentLevelUpController(k:HabboTalent)
        {
            this._habboTalent = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._rewardPerkTemplate != null)
                {
                    this._rewardPerkTemplate.dispose();
                    this._rewardPerkTemplate = null;
                }
                if (this._rewardProductTemplate != null)
                {
                    this._rewardProductTemplate.dispose();
                    this._rewardProductTemplate = null;
                }
                if (this._rewardVipTemplate != null)
                {
                    this._rewardVipTemplate.dispose();
                    this._rewardVipTemplate = null;
                }
                this.closeWindow();
                this._habboTalent = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function initialize():void
        {
            this._habboTalent.communicationManager.addHabboConnectionMessageEvent(new TalentLevelUpEvent(this._Str_16796));
        }

        private function _Str_16796(k:TalentLevelUpEvent):void
        {
            var _local_2:TalentLevelUpMessageParser = k.getParser();
            if ((((_local_2.level == 1) && (_local_2.talentTrackName == TalentEnum.HELPER)) && (this._habboTalent._Str_9968)))
            {
                return;
            }
            this.showWindow(_local_2.talentTrackName, _local_2.level, _local_2._Str_8893, _local_2._Str_7068);
        }

        public function showWindow(k:String, _arg_2:int, _arg_3:Vector.<TalentTrackRewardPerk>, _arg_4:Vector.<TalentTrackRewardProduct>):void
        {
            var _local_8:TalentTrackRewardPerk;
            var _local_9:TalentTrackRewardProduct;
            this.closeWindow();
            this._track = k;
            this._window = (this._habboTalent.getXmlWindow("level_up") as IWindowContainer);
            this._window.center();
            this._window.procedure = this.onWindowEvent;
            IStaticBitmapWrapperWindow(this._window.findChildByName("level_decoration")).assetUri = (((("${image.library.url}talent/" + k) + "_levelup_") + _arg_2) + ".png");
            this._window.findChildByName("level_up_message").caption = (("${talent.track." + k) + ".levelup.message}");
            this._window.findChildByName("level_title").caption = (((("${talent.track." + k) + ".level.") + _arg_2) + ".title}");
            this._window.findChildByName("level_description").caption = (((("${talent.track." + k) + ".level.") + _arg_2) + ".description}");
            var _local_5:IItemListWindow = IItemListWindow(this._window.findChildByName("reward_list"));
            var _local_6:IWindow = _local_5.removeListItem(_local_5.getListItemByName("plus_template"));
            this._rewardProductTemplate = _local_5.removeListItem(_local_5.getListItemByName("reward_product_template"));
            this._rewardVipTemplate = _local_5.removeListItem(_local_5.getListItemByName("reward_vip_template"));
            this._rewardPerkTemplate = _local_5.removeListItem(_local_5.getListItemByName("reward_perk_template"));
            var _local_7:Boolean;
            for each (_local_8 in _arg_3)
            {
                if (_local_7)
                {
                    _local_5.addListItem(_local_6.clone());
                }
                _local_5.addListItem(this.createRewardPerk(_local_8));
                _local_7 = true;
            }
            for each (_local_9 in _arg_4)
            {
                if (_local_7)
                {
                    _local_5.addListItem(_local_6.clone());
                }
                _local_5.addListItem(this.createRewardProduct(_local_9));
                _local_7 = true;
            }
            if (_local_5.numListItems < 1)
            {
                this._window.findChildByName("level_rewards").visible = false;
                IItemListWindow(this._window.findChildByName("level_up_layout")).arrangeListItems();
            }
        }

        private function createRewardPerk(k:TalentTrackRewardPerk):IWindow
        {
            var _local_2:IWindowContainer = (this._rewardPerkTemplate.clone() as IWindowContainer);
            IBadgeImageWidget(IWidgetWindow(_local_2.findChildByName("perk_image")).widget).badgeId = k._Str_10964;
            _local_2.findChildByName("perk_name").caption = (("${perk." + k._Str_10964) + ".name}");
            return _local_2;
        }

        private function createRewardProduct(k:TalentTrackRewardProduct):IWindow
        {
            var _local_2:IWindow;
            if (k._Str_13965 == 0)
            {
                _local_2 = this._rewardProductTemplate.clone();
                IStaticBitmapWrapperWindow(_local_2).assetUri = (("${image.library.url}talent/reward_product_" + k.productCode.toLowerCase().replace(" ", "_")) + ".png");
            }
            else
            {
                _local_2 = this._rewardVipTemplate.clone();
                IWindowContainer(_local_2).findChildByName("vip_length").caption = this._habboTalent.localizationManager.getLocalizationWithParams("catalog.vip.item.header.days", "", "num_days", k._Str_13965);
            }
            return _local_2;
        }

        private function closeWindow():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function onWindowEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._window == null) || (this._window.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    this.closeWindow();
                    return;
                case "talent_button":
                    this.closeWindow();
                    this._habboTalent.tracking.trackTalentTrackOpen(this._track, "levelup");
                    this._habboTalent.send(new GetTalentTrackMessageComposer(this._track));
                    return;
            }
        }
    }
}
