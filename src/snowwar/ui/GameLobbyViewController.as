package snowwar.ui
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.localization.IHabboLocalizationManager;
	import com.sulake.core.assets.XmlAsset;
	import com.sulake.habbo.avatar.enum.AvatarSetType;
	import com.sulake.habbo.avatar.enum.AvatarScaleType;
	import com.sulake.habbo.game.WindowUtils;
	import com.sulake.habbo.avatar.IAvatarImageListener;
	import com.sulake.habbo.avatar.IAvatarImage;
	import com.sulake.core.window.components.IItemGridWindow;
	import com.sulake.core.utils.Map;
	import com.sulake.core.window.IWindow;
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.window.components.IRegionWindow;
	import com.sulake.core.window.components.ITextWindow;
	import com.sulake.core.window.events.WindowEvent;
	import com.sulake.core.window.events.WindowMouseEvent;
	import snowwar._Str_400._SafeStr_3813;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import snowwar.SnowWarEngine;
	import snowwar._Str_254.SnowWarAnimatedWindowElement;
	import snowwar._Str_496._SafeStr_4032;

    public class GameLobbyViewController implements IDisposable, IAvatarImageListener 
    {
        private var gameViewController:GamesMainViewController;
        private var _SafeStr_18579:SnowWarEngine;
        private var _SafeStr_18580:String;
        private var _SafeStr_18581:int;
        private var _SafeStr_18582:int;
        private var _SafeStr_18583:int;
        private var _SafeStr_9206:IWindowContainer;
        private var _SafeStr_18584:Timer;
        private var _SafeStr_5217:int = -1;
        private var _SafeStr_14545:int = -1;
        private var _SafeStr_5041:Boolean = false;
        private var _SafeStr_18585:Array;
        private var _SafeStr_18586:Map;

        public function GameLobbyViewController(k:GamesMainViewController, _arg_2:String, _arg_3:int, _arg_4:int)
        {
            this._SafeStr_18585 = [];
            super();
            this.gameViewController = k;
            this._SafeStr_18579 = k.snowWarEngine;
            this._SafeStr_18586 = new Map();
            this._SafeStr_18580 = _arg_2;
            this._SafeStr_18581 = _arg_3;
            this._SafeStr_18582 = this._SafeStr_18578;
            this._SafeStr_18583 = _arg_4;
        }

        private function _SafeStr_18587():void
        {
            var _local_3:Point;
            this._SafeStr_9206 = (this.gameViewController.mainWindow.findChildByName("snowwar_lobby_cont") as IWindowContainer);
            this._SafeStr_9206.center();
            this._SafeStr_9206.findChildByName("cancel_link_region").procedure = this._SafeStr_16837;
            var k:IItemGridWindow = (this._SafeStr_9206.findChildByName("players_grid") as IItemGridWindow);
            var _local_2:IWindowContainer = (WindowUtils.createWindow("snowwar_lobby_player") as IWindowContainer);
            var _local_4:int;
            while (_local_4 < this._SafeStr_18583)
            {
                k._Str_2816(_local_2.clone());
                _local_4++;
            }
            _local_2.dispose();
            this._SafeStr_9206.visible = false;
        }

        private function createWindow(k:String):IWindowContainer
        {
            var _local_2:XmlAsset = (this._SafeStr_18579.assets.getAssetByName(k) as XmlAsset);
            return this._SafeStr_18579.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer;
        }

        private function _SafeStr_16837(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._SafeStr_9859(true);
            if (!this._SafeStr_18579.gameCenterEnabled)
            {
                this.gameViewController.createAndVisible(true);
            }
            else
            {
                this.gameViewController.close(true);
            }
        }

        public function _SafeStr_9859(k:Boolean):void
        {
            if (k)
            {
                this._SafeStr_18579.communication.connection.send(new _SafeStr_3813());
            }
            this._SafeStr_18588();
            this._SafeStr_14545 = -1;
        }

        public function set visible(k:Boolean):void
        {
            if (!this._SafeStr_9206)
            {
                this._SafeStr_18587();
            }
            this._SafeStr_9206.visible = k;
        }

        public function get visible():Boolean
        {
            if (this._SafeStr_9206)
            {
                return this._SafeStr_9206.visible;
            }
            return false;
        }

        public function dispose():void
        {
            var k:SnowWarAnimatedWindowElement;
            if (this._SafeStr_18586)
            {
                for each (k in this._SafeStr_18586)
                {
                    k.dispose();
                }
                this._SafeStr_18586.dispose();
                this._SafeStr_18586 = null;
            }
            if (this._SafeStr_9206 != null)
            {
                this._SafeStr_9206.dispose();
                this._SafeStr_9206 = null;
            }
            this._SafeStr_18588();
            this._SafeStr_18585 = [];
            this._SafeStr_5041 = true;
            this._SafeStr_14545 = -1;
        }

        private function _SafeStr_18588():void
        {
            if (this._SafeStr_18584 != null)
            {
                this._SafeStr_18584.removeEventListener(TimerEvent.TIMER, this._SafeStr_18589);
                this._SafeStr_18584.stop();
                this._SafeStr_18584 = null;
            }
            this._SafeStr_5217 = -1;
        }

        public function get disposed():Boolean
        {
            return this._SafeStr_5041;
        }

        public function _SafeStr_13276(k:int):void
        {
            var _local_2:_SafeStr_4032;
            for each (_local_2 in this._SafeStr_18585)
            {
                if (_local_2.userId == k)
                {
                    this._SafeStr_18585.splice(this._SafeStr_18585.indexOf(_local_2), 1);
                    break;
                }
            }
            this._SafeStr_18592(true);
        }

        public function _SafeStr_13272(k:_SafeStr_4032):void
        {
            if (k)
            {
                this._SafeStr_18585.push(k);
                this._SafeStr_18592(true, k.figure);
            }
        }

        public function _SafeStr_18590():void
        {
            if (this._SafeStr_18585)
            {
                this._SafeStr_18585 = [];
            }
        }

        public function _SafeStr_13269(k:int):void
        {
            this._SafeStr_18588();
            this._SafeStr_5217 = k;
            this._SafeStr_18584 = new Timer(1000, k);
            this._SafeStr_18584.addEventListener(TimerEvent.TIMER, this._SafeStr_18589);
            this._SafeStr_18584.start();
            this._SafeStr_18592(false);
        }

        private function _SafeStr_18589(k:TimerEvent):void
        {
            if (((this._SafeStr_5217) && (this._SafeStr_5217 > 0)))
            {
                this._SafeStr_5217--;
                HabboGamesCom.log(("on tick " + this._SafeStr_5217));
                this._SafeStr_18592(false);
            }
        }

        public function _SafeStr_13270():void
        {
            this._SafeStr_18588();
            this._SafeStr_18592(false);
        }

        public function set _SafeStr_18591(k:int):void
        {
            this._SafeStr_14545 = k;
        }

        private function _SafeStr_18592(k:Boolean, _arg_2:String=null):void
        {
            var _local_6:String;
            var _local_7:String;
            var _local_11:IRegionWindow;
            var _local_12:IBitmapWrapperWindow;
            var _local_13:SnowWarAnimatedWindowElement;
            var _local_14:_SafeStr_4032;
            var _local_15:IAvatarImage;
            var _local_16:BitmapData;
            var _local_17:Point;
            var _local_3:IWindow = (this._SafeStr_9206.findChildByName("wait_text") as ITextWindow);
            var _local_4:IWindow = (this._SafeStr_9206.findChildByName("wait_text_stroke") as ITextWindow);
            var _local_5:IHabboLocalizationManager = this._SafeStr_18579.localization;
            if (this._SafeStr_5217 >= 0)
            {
                _local_6 = "snowwar.lobby_game_start_countdown";
                _local_5.registerParameter(_local_6, "seconds", String(this._SafeStr_5217));
                _local_7 = ((((_local_6 + " ") + "%seconds%") + " ") + this._SafeStr_5217);
            }
            else
            {
                if (this._SafeStr_14545 >= 0)
                {
                    _local_6 = "snowwar.lobby_arena_queue_position";
                    _local_5.registerParameter(_local_6, "position", String(this._SafeStr_14545));
                    _local_7 = ((((_local_6 + " ") + "%position%") + " ") + this._SafeStr_14545);
                }
                else
                {
                    _local_6 = "snowwar.lobby_waiting_for_more_players";
                    _local_7 = _local_6;
                }
            }
            var _local_8:String = _local_5.getLocalization(_local_6);
            if (_local_8)
            {
                _local_3.caption = _local_8;
                _local_4.caption = _local_8;
            }
            else
            {
                _local_3.caption = _local_7;
                _local_4.caption = _local_7;
            }
            var _local_9:int;
            var _local_10:IItemGridWindow = (this._SafeStr_9206.findChildByName("players_grid") as IItemGridWindow);
            if (k)
            {
                for each (_local_14 in this._SafeStr_18585)
                {
                    _local_15 = null;
                    if (((_local_14.figure == _arg_2) || (!(_arg_2))))
                    {
                        _local_15 = this._SafeStr_18579.avatarRenderManager.createAvatarImage(_local_14.figure, AvatarScaleType.LARGE, _local_14.gender, this);
                    }
                    if (_local_15)
                    {
                        _local_15.setDirection(AvatarSetType.HEAD, 2);
                        _local_16 = _local_15._Str_818(AvatarSetType.HEAD);
                        _local_11 = (_local_10._Str_2830(_local_9) as IRegionWindow);
                        if (_local_11)
                        {
                            _local_11._Str_2613 = _local_14.name;
                            _local_11.mouseThreshold = 0;
                            _local_12 = (_local_11.findChildByName("image") as IBitmapWrapperWindow);
                            _local_13 = this._SafeStr_18586.remove(_local_12);
                            if (_local_13)
                            {
                                _local_13.dispose();
                            }
                            if (_local_12.bitmap)
                            {
                                _local_12.bitmap.dispose();
                            }
                            _local_12.bitmap = new BitmapData(_local_12.width, _local_12.height, true, 0);
                            _local_17 = new Point(((_local_12.width - _local_16.width) / 2), ((_local_12.height - _local_16.height) / 2));
                            _local_12.bitmap.copyPixels(_local_16, _local_16.rect, _local_17);
                        }
                        _local_16.dispose();
                        _local_15.dispose();
                    }
                    _local_9++;
                }
                while (_local_9 < this._SafeStr_18593)
                {
                    _local_11 = (_local_10._Str_2830(_local_9) as IRegionWindow);
                    _local_12 = (_local_11.findChildByName("image") as IBitmapWrapperWindow);
                    if (!this._SafeStr_18586.hasKey(_local_12))
                    {
                        _local_13 = new SnowWarAnimatedWindowElement(this._SafeStr_18579.assets, _local_12, "load_", 8);
                        this._SafeStr_18586.add(_local_12, _local_13);
                    }
                    _local_9++;
                }
            }
        }

        public function _Str_840(k:String):void
        {
            this._SafeStr_18592(true, k);
        }

        public function get _SafeStr_18594():String
        {
            return this._SafeStr_18580;
        }

        public function get _SafeStr_13274():int
        {
            return this._SafeStr_18581;
        }

        public function get _SafeStr_18578():int
        {
            return this._SafeStr_18582;
        }

        public function get _SafeStr_18593():int
        {
            return this._SafeStr_18583;
        }

        public function set _SafeStr_18594(k:String):void
        {
            this._SafeStr_18580 = k;
        }

        public function set _SafeStr_18593(k:int):void
        {
            this._SafeStr_18583 = k;
        }

        public function set _SafeStr_13274(k:int):void
        {
            this._SafeStr_18581 = k;
        }

        public function set _SafeStr_18578(k:int):void
        {
            this._SafeStr_18582 = k;
        }

        public function set counter(k:int):void
        {
            this._SafeStr_5217 = k;
        }
    }
}
