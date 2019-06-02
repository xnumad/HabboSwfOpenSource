package snowwar.ui
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.avatar.enum.AvatarSetType;
	import com.sulake.habbo.avatar.enum.AvatarScaleType;
	import com.sulake.habbo.game.WindowUtils;
	import com.sulake.habbo.avatar.IAvatarImageListener;
	import com.sulake.habbo.avatar.IAvatarFigureContainer;
	import com.sulake.habbo.avatar.IAvatarImage;
	import com.sulake.core.assets.IAsset;
	import com.sulake.core.utils.Map;
	import com.sulake.core.window.IWindow;
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.window.components.IItemListWindow;
	import com.sulake.core.window.components.IRegionWindow;
	import com.sulake.core.window.events.WindowEvent;
	import com.sulake.core.window.events.WindowMouseEvent;
	import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_3570;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import snowwar.SnowWarEngine;
	import snowwar._Str_254.SnowWarAnimatedWindowElement;
	import snowwar._Str_373._SafeStr_3665;
	import snowwar._Str_496._SafeStr_4018;
	import snowwar._Str_496._SafeStr_4032;

    public class GameStartingViewController implements IDisposable, IAvatarImageListener 
    {
        private var _disposed:Boolean;
        private var _snowWarEngine:SnowWarEngine;
        private var _SafeStr_9274:IWindowContainer;
        private var _SafeStr_18586:Map;
        private var _SafeStr_18794:_SafeStr_4018;
        private var _gameLoadingViewController:GameLoadingViewController;
        private var _SafeStr_18795:Array;

        public function GameStartingViewController(k:SnowWarEngine)
        {
            this._SafeStr_18795 = [];
            this._snowWarEngine = k;
            this._SafeStr_18586 = new Map();
            this._SafeStr_6656();
            this._gameLoadingViewController = new GameLoadingViewController(this._snowWarEngine);
            this._gameLoadingViewController.background.visible = true;
            this._snowWarEngine.windowManager.getDesktop(1).visible = false;
            this._snowWarEngine.roomUI.visible = false;
        }

        public function dispose():void
        {
            var k:SnowWarAnimatedWindowElement;
            if (this._disposed)
            {
                return;
            }
            this._snowWarEngine.windowManager.getDesktop(1).visible = true;
            this._snowWarEngine = null;
            if (this._SafeStr_18586)
            {
                for each (k in this._SafeStr_18586)
                {
                    k.dispose();
                }
                this._SafeStr_18586.dispose();
                this._SafeStr_18586 = null;
            }
            if (this._SafeStr_9274)
            {
                this._SafeStr_9274.dispose();
                this._SafeStr_9274 = null;
            }
            if (this._gameLoadingViewController)
            {
                this._gameLoadingViewController.dispose();
                this._gameLoadingViewController = null;
            }
            this._disposed = true;
            this._SafeStr_18795 = [];
        }

        private function _SafeStr_6656():void
        {
            this._SafeStr_9274 = (WindowUtils.createWindow("snowwar_ending") as IWindowContainer);
            this._SafeStr_9274.x = ((this._SafeStr_9274.desktop.width - this._SafeStr_9274.width) / 2);
            this._SafeStr_9274.y = ((this._SafeStr_9274.desktop.height > 685) ? 115 : 10);
            WindowUtils._Str_4180(this._SafeStr_9274.findChildByName("endingInformation"), "${snowwar.loading.title}");
            WindowUtils._Str_26294(this._SafeStr_9274, "buttonsContainer");
            WindowUtils._Str_26294(this._SafeStr_9274, "mostKillsContainer");
            WindowUtils._Str_26294(this._SafeStr_9274, "mostHitsContainer");
            WindowUtils._Str_26294(this._SafeStr_9274, "team1Score");
            WindowUtils._Str_26294(this._SafeStr_9274, "team2Score");
            WindowUtils._Str_26294(this._SafeStr_9274, "statusContainer");
            this._SafeStr_9274.findChildByName("loadingContainer").visible = true;
            this._SafeStr_9274.findChildByName("leave_link_region").procedure = this._SafeStr_16837;
        }

        private function _SafeStr_16837(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._SafeStr_9859();
        }

        private function _SafeStr_9859():void
        {
            if (this._snowWarEngine != null)
            {
                this._snowWarEngine._SafeStr_13222(true);
                this._snowWarEngine.send(new _SafeStr_3665());
                if (this._snowWarEngine.rejoinRoom > -1)
                {
                    this._snowWarEngine.send(new _Str_3570(this._snowWarEngine.rejoinRoom, false, true));
                }
                this._snowWarEngine.disposeGameStartingViewController();
            }
        }

        public function show(k:_SafeStr_4018):void
        {
            this._SafeStr_18794 = k;
            var _local_2:IBitmapWrapperWindow = (this._SafeStr_9274.findChildByName("arenaPreview") as IBitmapWrapperWindow);
            var _local_3:IAsset = this._snowWarEngine.assets.getAssetByName((("arena_" + k.fieldName) + "_preview"));
            if (_local_3)
            {
                _local_2.bitmap = (_local_3.content as BitmapData);
                _local_2.disposesBitmap = false;
            }
            WindowUtils._Str_4180(this._SafeStr_9274.findChildByName("arenaName"), this._snowWarEngine.gameArenaName(k));
            this._SafeStr_18796();
        }

        private function _SafeStr_18796():void
        {
            var k:_SafeStr_4032;
            this._SafeStr_18797();
            for each (k in this._SafeStr_18794._SafeStr_13266.sort(_SafeStr_4032._SafeStr_18802))
            {
                this._SafeStr_18798(k);
            }
        }

        private function _SafeStr_18797():void
        {
            var _local_2:IItemListWindow;
            var k:int = 1;
            while ((_local_2 = (this._SafeStr_9274.findChildByName((("team" + k++) + "PlayersList")) as IItemListWindow)) != null)
            {
                _local_2.destroyListItems();
            }
        }

        private function _SafeStr_18798(k:_SafeStr_4032):void
        {
            var _local_8:int;
            var _local_2:int = k.final;
            var _local_3:IItemListWindow = (this._SafeStr_9274.findChildByName((("team" + _local_2) + "PlayersList")) as IItemListWindow);
            var _local_4:IItemListWindow = (WindowUtils.createWindow(("snowwar_results_player_team_" + _local_2)) as IItemListWindow);
            var _local_5:IWindowContainer = (_local_4.getListItemByName("playerImageContainer") as IWindowContainer);
            var _local_6:IWindowContainer = (_local_4.getListItemByName("playerDataContainer") as IWindowContainer);
            var _local_7:IWindowContainer = (_local_4.getListItemByName("playerScoreContainer") as IWindowContainer);
            if (k.userId == this._snowWarEngine.sessionDataManager.userId)
            {
                WindowUtils._Str_2972(_local_5.findChildByName("playerImageBackground"), this._SafeStr_12987("green_square"));
            }
            switch (_local_2)
            {
                case 2:
                    _local_8 = 4;
                    break;
                case 1:
                default:
                    _local_8 = 2;
            }
            WindowUtils._Str_2972(this._SafeStr_18800(_local_5, "playerImage"), this._SafeStr_18801(k.final, k.figure, k.gender, _local_8));
            WindowUtils._Str_4180(this._SafeStr_18800(_local_6, "playerName"), k.name);
            WindowUtils._Str_26294(_local_6, "playerStats");
            WindowUtils._Str_26294(_local_7, "playerScore");
            WindowUtils._Str_26294(_local_6, "playerTotalStats");
            var _local_9:IBitmapWrapperWindow = (_local_6.findChildByName("skillLevel") as IBitmapWrapperWindow);
            if (_local_9.bitmap)
            {
                _local_9.bitmap.dispose();
            }
            _local_9.bitmap = this._SafeStr_18799(k.skillLevel, k.final);
            var _local_10:IRegionWindow = (_local_6.findChildByName("scoreTooltip") as IRegionWindow);
            _local_10._Str_2613 = ((k._SafeStr_17897.toString() + "/") + k._SafeStr_18803.toString());
            _local_10.visible = true;
            _local_3.addListItem(_local_4);
            var _local_11:IBitmapWrapperWindow = (_local_7.findChildByName("loadingIcon") as IBitmapWrapperWindow);
            var _local_12:SnowWarAnimatedWindowElement = this._SafeStr_18586.remove(k.userId);
            if (_local_12)
            {
                _local_12.dispose();
            }
            _local_12 = new SnowWarAnimatedWindowElement(this._snowWarEngine.assets, _local_11, "load_", 8);
            this._SafeStr_18586.add(k.userId, _local_12);
            _local_11.visible = true;
        }

        private function _SafeStr_18799(k:int, _arg_2:int):BitmapData
        {
            var _local_8:BitmapData;
            var _local_11:Point;
            k = Math.min(k, 30);
            var _local_3:BitmapData = (this._snowWarEngine.assets.getAssetByName("star_empty").content as BitmapData);
            var _local_4:BitmapData = (this._snowWarEngine.assets.getAssetByName("star_filled_bronze").content as BitmapData);
            var _local_5:BitmapData = (this._snowWarEngine.assets.getAssetByName("star_filled_silver").content as BitmapData);
            var _local_6:BitmapData = (this._snowWarEngine.assets.getAssetByName("star_filled_gold").content as BitmapData);
            var _local_7:int = ((k > 0) ? (((k - 1) % 10) + 1) : 0);
            var _local_9:BitmapData = new BitmapData(150, 13, true, 0);
            var _local_10:int;
            while (_local_10 < 10)
            {
                _local_11 = ((_arg_2 == 1) ? new Point((_local_10 * 15), 0) : new Point(((9 - _local_10) * 15), 0));
                _local_8 = ((k > 20) ? ((_local_7-- > 0) ? _local_6 : _local_3) : ((k > 10) ? ((_local_7-- > 0) ? _local_5 : _local_3) : ((_local_7-- > 0) ? _local_4 : _local_3)));
                _local_9.copyPixels(_local_8, _local_8.rect, _local_11);
                _local_10++;
            }
            return _local_9;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_840(k:String):void
        {
            if (this._SafeStr_18795.indexOf(k) == -1)
            {
                this._SafeStr_18796();
                this._SafeStr_18795.push(k);
            }
        }

        private function _SafeStr_18800(k:IWindowContainer, _arg_2:String):IWindow
        {
            return k.findChildByName(_arg_2);
        }

        private function _SafeStr_12987(k:String):BitmapData
        {
            return this._snowWarEngine.assets.getAssetByName(k).content as BitmapData;
        }

        private function _SafeStr_18801(k:int, _arg_2:String, _arg_3:String, _arg_4:int):BitmapData
        {
            var _local_5:IAvatarFigureContainer = this._snowWarEngine.avatarRenderManager._Str_718(_arg_2);
            switch (k)
            {
                case 1:
                    _local_5._Str_830("ch", 20000, [1]);
                    break;
                case 2:
                    _local_5._Str_830("ch", 20001, [1]);
                    break;
                default:
                    _local_5._Str_830("ch", 20000, [1]);
            }
            var _local_6:IAvatarImage = this._snowWarEngine.avatarRenderManager.createAvatarImage(_local_5.getFigureString(), AvatarScaleType.SMALL, _arg_3, this);
            if (_local_6)
            {
                _local_6.setDirection(AvatarSetType.FULL, _arg_4);
                return _local_6._Str_818(AvatarSetType.FULL);
            }
            return null;
        }

        public function playersInitialized(k:Array):void
        {
            var _local_2:int;
            var _local_3:SnowWarAnimatedWindowElement;
            for each (_local_2 in k)
            {
                _local_3 = this._SafeStr_18586.remove(_local_2);
                if (_local_3)
                {
                    _local_3.dispose();
                }
            }
            if (this._SafeStr_18586.length == 0)
            {
                this._SafeStr_18586.add(-1, new SnowWarAnimatedWindowElement(this._snowWarEngine.assets, (this._SafeStr_9274.findChildByName("mainLoadingIcon") as IBitmapWrapperWindow), "load_", 8));
                WindowUtils._Str_4180(this._SafeStr_9274.findChildByName("loadingText"), "${snowwar.loading_arena}");
            }
        }
    }
}
