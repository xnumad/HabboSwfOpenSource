package com.sulake.habbo.ui.widget.furniture.mannequin
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.avatar.enum.AvatarFigurePartType;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.MannequinWidgetHandler;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.IAvatarFigureContainer;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10762;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11554;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;

    public class MannequinWidget extends ConversionTrackingWidget 
    {
        private static const _Str_9305:int = 0;
        private static const _Str_11074:int = 1;
        private static const _Str_10942:int = 2;
        private static const _Str_8565:int = 3;
        private static const _Str_9053:int = 4;
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const SAVE_BUTTON:String = "save_button";
        private static const WEAR_BUTTON:String = "wear_button";
        private static const CONFIGURE_BUTTON:String = "configure_button";
        private static const GET_CLUB_BUTTON:String = "get_club_button";
        private static const CANCEL_TEXT:String = "cancel_text";
        private static const BACK_REGION:String = "back_region";
        private static const OK_BUTTON:String = "ok_button";
        private static const OUTFIT_NAME_SET:String = "outfit_name_set";
        private static const OUTFIT_NAME_SHOW:String = "outfit_name_show";
        private static const _Str_9071:int = 0;
        private static const _Str_8000:int = 1;
        private static const _Str_8218:int = 2;
        private static const _Str_18139:uint = 0;
        private static const _Str_17568:uint = 8956552;
        private static const _Str_15584:uint = 0x777777;
        private static const _Str_9402:Array = new Array(AvatarFigurePartType.CHEST_ACCESSORY, AvatarFigurePartType.COAT_CHEST, AvatarFigurePartType.CHEST, AvatarFigurePartType.LEGS, AvatarFigurePartType.SHOES, AvatarFigurePartType.WAIST_ACCESSORY);
        private static const _Str_10597:Array = ["hd", 99999, [99998]];
        private static const _Str_5044:int = 13;
        private static const _Str_3830:int = 14;

        private var _window:IWindowContainer;
        private var _furniId:int;
        private var _mannequinFigure:String;
        private var _mannequinGender:String;
        private var _mannequinClubLevel:int;
        private var _savedOutfitName:String;
        private var _nameState:int = -1;

        public function MannequinWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this.handler.widget = this;
        }

        public function get handler():MannequinWidgetHandler
        {
            return _Str_2470 as MannequinWidgetHandler;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            super.dispose();
        }

        public function open(k:int, _arg_2:String, _arg_3:String, _arg_4:String):void
        {
            this._furniId = k;
            this._mannequinFigure = _arg_2;
            this._mannequinGender = _arg_3;
            this._savedOutfitName = _arg_4;
            var _local_5:IRoomSession = (_Str_2470 as MannequinWidgetHandler).container.roomSession;
            var _local_6:ISessionDataManager = (_Str_2470 as MannequinWidgetHandler).container.sessionDataManager;
            var _local_7:Boolean = (((_local_5.isRoomController) || (_local_5.roomControllerLevel >= RoomControllerLevel.GUEST)) || (_local_6.isGodMode));
            var _local_8:IAvatarRenderManager = (_Str_2470 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_9:IAvatarFigureContainer = _local_8._Str_718(_arg_2);
            this._mannequinClubLevel = _local_8._Str_932(_local_9, this._mannequinGender, _Str_9402);
            var _local_10:int = this._Str_24391(_local_7, _local_6.gender, _local_6.clubLevel, _arg_3, this._mannequinClubLevel);
            this._Str_3248(_local_10);
            var _local_11:int = (((this._savedOutfitName) && (!(this._savedOutfitName == ""))) ? _Str_8218 : _Str_9071);
            this._Str_6655(_local_11);
            this._window.visible = true;
        }

        private function _Str_24391(k:Boolean, _arg_2:String, _arg_3:int, _arg_4:String, _arg_5:int):int
        {
            if (k)
            {
                return _Str_9305;
            }
            if (_arg_2.toLowerCase() != _arg_4.toLowerCase())
            {
                return _Str_9053;
            }
            if (_arg_3 < _arg_5)
            {
                return _Str_8565;
            }
            return _Str_10942;
        }

        private function _Str_3248(k:int):void
        {
            var _local_2:BitmapData;
            var _local_3:IAvatarFigureContainer;
            var _local_4:ISessionDataManager = (_Str_2470 as MannequinWidgetHandler).container.sessionDataManager;
            var _local_5:String = _local_4.figure;
            var _local_6:IAvatarRenderManager = (_Str_2470 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_7:int = (((this._savedOutfitName) && (!(this._savedOutfitName == ""))) ? _Str_8218 : _Str_9071);
            if (!this._window)
            {
                this._window = (windowManager.buildFromXML((assets.getAssetByName("mannequin_widget_frame_xml").content as XML)) as IWindowContainer);
                this._Str_2471(HEADER_BUTTON_CLOSE);
                this._window.center();
            }
            (this._window as IFrameWindow).content.removeChildAt(0);
            var _local_8:IWindowContainer = this.createWindow(k);
            (this._window as IFrameWindow).content.addChild(_local_8);
            switch (k)
            {
                case _Str_9305:
                    this._Str_2471(CONFIGURE_BUTTON);
                    this._Str_2471(WEAR_BUTTON);
                    this._Str_24329(OUTFIT_NAME_SET);
                    this._Str_2471(OUTFIT_NAME_SET);
                    _local_3 = _local_6._Str_718(this._mannequinFigure);
                    this._Str_17455(_local_3);
                    _local_2 = this.createAvatarImage(_local_3.getFigureString());
                    this._Str_11068(this._mannequinClubLevel);
                    this._Str_6655(_local_7);
                    this._Str_23723();
                    break;
                case _Str_11074:
                    this._Str_2471(SAVE_BUTTON);
                    this._Str_2471(BACK_REGION);
                    _local_3 = _local_6._Str_718(_local_5);
                    this._Str_17455(_local_3);
                    _local_2 = this.createAvatarImage(_local_3.getFigureString());
                    this._Str_11068(_local_6._Str_932(_local_3, _local_4.gender, _Str_9402));
                    this._Str_6655(_local_7);
                    break;
                case _Str_10942:
                    this._Str_2471(WEAR_BUTTON);
                    _local_3 = this._Str_19759(_local_5, this._mannequinFigure);
                    _local_2 = this.createAvatarImage(_local_3.getFigureString());
                    this._Str_11068(this._mannequinClubLevel);
                    this._Str_6655(_local_7);
                    break;
                case _Str_8565:
                    this._Str_2471(GET_CLUB_BUTTON);
                    _local_3 = this._Str_19759(_local_5, this._mannequinFigure);
                    _local_2 = this.createAvatarImage(_local_3.getFigureString());
                    this._Str_11068(this._mannequinClubLevel);
                    break;
                case _Str_9053:
                    this._Str_2471(OK_BUTTON);
                    _local_3 = _local_6._Str_718(this._mannequinFigure);
                    this._Str_17455(_local_3);
                    _local_2 = this.createAvatarImage(_local_3.getFigureString());
                    this._Str_11068(this._mannequinClubLevel);
                    break;
                default:
                    throw (new Error(("Invalid type for mannequin widget content apply: " + k)));
            }
            this._Str_3060(_local_8, _local_2);
        }

        private function createWindow(k:int):IWindowContainer
        {
            var _local_2:IAsset;
            var _local_3:IWindowContainer;
            switch (k)
            {
                case _Str_9305:
                    _local_2 = _assets.getAssetByName("mannequin_controller_main_xml");
                    break;
                case _Str_11074:
                    _local_2 = _assets.getAssetByName("mannequin_controller_save_xml");
                    break;
                case _Str_10942:
                    _local_2 = _assets.getAssetByName("mannequin_peer_main_xml");
                    break;
                case _Str_8565:
                    _local_2 = _assets.getAssetByName("mannequin_no_club_xml");
                    break;
                case _Str_9053:
                    _local_2 = _assets.getAssetByName("mannequin_wrong_gender_xml");
                    break;
                default:
                    throw (new Error(("Invalid type for mannequin widget content creation: " + k)));
            }
            _local_3 = ((_Str_2470 as MannequinWidgetHandler).container.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            return _local_3;
        }

        private function _Str_17455(k:IAvatarFigureContainer):void
        {
            var _local_2:String;
            for each (_local_2 in k._Str_1016())
            {
                if (_Str_9402.indexOf(_local_2) == -1)
                {
                    k._Str_923(_local_2);
                }
            }
            k._Str_830(_Str_10597[0], _Str_10597[1], _Str_10597[2]);
        }

        private function createAvatarImage(k:String):BitmapData
        {
            var _local_2:IAvatarRenderManager = (_Str_2470 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_3:IAvatarImage = _local_2.createAvatarImage(k, AvatarScaleType.LARGE);
            var _local_4:BitmapData = _local_3._Str_818(AvatarSetType.FULL);
            _local_3.dispose();
            return _local_4;
        }

        private function _Str_19759(k:String, _arg_2:String):IAvatarFigureContainer
        {
            var _local_6:String;
            var _local_3:IAvatarRenderManager = (_Str_2470 as MannequinWidgetHandler).container.avatarRenderManager;
            var _local_4:IAvatarFigureContainer = _local_3._Str_718(k);
            var _local_5:IAvatarFigureContainer = _local_3._Str_718(_arg_2);
            for each (_local_6 in _Str_9402)
            {
                _local_4._Str_923(_local_6);
            }
            for each (_local_6 in _local_5._Str_1016())
            {
                _local_4._Str_830(_local_6, _local_5.getPartSetId(_local_6), _local_5._Str_815(_local_6));
            }
            return _local_4;
        }

        private function _Str_11068(k:int):void
        {
            var _local_2:IIconWindow = (this._window.findChildByName("club_icon") as IIconWindow);
            if (!_local_2)
            {
                return;
            }
            switch (k)
            {
                case HabboClubLevelEnum._Str_3159:
                    _local_2.visible = false;
                    return;
                case HabboClubLevelEnum._Str_2964:
                    _local_2.style = _Str_5044;
                    _local_2.visible = true;
                    return;
                case HabboClubLevelEnum._Str_2575:
                    _local_2.style = _Str_3830;
                    _local_2.visible = true;
                    return;
            }
        }

        private function _Str_3060(k:IWindowContainer, _arg_2:BitmapData):void
        {
            var _local_6:BitmapData;
            if (((!(k)) || (!(_arg_2))))
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (k.findChildByName("preview_image") as IBitmapWrapperWindow);
            if (_local_3.bitmap == null)
            {
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height);
            }
            var _local_4:IAsset = (assets.getAssetByName("mannequin_preview_bg_png") as IAsset);
            if (_local_4)
            {
                _local_6 = (_local_4.content as BitmapData);
                _local_3.bitmap.copyPixels(_local_6, _local_6.rect, new Point(0, 0));
            }
            var _local_5:Point = new Point(((_local_3.width - _arg_2.width) / 2), ((_local_3.height - _arg_2.height) / 2));
            _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, _local_5, null, null, true);
        }

        private function _Str_23723():void
        {
            var _local_2:BitmapDataAsset;
            var k:IBitmapWrapperWindow = (this._window.findChildByName("write_deco") as IBitmapWrapperWindow);
            if (k)
            {
                _local_2 = (_assets.getAssetByName("small_pen") as BitmapDataAsset);
                k.bitmap = (_local_2.content as BitmapData);
                k.disposesBitmap = false;
            }
        }

        private function close():void
        {
            this._window.visible = false;
        }

        private function _Str_6655(k:int):void
        {
            this._nameState = k;
            var _local_2:ITextWindow = (this._window.findChildByName(OUTFIT_NAME_SET) as ITextWindow);
            if (_local_2)
            {
                switch (k)
                {
                    case _Str_9071:
                        _local_2.text = this.handler.container.localization.getLocalization("mannequin.widget.set_name_hint");
                        _local_2.textColor = _Str_15584;
                        _local_2.italic = true;
                        break;
                    case _Str_8000:
                        _local_2.textColor = _Str_17568;
                        _local_2.italic = false;
                        break;
                    case _Str_8218:
                        _local_2.text = this._savedOutfitName;
                        _local_2.textColor = _Str_18139;
                        _local_2.italic = false;
                        break;
                    default:
                        _local_2.text = this.handler.container.localization.getLocalization("mannequin.widget.set_name_hint");
                        _local_2.textColor = _Str_15584;
                }
            }
            var _local_3:ITextWindow = (this._window.findChildByName(OUTFIT_NAME_SHOW) as ITextWindow);
            if ((((_local_3) && (this._savedOutfitName)) && (!(this._savedOutfitName == ""))))
            {
                _local_3.text = (("'" + this._savedOutfitName) + "'");
            }
        }

        private function _Str_24030():void
        {
            var k:ITextWindow = (this._window.findChildByName(OUTFIT_NAME_SET) as ITextWindow);
            if (k)
            {
                k.text = "";
            }
        }

        private function saveOutfit():void
        {
            this.handler.container.connection.send(new _Str_10762(this._furniId));
        }

        private function _Str_20994():void
        {
            var k:String = this._Str_23640();
            this.handler.container.connection.send(new _Str_11554(this._furniId, k));
            this._savedOutfitName = k;
            this._Str_6655(_Str_8218);
        }

        private function _Str_23640():String
        {
            var k:String = (this._window.findChildByName(OUTFIT_NAME_SET) as ITextWindow).text;
            var _local_2:String = this.handler.container.localization.getLocalization("mannequin.widget.set_name_hint");
            return (k == _local_2) ? "" : k;
        }

        private function _Str_2471(k:String):void
        {
            this._window.findChildByName(k).addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
        }

        private function _Str_24329(k:String):void
        {
            this._window.findChildByName(k).addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_24123);
        }

        private function _Str_24123(k:WindowKeyboardEvent):void
        {
            if (k.keyCode == 13)
            {
                this._Str_20994();
            }
            else
            {
                if (this._nameState != _Str_8000)
                {
                    this._Str_6655(_Str_8000);
                }
            }
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            var _local_2:ISessionDataManager = (_Str_2470 as MannequinWidgetHandler).container.sessionDataManager;
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_TEXT:
                case OK_BUTTON:
                    this.close();
                    return;
                case SAVE_BUTTON:
                    this.saveOutfit();
                    this.close();
                    return;
                case WEAR_BUTTON:
                    if (_local_2.clubLevel < this._mannequinClubLevel)
                    {
                        this._Str_3248(_Str_8565);
                    }
                    else
                    {
                        if (_local_2.gender.toLowerCase() != this._mannequinGender.toLowerCase())
                        {
                            this._Str_3248(_Str_9053);
                        }
                        else
                        {
                            this.handler.container.connection.send(new _Str_3382(this._furniId));
                            this.close();
                        }
                    }
                    return;
                case CONFIGURE_BUTTON:
                    this._Str_20994();
                    this._Str_3248(_Str_11074);
                    return;
                case BACK_REGION:
                    this._Str_3248(_Str_9305);
                    return;
                case GET_CLUB_BUTTON:
                    (_Str_2470 as MannequinWidgetHandler).container.catalog.openClubCenter();
                    this.close();
                    return;
                case OUTFIT_NAME_SET:
                    if (this._nameState == _Str_9071)
                    {
                        this._Str_24030();
                        this._Str_6655(_Str_8000);
                    }
                    else
                    {
                        if (this._nameState == _Str_8218)
                        {
                            this._Str_6655(_Str_8000);
                        }
                    }
                    return;
            }
        }
    }
}
