package com.sulake.habbo.ui.widget
{
    import com.sulake.habbo.ui.IRoomWidgetFactory;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.core.assets.IAssetLibrary;
	import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
	import com.sulake.habbo.ui.widget.IRoomWidget;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.ui.widget.roomchat.RoomChatWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
    import com.sulake.habbo.ui.widget.infostand.InfoStandWidget;
    import com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
    import com.sulake.habbo.ui.widget.furniture.placeholder.PlaceholderFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.credit.CreditFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.stickie.StickieFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.present.PresentFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.trophy.TrophyFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.trophy.AchievementResolutionTrophyFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.ecotronbox.EcotronboxFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.petpackage.PetPackageFurniWidget;
    import com.sulake.habbo.ui.widget.doorbell.DoorbellWidget;
    import com.sulake.habbo.ui.widget.loadingbar.LoadingBarWidget;
    import com.sulake.habbo.ui.widget.roomqueue.RoomQueueWidget;
    import com.sulake.habbo.ui.widget.poll.RoomPollWidget;
    import com.sulake.habbo.ui.widget.chooser.UserChooserWidget;
    import com.sulake.habbo.ui.widget.chooser.FurniChooserWidget;
    import com.sulake.habbo.ui.widget.furniture.dimmer.DimmerFurniWidget;
    import com.sulake.habbo.ui.widget.friendrequest.FriendRequestWidget;
    import com.sulake.habbo.ui.widget.furniture.clothingchange.ClothingChangeWidget;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.habbo.ui.widget.furniture.welcomegift.WelcomeGiftWidget;
    import com.sulake.habbo.ui.widget.playlisteditor.PlaylistEditorWidget;
    import com.sulake.habbo.ui.widget.furniture.stickie.SpamwallPostitWIdget;
    import com.sulake.habbo.ui.widget.effects.EffectsWidget;
    import com.sulake.habbo.ui.widget.furniture.mannequin.MannequinWidget;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.habbo.ui.widget.camera.CameraWidget;
    import com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorFurniWidget;
    import com.sulake.habbo.ui.widget.furniture.requirementsmissing.CustomUserNotificationWidget;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniConfirmWidget;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniEngravingWidget;
    import com.sulake.habbo.ui.widget.furniture.highscore.HighScoreDisplayWidget;
    import com.sulake.habbo.ui.widget.furniture.customstackheight.CustomStackHeightWidget;
    import com.sulake.habbo.ui.widget.furniture.video.YoutubeDisplayWidget;
    import com.sulake.habbo.ui.widget.furniture.rentablespace.RentableSpaceDisplayWidget;
    import com.sulake.habbo.ui.widget.furniture.video.VimeoDisplayWidget;
    import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
    import com.sulake.habbo.ui.widget.furniture.externalimage.ExternalImageWidget;
    import com.sulake.habbo.ui.widget.wordquiz.WordQuizWidget;
    import com.sulake.habbo.ui.widget.uihelpbubbles.UiHelpBubblesWidget;
    import com.sulake.habbo.ui.widget.camera.RoomThumbnailCameraWidget;
    import com.sulake.habbo.ui.widget.roomlink.RoomLinkWidget;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
	import com.sulake.habbo.ui.widget.infobuspolls.VotePollWidget;

    public class RoomWidgetFactory implements IRoomWidgetFactory 
    {
        private var _roomUI:RoomUI;
        private var _chatWidgetId:int = 0;

        public function RoomWidgetFactory(k:RoomUI)
        {
            this._roomUI = k;
        }

        public function dispose():void
        {
            this._roomUI = null;
        }

        public function _Str_2548(k:String, _arg_2:IRoomWidgetHandler):IRoomWidget
        {
            if (((this._roomUI == null) || (this._roomUI.windowManager == null)))
            {
                return null;
            }
            var assets:IAssetLibrary = this._roomUI.assets;
            var windowManager:IHabboWindowManager = this._roomUI.windowManager;
            switch (k)
            {
                case RoomWidgetEnum.CHAT_WIDGET:
                    return new RoomChatWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI, this._chatWidgetId++, this._roomUI);
                case RoomWidgetEnum.CHAT_INPUT_WIDGET:
                    return new RoomChatInputWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI, this._roomUI.getDesktop("hard_coded_room_id"));
                case RoomWidgetEnum.INFOSTAND:
                    return new InfoStandWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI, this._roomUI.catalog);
                case RoomWidgetEnum.ME_MENU:
                    return new MeMenuWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.FURNI_PLACEHOLDER:
                    return new PlaceholderFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.FURNI_CREDIT_WIDGET:
                    return new CreditFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.FURNI_STICKIE_WIDGET:
                    return new StickieFurniWidget(_arg_2, windowManager, assets);
                case RoomWidgetEnum.FURNI_PRESENT_WIDGET:
                    return new PresentFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI, this._roomUI.catalog, this._roomUI.inventory, this._roomUI.roomEngine);
                case RoomWidgetEnum.FURNI_TROPHY_WIDGET:
                    return new TrophyFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING:
                    return new AchievementResolutionTrophyFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.FURNI_ECOTRONBOX_WIDGET:
                    return new EcotronboxFurniWidget(_arg_2, windowManager, assets);
                case RoomWidgetEnum.FURNI_PET_PACKAGE_WIDGET:
                    return new PetPackageFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.DOORBELL:
                    return new DoorbellWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.LOADINGBAR:
                    return new LoadingBarWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.ROOM_QUEUE:
                    return new RoomQueueWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.ROOM_POLL:
                    return new RoomPollWidget(_arg_2, windowManager, assets, this._roomUI.localization);
				case RoomWidgetEnum.ROOM_VOTE:
					return new VotePollWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.USER_CHOOSER:
                    return new UserChooserWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.FURNI_CHOOSER:
                    return new FurniChooserWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.ROOM_DIMMER:
                    return new DimmerFurniWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.FRIEND_REQUEST:
                    return new FriendRequestWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.CLOTHING_CHANGE:
                    return new ClothingChangeWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.CONVERSION_TRACKING:
                    return new ConversionTrackingWidget(_arg_2, windowManager);
                case RoomWidgetEnum.AVATAR_INFO:
                    return new AvatarInfoWidget(_arg_2, windowManager, assets, this._roomUI, this._roomUI.localization, this._roomUI, this._roomUI.catalog);
                case RoomWidgetEnum.WELCOME_GIFT:
                    return new WelcomeGiftWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.PLAYLIST_EDITOR_WIDGET:
                    return new PlaylistEditorWidget(_arg_2, windowManager, this._roomUI._Str_2476, assets, this._roomUI.localization, this._roomUI, this._roomUI.catalog);
                case RoomWidgetEnum.SPAMWALL_POSTIT_WIDGET:
                    return new SpamwallPostitWIdget(_arg_2, windowManager, assets);
                case RoomWidgetEnum.EFFECTS:
                    return new EffectsWidget(_arg_2, windowManager, assets);
                case RoomWidgetEnum.MANNEQUIN:
                    return new MannequinWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.FURNITURE_CONTEXT_MENU:
                    return new FurnitureContextMenuWidget(_arg_2, windowManager, assets, this._roomUI, this._roomUI.localization, this._roomUI, this._roomUI._Str_8097, this._roomUI.catalog);
                case RoomWidgetEnum.CAMERA:
                    return new CameraWidget(_arg_2, windowManager, assets, this._roomUI, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.ROOM_BACKGROUND_COLOR:
                    return new BackgroundColorFurniWidget(_arg_2, windowManager, assets);
                case RoomWidgetEnum.CUSTOM_USER_NOTIFICATION:
                    return new CustomUserNotificationWidget(_arg_2, windowManager, assets);
                case RoomWidgetEnum.FRIEND_FURNI_CONFIRM:
                    return new FriendFurniConfirmWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.FRIEND_FURNI_ENGRAVING:
                    return new FriendFurniEngravingWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.HIGH_SCORE_DISPLAY:
                    return new HighScoreDisplayWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.CUSTOM_STACK_HEIGHT:
                    return new CustomStackHeightWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.YOUTUBE:
                    return new YoutubeDisplayWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI.habboTracking);
                case RoomWidgetEnum.RENTABLESPACE:
                    return new RentableSpaceDisplayWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.VIMEO:
                    return new VimeoDisplayWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.ROOM_TOOLS:
                    return new RoomToolsWidget(_arg_2, windowManager, assets, this._roomUI);
                case RoomWidgetEnum.EXTERNAL_IMAGE:
                    return new ExternalImageWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI.inventory, this._roomUI._Str_2602, this._roomUI.roomEngine, this._roomUI);
                case RoomWidgetEnum.WORD_QUIZZ:
                    return new WordQuizWidget(_arg_2, windowManager, assets, this._roomUI.localization);
                case RoomWidgetEnum.UI_HELP_BUBBLE:
                    return new UiHelpBubblesWidget(_arg_2, windowManager, assets, this._roomUI.localization, this._roomUI._Str_16059, this._roomUI.toolbar, this._roomUI.getDesktop("hard_coded_room_id"), this._roomUI);
                case RoomWidgetEnum.ROOM_THUMBNAIL_CAMERA:
                    return new RoomThumbnailCameraWidget(_arg_2, windowManager, assets, this._roomUI, this._roomUI.localization, this._roomUI);
                case RoomWidgetEnum.ROOM_LINK:
                    return new RoomLinkWidget(_arg_2, windowManager);
                case RoomWidgetEnum.CRAFTING:
                    return new CraftingWidget(_arg_2, windowManager, this._roomUI);
            }
            return null;
        }

        public function get disposed():Boolean
        {
            return this._roomUI == null;
        }
    }
}
