package 
{
    import flash.display.Sprite;
    import onBoardingHc.IUIContext;
    import com.sulake.core.runtime.IDisposable;
    import onBoardingHcSteps.Background;
    import onBoardingHcSteps.AvatarEditor;
    import onBoardingHc.NameChangeDialog;
    import onBoardingHcSteps.RoomPicker;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.runtime.IContext;
    import flash.text.TextField;
    import flash.utils.ByteArray;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.habbo.avatar.AvatarRenderManager;
    import com.sulake.habbo.avatar.enum.RenderMode;
    import flash.events.Event;
    import flash.display.Bitmap;
    import onBoardingHcUi.LoaderUI;
    import flash.text.TextFormatAlign;
    import flash.filters.GlowFilter;
    import onBoardingHc.HitchNameChangeDialog;
    import images.*;
    import binaryData.*;
    import fonts.*;

    public class OnBoardingHcFlow extends Sprite implements IUIContext, IDisposable
    {
        public static const NEWUSERFLOWFINISHED:String = "NewUserFlowFinished";
        private static const LOGO_AREA_HEIGHT:int = 95;
        private static const MAIN_AREA_MARGIN:int = 5;
        public static var ubuntu_regular:Class = _Str_623;
        public static var ubuntu_bold:Class = _Str_596;
        public static var ubuntu_italic:Class = _Str_605;
        public static var ubuntu_bold_italic:Class = _Str_600;
        public static var _Str_2240:Class = OnBoardingHcFlow__Str_2240;
        private static const _Str_1278:Class = OnBoardingHcFlow__Str_1278;

        private var _background:Background;
        private var _avatarEditor:AvatarEditor;
        private var _nameChangeContainer:Sprite;
        private var _nameChangeDialog:NameChangeDialog;
        private var _roomPickerContainer:Sprite;
        private var _roomPicker:RoomPicker;
        private var _disposed:Boolean;
        private var _avatarRenderer:IAvatarRenderManager;
        private var _fakeContext:IContext;
        private var _errorBalloon:Sprite;
        private var _hcMemeber:Boolean;
        private var _nameClaimed:Boolean;
        private var _mainSprite:Sprite;
        private var _logoTopSprite:Sprite;
        private var _selectedName:String;
        private var _isFemale:Boolean;
        private var _textIntro:TextField;
        private var _debugText:TextField;
        private var _showHcItems:Boolean;
        private var _nameAreaX:int = 585;
        private var _nameAreaWidth:int = 350;

        public function OnBoardingHcFlow()
        {
            this._Str_1539();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._avatarRenderer)
            {
                this._avatarRenderer.dispose();
                this._avatarRenderer = null;
            }
            if (this._fakeContext)
            {
                this._fakeContext.dispose();
                this._fakeContext = null;
            }
            if (this._background)
            {
                removeChild(this._background);
                this._background.dispose();
                this._background = null;
            }
            if (this._avatarEditor)
            {
                this._avatarEditor.dispose();
                this._avatarEditor = null;
            }
            if (this._nameChangeContainer)
            {
                this._nameChangeContainer = null;
            }
            if (this._roomPickerContainer != null)
            {
                this._roomPickerContainer = null;
            }
            if (this._mainSprite != null)
            {
                removeChild(this._mainSprite);
                this._mainSprite = null;
            }
            stage.removeChild(this);
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_1539():void
        {
            this._fakeContext = new FakeContext();
            var k:ByteArray = (new (HabboAvatarRenderLib.manifest)() as ByteArray);
            var _local_2:XML = new XML(k.readUTFBytes(k.length));
            var _local_3:XML = new XML("<manifest><library /></manifest>");
            _local_3.library.appendChild(_local_2.component.assets);
            var _local_4:IAssetLibrary = new AssetLibrary("_assetsTemp@", _local_3);
            _local_4.loadFromResource(_local_3, HabboAvatarRenderLib);
            (this._fakeContext.assets as AssetLibraryCollection).addAssetLibrary(_local_4);
            k = (new (OnBoardingHcFlow._Str_2240)() as ByteArray);
            var _local_5:XML = new XML(k.readUTFBytes(k.length));
            this._avatarRenderer = new AvatarRenderManager(this._fakeContext, 0, _local_4, true);
            this._avatarRenderer._Str_882(_local_5);
            this._avatarRenderer.mode = RenderMode.LOCAL_ONLY;
        }

        public function init(k:String):void
        {
            stage.addEventListener(Event.RESIZE, this._Str_1001);
            this._background = new Background();
            addChild(this._background);
            this._logoTopSprite = new Sprite();
            addChild(this._logoTopSprite);
            var _local_2:Bitmap = new _Str_1278();
            _local_2.x = 40;
            _local_2.y = 40;
            this._logoTopSprite.addChild(_local_2);
            this._mainSprite = new Sprite();
            addChild(this._mainSprite);
            this._mainSprite.y = LOGO_AREA_HEIGHT;
            this._mainSprite.x = MAIN_AREA_MARGIN;
            this._avatarEditor = new AvatarEditor(this);
            this._avatarEditor._Str_2039(this._showHcItems);
            this._mainSprite.addChild(this._avatarEditor);
            this._nameChangeContainer = new Sprite();
            this._nameChangeContainer.x = this._nameAreaX;
            this._nameChangeContainer.y = 95;
            this._nameChangeContainer.visible = true;
            this._mainSprite.addChild(this._nameChangeContainer);
            this._roomPickerContainer = new Sprite();
            this._roomPickerContainer.x = 0;
            this._roomPickerContainer.y = LOGO_AREA_HEIGHT;
            this._roomPickerContainer.visible = false;
            this._mainSprite.addChild(this._roomPickerContainer);
            if (this._Str_1609)
            {
                this._roomPicker = new RoomPicker(this, this._roomPickerContainer);
                this._roomPicker._Str_1377();
            }
            if (k == "2")
            {
                this._Str_1128();
            }
            else
            {
                this.startNameChange();
            }
        }

        public function setHcVisibility(k:Boolean):void
        {
            this._showHcItems = k;
        }

        private function _Str_1001(k:Event):void
        {
            if (this.disposed)
            {
                return;
            }
            this._Str_1606();
        }

        private function _Str_1606():void
        {
            var _local_2:int;
            if (this._background != null)
            {
                this._background.resize();
            }
            if (this._roomPickerContainer)
            {
                this._roomPickerContainer.x = 0;
            }
            if (!this._textIntro)
            {
                this._textIntro = LoaderUI.createTextField("intro", 40, LoaderUI._Str_1545, false, true, false, false, TextFormatAlign.LEFT);
                this._textIntro.x = 185;
                this._textIntro.y = 45;
                this._textIntro.width = 500;
                this._textIntro.multiline = false;
                this._textIntro.thickness = 50;
                this._logoTopSprite.addChild(this._textIntro);
            }
            var k:int = (this._mainSprite.width + 20);
            if (stage.stageWidth > k)
            {
                _local_2 = ((stage.stageWidth - k) / 2);
                if (_local_2 < MAIN_AREA_MARGIN)
                {
                    _local_2 = MAIN_AREA_MARGIN;
                }
                this._mainSprite.x = _local_2;
            }
            else
            {
                this._mainSprite.x = MAIN_AREA_MARGIN;
            }
            if (this._avatarEditor)
            {
                this._avatarEditor.x = MAIN_AREA_MARGIN;
                this._nameAreaX = ((this._avatarEditor.x + this._avatarEditor.width) - 125);
            }
            if (this._nameChangeContainer)
            {
                this._nameChangeContainer.x = this._nameAreaX;
            }
            this._mainSprite.y = LOGO_AREA_HEIGHT;
        }

        public function getString(k:String, _arg_2:String):String
        {
            var _local_3:String = stage.loaderInfo.parameters[("new.user.flow." + k)];
            if (((_local_3 == null) || (_local_3 == "")))
            {
                _local_3 = stage.loaderInfo.parameters[("new.user.reception." + k)];
                if (((_local_3 == null) || (_local_3 == "")))
                {
                    return _arg_2;
                }
            }
            return _local_3;
        }

        public function getNumber(k:String, _arg_2:int):int
        {
            var _local_3:String = stage.loaderInfo.parameters[("new.user.flow." + k)];
            if (((_local_3 == null) || (_local_3 == "")))
            {
                _local_3 = stage.loaderInfo.parameters[("new.user.reception." + k)];
                if (((_local_3 == null) || (_local_3 == "")))
                {
                    return _arg_2;
                }
            }
            return int(_local_3);
        }

        public function _Str_657(k:String):void
        {
            var _local_2:TextField = LoaderUI.createTextField(k, 9, 0xFFFFFF, true);
            LoaderUI.addEtching(_local_2, true);
            var _local_3:Bitmap = LoaderUI.createBalloon((_local_2.width + 30), (_local_2.height + 17), -1, true, 11411485);
            if (this._errorBalloon)
            {
                removeChild(this._errorBalloon);
            }
            this._errorBalloon = new Sprite();
            this._errorBalloon.addChild(_local_3);
            this._errorBalloon.addChild(_local_2);
            _local_2.x = 15;
            _local_2.y = 14;
            this._mainSprite.addChild(this._errorBalloon);
            this._errorBalloon.x = 766;
            this._errorBalloon.y = (541 + 36);
            this._errorBalloon.filters = [new GlowFilter(0, 0.24, 6, 6)];
        }

        public function get _Str_1458():IAvatarRenderManager
        {
            return this._avatarRenderer;
        }

        public function get _Str_1857():String
        {
            return this._selectedName;
        }

        public function get _Str_2026():Boolean
        {
            return this._isFemale;
        }

        public function _Str_931():void
        {
            if (this._Str_1609)
            {
                this._Str_1128();
            }
            else
            {
                dispatchEvent(new Event(NEWUSERFLOWFINISHED));
            }
        }

        public function _Str_1497(k:Boolean):void
        {
            this._hcMemeber = k;
        }

        public function _Str_1171():void
        {
            if (((!(this._nameChangeDialog == null)) && (this._nameChangeContainer.visible)))
            {
                this._nameChangeDialog._Str_1171(this._isFemale);
            }
            else
            {
                this._Str_943();
                this._Str_931();
            }
        }

        private function startNameChange():void
        {
            if (!this._nameChangeDialog)
            {
                this._nameChangeDialog = new HitchNameChangeDialog(this, this._nameChangeContainer, this._Str_2203());
            }
            if (this._roomPickerContainer)
            {
                this._roomPickerContainer.visible = false;
            }
            this._nameChangeContainer.visible = true;
            this._nameChangeContainer.x = this._nameAreaX;
            this._nameChangeDialog._Str_1663 = this._avatarEditor.gender;
            this._Str_1606();
            this._Str_1391();
        }

        public function _Str_642(k:String, _arg_2:Boolean):void
        {
            this._selectedName = k;
            this._isFemale = _arg_2;
        }

        public function _Str_1829(k:Boolean):void
        {
            this._isFemale = k;
        }

        public function _Str_943(k:Boolean=true):void
        {
            this._nameClaimed = k;
            this._avatarEditor._Str_943(k);
        }

        public function _Str_909(k:Boolean):void
        {
            this._avatarEditor._Str_909(k);
        }

        private function get _Str_1609():Boolean
        {
            return !(this.getString("roomTypes", "") == "");
        }

        private function _Str_1128():void
        {
            if (this._roomPicker == null)
            {
                return;
            }
            this._avatarEditor.visible = false;
            this._avatarEditor._Str_2238(false);
            this._nameChangeContainer.visible = false;
            this._roomPickerContainer.visible = true;
            this._roomPicker.init();
            this._Str_1606();
            this._Str_1523();
        }

        public function _Str_1523():void
        {
            if (this._textIntro)
            {
                this._textIntro.width = 650;
                this._textIntro.htmlText = this.getString("onboarding.choose.your.room", "Choose your room");
            }
        }

        public function _Str_1391():void
        {
            if (this._textIntro)
            {
                this._textIntro.width = 650;
                this._textIntro.htmlText = this.getString("onboarding.choose.your.style", "My looks");
            }
        }

        public function _Str_1411():void
        {
            dispatchEvent(new Event(NEWUSERFLOWFINISHED));
        }

        public function get _Str_735():TextField
        {
            return null;
        }

        public function _Str_2051():int
        {
            return this._nameAreaX;
        }

        public function _Str_2203():int
        {
            return this._nameAreaWidth;
        }
    }
}
