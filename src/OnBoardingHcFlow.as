package 
{
    import flash.display.Sprite;
    import onBoardingHc._Str_996;
    import com.sulake.core.runtime.IDisposable;
    import onBoardingHcSteps._Str_960;
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
    import onBoardingHc._Str_973;
    import images.*;
    import binaryData.*;
    import fonts.*;

    public class OnBoardingHcFlow extends Sprite implements _Str_996, IDisposable 
    {
        public static const NEWUSERFLOWFINISHED:String = "NewUserFlowFinished";
        private static const _Str_2052:int = 95;
        private static const _Str_1707:int = 5;
        public static var ubuntu_regular:Class = _Str_623;
        public static var ubuntu_bold:Class = _Str_596;
        public static var ubuntu_italic:Class = _Str_605;
        public static var ubuntu_bold_italic:Class = _Str_600;
        public static var _Str_2240:Class = OnBoardingHcFlow__Str_2240;
        private static const _Str_1278:Class = OnBoardingHcFlow__Str_1278;

        private var _Str_803:_Str_960;
        private var _Str_1095:AvatarEditor;
        private var _Str_1952:Sprite;
        private var _Str_907:NameChangeDialog;
        private var _Str_1611:Sprite;
        private var _roomPicker:RoomPicker;
        private var _disposed:Boolean;
        private var _Str_1298:IAvatarRenderManager;
        private var _Str_1429:IContext;
        private var _Str_1018:Sprite;
        private var _Str_865:Boolean;
        private var _Str_670:Boolean;
        private var _Str_845:Sprite;
        private var _Str_1170:Sprite;
        private var _Str_2082:String;
        private var _Str_1885:Boolean;
        private var _Str_2073:TextField;
        private var _Str_1809:TextField;
        private var _Str_993:Boolean;
        private var _Str_1351:int = 585;
        private var _Str_1884:int = 350;

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
            if (this._Str_1298)
            {
                this._Str_1298.dispose();
                this._Str_1298 = null;
            }
            if (this._Str_1429)
            {
                this._Str_1429.dispose();
                this._Str_1429 = null;
            }
            if (this._Str_803)
            {
                removeChild(this._Str_803);
                this._Str_803.dispose();
                this._Str_803 = null;
            }
            if (this._Str_1095)
            {
                this._Str_1095.dispose();
                this._Str_1095 = null;
            }
            if (this._Str_1952)
            {
                this._Str_1952 = null;
            }
            if (this._Str_1611 != null)
            {
                this._Str_1611 = null;
            }
            if (this._Str_845 != null)
            {
                removeChild(this._Str_845);
                this._Str_845 = null;
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
            this._Str_1429 = new FakeContext();
            var k:ByteArray = (new (HabboAvatarRenderLib.manifest)() as ByteArray);
            var _local_2:XML = new XML(k.readUTFBytes(k.length));
            var _local_3:XML = new XML("<manifest><library /></manifest>");
            _local_3.library.appendChild(_local_2.component.assets);
            var _local_4:IAssetLibrary = new AssetLibrary("_assetsTemp@", _local_3);
            _local_4.loadFromResource(_local_3, HabboAvatarRenderLib);
            (this._Str_1429.assets as AssetLibraryCollection).addAssetLibrary(_local_4);
            k = (new (OnBoardingHcFlow._Str_2240)() as ByteArray);
            var _local_5:XML = new XML(k.readUTFBytes(k.length));
            this._Str_1298 = new AvatarRenderManager(this._Str_1429, 0, _local_4, true);
            this._Str_1298._Str_882(_local_5);
            this._Str_1298.mode = RenderMode.LOCAL_ONLY;
        }

        public function init(k:String):void
        {
            stage.addEventListener(Event.RESIZE, this._Str_1001);
            this._Str_803 = new _Str_960();
            addChild(this._Str_803);
            this._Str_1170 = new Sprite();
            addChild(this._Str_1170);
            var _local_2:Bitmap = new _Str_1278();
            _local_2.x = 40;
            _local_2.y = 40;
            this._Str_1170.addChild(_local_2);
            this._Str_845 = new Sprite();
            addChild(this._Str_845);
            this._Str_845.y = _Str_2052;
            this._Str_845.x = _Str_1707;
            this._Str_1095 = new AvatarEditor(this);
            this._Str_1095._Str_2039(this._Str_993);
            this._Str_845.addChild(this._Str_1095);
            this._Str_1952 = new Sprite();
            this._Str_1952.x = this._Str_1351;
            this._Str_1952.y = 95;
            this._Str_1952.visible = true;
            this._Str_845.addChild(this._Str_1952);
            this._Str_1611 = new Sprite();
            this._Str_1611.x = 0;
            this._Str_1611.y = _Str_2052;
            this._Str_1611.visible = false;
            this._Str_845.addChild(this._Str_1611);
            if (this._Str_1609)
            {
                this._roomPicker = new RoomPicker(this, this._Str_1611);
                this._roomPicker._Str_1377();
            }
            if (k == "2")
            {
                this._Str_1128();
            }
            else
            {
                this._Str_1131();
            }
        }

        public function _Str_2031(k:Boolean):void
        {
            this._Str_993 = k;
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
            if (this._Str_803 != null)
            {
                this._Str_803.resize();
            }
            if (this._Str_1611)
            {
                this._Str_1611.x = 0;
            }
            if (!this._Str_2073)
            {
                this._Str_2073 = LoaderUI._Str_1132("intro", 40, LoaderUI._Str_1545, false, true, false, false, TextFormatAlign.LEFT);
                this._Str_2073.x = 185;
                this._Str_2073.y = 45;
                this._Str_2073.width = 500;
                this._Str_2073.multiline = false;
                this._Str_2073.thickness = 50;
                this._Str_1170.addChild(this._Str_2073);
            }
            var k:int = (this._Str_845.width + 20);
            if (stage.stageWidth > k)
            {
                _local_2 = ((stage.stageWidth - k) / 2);
                if (_local_2 < _Str_1707)
                {
                    _local_2 = _Str_1707;
                }
                this._Str_845.x = _local_2;
            }
            else
            {
                this._Str_845.x = _Str_1707;
            }
            if (this._Str_1095)
            {
                this._Str_1095.x = _Str_1707;
                this._Str_1351 = ((this._Str_1095.x + this._Str_1095.width) - 125);
            }
            if (this._Str_1952)
            {
                this._Str_1952.x = this._Str_1351;
            }
            this._Str_845.y = _Str_2052;
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
            var _local_2:TextField = LoaderUI._Str_1132(k, 9, 0xFFFFFF, true);
            LoaderUI._Str_1516(_local_2, true);
            var _local_3:Bitmap = LoaderUI._Str_2206((_local_2.width + 30), (_local_2.height + 17), -1, true, 11411485);
            if (this._Str_1018)
            {
                removeChild(this._Str_1018);
            }
            this._Str_1018 = new Sprite();
            this._Str_1018.addChild(_local_3);
            this._Str_1018.addChild(_local_2);
            _local_2.x = 15;
            _local_2.y = 14;
            this._Str_845.addChild(this._Str_1018);
            this._Str_1018.x = 766;
            this._Str_1018.y = (541 + 36);
            this._Str_1018.filters = [new GlowFilter(0, 0.24, 6, 6)];
        }

        public function get _Str_1458():IAvatarRenderManager
        {
            return this._Str_1298;
        }

        public function get _Str_1857():String
        {
            return this._Str_2082;
        }

        public function get _Str_2026():Boolean
        {
            return this._Str_1885;
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
            this._Str_865 = k;
        }

        public function _Str_1171():void
        {
            if (((!(this._Str_907 == null)) && (this._Str_1952.visible)))
            {
                this._Str_907._Str_1171(this._Str_1885);
            }
            else
            {
                this._Str_943();
                this._Str_931();
            }
        }

        private function _Str_1131():void
        {
            if (!this._Str_907)
            {
                this._Str_907 = new _Str_973(this, this._Str_1952, this._Str_2203());
            }
            if (this._Str_1611)
            {
                this._Str_1611.visible = false;
            }
            this._Str_1952.visible = true;
            this._Str_1952.x = this._Str_1351;
            this._Str_907._Str_1663 = this._Str_1095.gender;
            this._Str_1606();
            this._Str_1391();
        }

        public function _Str_642(k:String, _arg_2:Boolean):void
        {
            this._Str_2082 = k;
            this._Str_1885 = _arg_2;
        }

        public function _Str_1829(k:Boolean):void
        {
            this._Str_1885 = k;
        }

        public function _Str_943(k:Boolean=true):void
        {
            this._Str_670 = k;
            this._Str_1095._Str_943(k);
        }

        public function _Str_909(k:Boolean):void
        {
            this._Str_1095._Str_909(k);
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
            this._Str_1095.visible = false;
            this._Str_1095._Str_2238(false);
            this._Str_1952.visible = false;
            this._Str_1611.visible = true;
            this._roomPicker.init();
            this._Str_1606();
            this._Str_1523();
        }

        public function _Str_1523():void
        {
            if (this._Str_2073)
            {
                this._Str_2073.width = 650;
                this._Str_2073.htmlText = this.getString("onboarding.choose.your.room", "Choose your room");
            }
        }

        public function _Str_1391():void
        {
            if (this._Str_2073)
            {
                this._Str_2073.width = 650;
                this._Str_2073.htmlText = this.getString("onboarding.choose.your.style", "My looks");
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
            return this._Str_1351;
        }

        public function _Str_2203():int
        {
            return this._Str_1884;
        }
    }
}
