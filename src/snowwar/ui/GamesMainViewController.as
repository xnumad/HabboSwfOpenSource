package snowwar.ui
{
    import com.sulake.habbo.catalog.IVideoOfferLauncher;
    import com.sulake.core.runtime.IDisposable;
    import snowwar.SnowWarEngine;
	import com.sulake.core.window.IWindowContainer;
    import snowwar._Str_254.SnowWarAnimatedWindowElement;
    import flash.utils.Timer;
    import com.sulake.habbo.game.WindowUtils;
	import com.sulake.core.window.events.WindowMouseEvent
	import com.sulake.core.window.components.IItemListWindow;
	import com.sulake.core.window.IWindow;
	import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import flash.events.TimerEvent;

    public class GamesMainViewController implements IVideoOfferLauncher, IDisposable 
    {
        private static const _SafeStr_18751:int = 0;
        private static const _SafeStr_18752:int = 1;
        private static const _SafeStr_18753:int = 2;
        private static const _SafeStr_18754:Array = ["move_", "throw_1_", "throw_2_", "throw_3_", "balls_"];
        private static const _SafeStr_18755:Array = [4, 4, 5, 5, 5];
        private static const _SafeStr_18756:int = 1000;

        private var _snowWarEngine:SnowWarEngine;
        private var _mainWindow:IWindowContainer;
        private var _quickPlayContainer:IWindowContainer;
        private var _gameLobbyViewController:GameLobbyViewController;
        private var _SafeStr_5041:Boolean;
        private var _SafeStr_18758:SnowWarAnimatedWindowElement;
        private var _SafeStr_18759:Timer;
        private var _SafeStr_18760:int = 0;
        private var _SafeStr_18761:int = 0;
        private var _SafeStr_18762:int = -1;
        private var _SafeStr_18763:int = 0;

        public function GamesMainViewController(snowWarEngine:SnowWarEngine)
        {
            this._snowWarEngine = snowWarEngine;
        }

        public function get snowWarEngine():SnowWarEngine
        {
            return this._snowWarEngine;
        }

        public function get mainWindow():IWindowContainer
        {
            return this._mainWindow;
        }

        public function get gameLobbyViewController():GameLobbyViewController
        {
            return this._gameLobbyViewController;
        }

        public function _SafeStr_7703():void
        {
            if (this._mainWindow)
            {
                this._mainWindow.visible = (!(this.mainWindow.visible));
            }
            else
            {
                this.createAndVisible(true);
            }
        }

        private function createWindow():void
        {
            this._SafeStr_18761 = ((this._snowWarEngine.config.getBoolean("games.buy.x.games.enabled")) ? _SafeStr_18752 : _SafeStr_18751);
            if (((this._snowWarEngine.catalog.videoOffers.enabled) && (this._snowWarEngine.config.getBoolean("games.buy.x.games.video.enabled"))))
            {
                this._SafeStr_18761 = _SafeStr_18753;
                this._snowWarEngine.catalog.videoOffers.load(this);
            }
            this._mainWindow = (WindowUtils.createWindow("games_main", 1) as IWindowContainer);
            this._mainWindow.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_9859);
            this._mainWindow.visible = true;
            this._mainWindow.center();
            this._quickPlayContainer = (this._mainWindow.findChildByName("quick_play_container") as IWindowContainer);
            this._quickPlayContainer.findChildByName("play.button").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18764);
            this._quickPlayContainer.findChildByName("buy.button").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18765);
            this._quickPlayContainer.findChildByName("watch_video.button").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18765);
            this._quickPlayContainer.visible = false;
            this._quickPlayContainer.findChildByName("instructions_link").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18766);
            this._quickPlayContainer.findChildByName("leaderboard_link").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18767);
            this._quickPlayContainer.findChildByName("instructions_back").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_12885);
            this._quickPlayContainer.findChildByName("instructions_next").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18768);
            this._quickPlayContainer.findChildByName("instructions_prev").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18769);
            this._quickPlayContainer.findChildByName("games_left_region").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18770);
            this._quickPlayContainer.findChildByName("leaderboard_link").visible = this._snowWarEngine.config.getBoolean("games.highscores.enabled");
            var k:IItemListWindow = (this._quickPlayContainer.findChildByName("page_list") as IItemListWindow);
            var _local_2:int;
            while (_local_2 < k.numListItems)
            {
                k.getListItemAt(_local_2).addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18771);
                _local_2++;
            }
            this._SafeStr_5041 = false;
            this._SafeStr_13278();
        }

        public function close(k:Boolean):void
        {
            if (((this._gameLobbyViewController) && (this._gameLobbyViewController.visible)))
            {
                this._gameLobbyViewController._SafeStr_9859(k);
            }
            this._SafeStr_18774();
        }

        private function _SafeStr_9859(k:WindowMouseEvent):void
        {
            this.close(true);
        }

        private function _SafeStr_18764(k:WindowMouseEvent):void
        {
            if (this._snowWarEngine._SafeStr_13224 != 0)
            {
                this._snowWarEngine._SafeStr_13185();
            }
            else
            {
                this._SafeStr_18770(k);
            }
        }

        private function _SafeStr_18765(k:WindowMouseEvent):void
        {
            this._SafeStr_18770(k);
        }

        private function _SafeStr_18772():void
        {
            var k:IWindow = this._quickPlayContainer.findChildByName("play.button");
            var _local_2:IWindow = this._quickPlayContainer.findChildByName("buy.button");
            var _local_3:IWindow = this._quickPlayContainer.findChildByName("watch_video.button");
            var _local_4:IWindow = this._quickPlayContainer.findChildByName("games.lobby.get.vip");
            var _local_5:IWindow = this._quickPlayContainer.findChildByName("games.lobby.get.games");
            var _local_6:IWindow = this._quickPlayContainer.findChildByName("games.lobby.get.games_for_video");
            k.visible = false;
            _local_2.visible = false;
            _local_3.visible = false;
            _local_4.visible = false;
            _local_5.visible = false;
            _local_6.visible = false;
            switch (this._SafeStr_18761)
            {
                case _SafeStr_18752:
                    if (this._snowWarEngine._SafeStr_13224 == 0)
                    {
                        _local_2.visible = true;
                    }
                    else
                    {
                        k.visible = true;
                    }
                    _local_5.visible = true;
                    return;
                case _SafeStr_18753:
                    if (this._snowWarEngine._SafeStr_13224 == 0)
                    {
                        _local_3.visible = true;
                    }
                    else
                    {
                        k.visible = true;
                    }
                    if (this._SafeStr_18762 > 0)
                    {
                        _local_6.visible = true;
                    }
                    return;
                default:
                    k.visible = true;
                    _local_4.visible = true;
            }
        }

        public function offersAvailable(k:int):void
        {
            this._SafeStr_18762 = k;
            if (this._SafeStr_18762 < 1)
            {
                this._SafeStr_18761 = _SafeStr_18751;
            }
            if (this._quickPlayContainer)
            {
                this._SafeStr_18772();
            }
        }

        private function _SafeStr_18766(k:WindowMouseEvent):void
        {
            this._SafeStr_18773(true);
        }

        private function _SafeStr_18767(k:WindowMouseEvent):void
        {
            this._snowWarEngine.showLeaderboard();
        }

        private function _SafeStr_12885(k:WindowMouseEvent):void
        {
            this._SafeStr_18773(false);
        }

        private function _SafeStr_18768(k:WindowMouseEvent):void
        {
            this._SafeStr_18763++;
            this._SafeStr_18763 = (this._SafeStr_18763 % _SafeStr_18754.length);
            this._SafeStr_18773(true);
        }

        private function _SafeStr_18769(k:WindowMouseEvent):void
        {
            this._SafeStr_18763 = ((this._SafeStr_18763 - 1) + _SafeStr_18754.length);
            this._SafeStr_18763 = (this._SafeStr_18763 % _SafeStr_18754.length);
            this._SafeStr_18773(true);
        }

        private function _SafeStr_18771(k:WindowMouseEvent):void
        {
            this._SafeStr_18763 = parseInt(k.window.name.replace("page_", ""));
            this._SafeStr_18773(true);
        }

        private function _SafeStr_18773(k:Boolean):void
        {
            var _local_7:IWindowContainer;
            this._quickPlayContainer.findChildByName("teaser_container").visible = (!(k));
            this._quickPlayContainer.findChildByName("instructions_container").visible = k;
            if (this._SafeStr_18758)
            {
                this._SafeStr_18758.dispose();
                this._SafeStr_18758 = null;
            }
            if (!k)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._quickPlayContainer.findChildByName("instructions_image") as IBitmapWrapperWindow);
            var _local_3:String = _SafeStr_18754[this._SafeStr_18763];
            var _local_4:int = _SafeStr_18755[this._SafeStr_18763];
            this._SafeStr_18758 = new SnowWarAnimatedWindowElement(this._snowWarEngine.assets, _local_2, _local_3, _local_4, _SafeStr_18756);
            this._quickPlayContainer.findChildByName("instruction_text").caption = (("${snowwar.instructions." + (this._SafeStr_18763 + 1)) + "}");
            var _local_5:IItemListWindow = (this._quickPlayContainer.findChildByName("page_list") as IItemListWindow);
            var _local_6:int;
            while (_local_6 < _local_5.numListItems)
            {
                _local_7 = (_local_5.getListItemAt(_local_6) as IWindowContainer);
                _local_3 = ((_local_6 <= this._SafeStr_18763) ? "pagination_ball_hilite" : "pagination_ball");
                WindowUtils._Str_2972(_local_7.getChildAt(0), this._SafeStr_12987(_local_3));
                _local_6++;
            }
        }

        private function _SafeStr_12987(k:String):BitmapData
        {
            var _local_2:IAsset = this._snowWarEngine.assets.getAssetByName(k);
            if (_local_2)
            {
                return _local_2.content as BitmapData;
            }
            return null;
        }

        private function _SafeStr_18770(k:WindowMouseEvent):void
        {
            switch (this._SafeStr_18761)
            {
                case _SafeStr_18752:
                    this._snowWarEngine._SafeStr_13226("gameFramework.buyTokens.clicked.frontView");
                    return;
                case _SafeStr_18753:
                    if (!this._snowWarEngine._SafeStr_13227("gameFramework.videoOffer.clicked.frontView"))
                    {
                        this._SafeStr_18761 = _SafeStr_18751;
                        this._SafeStr_18772();
                    }
                    return;
                default:
                    this._snowWarEngine._SafeStr_7664("gameFramework.getVip.clicked.frontView");
            }
        }

        public function createAndVisible(create:Boolean):void
        {
            if (((!(this._mainWindow)) && (create)))
            {
                this.createWindow();
            }
            else
            {
                if (((!(this.mainWindow)) && (!(create))))
                {
                    return;
                }
            }
            if (this._gameLobbyViewController)
            {
                this._gameLobbyViewController.visible = false;
            }
            this._quickPlayContainer.visible = true;
        }

        public function _SafeStr_13273(k:String, _arg_2:int, _arg_3:int):void
        {
            if (!this._mainWindow)
            {
                this.createWindow();
            }
            if (!this._gameLobbyViewController)
            {
                this._gameLobbyViewController = new GameLobbyViewController(this, k, _arg_2, _arg_3);
            }
            else
            {
                this._gameLobbyViewController._SafeStr_18594 = k;
                this._gameLobbyViewController._SafeStr_13274 = _arg_2;
                this._gameLobbyViewController._SafeStr_18593 = _arg_3;
                this._gameLobbyViewController._SafeStr_18590();
            }
            this._quickPlayContainer.visible = false;
            this._gameLobbyViewController.visible = true;
        }

        public function dispose():void
        {
            if (!this._SafeStr_5041)
            {
                this._SafeStr_18774();
                this._SafeStr_5041 = true;
                this._SafeStr_18775();
            }
        }

        private function _SafeStr_18774():void
        {
            if (this._SafeStr_18758)
            {
                this._SafeStr_18758.dispose();
                this._SafeStr_18758 = null;
            }
            if (this._gameLobbyViewController)
            {
                this._gameLobbyViewController.dispose();
                this._gameLobbyViewController = null;
            }
            if (this._quickPlayContainer)
            {
                this._quickPlayContainer.dispose();
                this._quickPlayContainer = null;
            }
            if (this._mainWindow)
            {
                this._mainWindow.dispose();
                this._mainWindow = null;
            }
        }

        private function _SafeStr_18775():void
        {
            if (this._SafeStr_18759)
            {
                this._SafeStr_18759.removeEventListener(TimerEvent.TIMER, this._SafeStr_18589);
                this._SafeStr_18759.stop();
                this._SafeStr_18759 = null;
            }
            this._SafeStr_18760 = NaN;
        }

        public function get disposed():Boolean
        {
            return this._SafeStr_5041;
        }

        public function _SafeStr_13278():void
        {
            var k:IWindowContainer;
            var _local_2:ITextWindow;
            var _local_3:IWindow;
            if (((this._quickPlayContainer) && (this._quickPlayContainer.visible)))
            {
                WindowUtils._Str_4180(this._quickPlayContainer.findChildByName("games_left"), this._snowWarEngine._SafeStr_13224.toString());
                k = (this._quickPlayContainer.findChildByName("games_left_region") as IWindowContainer);
                _local_2 = (this._quickPlayContainer.findChildByName("games_left_stroke") as ITextWindow);
                _local_3 = this._quickPlayContainer.findChildByName("play.button");
                _local_3.visible = true;
                this._SafeStr_18772();
                if (this._SafeStr_18776(k, _local_2, _local_3))
                {
                    this._SafeStr_18777(_local_3);
                }
            }
        }

        private function _SafeStr_18776(k:IWindowContainer, _arg_2:ITextWindow, _arg_3:IWindow):Boolean
        {
            if (this._snowWarEngine._SafeStr_13223)
            {
                k.visible = false;
                return true;
            }
            k.visible = true;
            var _local_4:IWindow = ITextWindow(this._quickPlayContainer.findChildByName("play_text"));
            _arg_3.color = 0x55CC00;
            switch (this._snowWarEngine._SafeStr_13224)
            {
                case -1:
                    k.visible = false;
                    WindowUtils._Str_4180(_local_4, "${snowwar.play}");
                    return true;
                case 0:
                    k.visible = true;
                    _arg_2.textColor = 0xFF0000;
                    WindowUtils._Str_4180(_local_4, "${catalog.vip.buy.title}");
                    return false;
                default:
                    k.visible = true;
                    _arg_2.textColor = 1079212;
                    WindowUtils._Str_4180(_local_4, "${snowwar.play}");
                    return true;
            }
        }

        private function _SafeStr_18777(k:IWindow):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_2:IWindow = ITextWindow(this._quickPlayContainer.findChildByName("play_text"));
            if (this._SafeStr_18760 > 0)
            {
                k.disable();
                k.color = 0xCCCCCC;
                _local_3 = Math.floor((this._SafeStr_18760 / 60));
                _local_4 = (this._SafeStr_18760 % 60);
                _local_2.caption = ((_local_3 + ":") + ((_local_4 < 10) ? ("0" + _local_4) : _local_4));
            }
            else
            {
                if (this._SafeStr_18760 <= 0)
                {
                    k.enable();
                    k.color = 0x55CC00;
                    WindowUtils._Str_4180(_local_2, "${snowwar.play}");
                }
            }
        }

        private function _SafeStr_18589(k:TimerEvent):void
        {
            if (((this._SafeStr_18760) && (this._SafeStr_18760 > 0)))
            {
                this._SafeStr_18760--;
                HabboGamesCom.log(("on block tick " + this._SafeStr_18760));
                this._SafeStr_13278();
            }
            if (this._SafeStr_18760 <= 0)
            {
                this._SafeStr_13278();
                this._SafeStr_18775();
            }
        }

        public function _SafeStr_18778(k:int):void
        {
            if (k > 0)
            {
                this._SafeStr_18760 = k;
                if (!this._SafeStr_18759)
                {
                    this._SafeStr_18759 = new Timer(1000, this._SafeStr_18760);
                    this._SafeStr_18759.addEventListener(TimerEvent.TIMER, this._SafeStr_18589);
                    this._SafeStr_18759.start();
                }
            }
            this._SafeStr_13278();
        }
    }
}
