package com.sulake.habbo.ui.widget.furniture.requirementsmissing
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.ui.handler.CustomUserNotificationWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.inventory.IAvatarEffect;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.inventory.AvatarEffectSubtypeEnum;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class CustomUserNotificationWidget extends ConversionTrackingWidget 
    {
        public static const VIPHOPPER:String = "viphopper";
        public static const VIPGATE:String = "vipgate";
        public static const COSTUMEHOPPER:String = "costumehopper";
        public static const RESPECTFAILEDSTAGE:String = "respectfailedstage";
        public static const RESPECTFAILEDAUDIENCE:String = "respectfailedaudience";

        private var _window:IFrameWindow;
        private var _widgetHandler:CustomUserNotificationWidgetHandler;

        public function CustomUserNotificationWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._widgetHandler = CustomUserNotificationWidgetHandler(k);
            this._widgetHandler.widget = this;
        }

        public function open(k:String=""):void
        {
            if (!this._window)
            {
                switch (k)
                {
                    case VIPHOPPER:
                        this._Str_6297("viprequired_xml");
                        this._Str_21325("viphopper");
                        break;
                    case VIPGATE:
                        this._Str_6297("viprequired_xml");
                        this._Str_21325("gate");
                        break;
                    case COSTUMEHOPPER:
                        this._Str_6297("costumehopper_costumerequired_xml");
                        break;
                    case RESPECTFAILEDSTAGE:
                        this._Str_6297("respect_giving_failed_notification_xml");
                        this._Str_2497("stage");
                        this._Str_22240("stage");
                        break;
                    case RESPECTFAILEDAUDIENCE:
                        this._Str_6297("respect_giving_failed_notification_xml");
                        this._Str_2497("audience");
                        this._Str_22240("audience");
                        break;
                }
                this._window.center();
                this._window.procedure = this._Str_5162;
            }
        }

        private function _Str_6297(k:String):void
        {
            this._window = IFrameWindow(windowManager.buildFromXML(XML(assets.getAssetByName(k).content)));
        }

        private function _Str_21325(k:String):void
        {
            this._window.findChildByName("title").caption = (("${" + k) + ".viprequired.title}");
            this._window.findChildByName("bodytext").caption = (("${" + k) + ".viprequired.bodytext}");
        }

        private function _Str_2497(k:String):void
        {
            var _local_2:String = ("respect.giving.failed.no." + k);
            var _local_3:String = this._widgetHandler.container.localization.getLocalization(_local_2);
            var _local_4:String = this._widgetHandler.container.config.getProperty("respect.talent.show.min.audience");
            if (_local_4)
            {
                _local_3 = _local_3.replace("%users%", _local_4);
            }
            this._window.findChildByName("body_txt").caption = _local_3;
        }

        private function _Str_22240(k:String):void
        {
            var _local_2:* = (("${image.library.url}notifications/habbo_talent_show_" + k) + ".png");
            var _local_3:IStaticBitmapWrapperWindow = (this._window.content.getChildByName("respectFailedNotificationBitmap") as IStaticBitmapWrapperWindow);
            _local_3.assetUri = _local_2;
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_5162(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Array;
            var _local_4:Boolean;
            var _local_5:IAvatarEffect;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "buy_vip":
                        if (((!(this._widgetHandler == null)) && (!(this._widgetHandler.container == null))))
                        {
                            this._widgetHandler.container.catalog.openClubCenter();
                        }
                        this.close();
                        break;
                    case "vip_benefits":
                        this._widgetHandler.container.catalog.showVipBenefits();
                        break;
                    case "buy_costumes":
                        _local_3 = this._widgetHandler.container.inventory.getAvatarEffects();
                        _local_4 = false;
                        for each (_local_5 in _local_3)
                        {
                            if (_local_5._Str_3882 == AvatarEffectSubtypeEnum._Str_16334)
                            {
                                _local_4 = true;
                                break;
                            }
                        }
                        if (_local_4)
                        {
                            this._widgetHandler.container.avatarEditor.openEditor(AvatarEditorInstanceId._Str_3350, null, null, true, null, AvatarEditorFigureCategory.EFFECTS);
                            this._widgetHandler.container.avatarEditor.loadOwnAvatarInEditor(AvatarEditorInstanceId._Str_3350);
                        }
                        else
                        {
                            this._widgetHandler.container.catalog.openCatalogPage("costumes");
                        }
                        this.close();
                        break;
                    case "close":
                        this.close();
                        break;
                }
                if (_arg_2.tags.indexOf("close") != -1)
                {
                    this.close();
                }
            }
        }
    }
}
