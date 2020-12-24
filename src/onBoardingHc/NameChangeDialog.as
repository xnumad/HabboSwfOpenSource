package onBoardingHc
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.Sprite;
    import onBoardingHcUi.Dimmer;
    import flash.text.TextField;
    import onBoardingHcUi._Str_951;
    import flash.display.Bitmap;
    import flash.utils.Timer;
    import onBoardingHcUi.WaitIndicator;
    import onBoardingHcUi.LoaderUI;
    import flash.external.ExternalInterface;
    import flash.events.TimerEvent;
    import flash.geom.Rectangle;
    import onBoardingHcUi.NineSplitSprite;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.Shape;
    import flash.filters.GlowFilter;
    import onBoardingHc.images.*;

    public class NameChangeDialog implements IDisposable 
    {
        private static const IDLE_TIME_MS:int = 500;
        private static const NEWUSERRECEPTION_CLAIMNAME:String = "NewUserReception.claimName";
        private static const NEWUSERRECEPTIONCLAIMNAMERESPONSE:String = "newUserReceptionClaimNameResponse";
        private static const NEWUSERRECEPTIONCLAIMNAMEFAILED:String = "newUserReceptionClaimNameFailed";
        private static const NEWUSERRECEPTION_CHECKNAME:String = "NewUserReception.checkName";
        private static const NEWUSERRECEPTIONCHECKNAMERESPONSE:String = "newUserReceptionCheckNameResponse";
        private static const NEWUSERRECEPTIONCHECKNAMEFAILED:String = "newUserReceptionCheckNameFailed";

        private var input_error_alert_hitch_png:Class;
        protected var _style:int;
        private var _disposed:Boolean;
        protected var _context:IUIContext;
        private var _nameClaimed:Boolean;
        protected var _nameChangeDialog:Sprite;
        private var _dimmer:Dimmer;
        protected var _inputField:TextField;
        protected var _submitButton:_Str_951;
        protected var _skipButton:_Str_951;
        private var _errorBalloon:Sprite;
        protected var _tickMark:Bitmap;
        protected var _Str_2194:Bitmap;
        private var _Str_1513:Boolean;
        protected var _Str_1260:Bitmap;
        private var _Str_1987:Timer;
        protected var _Str_1263:WaitIndicator;
        protected var _container:Sprite;
        private var _Str_1964:String;
        protected var _Str_1156:String;
        protected var _Str_1482:Sprite;
        protected var _Str_2083:int;

        public function NameChangeDialog(k:IUIContext, _arg_2:Sprite, _arg_3:int)
        {
            this.input_error_alert_hitch_png = _Str_937;
            this._style = LoaderUI._Str_2056;
            super();
            this._context = k;
            this._container = _arg_2;
            this._Str_2083 = _arg_3;
            this.init();
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(NEWUSERRECEPTIONCLAIMNAMERESPONSE, this._Str_1683);
                ExternalInterface.addCallback(NEWUSERRECEPTIONCLAIMNAMEFAILED, this._Str_1587);
                ExternalInterface.addCallback(NEWUSERRECEPTIONCHECKNAMERESPONSE, this._Str_1434);
                ExternalInterface.addCallback(NEWUSERRECEPTIONCHECKNAMEFAILED, this._Str_1671);
                this._Str_1987 = new Timer(IDLE_TIME_MS, 1);
                this._Str_1987.addEventListener(TimerEvent.TIMER, this._Str_1333);
            }
            this._Str_1552(null);
        }

        protected function init():void
        {
            var _local_10:Bitmap;
            this._nameChangeDialog = LoaderUI.createFrame(this._context.getString("rename.title", "Pick a name for your character"), "", new Rectangle((-(this._Str_2083) / 2), 0, this._Str_2083, 1), this._style);
            var k:int = 23;
            var _local_2:int = (this._Str_2083 - (k * 2));
            var _local_3:int = (this._Str_2083 - 12);
            this._nameChangeDialog.x = 5;
            var _local_4:Boolean;
            var _local_5:TextField = LoaderUI.createTextField(this._context.getString("rename.subtitle", " \tYou are a unique and beautiful snowflake."), 20, 0, true, false, false, _local_4);
            _local_5.x = k;
            LoaderUI.addEtching(_local_5);
            var _local_6:TextField = LoaderUI.createTextField(this._context.getString("rename.description", "In Habbo, we all sign in using a unique name, so go ahead and enter yours. There's no need to use your real one - stage names are perfectly ok."), 12, 0, false, true, false, _local_4);
            this._nameChangeDialog.addChild(_local_6);
            _local_6.x = k;
            _local_6.width = _local_2;
            LoaderUI.addEtching(_local_6);
            var _local_7:Sprite = new Sprite();
            this._Str_1260 = NineSplitSprite._Str_1852.render(_local_2, 50);
            _local_7.addChild(this._Str_1260);
            this._nameChangeDialog.addChild(_local_7);
            _local_7.x = k;
            var _local_8:TextField = LoaderUI.createTextField(this._context.getString("rename.accepted", "WE ACCEPT LETTERS AND NUMBERS. NOT VISA OR MASTERCARD."), 9, 0x424242, true, false, false, _local_4);
            this._nameChangeDialog.addChild(_local_8);
            _local_8.x = (k + 5);
            LoaderUI.addEtching(_local_8);
            var _local_9:TextField = LoaderUI.createTextField(this._context.getString("rename.warning", "Once you've selected a name for your character, you can't change it anymore, so please pay a bit of attention to your selection."), 16, 0x424242, false, true, false, false);
            _local_9.width = (_local_2 - 66);
            LoaderUI.addEtching(_local_9);
            _local_10 = NineSplitSprite._Str_1605.render(_local_2, (_local_9.height + 24));
            this._Str_1482 = new Sprite();
            if (_local_10)
            {
                this._Str_1482.addChild(_local_10);
            }
            this._Str_1482.addChild(_local_9);
            _local_9.x = 50;
            _local_9.y = 12;
            this._nameChangeDialog.addChild(this._Str_1482);
            this._Str_1482.x = k;
            this._Str_1156 = this._context.getString("name", "Click here to type a name");
            this._inputField = LoaderUI.createTextField(this._Str_1156, 14, 0x888888, true, false, true, false);
            this._nameChangeDialog.addChild(this._inputField);
            this._inputField.x = (_local_7.x + 16);
            this._inputField.y = (_local_7.y + int(((_local_7.height - this._inputField.height) / 2)));
            this._inputField.width = (_local_7.width - 30);
            this._inputField.addEventListener(MouseEvent.CLICK, this._Str_2136);
            this._inputField.addEventListener(Event.CHANGE, this._Str_1552);
            this._Str_1263 = new WaitIndicator(this._style);
            this._nameChangeDialog.addChild(this._Str_1263);
            this._Str_1263.y = (_local_7.y + int((_local_7.height / 2)));
            this._Str_1263.x = (((_local_7.x + _local_7.width) - int((this._tickMark.width / 2))) - 15);
            this._Str_1263.visible = false;
            _local_7.addEventListener(MouseEvent.CLICK, this._Str_2173);
            var _local_11:int = -50;
            LoaderUI.resizeFrame(this._nameChangeDialog, this._Str_2083, _local_11);
            this._nameChangeDialog.y = -(int((_local_11 / 2)));
            this._dimmer = new Dimmer();
            this._container.addChild(this._nameChangeDialog);
        }

        private function _Str_1333(k:TimerEvent):void
        {
            this.checkName(this._inputField.text);
        }

        public function _Str_1255(k:Boolean):void
        {
            this._nameClaimed = k;
        }

        protected function _Str_1552(k:Event):void
        {
            if (this._Str_1987 != null)
            {
                this._Str_1987.reset();
                this._Str_1987.start();
            }
            this._Str_1722();
        }

        protected function _Str_2173(k:MouseEvent):void
        {
            this._context.stage.focus = this._inputField;
            this._Str_2136(null);
        }

        protected function _Str_2136(k:Event):void
        {
            if (this._Str_1513)
            {
                return;
            }
            this._Str_1513 = true;
            this._inputField.textColor = ((this._style == LoaderUI._Str_1585) ? 0x666666 : 0);
            this._inputField.removeEventListener(MouseEvent.CLICK, this._Str_2136);
            this._Str_1552(null);
        }

        public function _Str_1171(k:Boolean):void
        {
            this.claimName(this._inputField.text, k);
        }

        private function get _Str_1379():Boolean
        {
            return (!(this._inputField == null)) && (!(this._inputField.text == this._context.getString("name", this._Str_1156)));
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(NEWUSERRECEPTIONCLAIMNAMERESPONSE, null);
                ExternalInterface.addCallback(NEWUSERRECEPTIONCLAIMNAMEFAILED, null);
            }
            if (this._dimmer)
            {
                this._container.removeChild(this._dimmer);
            }
            if (this._nameChangeDialog)
            {
                this._container.removeChild(this._nameChangeDialog);
            }
            if (this._Str_1263 != null)
            {
                this._Str_1263.dispose();
                this._Str_1263 = null;
            }
            this._dimmer = null;
            this._inputField = null;
            this._submitButton = null;
            this._skipButton = null;
            this._errorBalloon = null;
            this._tickMark = null;
            this._Str_1260 = null;
            this._nameChangeDialog = null;
            this._context = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_1683(k:String, _arg_2:Object, _arg_3:Array):void
        {
            this._Str_2183 = false;
            switch (k)
            {
                case "OK":
                    this._Str_2183 = true;
                    this._context._Str_943();
                    this._context._Str_931();
                    return;
                case "INVALID_NAME":
                    switch (_arg_2.resultType)
                    {
                        case "VALIDATION_NAME_OK":
                            this._Str_2183 = true;
                            this._context._Str_943();
                            break;
                        case "VALIDATION_ERROR_NAME_TOO_LONG":
                            this._Str_657(this._context.getString("rename.error.too_long", "OOPS! YOUR NAME'S TOO LONG TO REMEMBER"));
                            break;
                        case "VALIDATION_ERROR_NAME_TOO_SHORT":
                            this._Str_657(this._context.getString("rename.error.too_short", "OOPS! YOUR NAME'S TOO SHORT TO PRONOUNCE."));
                            break;
                        case "VALIDATION_ERROR_ILLEGAL_CHARS":
                            this._Str_657(this._context.getString("rename.error.chars", "OOPS! JUST LETTERS AND NUMBERS, PLS."));
                            break;
                        case "VALIDATION_ERROR_ILLEGAL_WORDS":
                            this._Str_657(this._context.getString("rename.error.words", "OOPS! THINK HARDER - THAT'S NOT A VERY NICE NAME."));
                            break;
                    }
                    return;
                case "NAME_IN_USE":
                    this._Str_657(this._context.getString("rename.error.taken", "OOPS! SOMEONE'S ALREADY USING THAT NAME."));
                    return;
                case "NAME_CHANGE_NOT_ALLOWED":
                    return;
            }
        }

        public function _Str_1587(k:String):void
        {
        }

        private function claimName(k:String, _arg_2:Boolean):void
        {
            if (ExternalInterface.available)
            {
                if (this._nameClaimed)
                {
                    this._context._Str_943();
                }
                ExternalInterface.call(NEWUSERRECEPTION_CLAIMNAME, k, _arg_2);
                this._context._Str_943();
            }
            else
            {
                this._context._Str_943(false);
            }
        }

        public function _Str_1434(k:String, _arg_2:String, _arg_3:Object, _arg_4:Array):void
        {
            if (((this._inputField == null) || (!(this._inputField.text == k))))
            {
                return;
            }
            if (this._Str_1263 != null)
            {
                this._Str_1263.visible = false;
            }
            this._Str_2183 = false;
            switch (_arg_2)
            {
                case "OK":
                    this._Str_2183 = true;
                    break;
                case "INVALID_NAME":
                    switch (_arg_3.resultType)
                    {
                        case "VALIDATION_NAME_OK":
                            this._Str_2183 = true;
                            break;
                        case "VALIDATION_ERROR_NAME_TOO_LONG":
                            this._Str_657(this._context.getString("rename.error.too_long", "OOPS! YOUR NAME'S TOO LONG TO REMEMBER"));
                            break;
                        case "VALIDATION_ERROR_NAME_TOO_SHORT":
                            this._Str_657(this._context.getString("rename.error.too_short", "OOPS! YOUR NAME'S TOO SHORT TO PRONOUNCE."));
                            break;
                        case "VALIDATION_ERROR_ILLEGAL_CHARS":
                            this._Str_657(this._context.getString("rename.error.chars", "OOPS! JUST LETTERS AND NUMBERS, PLS."));
                            break;
                        case "VALIDATION_ERROR_ILLEGAL_WORDS":
                            this._Str_657(this._context.getString("rename.error.words", "OOPS! THINK HARDER - THAT'S NOT A VERY NICE NAME."));
                            break;
                    }
                    break;
                case "NAME_IN_USE":
                    this._Str_657(this._context.getString("rename.error.taken", "OOPS! SOMEONE'S ALREADY USING THAT NAME."));
                    break;
                case "NAME_CHANGE_NOT_ALLOWED":
                    break;
            }
            if (this._Str_1482 != null)
            {
                this._Str_1482.visible = (!(this._Str_2183));
                this._context._Str_909(this._Str_2183);
            }
        }

        public function _Str_1671(k:String):void
        {
        }

        private function checkName(k:String):void
        {
            if (ExternalInterface.available)
            {
                ExternalInterface.call(NEWUSERRECEPTION_CHECKNAME, k);
                if (this._Str_1263 != null)
                {
                    this._Str_1263.visible = true;
                }
            }
        }

        protected function get _Str_2183():Boolean
        {
            return (!(this._tickMark == null)) && (this._tickMark.visible);
        }

        protected function set _Str_2183(k:Boolean):void
        {
            k = true;
            if (this._tickMark != null)
            {
                this._tickMark.visible = k;
            }
            if (this._Str_2194 != null)
            {
                this._Str_2194.visible = (!(k));
            }
            if (this._submitButton != null)
            {
                this._submitButton.active = true;
                if (this._style == LoaderUI._Str_1585)
                {
                    this._submitButton.visible = true;
                    this._submitButton.active = ((this._Str_1379) ? k : true);
                }
                else
                {
                    this._submitButton.visible = ((k) && (this._Str_1379));
                }
            }
            if (this._skipButton != null)
            {
                if (this._style == LoaderUI._Str_1585)
                {
                    this._skipButton.visible = this._Str_1379;
                }
            }
        }

        private function _Str_657(k:String):void
        {
            var _local_4:TextField;
            var _local_5:Bitmap;
            var _local_6:Shape;
            var _local_2:int = this._Str_1260.width;
            var _local_3:int = this._Str_1260.height;
            this._Str_1260.bitmapData = ((this._style == LoaderUI._Str_1585) ? NineSplitSprite._Str_2104.render(_local_2, _local_3).bitmapData : NineSplitSprite._Str_1995.render(_local_2, _local_3).bitmapData);
            this._Str_1722();
            if (this._Str_2194 != null)
            {
                this._Str_2194.visible = true;
            }
            if (this._style == LoaderUI._Str_2056)
            {
                _local_4 = LoaderUI.createTextField(k, 9, 0xFFFFFF, true);
                _local_5 = LoaderUI.createBalloon((_local_4.width + 30), (_local_4.height + 17), -1, true, 11411485);
                this._errorBalloon = new Sprite();
                this._errorBalloon.addChild(_local_5);
                this._errorBalloon.addChild(_local_4);
                _local_4.x = 15;
                _local_4.y = 14;
            }
            else
            {
                _local_4 = LoaderUI.createTextField(k, 10, 0xFFFFFF);
                _local_6 = LoaderUI.createScale9GridShapeFromImage(Bitmap(new this.input_error_alert_hitch_png()).bitmapData, new Rectangle(3, 3, 5, 5));
                _local_2 = this._Str_1260.width;
                if (_local_4.width > _local_2)
                {
                    _local_2 = (_local_4.width + 20);
                }
                _local_6.width = _local_2;
                _local_6.height = (this._Str_1260.height - 11);
                this._errorBalloon = new Sprite();
                this._errorBalloon.addChild(_local_6);
                this._errorBalloon.addChild(_local_4);
                _local_4.x = 16;
                _local_4.y = int(((_local_6.height - _local_4.height) / 2));
            }
            this._nameChangeDialog.addChild(this._errorBalloon);
            if (this._style == LoaderUI._Str_2056)
            {
                this._errorBalloon.x = int(((this._nameChangeDialog.width - this._errorBalloon.width) / 2));
                this._errorBalloon.y = (this._Str_1260.parent.y + this._Str_1260.height);
                this._errorBalloon.filters = [new GlowFilter(0, 0.24, 6, 6)];
            }
            else
            {
                this._errorBalloon.x = this._Str_1260.parent.x;
                this._errorBalloon.y = ((this._Str_1260.parent.y + this._Str_1260.height) + 4);
            }
        }

        private function _Str_1722():void
        {
            var k:int;
            var _local_2:int;
            if (((!(this._errorBalloon == null)) && (this._nameChangeDialog.contains(this._errorBalloon))))
            {
                k = this._Str_1260.width;
                _local_2 = this._Str_1260.height;
                this._Str_1260.bitmapData = ((this._style == LoaderUI._Str_1585) ? NineSplitSprite._Str_1531.render(k, _local_2).bitmapData : NineSplitSprite._Str_1594.render(k, _local_2).bitmapData);
                this._nameChangeDialog.removeChild(this._errorBalloon);
            }
            this._tickMark.visible = false;
            if (this._Str_2194 != null)
            {
                this._Str_2194.visible = false;
            }
        }

        public function set _Str_1663(k:String):void
        {
            this._Str_1964 = k;
        }
    }
}
