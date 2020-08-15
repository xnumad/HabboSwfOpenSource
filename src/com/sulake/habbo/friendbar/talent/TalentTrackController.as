package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrack;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.talent.TalentTrackMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.EmailStatusResultEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ChangeEmailResultEvent;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsData;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.session.talent.TalentEnum;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets.IAvatarImageWidget;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackRewardPerk;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackRewardProduct;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackTask;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevel;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils._Str_988;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.talent.GetTalentTrackMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetEmailStatusComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupDetailsMessageComposer;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.communication.messages.outgoing.talent.GuideAdvertisementReadMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.users.ChangeEmailComposer;
    import com.sulake.habbo.communication.messages.parser.users.ChangeEmailResultParser;
    import com.sulake.core.window.components.ITextFieldWindow;
    import __AS3__.vec.*;

    public class TalentTrackController implements IDisposable 
    {
        private static const _Str_4923:int = 3;
        private static const _Str_13088:int = 100;
        private static const BEGIN_:String = "begin_";
        private static const LEVEL_PANE_:String = "level_pane_";
        private static const _NO_CITIZENSHIP:String = "_no_citizenship";
        private static const _Str_13352:int = 40;
        private static const _Str_3555:int = 10;
        private static const _Str_5573:int = 200;
        private static const _Str_11612:int = 60;

        private var _habboTalent:HabboTalent;
        private var _disposed:Boolean = false;
        private var _dialog:IModalDialog;
        private var _window:IWindowContainer;
        private var _taskProgressPopup:IModalDialog;
        private var _panoramaList:IItemListWindow;
        private var _talentTrack:TalentTrack;
        private var _talentProgressMeter:TalentProgressMeter;
        private var _levelTemplate:IWindowContainer;
        private var _rewardAchievedTemplate:IBorderWindow;
        private var _rewardLockedTemplate:IBorderWindow;
        private var _rewardProductTemplate:IBorderWindow;
        private var _rewardVipTemplate:IBorderWindow;
        private var _taskAchievedTemplate:IWindowContainer;
        private var _taskOngoingTemplate:IWindowContainer;
        private var _taskLockedTemplate:IWindowContainer;
        private var _overlayTemplate:IWindow;
        private var _expectedGroupID:int = -1;

        public function TalentTrackController(k:HabboTalent)
        {
            this._habboTalent = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._talentProgressMeter)
                {
                    this._talentProgressMeter.dispose();
                    this._talentProgressMeter = null;
                }
                this.destroyWindow();
                this._habboTalent = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get talentTrack():TalentTrack
        {
            return this._talentTrack;
        }

        public function initialize():void
        {
            this._habboTalent.communicationManager.addHabboConnectionMessageEvent(new TalentTrackMessageEvent(this.onTalentTrack));
            this._habboTalent.communicationManager.addHabboConnectionMessageEvent(new HabboGroupDetailsMessageEvent(this.onGroupDetails));
            this._habboTalent.communicationManager.addHabboConnectionMessageEvent(new EmailStatusResultEvent(this.onEmailStatus));
            this._habboTalent.communicationManager.addHabboConnectionMessageEvent(new ChangeEmailResultEvent(this.onChangeEmailResult));
        }

        private function onEmailStatus(k:EmailStatusResultEvent):void
        {
            var _local_2:IWindowContainer = this.getEmailContainer();
            if (_local_2 != null)
            {
                this.getEmailText().text = k.getParser().email;
                _local_2.findChildByName("unverified_container").visible = (!(k.getParser().isVerified));
                _local_2.findChildByName("verified_txt").visible = k.getParser().isVerified;
            }
        }

        private function onChangeEmailResult(k:ChangeEmailResultEvent):void
        {
            this.setEmailErrorStatus(true, k.getParser().result);
        }

        private function onTalentTrack(k:TalentTrackMessageEvent):void
        {
            var _local_2:TalentTrackMessageParser = k.getParser();
            this._talentTrack = _local_2._Str_23534();
            this.createWindow();
        }

        private function onGroupDetails(k:HabboGroupDetailsMessageEvent):void
        {
            var _local_2:HabboGroupDetailsData = k.data;
            if (_local_2.groupId == this._expectedGroupID)
            {
                this._expectedGroupID = -1;
                this._habboTalent.navigator.goToPrivateRoom(_local_2.roomId);
            }
        }

        private function createWindow():void
        {
            var _local_4:String;
            var _local_7:IWindowContainer;
            this.destroyWindow();
            this._dialog = this._habboTalent.getModalXmlWindow("talent_track");
            this._window = IWindowContainer(this._dialog.rootWindow);
            this._window.procedure = this.onWindowEvent;
            this._dialog.background.procedure = this.onModalWindowBackgroundEvent;
            this._habboTalent.windowManager.getWindowContext(_Str_4923).getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this.onDesktopResized);
            this._panoramaList = IItemListWindow(this._window.findChildByName("panorama"));
            this._levelTemplate = IWindowContainer(this._panoramaList.removeListItem(this._panoramaList.getListItemByName("level_pane")));
            var k:IItemListWindow = IItemListWindow(this._levelTemplate.findChildByName("reward_list"));
            this._rewardAchievedTemplate = IBorderWindow(k.removeListItem(k.getListItemByName("reward_achieved")));
            this._rewardLockedTemplate = IBorderWindow(k.removeListItem(k.getListItemByName("reward_locked")));
            this._rewardProductTemplate = IBorderWindow(k.removeListItem(k.getListItemByName("reward_product")));
            this._rewardVipTemplate = IBorderWindow(k.removeListItem(k.getListItemByName("reward_vip")));
            var _local_2:IItemListWindow = IItemListWindow(this._levelTemplate.findChildByName("task_list_top"));
            this._taskAchievedTemplate = IWindowContainer(_local_2.removeListItem(_local_2.getListItemByName("task_achieved")));
            this._taskOngoingTemplate = IWindowContainer(_local_2.removeListItem(_local_2.getListItemByName("task_ongoing")));
            this._taskLockedTemplate = IWindowContainer(_local_2.removeListItem(_local_2.getListItemByName("task_locked")));
            this._overlayTemplate = this._levelTemplate.removeChild(this._levelTemplate.findChildByName("action_overlay"));
            var _local_3:Boolean = this._habboTalent._Str_9968;
            for each (_local_4 in TalentEnum.asArray)
            {
                _local_7 = (this._panoramaList.getListItemByName((BEGIN_ + _local_4)) as IWindowContainer);
                if (_local_7 != null)
                {
                    _local_7.visible = ((_local_4 == this._talentTrack.name) && (_local_3));
                    if (_local_7.visible)
                    {
                        this.showAvatarInContainer(_local_7);
                    }
                }
                if (_local_4 != TalentEnum.CITIZENSHIP)
                {
                    _local_7 = (this._panoramaList.getListItemByName(((BEGIN_ + _local_4) + _NO_CITIZENSHIP)) as IWindowContainer);
                    if (_local_7 != null)
                    {
                        _local_7.visible = ((_local_4 == this._talentTrack.name) && (!(_local_3)));
                        if (_local_7.visible)
                        {
                            this.showAvatarInContainer(_local_7);
                        }
                    }
                }
            }
            this._window.findChildByName("frame_title").caption = (("${talent.track." + this._talentTrack.name) + ".frame.title}");
            this._window.findChildByName("frame_subtitle").caption = (("${talent.track." + this._talentTrack.name) + ".frame.subtitle}");
            this._window.findChildByName("progress_text").caption = (("${talent.track." + this._talentTrack.name) + ".progress.title}");
            if (((_local_3) && (!(this._talentTrack.name == TalentEnum.CITIZENSHIP))))
            {
                this._talentTrack.removeFirstLevel();
            }
            var _local_5:int;
            var _local_6:int;
            while (_local_6 < this._talentTrack.levels.length)
            {
                this.createLevelPane(this._talentTrack.levels[_local_6], _local_6);
                if (this._talentTrack.levels[_local_6].state == TalentTrack.STATE_ONGOING)
                {
                    _local_5 = _local_6;
                }
                _local_6++;
            }
            this._talentProgressMeter = new TalentProgressMeter(this._habboTalent, this);
            this._panoramaList.setListItemIndex(this._panoramaList.getListItemByName("end_padding"), (this._panoramaList.numListItems - 1));
            this.resizeWindow();
            this.scrollToLevel(_local_5);
        }

        private function showAvatarInContainer(k:IWindowContainer):void
        {
            var _local_2:IWidgetWindow = (k.findChildByName("avatar_image") as IWidgetWindow);
            if (_local_2 != null)
            {
                IAvatarImageWidget(_local_2.widget).figure = this._habboTalent._Str_20410.figure;
            }
        }

        private function createLevelPane(k:TalentTrackLevel, _arg_2:int):void
        {
            var _local_9:IBorderWindow;
            var _local_10:ITextWindow;
            var _local_11:ITextWindow;
            var _local_12:ITextWindow;
            var _local_13:ITextWindow;
            var _local_14:IItemListWindow;
            var _local_15:int;
            var _local_16:TalentTrackRewardPerk;
            var _local_17:TalentTrackRewardProduct;
            var _local_18:IWindow;
            var _local_19:Vector.<IWindow>;
            var _local_20:TalentTrackTask;
            var _local_21:IWindow;
            var _local_22:Point;
            var _local_3:IWindowContainer = IWindowContainer(this._levelTemplate.clone());
            var _local_4:IItemListWindow = IItemListWindow(_local_3.findChildByName("status_list"));
            var _local_5:IWindowContainer = IWindowContainer(_local_3.findChildByName("level_reward"));
            var _local_6:IWindowContainer = IWindowContainer(_local_3.findChildByName("level_task"));
            var _local_7:IItemListWindow = IItemListWindow(_local_3.findChildByName("task_list_top"));
            var _local_8:IItemListWindow = IItemListWindow(_local_3.findChildByName("task_list_bottom"));
            _local_3.name = (LEVEL_PANE_ + _arg_2);
            _local_3.findChildByName("level_title").caption = (((("${talent.track." + this._talentTrack.name) + ".level.") + k.level) + ".title}");
            _local_3.findChildByName("level_description").caption = (((("${talent.track." + this._talentTrack.name) + ".level.") + k.level) + ".description}");
            if (_arg_2 == 0)
            {
                _local_5.width = 0;
                _local_5.visible = false;
                _local_4.x = (4 * _Str_3555);
            }
            else
            {
                _local_9 = IBorderWindow(_local_5.findChildByName("border"));
                _local_10 = ITextWindow(_local_5.findChildByName("title_locked"));
                _local_11 = ITextWindow(_local_5.findChildByName("title_achieved"));
                _local_12 = ITextWindow(_local_5.findChildByName("description_locked"));
                _local_13 = ITextWindow(_local_5.findChildByName("description_achieved"));
                _local_14 = IItemListWindow(_local_5.findChildByName("reward_list"));
                switch (k.state)
                {
                    case TalentTrack.STATE_ACHIEVED:
                    case TalentTrack.STATE_ONGOING:
                        _local_9.color = 4537147;
                        _local_10.visible = false;
                        _local_11.caption = ((this._habboTalent.localizationManager.getLocalization("talent.track.common.unlocked.level.prefix") + " ") + this._habboTalent.localizationManager.getLocalization((((("talent.track." + this._talentTrack.name) + ".level.") + k.level) + ".title")));
                        _local_12.visible = false;
                        _local_13.caption = (((("${talent.track." + this._talentTrack.name) + ".level.") + k.level) + ".unlock}");
                        _local_5.findChildByName("locked").visible = false;
                        break;
                    case TalentTrack.STATE_LOCKED:
                        _local_9.color = 0xBDBDBD;
                        _local_9.findChildByName("unlocked").visible = false;
                        _local_10.caption = (((("${talent.track." + this._talentTrack.name) + ".level.") + k.level) + ".title}");
                        _local_11.visible = false;
                        _local_12.caption = (((("${talent.track." + this._talentTrack.name) + ".level.") + k.level) + ".unlock}");
                        _local_13.visible = false;
                        _local_5.findChildByName("achieved").visible = false;
                        break;
                }
                if (k.rewardCount == 0)
                {
                    _local_15 = Math.max(_Str_5573, Math.max(_local_11.width, _local_10.width));
                    _local_12.width = _local_15;
                    _local_13.width = _local_15;
                    _local_9.width = (_local_15 + (2 * _Str_3555));
                    _local_5.width = (_local_15 + (2 * _Str_3555));
                    _local_9.height = ((_local_13.y + Math.max(_local_13.height, _local_12.height)) + _Str_3555);
                    _local_5.height = (_local_9.height + _local_9.y);
                    _local_14.visible = false;
                }
                else
                {
                    if (((k.rewardCount == 1) && (k._Str_7068.length > 0)))
                    {
                        _local_15 = Math.max((_Str_5573 + (_Str_3555 * 2)), Math.max(_local_11.width, _local_10.width));
                        _local_12.width = _local_15;
                        _local_13.width = _local_15;
                        _local_14.addListItem(this.createRewardProduct(k, k._Str_7068[0]));
                        _local_9.width = (_local_15 + (2 * _Str_3555));
                        _local_5.width = (_local_15 + (2 * _Str_3555));
                    }
                    else
                    {
                        if (k.rewardCount == 1)
                        {
                            _local_9.width = ((_Str_5573 * 2) + (_Str_3555 * 2));
                            _local_12.width = (_Str_5573 * 2);
                            _local_13.width = (_Str_5573 * 2);
                            _local_14.addListItem(((k._Str_8893.length > 0) ? this.createRewardPerk(k, k._Str_8893[0]) : this.createRewardProduct(k, k._Str_7068[0])));
                            _local_14.arrangeListItems();
                            _local_5.width = (_local_14.width + (2 * _Str_3555));
                            _local_9.width = (_local_14.width + (2 * _Str_3555));
                        }
                        else
                        {
                            for each (_local_16 in k._Str_8893)
                            {
                                _local_14.addListItem(this.createRewardPerk(k, _local_16));
                            }
                            for each (_local_17 in k._Str_7068)
                            {
                                _local_14.addListItem(this.createRewardProduct(k, _local_17));
                            }
                            _local_14.arrangeListItems();
                            _local_5.width = (_local_14.width + (2 * _Str_3555));
                            _local_9.width = (_local_14.width + (2 * _Str_3555));
                            _local_13.width = (_local_9.width - (2 * _Str_3555));
                        }
                    }
                }
            }
            if (k._Str_20997.length == 0)
            {
                _local_6.width = 0;
                _local_6.visible = false;
            }
            else
            {
                _local_19 = new Vector.<IWindow>();
                for each (_local_20 in k._Str_20997)
                {
                    _local_18 = this.createTask(k, _local_20);
                    if (_local_7.numListItems == _local_8.numListItems)
                    {
                        _local_7.addListItem(_local_18);
                    }
                    else
                    {
                        _local_8.addListItem(_local_18);
                    }
                    if (((_local_20.badgeCode == TalentTrackTask.SAFETY_QUIZ_GRADUATE_1) && (_local_20.state == TalentTrack.STATE_ONGOING)))
                    {
                        _local_19.push(_local_18);
                    }
                }
                _local_7.arrangeListItems();
                _local_8.arrangeListItems();
                _local_6.width = Math.max(_local_7.width, _local_8.width);
                for each (_local_18 in _local_19)
                {
                    _local_21 = this._overlayTemplate.clone();
                    _local_22 = new Point();
                    _local_3.addChild(_local_21);
                    _local_18.convertPointFromLocalToGlobalSpace(_local_22);
                    _local_3.convertPointFromGlobalToLocalSpace(_local_22);
                    _local_21.x = (_local_21.x + _local_22.x);
                    _local_21.y = (_local_21.y + _local_22.y);
                    _local_21.visible = true;
                }
            }
            _local_4.arrangeListItems();
            _local_4.width = ((_local_5.width + _Str_3555) + _local_6.width);
            _local_3.width = ((_local_4.x + _local_4.width) + _Str_3555);
            this.repositionLevelIllustration(k, _local_3);
            this._panoramaList.addListItem(_local_3);
        }

        private function repositionLevelIllustration(k:TalentTrackLevel, _arg_2:IWindowContainer):void
        {
            var _local_3:IWindow = _arg_2.findChildByName("level_description");
            var _local_4:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_arg_2.findChildByName("level_illustration"));
            _local_4.assetUri = (((("${image.library.url}talent/" + this._talentTrack.name) + "_") + k.level) + ".png");
            if (((k.level == 8) && (this._talentTrack.name == TalentEnum.HELPER)))
            {
                _local_4.width = 220;
                _local_4.height = 270;
                _local_4.x = Math.max(_local_3.right, _arg_2.width);
            }
            else
            {
                if (((k.level == 0) && (this._talentTrack.name == TalentEnum.CITIZENSHIP)))
                {
                    _local_4.width = 0;
                    _local_4.x = Math.max(_local_3.right, _arg_2.width);
                }
                else
                {
                    if (((k.level == 4) && (this._talentTrack.name == TalentEnum.CITIZENSHIP)))
                    {
                        _local_4.width = 220;
                        _local_4.height = 280;
                        _local_4.x = Math.max(_local_3.right, _arg_2.width);
                    }
                    else
                    {
                        _local_4.x = Math.max(_local_3.right, (_arg_2.width - _local_4.width));
                    }
                }
            }
            _arg_2.width = Math.max(_arg_2.width, _local_4.right);
        }

        private function createRewardPerk(k:TalentTrackLevel, _arg_2:TalentTrackRewardPerk):IWindowContainer
        {
            var _local_3:IWindowContainer;
            switch (k.state)
            {
                case TalentTrack.STATE_ACHIEVED:
                case TalentTrack.STATE_ONGOING:
                    _local_3 = IWindowContainer(this._rewardAchievedTemplate.clone());
                    IBadgeImageWidget(IWidgetWindow(_local_3.findChildByName("achieved")).widget).badgeId = _arg_2._Str_10964;
                    break;
                case TalentTrack.STATE_LOCKED:
                    _local_3 = IWindowContainer(this._rewardLockedTemplate.clone());
                    break;
            }
            var _local_4:IWindow = IWindow(_local_3.findChildByName("title"));
            var _local_5:IWindow = ITextWindow(_local_3.findChildByName("description"));
            _local_4.caption = (("${perk." + _arg_2._Str_10964) + ".name}");
            _local_5.caption = (("${perk." + _arg_2._Str_10964) + ".description}");
            if (k.rewardCount == 1)
            {
                _local_3.width = (_Str_5573 * 2);
                _local_3.findChildByName("title").width = ((_Str_5573 * 2) - _Str_11612);
                _local_3.findChildByName("description").width = ((_Str_5573 * 2) - _Str_11612);
            }
            else
            {
                if (_local_5.height > 30)
                {
                    _local_5.width = (_local_5.width + (4 * _Str_3555));
                }
                _local_5.width = Math.max(_local_5.width, _local_4.width);
                _local_3.width = ((Math.max(_local_5.width, _local_4.width) + _Str_11612) + _Str_3555);
            }
            return _local_3;
        }

        private function createRewardProduct(k:TalentTrackLevel, _arg_2:TalentTrackRewardProduct):IWindowContainer
        {
            var _local_3:IWindowContainer;
            if (_arg_2._Str_13965 == 0)
            {
                _local_3 = IWindowContainer(this._rewardProductTemplate.clone());
                IStaticBitmapWrapperWindow(_local_3.findChildByName("product_icon")).assetUri = (("${image.library.url}talent/reward_product_" + _arg_2.productCode.toLowerCase().replace(" ", "_")) + ".png");
            }
            else
            {
                _local_3 = IWindowContainer(this._rewardVipTemplate.clone());
                _local_3.findChildByName("vip_length").caption = this._habboTalent.localizationManager.getLocalizationWithParams("catalog.vip.item.header.days", "", "num_days", _arg_2._Str_13965);
            }
            if (k.state == TalentTrack.STATE_LOCKED)
            {
                _local_3.color = 0x979797;
                _local_3.blend = 0.6;
            }
            return _local_3;
        }

        private function createTask(k:TalentTrackLevel, _arg_2:TalentTrackTask):IWindowContainer
        {
            var _local_3:IWindowContainer;
            var _local_6:IRegionWindow;
            if (((_arg_2.badgeCode == null) || (_arg_2.badgeCode == "")))
            {
                return null;
            }
            switch (_arg_2.state)
            {
                case TalentTrack.STATE_ACHIEVED:
                    _local_3 = IWindowContainer(this._taskAchievedTemplate.clone());
                    IBadgeImageWidget(IWidgetWindow(_local_3.findChildByName("badge")).widget).badgeId = _arg_2.badgeCode;
                    break;
                case TalentTrack.STATE_ONGOING:
                    _local_3 = IWindowContainer(this._taskOngoingTemplate.clone());
                    IBadgeImageWidget(IWidgetWindow(_local_3.findChildByName("badge")).widget).badgeId = _arg_2.badgeCode;
                    _local_3.findChildByName("task_progress_fg").width = _Str_988._Str_1452(_arg_2._Str_7605, 0, _arg_2._Str_15676, 0, 48);
                    _local_6 = (_local_3.findChildByName("task_ongoing_region") as IRegionWindow);
                    _local_6.id = _arg_2.achievementId;
                    if (_arg_2.badgeCode == TalentTrackTask.SAFETY_QUIZ_GRADUATE_1)
                    {
                        _local_6.toolTipCaption = "";
                        _local_6.name = _arg_2.badgeCode;
                    }
                    break;
                case TalentTrack.STATE_LOCKED:
                    _local_3 = IWindowContainer(this._taskLockedTemplate.clone());
                    break;
            }
            var _local_4:IWindow = _local_3.findChildByName("title");
            var _local_5:IWindow = _local_3.findChildByName("description");
            _local_4.caption = this._habboTalent.localizationManager.getAchievementName(_arg_2.badgeCode).toUpperCase();
            _local_5.caption = this._habboTalent.localizationManager.getAchievementInstruction(_arg_2.badgeCode);
            if (_local_4.height > 20)
            {
                _local_4.y = (_local_4.y - 5);
                _local_5.y = (_local_5.y + 5);
            }
            else
            {
                if (_local_5.height > 30)
                {
                    _local_4.y = (_local_4.y - 5);
                    _local_5.y = (_local_5.y - 5);
                }
            }
            return _local_3;
        }

        private function destroyWindow():void
        {
            this.destroyTaskProgressDialog();
            if (this._overlayTemplate != null)
            {
                this._overlayTemplate.dispose();
                this._overlayTemplate = null;
            }
            if (this._levelTemplate)
            {
                this._levelTemplate.dispose();
                this._levelTemplate = null;
            }
            if (this._rewardAchievedTemplate)
            {
                this._rewardAchievedTemplate.dispose();
                this._rewardAchievedTemplate = null;
            }
            if (this._rewardLockedTemplate)
            {
                this._rewardLockedTemplate.dispose();
                this._rewardLockedTemplate = null;
            }
            if (this._rewardProductTemplate)
            {
                this._rewardProductTemplate.dispose();
                this._rewardProductTemplate = null;
            }
            if (this._rewardVipTemplate)
            {
                this._rewardVipTemplate.dispose();
                this._rewardVipTemplate = null;
            }
            if (this._taskAchievedTemplate)
            {
                this._taskAchievedTemplate.dispose();
                this._taskAchievedTemplate = null;
            }
            if (this._taskOngoingTemplate)
            {
                this._taskOngoingTemplate.dispose();
                this._taskOngoingTemplate = null;
            }
            if (this._taskLockedTemplate)
            {
                this._taskLockedTemplate.dispose();
                this._taskLockedTemplate = null;
            }
            if (this._dialog)
            {
                this._dialog.dispose();
                this._dialog = null;
                this._window = null;
                this._habboTalent.windowManager.getWindowContext(_Str_4923).getDesktopWindow().removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this.onDesktopResized);
            }
        }

        private function resizeWindow():void
        {
            if (((this._dialog == null) || (this._dialog.disposed)))
            {
                return;
            }
            this._window.x = _Str_13088;
            this._window.width = (this._window.desktop.width - (2 * _Str_13088));
            this._window.findChildByName("frame").width = this._window.width;
            this._window.findChildByName("panorama").width = this._window.width;
            this._window.findChildByName("panorama_scrollbar").width = this._window.width;
            this._talentProgressMeter.resize();
            this._panoramaList.arrangeListItems();
            this._window.invalidate();
        }

        private function onDesktopResized(k:WindowEvent):void
        {
            this.resizeWindow();
        }

        private function onWindowEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if ((((this._window == null) || (this._window.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.destroyWindow();
                    return;
                case "progress_container":
                    _local_3 = WindowMouseEvent(k).localX;
                    if (_local_3 < _Str_13352)
                    {
                        this._panoramaList.scrollH = 0;
                    }
                    else
                    {
                        if (_local_3 > (this._talentProgressMeter.width - _Str_13352))
                        {
                            this._panoramaList.scrollH = 1;
                        }
                        else
                        {
                            this.scrollToLevel(int(Math.floor((_local_3 / this._talentProgressMeter._Str_19867))));
                        }
                    }
                    return;
                case "task_ongoing_region":
                    this.createTaskProgressDialog(_arg_2.id);
                    return;
                case "citizenship_button":
                    this._habboTalent.tracking.trackTalentTrackOpen(TalentEnum.CITIZENSHIP, "talentrack");
                    this._habboTalent.send(new GetTalentTrackMessageComposer(TalentEnum.CITIZENSHIP));
                    return;
                case "button_track_citizenship":
                    return;
                case "button_track_helper":
                    return;
                case TalentTrackTask.SAFETY_QUIZ_GRADUATE_1:
                    this.closeAndLog(_arg_2.name);
                    this._habboTalent.habboHelp.showSafetyBooklet();
                    return;
            }
        }

        private function onModalWindowBackgroundEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._window == null) || (this._window.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            this.destroyWindow();
        }

        private function scrollToLevel(k:int):void
        {
            var _local_2:IWindow;
            if (k == 0)
            {
                this._panoramaList.scrollH = 0;
            }
            else
            {
                _local_2 = this._panoramaList.getListItemByName((LEVEL_PANE_ + k));
                if (_local_2 != null)
                {
                    Logger.log(this._panoramaList.scrollH);
                    this._panoramaList.scrollH = _Str_988._Str_1452((_local_2.x - 20), 0, (this._panoramaList.scrollableRegion.width - this._panoramaList.visibleRegion.width), 0, 1);
                    Logger.log(((((((_local_2.x + " ") + this._panoramaList.scrollableRegion.width) + " ") + _Str_988._Str_1452(_local_2.x, 0, this._panoramaList.scrollableRegion.width, 0, 1)) + " ") + this._panoramaList.scrollH));
                }
            }
        }

        private function createTaskProgressDialog(k:int):void
        {
            var _local_5:String;
            var _local_6:String;
            var _local_7:Boolean;
            this.destroyTaskProgressDialog();
            var _local_2:TalentTrackTask = this._talentTrack._Str_17590(k);
            if ((((_local_2 == null) || (_local_2.badgeCode == null)) || (_local_2.badgeCode == "")))
            {
                return;
            }
            this._habboTalent.tracking.trackEventLog("Talent", this.talentTrack.name, "talent.progress.show", _local_2.badgeCode);
            if (_local_2.badgeCode == TalentTrackTask.GUIDE_ADVERTISEMENT_READER)
            {
                this.setupTourAdvertisement();
                return;
            }
            this._taskProgressPopup = this._habboTalent.getModalXmlWindow("task_progress_dialog");
            this._taskProgressPopup.rootWindow.procedure = this.onTaskProgressWindowEvent;
            this._taskProgressPopup.background.procedure = this.onTaskProgressBackgroundWindowEvent;
            var _local_3:IWindowContainer = IWindowContainer(this._taskProgressPopup.rootWindow);
            _local_3.findChildByName("instruction").caption = this._habboTalent.localizationManager.getAchievementInstruction(_local_2.badgeCode);
            _local_3.findChildByName("title").caption = this._habboTalent.localizationManager.getAchievementName(_local_2.badgeCode);
            _local_3.findChildByName("progress_text").caption = ((((this._habboTalent.localizationManager.getLocalization("talent.track.task.progress.dialog.progress") + " ") + _local_2._Str_7605) + "/") + _local_2._Str_15676);
            IBadgeImageWidget(IWidgetWindow(_local_3.findChildByName("badge")).widget).badgeId = _local_2.badgeCode;
            this.getEmailContainer().visible = false;
            if (this._habboTalent._Str_9968)
            {
                _local_5 = this._habboTalent.localizationManager.getLocalization((((("talent.track.task.action." + this._talentTrack.name) + ".") + this.mapBadgeCode(_local_2.badgeCode)) + ".description"), "");
                _local_6 = this._habboTalent.localizationManager.getLocalization((((("talent.track.task.action." + this._talentTrack.name) + ".") + this.mapBadgeCode(_local_2.badgeCode)) + ".link"), "");
                _local_7 = ((!(_local_5 == "")) || (!(_local_6 == "")));
                _local_3.findChildByName("action_separator").visible = _local_7;
                _local_3.findChildByName("action_title").visible = _local_7;
                this.setText(_local_3, "action_description", _local_5);
                this.setText(_local_3, "action_link", _local_6);
                _local_3.findChildByName("action_link").name = _local_2.badgeCode;
                _local_3.findChildByName("progress_separator").visible = (!(_local_6 == ""));
                if (((_local_2.badgeCode == TalentTrackTask.EMAIL_VERIFICATION_1) && (this.emailChangeEnabled)))
                {
                    this.getEmailContainer().visible = true;
                    this.getEmailContainer().findChildByName("change_email_region").procedure = this.onChangeEmail;
                    this.getEmailText().procedure = this.onEmailTxt;
                    this._habboTalent.send(new GetEmailStatusComposer());
                    this.setEmailErrorStatus(false);
                }
            }
            else
            {
                _local_3.findChildByName("action_separator").visible = false;
                _local_3.findChildByName("action_title").visible = false;
                _local_3.findChildByName("action_description").visible = false;
                _local_3.findChildByName("action_link").visible = false;
            }
            IItemListWindow(_local_3.findChildByName("top_list")).arrangeListItems();
            if (_local_2._Str_7605 <= 0)
            {
                _local_3.findChildByName("achieved_left").visible = false;
                _local_3.findChildByName("achieved_right").visible = false;
                _local_3.findChildByName("achieved_mid").visible = false;
            }
            else
            {
                if (_local_2._Str_7605 < _local_2._Str_15676)
                {
                    _local_3.findChildByName("achieved_right").visible = false;
                    _local_3.findChildByName("achieved_mid").width = _Str_988._Str_1452(_local_2._Str_7605, 0, _local_2._Str_15676, 0, _local_3.findChildByName("unachieved_mid").width);
                }
            }
            var _local_4:IItemListWindow = IItemListWindow(_local_3.findChildByName("list"));
            if (!_local_2._Str_24120())
            {
                _local_4.removeListItem(_local_4.getListItemByName("progress_main_container"));
            }
            _local_4.arrangeListItems();
        }

        private function getEmailContainer():IWindowContainer
        {
            if (((this._taskProgressPopup == null) || (this._taskProgressPopup.rootWindow == null)))
            {
                return null;
            }
            var k:IWindowContainer = IWindowContainer(this._taskProgressPopup.rootWindow);
            return (k == null) ? null : IWindowContainer(k.findChildByName("email_container"));
        }

        private function mapBadgeCode(k:String):String
        {
            if (((k == TalentTrackTask.ROOM_ENTRY_1) || (k == TalentTrackTask.ROOM_ENTRY_2)))
            {
                return "ACH_RoomEntry";
            }
            return k;
        }

        private function setText(k:IWindowContainer, _arg_2:String, _arg_3:String):void
        {
            var _local_4:IWindow = k.findChildByName(_arg_2);
            _local_4.caption = _arg_3;
            _local_4.visible = (!(_arg_3 == ""));
        }

        private function destroyTaskProgressDialog():void
        {
            if (this._taskProgressPopup != null)
            {
                this._taskProgressPopup.dispose();
                this._taskProgressPopup = null;
            }
        }

        private function onTaskProgressWindowEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if ((((this._taskProgressPopup == null) || (this._taskProgressPopup.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "thanks_button":
                    this.destroyTaskProgressDialog();
                    return;
                case TalentTrackTask.HABBO_WAY_GRADUATE_1:
                    this.closeAndLog(_arg_2.name);
                    this._habboTalent.habboHelp.showHabboWay();
                    return;
                case TalentTrackTask.GUIDE_GROUP_MEMBER_1:
                    this.closeAndLog(_arg_2.name);
                    _local_3 = this._habboTalent.getInteger("guide.help.alpha.groupid", 0);
                    if (_local_3 > 0)
                    {
                        this._expectedGroupID = _local_3;
                        this._habboTalent.send(new GetHabboGroupDetailsMessageComposer(_local_3, false));
                    }
                    return;
                case TalentTrackTask.SAFETY_QUIZ_GRADUATE_1:
                    this.closeAndLog(_arg_2.name);
                    this._habboTalent.habboHelp.showSafetyBooklet();
                    return;
                case TalentTrackTask.ROOM_ENTRY_1:
                case TalentTrackTask.ROOM_ENTRY_2:
                    this.closeAndLog(_arg_2.name);
                    this._habboTalent.navigator.openNavigator(null);
                    return;
                case TalentTrackTask.AVATAR_LOOKS_1:
                    this.closeAndLog(_arg_2.name);
                    this._habboTalent.avatarEditor.openEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR, null, null, true);
                    this._habboTalent.avatarEditor.loadOwnAvatarInEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
                    return;
            }
        }

        private function closeAndLog(k:String):void
        {
            this.destroyWindow();
            this._habboTalent.tracking.trackEventLog("Talent", this._talentTrack.name, "talent.progress.click_activity", k);
        }

        private function setupTourAdvertisement():void
        {
            this._taskProgressPopup = this._habboTalent.getModalXmlWindow("tour_task_progress_dialog");
            var k:IWindowContainer = IWindowContainer(this._taskProgressPopup.rootWindow);
            k.findChildByName("take_tour_button").procedure = this.onTakeTour;
            k.findChildByName("decline_tour_region").procedure = this.onDeclineTour;
            k.findChildByName("header_button_close").procedure = this.onCloseTourAd;
        }

        private function onTakeTour(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.destroyWindow();
                this.destroyTaskProgressDialog();
                this._habboTalent.send(new GuideAdvertisementReadMessageComposer());
                this._habboTalent.habboHelp.requestGuide();
                this._habboTalent.tracking.trackEventLog("Help", "", "tour.new_user.accept");
                this._habboTalent.tracking.trackGoogle("newbieTourWindow", "click_acceptTour");
            }
        }

        private function onCloseTourAd(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.destroyTaskProgressDialog();
            }
        }

        private function onDeclineTour(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.destroyWindow();
                this.destroyTaskProgressDialog();
                this._habboTalent.send(new GuideAdvertisementReadMessageComposer());
                this._habboTalent.tracking.trackEventLog("Help", "", "tour.new_user.cancel");
                this._habboTalent.tracking.trackGoogle("newbieTourWindow", "click_refuseTour");
            }
        }

        private function onChangeEmail(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this.getEmailText().text;
                this._habboTalent.send(new ChangeEmailComposer(_local_3));
            }
        }

        private function onEmailTxt(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_FOCUSED)
            {
                this.setEmailErrorStatus(false);
            }
        }

        private function setEmailErrorStatus(k:Boolean, _arg_2:int=0):void
        {
            if (this.getEmailContainer() == null)
            {
                return;
            }
            var _local_3:Boolean = ((k) && (!(_arg_2 == ChangeEmailResultParser.EMAIL_STATUS_OK)));
            var _local_4:IWindowContainer = this.getEmailContainer();
            var _local_5:IWindow = _local_4.findChildByName("error_txt");
            _local_5.visible = _local_3;
            _local_5.caption = ((("$" + "{welcome.gift.email.error.") + _arg_2) + "}");
            _local_4.findChildByName("error_border").visible = _local_3;
            _local_4.findChildByName("change_email_region").visible = (!(k));
            _local_4.findChildByName("changed_container").visible = ((k) && (_arg_2 == ChangeEmailResultParser.EMAIL_STATUS_OK));
        }

        private function getEmailText():ITextFieldWindow
        {
            return ITextFieldWindow(this.getEmailContainer().findChildByName("email_txt"));
        }

        private function onTaskProgressBackgroundWindowEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._taskProgressPopup == null) || (this._taskProgressPopup.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            this.destroyTaskProgressDialog();
        }

        private function get emailChangeEnabled():Boolean
        {
            return this._habboTalent.getBoolean("talent.progress.emailchange.enabled");
        }
    }
}
