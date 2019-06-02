package 
{
    import flash.display.Sprite;
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Timer;
    import splash.PhotoSplashScreen;
    import onBoardingHcUi.LoaderUI;
    import flash.text.TextFormatAlign;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.display.DisplayObject;
    import flash.display.Stage;
    import flash.events.*;

    public class HabboLoadingScreen extends Sprite implements IDisposable, IHabboLoadingScreen 
    {
        private static const _Str_1968:int = 28;
        public static const _Str_1292:int = 400;
        public static const _Str_1794:int = 25;
        public static const _Str_1195:int = 2;
        public static const _Str_2172:int = 2;
        public static const CONTAINER:String = "container";
        public static const FILELOADINGBAR:String = "fileLoadingBar";
        public static const FILEBARSPRITE:String = "fileBarSprite";
        public static const PHOTOSPLASHSCREEN:String = "photoSplashScreen";
        public static const BACKGROUND:String = "background";
        public static const HABBOLOGO:String = "habboLogo";
        public static const TEXTFIELD:String = "textField";
        public static const LOADINGNUMBERTEXTFIELD:String = "loadingNumberTextField";

        private var _Str_1214:Timer;
        private var _Str_1981:int = 0;
        private var _Str_1747:PhotoSplashScreen;
        private var _disposed:Boolean = false;
        private var _Str_1541:int = 0;
        private var _Str_2236:String = null;
        private var _Str_2109:Boolean = false;

        public function HabboLoadingScreen(k:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            var _local_6:Sprite;
            var _local_7:Sprite;
            var _local_11:Array;
            super();
            var _local_5:Sprite = new Sprite();
            _local_5.name = BACKGROUND;
            _local_5.graphics.clear();
            _local_5.graphics.beginFill(922908);
            _local_5.graphics.drawRect(0, 0, k, _arg_2);
            addChild(_local_5);
            this._Str_1747 = new PhotoSplashScreen(this);
            this._Str_1747.name = PHOTOSPLASHSCREEN;
            addChild(this._Str_1747);
            _local_6 = new Sprite();
            _local_6.name = FILELOADINGBAR;
            _local_6.graphics.lineStyle(1, 0xFFFFFF, 1, true);
            _local_6.graphics.beginFill(2500143);
            _local_6.graphics.drawRect(1, 0, (_Str_1292 - 1), 0);
            _local_6.graphics.drawRect(_Str_1292, 1, 0, (_Str_1794 - 1));
            _local_6.graphics.drawRect(1, _Str_1794, (_Str_1292 - 1), 0);
            _local_6.graphics.drawRect(0, 1, 0, (_Str_1794 - 1));
            _local_6.graphics.endFill();
            addChild(_local_6);
            var _local_8:String;
            if (_arg_4 != null)
            {
                _local_11 = _arg_4.split("/");
                this._Str_1541 = this._Str_1537(0, (_local_11.length - 1));
                this._Str_2236 = _arg_4;
                _local_8 = _local_11[this._Str_1541];
            }
            else
            {
                _local_8 = _arg_3;
            }
            var _local_9:TextField = LoaderUI._Str_1132(_local_8, _Str_1968, LoaderUI._Str_1545, true, false, false, false, TextFormatAlign.CENTER);
            _local_9.name = TEXTFIELD;
            addChild(_local_9);
            var _local_10:TextField = LoaderUI._Str_1132("0%", 14, 0x999999, true, false, false, false, TextFormatAlign.CENTER);
            _local_10.name = LOADINGNUMBERTEXTFIELD;
            addChild(_local_10);
            _local_7 = new Sprite();
            _local_7.name = FILEBARSPRITE;
            _local_6.addChild(_local_7);
            _local_6.visible = true;
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        private function _Str_583(k:Event):void
        {
            Logger.log("Habbo Loading Screen was removed from stage.");
        }

        private function onAddedToStage(k:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            stage.addEventListener(Event.RESIZE, this.onResize);
            this._Str_1370();
            this._Str_1214 = new Timer(750);
            this._Str_1214.addEventListener(TimerEvent.TIMER, this._Str_1187);
            this._Str_1214.start();
        }

        private function onResize(k:Event):void
        {
            this._Str_1370();
        }

        private function _Str_1187(k:Event):void
        {
            var _local_2:Array;
            var _local_3:TextField;
            var _local_4:TextField;
            if (this._Str_1981 == 100)
            {
                if (this._Str_2109)
                {
                    _local_2 = this._Str_2236.split("/");
                    _local_3 = (getChildByName(TEXTFIELD) as TextField);
                    if (_local_3 != null)
                    {
                        this._Str_1397(TEXTFIELD);
                        _local_4 = LoaderUI._Str_1132(_local_2[this._Str_1541], _Str_1968, LoaderUI._Str_1545, true, false, false, false, TextFormatAlign.CENTER);
                        _local_4.x = ((width - _local_4.width) / 2);
                        _local_4.y = _local_3.y;
                        _local_4.name = TEXTFIELD;
                        addChild(_local_4);
                    }
                    this._Str_2109 = false;
                }
                this._Str_1981 = 0;
            }
            else
            {
                this._Str_1981 = (this._Str_1981 + Math.min(this._Str_1537(1, Math.min(this._Str_1537(15, 33))), (100 - this._Str_1981)));
            }
            if (((this._Str_1981 == 100) && (!(this._Str_2236 == null))))
            {
                this._Str_2109 = true;
                this._Str_1541 = ((this._Str_1541 + 1) % (this._Str_2236.split("/").length - 1));
            }
            this._Str_1846((this._Str_1981 / 100));
        }

        private function _Str_1537(k:Number, _arg_2:Number):Number
        {
            return Math.floor((Math.random() * ((_arg_2 - k) + 1))) + k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_1397(k:String):void
        {
            var _local_2:DisplayObject = getChildByName(k);
            if (_local_2 != null)
            {
                removeChild(_local_2);
            }
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            var k:Stage = stage;
            if (k != null)
            {
                k.removeEventListener(Event.RESIZE, this.onResize);
            }
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            removeEventListener(Event.REMOVED_FROM_STAGE, this._Str_583);
            this._Str_1397(PHOTOSPLASHSCREEN);
            this._Str_1397(BACKGROUND);
            this._Str_1397(TEXTFIELD);
            this._Str_1397(HABBOLOGO);
            this._Str_1397(FILELOADINGBAR);
            this._Str_1397(CONTAINER);
            this._Str_1214.stop();
            this._Str_1214.removeEventListener(TimerEvent.TIMER, this._Str_1187);
            if (parent != null)
            {
                parent.removeChild(this);
            }
        }

        public function _Str_1370():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:Stage = this.stage;
            if (_local_3 != null)
            {
                k = _local_3.stageWidth;
                _local_2 = _local_3.stageHeight;
            }
            else
            {
                k = this.width;
                _local_2 = this.height;
            }
            var _local_4:Sprite = (getChildByName(BACKGROUND) as Sprite);
            if (_local_4 != null)
            {
                _local_4.x = 0;
                _local_4.y = 0;
                _local_4.graphics.clear();
                _local_4.graphics.beginFill(922908);
                _local_4.graphics.drawRect(0, 0, k, _local_2);
            }
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int = 10;
            var _local_11:Sprite = (getChildByName(PHOTOSPLASHSCREEN) as Sprite);
            if (_local_11 != null)
            {
                _local_11.x = ((k - _local_11.width) / 2);
                _local_9 = (_local_11.y + _local_11.height);
            }
            var _local_12:TextField = (getChildByName(TEXTFIELD) as TextField);
            if (_local_12 != null)
            {
                _local_12.x = ((k - _local_12.width) / 2);
                if (_local_12.width > _local_7)
                {
                    _local_7 = _local_12.width;
                    _local_5 = _local_12.x;
                }
            }
            var _local_13:Sprite = (getChildByName(FILELOADINGBAR) as Sprite);
            if (_local_13 != null)
            {
                _local_13.x = ((k - _local_13.width) / 2);
                _local_13.y = _local_9;
                _local_9 = (_local_13.y + _local_13.height);
                if (_local_13.width > _local_7)
                {
                    _local_7 = _local_13.width;
                    _local_5 = _local_13.x;
                }
            }
            var _local_14:TextField = (getChildByName(LOADINGNUMBERTEXTFIELD) as TextField);
            if (_local_14 != null)
            {
                _local_14.x = ((k - _local_14.width) / 2);
                if (_local_14.width > _local_7)
                {
                    _local_7 = _local_14.width;
                    _local_5 = _local_14.x;
                }
            }
            _local_9 = ((_local_2 - _local_9) / 2);
            _local_9 = (_local_9 - (_local_10 * 2));
            if (_local_11 != null)
            {
                _local_11.y = _local_9;
                _local_9 = (_local_11.y + _local_11.height);
            }
            if (_local_12 != null)
            {
                _local_12.y = (_local_9 + 50);
                _local_9 = ((_local_12.y + _local_12.height) + _local_10);
            }
            if (_local_13 != null)
            {
                _local_13.y = _local_9;
                _local_9 = ((_local_13.y + _local_13.height) + (_local_10 / 2));
            }
            if (_local_14 != null)
            {
                _local_14.y = _local_9;
            }
        }

        public function _Str_1846(k:Number):void
        {
            var _local_2:int = _Str_1292;
            var _local_3:int = _Str_1794;
            var _local_4:int = _Str_1195;
            var _local_5:int = _Str_2172;
            var _local_6:Sprite = (getChildByName(FILELOADINGBAR) as Sprite);
            if (_local_6 == null)
            {
                return;
            }
            var _local_7:Sprite = (_local_6.getChildByName(FILEBARSPRITE) as Sprite);
            if (_local_7 == null)
            {
                return;
            }
            _local_7.x = (_local_4 + _local_5);
            _local_7.y = (_local_4 + _local_5);
            _local_7.graphics.clear();
            var _local_8:int = ((_local_3 - (_local_4 * 2)) - (_local_5 * 2));
            var _local_9:int = (((_local_2 - (_local_4 * 2)) - (_local_5 * 2)) * k);
            _local_7.graphics.beginFill(0);
            _local_7.graphics.drawRect(-1, -1, (_local_2 - (_local_4 * 2)), (_local_3 - (_local_5 * 2)));
            _local_7.graphics.endFill();
            _local_7.graphics.beginFill(12241619);
            _local_7.graphics.drawRect(0, 0, _local_9, (_local_8 / 2));
            _local_7.graphics.endFill();
            _local_7.graphics.beginFill(9216429);
            _local_7.graphics.drawRect(0, (_local_8 / 2), _local_9, ((_local_8 / 2) + 1));
            _local_7.graphics.endFill();
        }

        public function _Str_774(k:Number):void
        {
            var _local_2:TextField = (getChildByName(LOADINGNUMBERTEXTFIELD) as TextField);
            if (_local_2 != null)
            {
                _local_2.text = (Math.round((k * 100)) + "%");
            }
        }
    }
}
