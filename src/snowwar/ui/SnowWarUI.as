package snowwar.ui
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.sound.HabboSoundConstants;
	import com.sulake.core.window.IWindow;
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.assets.BitmapDataAsset;
	import com.sulake.habbo.avatar.enum.AvatarScaleType;
	import com.sulake.habbo.avatar.enum.AvatarSetType;
	import com.sulake.habbo.game.WindowUtils;
	import com.sulake.habbo.avatar.IAvatarImageListener;
	import com.sulake.habbo.avatar.IAvatarImage;
	import snowwar._Str_254.SnowWarAnimatedWindowElement;
	import com.sulake.core.window.events.WindowMouseEvent;
	import snowwar._Str_373._SafeStr_3665;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.habbo.session.SecurityLevelEnum;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import snowwar.SnowWarEngine;

    public class SnowWarUI implements IDisposable, IAvatarImageListener 
    {
        private static const _SafeStr_22085:int = 4;
        private static const _SafeStr_22086:int = 75;
        private static const _SafeStr_22087:int = 4;
        private static const _SafeStr_22088:int = 50;
        private static const _SafeStr_22089:int = 5;
        private static const _SafeStr_22090:int = 5;

        private var _snowWarEngine:SnowWarEngine;
        private var _exit:IWindowContainer;
        private var _snowballs:IWindowContainer;
        private var _ownStats:IWindowContainer;
        private var _timer:IWindowContainer;
        private var _teamScores:IWindowContainer;
        private var _SafeStr_22094:IWindowContainer;
        private var _indicatorForgroundColor:RGBColor;
        private var _indicatorBackgroundColor:RGBColor;
        private var _counter:IBitmapWrapperWindow;
        private var _SafeStr_5041:Boolean = false;
        private var _SafeStr_12657:int = 1;
        private var _SafeStr_13145:uint;
        private var _SafeStr_22098:int = -1;
        private var _SafeStr_22099:int = 5;
        private var _makeSnowballImage:IBitmapWrapperWindow;
        private var _SafeStr_22101:Boolean = false;
        private var _SafeStr_22102:int = 5;
        private var _ballProgress:IBitmapWrapperWindow;
        private var _SafeStr_22104:SnowWarAnimatedWindowElement;
        private var _emptyFlashImage:IBitmapWrapperWindow;
        private var _uiNoBalls:SnowWarAnimatedWindowElement;
        private var _backgroundFlashImage:IBitmapWrapperWindow;
        private var _SafeStr_22108:int = 0;
        private var _SafeStr_22109:String = "";
        private var _SafeStr_22110:Timer;
        private var _hasChecksumIndicator:Boolean;

        public function SnowWarUI(k:SnowWarEngine)
        {
            this._snowWarEngine = k;
            this._snowWarEngine.windowManager.getDesktop(1).visible = false;
            this._hasChecksumIndicator = this._snowWarEngine.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751);
            if (true)
            {
                this._indicatorForgroundColor = new RGBColor();
                this._indicatorBackgroundColor = new RGBColor(0xFFFFFF);
            }
        }

        public function dispose():void
        {
            this._snowWarEngine.windowManager.getDesktop(1).visible = true;
            this._snowWarEngine = null;
            if (this._exit)
            {
                this._exit.dispose();
                this._exit = null;
            }
            if (this._snowballs)
            {
                this._makeSnowballImage = null;
                this._ballProgress = null;
                this._emptyFlashImage = null;
                this._snowballs.dispose();
                this._snowballs = null;
            }
            if (this._ownStats)
            {
                this._backgroundFlashImage = null;
                this._ownStats.dispose();
                this._ownStats = null;
            }
            if (this._timer)
            {
                this._timer.dispose();
                this._timer = null;
            }
            if (this._teamScores)
            {
                this._teamScores.dispose();
                this._teamScores = null;
            }
            if (this._counter)
            {
                this._counter.dispose();
                this._counter = null;
            }
            if (this._uiNoBalls != null)
            {
                this._uiNoBalls.dispose();
                this._uiNoBalls = null;
            }
            if (this._SafeStr_22094)
            {
                this._SafeStr_22094.dispose();
                this._SafeStr_22094 = null;
            }
            if (this._SafeStr_22110)
            {
                this._SafeStr_22110.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._SafeStr_22110.stop();
                this._SafeStr_22110 = null;
            }
            this._SafeStr_22116();
            this._SafeStr_5041 = true;
        }

        public function get disposed():Boolean
        {
            return this._SafeStr_5041;
        }

        public function init():void
        {
            this._exit = (WindowUtils.createWindow("snowwar_exit") as IWindowContainer);
            this._exit.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_22112);
            this._exit.x = 0;
            this._exit.y = 10;
			
            this._snowballs = (WindowUtils.createWindow("snowwar_snowballs") as IWindowContainer);
            var k:IWindow = this._snowballs.findChildByName("make_snowball");
            k.addEventListener(WindowMouseEvent.DOWN, this.onButtonDownEvent);
            k.addEventListener(WindowMouseEvent.UP, this.onButtonUpEvent);
            k.addEventListener(WindowMouseEvent.OUT, this.onButtonUpEvent);
            this._snowballs.center();
            this._snowballs.x = 10;
			
            this._makeSnowballImage = (this._snowballs.findChildByName("makeSnowballImage") as IBitmapWrapperWindow);
			
            this._emptyFlashImage = (this._snowballs.findChildByName("emptyFlashImage") as IBitmapWrapperWindow);
            this._emptyFlashImage.visible = false;
			
            this._uiNoBalls = new SnowWarAnimatedWindowElement(this._snowWarEngine.assets, this._emptyFlashImage, "ui_no_balls_", _SafeStr_22085, _SafeStr_22086, true);
			
            this._ballProgress = (this._snowballs.findChildByName("ballProgress") as IBitmapWrapperWindow);
			
            this._ownStats = (WindowUtils.createWindow("snowwar_own_stats") as IWindowContainer);
            this._ownStats.x = 10;
            this._ownStats.y = ((this._ownStats.desktop.height - this._ownStats.height) - 10);
			
            this._backgroundFlashImage = (this._ownStats.findChildByName("backgroundFlashImage") as IBitmapWrapperWindow);
            this._SafeStr_22115();
            this._teamScores = (WindowUtils.createWindow("snowwar_team_scores") as IWindowContainer);
            this._teamScores.x = ((this._teamScores.desktop.width - this._teamScores.width) - 10);
            this._teamScores.y = 10;
            this._timer = (WindowUtils.createWindow("snowwar_timer") as IWindowContainer);
            this._timer.x = ((this._timer.desktop.width - this._timer.width) - 50);
            this._timer.y = 105;
            this._SafeStr_18740 = 0;
            this._counter = (WindowUtils.createWindow("counter") as IBitmapWrapperWindow);
            this._counter.center();
            if (true)
            {
                this._timer.getChildByName("checksumIndicator").visible = true;
                this._indicatorForgroundColor.fromInt(this._timer.color);
            }
            this._SafeStr_22099 = _SafeStr_22090;
        }

        public function _Str_840(k:String):void
        {
            this._SafeStr_22115();
        }

        private function _SafeStr_22115():void
        {
            var k:BitmapData;
            var _local_2:String = this._snowWarEngine.sessionDataManager.figure;
            var _local_3:String = this._snowWarEngine.sessionDataManager.gender;
            var _local_4:IAvatarImage = this._snowWarEngine.avatarRenderManager.createAvatarImage(_local_2, AvatarScaleType.LARGE, _local_3, this);
            if (_local_4 != null)
            {
                _local_4.setDirection(AvatarSetType.FULL, 2);
                k = _local_4._Str_818(AvatarSetType.HEAD);
                _local_4.dispose();
                WindowUtils._Str_2972(this._ownStats.findChildByName("user_image"), k);
                k.dispose();
            }
        }

        private function _SafeStr_12987(k:String):BitmapData
        {
            return this._snowWarEngine.assets.getAssetByName(k).content as BitmapData;
        }

        private function _SafeStr_18800(k:IWindowContainer, _arg_2:String):IWindow
        {
            return k.findChildByName(_arg_2);
        }

        private function onButtonDownEvent(k:WindowMouseEvent):void
        {
            this._SafeStr_22123(true);
            if (this._snowWarEngine._SafeStr_13194())
            {
                this._SafeStr_13237();
            }
        }

        private function onButtonUpEvent(k:WindowMouseEvent):void
        {
            this._SafeStr_22123(false);
        }

        public function _SafeStr_13237():void
        {
            if (this._SafeStr_22104 != null)
            {
                this._SafeStr_22104.dispose();
                this._SafeStr_22104 = null;
            }
            this._SafeStr_22104 = new SnowWarAnimatedWindowElement(this._snowWarEngine.assets, this._ballProgress, "load_", 8);
            SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_MAKE_SNOWBALL);
        }

        public function _SafeStr_13225():void
        {
            this._SafeStr_22116();
            SnowWarEngine._Str_25775(HabboSoundConstants.GAMES_SW_MAKE_SNOWBALL);
            if (this._SafeStr_22101)
            {
                this.onButtonDownEvent(null);
            }
        }

        private function _SafeStr_22116():void
        {
            if (this._SafeStr_22104 != null)
            {
                this._SafeStr_22104.dispose();
                this._SafeStr_22104 = null;
            }
        }

        private function _SafeStr_22112(k:WindowMouseEvent):void
        {
            if (!this._SafeStr_22094)
            {
                this._SafeStr_22094 = (WindowUtils.createWindow("snowwar_exit_confirmation") as IWindowContainer);
                this._SafeStr_22094.findChildByName("yes").addEventListener(WindowMouseEvent.CLICK, this.onSnowWarExitConfirmationWindowClicked);
                this._SafeStr_22094.findChildByName("no").addEventListener(WindowMouseEvent.CLICK, this.onSnowWarExitConfirmationWindowClicked);
                this._SafeStr_22094.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this.onSnowWarExitConfirmationWindowClicked);
            }
            else
            {
                this._SafeStr_22094.visible = true;
                this._SafeStr_22094.activate();
            }
        }

        private function onSnowWarExitConfirmationWindowClicked(k:WindowMouseEvent):void
        {
            if (k.window.name == "yes")
            {
                this._snowWarEngine.send(new _SafeStr_3665());
                this._snowWarEngine.onStageEnding();
                this._snowWarEngine._SafeStr_13209();
            }
            else
            {
                this._SafeStr_22094.visible = false;
            }
        }

        public function set _SafeStr_18742(k:int):void
        {
            var _local_2:int;
            while (_local_2 < _SafeStr_22089)
            {
                this._snowballs.findChildByName(("ball_" + _local_2)).visible = (_local_2 < k);
                _local_2++;
            }
            this._SafeStr_22102 = k;
            var _local_3:IWindow = this._snowballs.findChildByName(("ball_" + k));
            if (_local_3 != null)
            {
                this._ballProgress.x = _local_3.x;
                this._ballProgress.y = _local_3.y;
            }
        }

        public function set _SafeStr_18741(k:int):void
        {
            WindowUtils._Str_4180(this._ownStats.findChildByName("personal_score"), k.toString());
        }

        public function set _SafeStr_18740(k:int):void
        {
            if (this._hasChecksumIndicator)
            {
                if (this._indicatorForgroundColor)
                {
                    this._indicatorForgroundColor.tweenTo(this._indicatorBackgroundColor);
                    this._timer.getChildByName("checksumIndicator").color = this._indicatorForgroundColor.rgb;
                }
            }
            if (this._SafeStr_22098 == k)
            {
                return;
            }
            this._SafeStr_22098 = k;
            var _local_2:String = ("" + int((k / 60)));
            var _local_3:String = ("" + int((k % 60)));
            if (int(_local_2) < 10)
            {
                _local_2 = ("0" + _local_2);
            }
            if (int(_local_3) < 10)
            {
                _local_3 = ("0" + _local_3);
            }
            WindowUtils._Str_26291(this._timer, "time_left");
            WindowUtils._Str_4180(this._timer.findChildByName("time_left"), ((_local_2 + ":") + _local_3));
            if (((k <= 5) && (k > 0)))
            {
                SnowWarEngine._Str_4375(HabboSoundConstants.CALL_FOR_HELP);
                if (!this._SafeStr_22110)
                {
                    this._SafeStr_22110 = new Timer(500, 1);
                    this._SafeStr_22110.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                }
                this._SafeStr_22110.reset();
                this._SafeStr_22110.start();
            }
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            if (this._timer)
            {
                WindowUtils._Str_26294(this._timer, "time_left");
            }
        }

        public function set _SafeStr_12584(k:int):void
        {
            if (this._SafeStr_22099 != k)
            {
                WindowUtils._Str_2972(this._SafeStr_18800(this._ownStats, "energy_bar"), this._SafeStr_12987(("ui_me_health_" + k)));
                this._SafeStr_22099 = k;
            }
        }

        public function setChecksumIndicatorColor(k:uint):void
        {
            if (this._hasChecksumIndicator)
            {
                this._timer.color = k;
                if (this._indicatorForgroundColor)
                {
                    this._indicatorForgroundColor.fromInt(k);
                }
            }
        }

        public function _SafeStr_18750():void
        {
            this._SafeStr_13145 = 0;
            this._SafeStr_12657 = 1;
        }

        public function update(k:uint):void
        {
            this._SafeStr_22119();
            this._SafeStr_22120(k);
            this._SafeStr_22118(k);
            this._SafeStr_22122();
        }

        private function _SafeStr_22118(k:uint):void
        {
            var _local_2:int;
            if (this._SafeStr_22108 > 0)
            {
                _local_2 = ((this._SafeStr_22108 / _SafeStr_22088) + 1);
                if (_local_2 > _SafeStr_22087)
                {
                    this._SafeStr_22108 = 0;
                    this._backgroundFlashImage.visible = false;
                }
                else
                {
                    this._SafeStr_22108 = (this._SafeStr_22108 + k);
                    this._backgroundFlashImage.visible = true;
                    WindowUtils._Str_2972(this._backgroundFlashImage, this._SafeStr_12987((this._SafeStr_22109 + _local_2)));
                }
            }
        }

        public function _SafeStr_13280(k:Boolean):void
        {
            this._SafeStr_22108 = 1;
            this._SafeStr_22109 = ((k) ? "ui_me_plus_" : "ui_me_minus_");
        }

        private function _SafeStr_22119():void
        {
            this._emptyFlashImage.visible = ((this._SafeStr_22102 == 0) && (this._SafeStr_22104 == null));
        }

        private function _SafeStr_22120(k:uint):void
        {
            var _local_4:BitmapData;
            var _local_5:Point;
            var _local_2:Boolean;
            this._SafeStr_13145 = (this._SafeStr_13145 + k);
            if (this._SafeStr_12657 < 6)
            {
                if (this._SafeStr_13145 >= 1000)
                {
                    _local_2 = true;
                    this._SafeStr_13145 = 0;
                }
            }
            else
            {
                if (this._SafeStr_12657 < 11)
                {
                    if (this._SafeStr_13145 > 100)
                    {
                        _local_2 = true;
                        this._SafeStr_13145 = 0;
                    }
                }
                else
                {
                    if (this._counter)
                    {
                        this._counter.dispose();
                        this._counter = null;
                    }
                }
            }
            if ((((!(_local_2)) || (this._SafeStr_5041)) || (!(this._counter))))
            {
                return;
            }
            var _local_3:BitmapDataAsset = (this._snowWarEngine.assets.getAssetByName(this._SafeStr_22121("explosion", this._SafeStr_12657)) as BitmapDataAsset);
            if (_local_3)
            {
                _local_4 = (_local_3.content as BitmapData);
                if (!this._counter.bitmap)
                {
                    this._counter.bitmap = new BitmapData(this._counter.width, this._counter.height, true, 0xFFFFFF);
                }
                this._counter.bitmap.fillRect(this._counter.bitmap.rect, 0xFFFFFF);
                _local_5 = new Point(-(_local_3.offset.x), -(_local_3.offset.y));
                this._counter.bitmap.copyPixels(_local_4, _local_4.rect, _local_5, null, null, true);
                this._counter.invalidate();
            }
            this._SafeStr_12657++;
        }

        private function _SafeStr_22121(k:String, _arg_2:int, _arg_3:int=4):String
        {
            var _local_4:String = _arg_2.toString();
            while (_local_4.length < _arg_3)
            {
                _local_4 = ("0" + _local_4);
            }
            return k + _local_4;
        }

        private function _SafeStr_22122():void
        {
            var k:Array = this._snowWarEngine.synchronizedGameArena._SafeStr_19011();
            if (k.length >= 2)
            {
                WindowUtils._Str_4180(this._teamScores.findChildByName("score_blue"), k[0]);
                WindowUtils._Str_4180(this._teamScores.findChildByName("score_red"), k[1]);
            }
        }

        private function _SafeStr_22123(k:Boolean):void
        {
            if (this._SafeStr_22101 != k)
            {
                WindowUtils._Str_2972(this._makeSnowballImage, this._SafeStr_12987(("ui_make_balls_" + ((k) ? "down" : "up"))));
            }
            this._SafeStr_22101 = k;
        }
    }
}
class RGBColor 
{
    private var _r:uint;
    private var _g:uint;
    private var _b:uint;
    private var _a:uint;

    public function RGBColor(k:uint=0)
    {
        this.fromInt(k);
    }

    public function get r():uint
    {
        return this._r;
    }

    public function get g():uint
    {
        return this._g;
    }

    public function get b():uint
    {
        return this._b;
    }

    public function get a():uint
    {
        return this._a;
    }

    public function fromInt(k:uint):void
    {
        this._a = ((k >> 24) & 0xFF);
        this._r = ((k >> 16) & 0xFF);
        this._g = ((k >> 8) & 0xFF);
        this._b = ((k >> 0) & 0xFF);
    }

    public function get rgb():uint
    {
        return (((this._a << 24) | (this._r << 16)) | (this._g << 8)) | this._b;
    }

    public function tweenTo(k:RGBColor):void
    {
        this._a = (this._a + ((k.a - this.a) / 24));
        this._r = (this._r + ((k.r - this.r) / 24));
        this._g = (this._g + ((k.g - this.g) / 24));
        this._b = (this._b + ((k.b - this.b) / 24));
    }
}
