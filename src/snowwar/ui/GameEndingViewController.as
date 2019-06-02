package snowwar.ui
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.catalog.IVideoOfferLauncher;
	import com.sulake.habbo.game.HabboGames;
	import com.sulake.core.utils.Map;
	import com.sulake.core.window.IWindow;
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.assets.IAsset;
	import com.sulake.habbo.avatar.enum.AvatarScaleType;
	import com.sulake.habbo.avatar.enum.AvatarSetType;
	import com.sulake.habbo.avatar.IAvatarImageListener;
	import com.sulake.habbo.avatar.IAvatarFigureContainer;
	import com.sulake.habbo.avatar.IAvatarImage;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.window.components.IItemListWindow
	import com.sulake.core.window.components.IRegionWindow;
	import com.sulake.core.window.components.ITextWindow;
	import snowwar._Str_254.SnowWarAnimatedWindowElement;
	import com.sulake.habbo.game.WindowUtils;
	import com.sulake.core.window.events.WindowEvent;
	import com.sulake.core.window.events.WindowMouseEvent;
	import snowwar._Str_345._SafeStr_1434;
	import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
	import snowwar._Str_373._SafeStr_3665;
	import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_3570;
	import snowwar._Str_400._SafeStr_3624;
	import snowwar._Str_400._SafeStr_3813;
	import snowwar._Str_496.Game2GameResult;
	import snowwar._Str_496.Game2SnowWarGameStats;
	import snowwar._Str_496.Game2TeamPlayerData;
	import snowwar._Str_496.Game2TeamScoreData;
	import snowwar._Str_496._SafeStr_4018;
	import snowwar._Str_496._SafeStr_4032;
	import snowwar.SnowWarEngine;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

    public class GameEndingViewController implements IDisposable, IAvatarImageListener, IVideoOfferLauncher 
    {
        private static const _SafeStr_18873:uint = 2;
        private static const _SafeStr_18874:int = 0;
        private static const _SafeStr_18875:int = 1;
        private static const _SafeStr_18876:int = 2;
        private static const _SafeStr_18877:int = 3;
        private static const _SafeStr_18878:int = 4;
        private static const _SafeStr_18879:int = 5;
        private static const _SafeStr_18751:int = 0;
        private static const _SafeStr_18752:int = 1;
        private static const _SafeStr_18753:int = 2;

        private var _SafeStr_9274:IWindowContainer;
        private var _SafeStr_18579:SnowWarEngine;
        private var _SafeStr_5041:Boolean = false;
        private var _SafeStr_18880:Array;
        private var _SafeStr_13149:Dictionary;
        private var _SafeStr_18793:GameLoadingViewController;
        private var _SafeStr_18872:Game2GameResult;
        private var _SafeStr_18584:Timer;
        private var _SafeStr_5217:int = 0;
        private var _SafeStr_5998:int = 0;
        private var _SafeStr_18881:Map;
        private var _SafeStr_18882:Map;
        private var _SafeStr_18761:int = 0;
        private var _SafeStr_18762:int = -1;

        public function GameEndingViewController(k:SnowWarEngine, _arg_2:Array, _arg_3:Game2SnowWarGameStats, _arg_4:Game2GameResult, _arg_5:int)
        {
            var teamScoreData:Game2TeamScoreData;
            var _local_7:ITextWindow;
            super();
            this._SafeStr_18880 = _arg_2;
            this._SafeStr_13149 = new Dictionary();
            this._SafeStr_18579 = k;
            this._SafeStr_18872 = _arg_4;
            this._SafeStr_18882 = new Map();
            this._SafeStr_18761 = ((this._SafeStr_18579.config.getBoolean("games.buy.x.games.enabled")) ? _SafeStr_18752 : _SafeStr_18751);
            if (((this._SafeStr_18579.catalog.videoOffers.enabled) && (this._SafeStr_18579.config.getBoolean("games.buy.x.games.video.enabled"))))
            {
                this._SafeStr_18761 = _SafeStr_18753;
                this._SafeStr_18579.catalog.videoOffers.load(this);
            }
            k.roomUI.visible = false;
            k.windowManager.getDesktop(1).visible = false;
            this._SafeStr_18793 = new GameLoadingViewController(this._SafeStr_18579);
            this._SafeStr_18793.background.visible = true;
            this._SafeStr_14365();
            for each (teamScoreData in _arg_2)
            {
                this._SafeStr_18886(teamScoreData);
            }
            _local_7 = (this.findChildByName(this._SafeStr_9274, "endingInformation") as ITextWindow);
            if (this._SafeStr_18872.resultType == Game2GameResult._SafeStr_18781)
            {
                WindowUtils._Str_26442(_local_7.parent, this._SafeStr_18894());
                WindowUtils._Str_4180(_local_7, "${snowwar.result.tie}");
            }
            else
            {
                WindowUtils._Str_26442(_local_7.parent, this._SafeStr_18895(this._SafeStr_18872._SafeStr_18785));
                WindowUtils._Str_4180(_local_7, ((("$" + "{snowwar.team_") + this._SafeStr_18872._SafeStr_18785) + "_wins}"));
            }
            this._SafeStr_18891(_arg_3._SafeStr_18905);
            this._SafeStr_18892(_arg_3._SafeStr_18906);
            this._SafeStr_18899(_arg_5);
            if (this._SafeStr_18579._SafeStr_13223)
            {
                WindowUtils._Str_26294(this._SafeStr_9274, "statusContainer");
            }
            else
            {
                WindowUtils._Str_26291(this._SafeStr_9274, "statusContainer");
                this._SafeStr_18579.communication.connection.send(new _SafeStr_3624(HabboGames._SafeStr_7697));
            }
            this._SafeStr_13277();
        }

        public function dispose():void
        {
            var k:SnowWarAnimatedWindowElement;
            this._SafeStr_18579.windowManager.getDesktop(1).visible = true;
            this._SafeStr_18885();
            if (this._SafeStr_18882)
            {
                for each (k in this._SafeStr_18882)
                {
                    k.dispose();
                }
                this._SafeStr_18882.dispose();
                this._SafeStr_18882 = null;
            }
            if (this._SafeStr_18793)
            {
                this._SafeStr_18793.dispose();
                this._SafeStr_18793 = null;
            }
            if (this._SafeStr_9274 != null)
            {
                this._SafeStr_9274.dispose();
                this._SafeStr_9274 = null;
            }
            this._SafeStr_18880 = null;
            this._SafeStr_13149 = null;
            this._SafeStr_18872 = null;
            this._SafeStr_5041 = true;
        }

        public function get disposed():Boolean
        {
            return this._SafeStr_5041;
        }

        private function _SafeStr_14365():void
        {
            this._SafeStr_9274 = (WindowUtils.createWindow("snowwar_ending") as IWindowContainer);
            this._SafeStr_9274.x = ((this._SafeStr_9274.desktop.width - this._SafeStr_9274.width) / 2);
            this._SafeStr_9274.y = ((this._SafeStr_9274.desktop.height > 685) ? 115 : 10);
            this._SafeStr_9274.findChildByName("leave_link_region").procedure = this._SafeStr_16837;
            this._SafeStr_9274.findChildByName("button_rematch").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18883);
            this._SafeStr_9274.findChildByName("button_play_again").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18884);
            this._SafeStr_9274.findChildByName("button_buy_games").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18765);
            this._SafeStr_9274.findChildByName("button_watch_video").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18765);
            this._SafeStr_9274.findChildByName("loadingContainer").visible = false;
            this._SafeStr_9274.findChildByName("statusContainer").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18770);
        }

        private function _SafeStr_18883(k:WindowMouseEvent=null, _arg_2:IWindow=null):void
        {
            var _local_3:IWindow;
            if (this._SafeStr_18579._SafeStr_13224 == 0)
            {
                this._SafeStr_18770(k);
            }
            else
            {
                this._SafeStr_5998 = _SafeStr_18875;
                this._SafeStr_18579._SafeStr_13215();
                _local_3 = this._SafeStr_9274.findChildByName("button_rematch");
                _local_3.color = 0xCCCCCC;
                _local_3.disable();
                this._SafeStr_9274.findChildByName("statusContainer").visible = false;
            }
        }

        private function _SafeStr_18884(k:WindowEvent=null, _arg_2:IWindow=null):void
        {
            this._SafeStr_18579._SafeStr_13185();
            this._SafeStr_9274.findChildByName("button_play_again").visible = false;
            this._SafeStr_9274.findChildByName("statusContainer").visible = false;
        }

        private function _SafeStr_18765(k:WindowMouseEvent):void
        {
            this._SafeStr_18770(k);
        }

        private function _SafeStr_18772():void
        {
            var k:IWindow = this._SafeStr_9274.findChildByName("button_rematch");
            var _local_2:IWindow = this._SafeStr_9274.findChildByName("button_buy_games");
            var _local_3:IWindow = this._SafeStr_9274.findChildByName("button_watch_video");
            var _local_4:IWindow = this._SafeStr_9274.findChildByName("status.text_get_vip");
            var _local_5:IWindow = this._SafeStr_9274.findChildByName("status.text_get_more_games");
            var _local_6:IWindow = this._SafeStr_9274.findChildByName("status.text_watch_video");
            k.visible = false;
            _local_2.visible = false;
            _local_3.visible = false;
            _local_4.visible = false;
            _local_5.visible = false;
            _local_6.visible = false;
            switch (this._SafeStr_18761)
            {
                case _SafeStr_18752:
                    if (this._SafeStr_18579._SafeStr_13224 == 0)
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
                    if (this._SafeStr_18579._SafeStr_13224 == 0)
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

        private function _SafeStr_16837(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._SafeStr_9859(true);
        }

        public function _SafeStr_9859(k:Boolean):void
        {
            if (k)
            {
                this._SafeStr_18579._SafeStr_13222(true);
                if (((this._SafeStr_5998 == _SafeStr_18877) || (this._SafeStr_5998 == _SafeStr_18876)))
                {
                    this._SafeStr_18579.communication.connection.send(new _SafeStr_3813());
                    if (this._SafeStr_18579.rejoinRoom > -1)
                    {
                        this._SafeStr_18579.communication.connection.send(new _Str_3570(this._SafeStr_18579.rejoinRoom, false, true));
                    }
                }
                else
                {
                    if (this._SafeStr_5998 == _SafeStr_18879)
                    {
                        if (this._SafeStr_18579.rejoinRoom > -1)
                        {
                            this._SafeStr_18579.communication.connection.send(new _Str_3570(this._SafeStr_18579.rejoinRoom, false, true));
                        }
                        else
                        {
                            this._SafeStr_18579.communication.connection.send(new _SafeStr_3665());
                        }
                    }
                    else
                    {
                        this._SafeStr_18579.communication.connection.send(new _SafeStr_3665());
                    }
                }
                this._SafeStr_18885();
            }
        }

        private function _SafeStr_18885():void
        {
            if (this._SafeStr_18584)
            {
                this._SafeStr_18584.removeEventListener(TimerEvent.TIMER, this._SafeStr_18589);
                this._SafeStr_18584.stop();
                this._SafeStr_18584 = null;
                this._SafeStr_5217 = 0;
            }
        }

        private function _SafeStr_18886(k:Game2TeamScoreData):void
        {
            var _local_3:Game2TeamPlayerData;
            var _local_2:int = k._SafeStr_18907;
            for each (_local_3 in k._SafeStr_13266)
            {
                this._SafeStr_18887(_local_3);
            }
            WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, (("team" + _local_2) + "Score")), k.score.toString());
        }

        private function _SafeStr_18887(k:Game2TeamPlayerData):void
        {
            this._SafeStr_13149[k.userId] = k;
            var _local_2:IItemListWindow = (this._SafeStr_9274.findChildByName((("team" + k.final) + "PlayersList")) as IItemListWindow);
            var _local_3:IItemListWindow = (WindowUtils.createWindow(("snowwar_results_player_team_" + k.final)) as IItemListWindow);
            var _local_4:IWindowContainer = (_local_3.getListItemByName("playerImageContainer") as IWindowContainer);
            var _local_5:IWindowContainer = (_local_3.getListItemByName("playerDataContainer") as IWindowContainer);
            var _local_6:IWindowContainer = (_local_3.getListItemByName("playerScoreContainer") as IWindowContainer);
            WindowUtils._Str_2972(this.findChildByName(_local_4, "playerImage"), this._SafeStr_18801(k.final, k.figure, k.gender), 0, 0, 0);
            WindowUtils._Str_4180(this.findChildByName(_local_5, "playerName"), k.userName);
            WindowUtils._Str_26294(_local_5, "playerTotalStats");
            WindowUtils._Str_4180(this.findChildByName(_local_5, "playerHits"), k.playerStats._SafeStr_18908.toString());
            WindowUtils._Str_4180(this.findChildByName(_local_5, "playerKills"), k.playerStats._SafeStr_18909.toString());
            WindowUtils._Str_4180(this.findChildByName(_local_6, "playerScore"), k.score.toString());
            var _local_7:IWindowContainer = (_local_4.findChildByName("addFriend") as IWindowContainer);
            if (((this._SafeStr_18579.friendList.canBeAskedForAFriend(k.userId)) && (!(k.userId == this._SafeStr_18579.sessionDataManager.userId))))
            {
                _local_7.id = k.userId;
                _local_7.getChildAt(0).id = k.final;
                _local_7.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18888);
                _local_7.addEventListener(WindowMouseEvent.OVER, this._SafeStr_18889);
                _local_7.addEventListener(WindowMouseEvent.OUT, this._SafeStr_18890);
                _local_7.visible = true;
            }
            _local_2.addListItem(_local_3);
            _local_3.name = ("player" + k.userId);
        }

        private function _SafeStr_18888(k:WindowMouseEvent):void
        {
            var _local_2:int = k.window.id;
            var _local_3:Game2TeamPlayerData = this._SafeStr_13149[_local_2];
            if (_local_3)
            {
                this._SafeStr_18579.friendList._Str_14642(_local_2, _local_3.userName);
                this._SafeStr_18579.communication.connection.send(new _SafeStr_1434("GameFramework", "SnowStorm", "gameFramework.sendFriendRequest.rematchView"));
                this._SafeStr_18579._SafeStr_13216(_local_2, "${snowwar.friend_request.sent}", true);
            }
            k.window.visible = false;
        }

        private function _SafeStr_18889(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.window as IWindowContainer).getChildAt(0);
            WindowUtils._Str_2972(_local_2, this._SafeStr_12987("add_friend_icon_green"));
        }

        private function _SafeStr_18890(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.window as IWindowContainer).getChildAt(0);
            var _local_3:String = ("add_friend_icon_" + ((_local_2.id == 1) ? "blue" : "red"));
            WindowUtils._Str_2972(_local_2, this._SafeStr_12987(_local_3));
        }

        private function _SafeStr_18891(k:int):void
        {
            var _local_2:Game2TeamPlayerData = this._SafeStr_13149[k];
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IWindowContainer = (this._SafeStr_9274.findChildByName("mostHitsContainer") as IWindowContainer);
            if (_local_2.playerStats._SafeStr_18908 == 0)
            {
                _local_3.visible = false;
                return;
            }
            WindowUtils._Str_2972(this.findChildByName(_local_3, "backgroundImage"), this._SafeStr_12987(this.squareNameForTeam(_local_2.final)));
            WindowUtils._Str_2972(this.findChildByName(_local_3, "playerImage"), this._SafeStr_18801(_local_2.final, _local_2.figure, _local_2.gender), 0, 0, 0);
            WindowUtils._Str_4180(this.findChildByName(_local_3, "playerName"), _local_2.userName);
            WindowUtils._Str_26442(_local_3, this._SafeStr_18895(_local_2.final));
        }

        private function _SafeStr_18892(k:int):void
        {
            var _local_2:Game2TeamPlayerData = this._SafeStr_13149[k];
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IWindowContainer = (this._SafeStr_9274.findChildByName("mostKillsContainer") as IWindowContainer);
            if (_local_2.playerStats._SafeStr_18909 == 0)
            {
                _local_3.visible = false;
                return;
            }
            WindowUtils._Str_2972(this.findChildByName(_local_3, "backgroundImage"), this._SafeStr_12987(this.squareNameForTeam(_local_2.final)));
            WindowUtils._Str_2972(this.findChildByName(_local_3, "playerImage"), this._SafeStr_18801(_local_2.final, _local_2.figure, _local_2.gender), 0, 0, 0);
            WindowUtils._Str_4180(this.findChildByName(_local_3, "playerName"), _local_2.userName);
            WindowUtils._Str_26442(_local_3, this._SafeStr_18895(_local_2.final));
        }

        private function squareNameForTeam(k:int):String
        {
            var squareName:String;
            switch (k)
            {
                case 1:
                    squareName = "blue_square";
                    break;
                case 2:
                    squareName = "red_square";
                    break;
                default:
                    squareName = "blue_square";
            }
            return squareName;
        }

        private function _SafeStr_18894():uint
        {
            return 8227482;
        }

        private function _SafeStr_18895(k:int):uint
        {
            switch (k)
            {
                case 1:
                    return 4279269292;
                case 2:
                    return 4294797401;
            }
            return 4279269292;
        }

        private function _SafeStr_18896(k:int):uint
        {
            switch (k)
            {
                case 1:
                    return 2;
                case 2:
                    return 4;
            }
            return 2;
        }

        private function _SafeStr_18801(k:int, _arg_2:String, _arg_3:String):BitmapData
        {
            var _local_5:BitmapData;
            var _local_4:IAvatarFigureContainer = this._SafeStr_18579.avatarRenderManager._Str_718(_arg_2);
            switch (k)
            {
                case 1:
                    _local_4._Str_830("ch", 20000, [1]);
                    break;
                case 2:
                    _local_4._Str_830("ch", 20001, [1]);
                    break;
                default:
                    _local_4._Str_830("ch", 20000, [1]);
            }
            var _local_6:IAvatarImage = this._SafeStr_18579.avatarRenderManager.createAvatarImage(_local_4.getFigureString(), AvatarScaleType.SMALL, _arg_3, this);
            if (_local_6)
            {
                _local_6.setDirection(AvatarSetType.FULL, this._SafeStr_18896(k));
                return _local_6._Str_818(AvatarSetType.FULL);
            }
            return _local_5;
        }

        private function findChildByName(k:IWindowContainer, _arg_2:String):IWindow
        {
            return (k != null) ? k.findChildByName(_arg_2) : null;
        }

        private function _SafeStr_12987(k:String):BitmapData
        {
            var _local_2:IAsset = this._SafeStr_18579.assets.getAssetByName(k);
            if (_local_2)
            {
                return _local_2.content as BitmapData;
            }
            return null;
        }

        public function _Str_840(k:String):void
        {
        }

        public function rematchPlayer(id:int):void
        {
            var _local_6:SnowWarAnimatedWindowElement;
            var _local_2:IItemListWindow = (this._SafeStr_9274.findChildByName(("player" + id)) as IItemListWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:Game2TeamPlayerData = this._SafeStr_13149[id];
            if (_local_3 == null)
            {
                return;
            }
            _local_3._SafeStr_18910 = true;
            var _local_4:IWindowContainer = (_local_2.getListItemByName("playerScoreContainer") as IWindowContainer);
            var _local_5:IBitmapWrapperWindow = (this.findChildByName(_local_4, "playerScoreGlow") as IBitmapWrapperWindow);
            if (!this._SafeStr_18882.hasKey(_local_5))
            {
                _local_6 = new SnowWarAnimatedWindowElement(this._SafeStr_18579.assets, _local_5, "rematch_", 6, 100, true);
                this._SafeStr_18882.add(_local_5, _local_6);
            }
        }

        public function _SafeStr_13267(k:Boolean):void
        {
            var _local_3:Game2TeamPlayerData;
            var _local_4:int;
            var _local_5:IItemListWindow;
            var _local_6:IItemListWindow;
            var _local_7:IWindowContainer;
            var _local_8:IWindowContainer;
            if (!k)
            {
                return this._SafeStr_18897();
            }
            this._SafeStr_5998 = _SafeStr_18876;
            this._SafeStr_18900();
            var _local_2:Array = [];
            for each (_local_3 in this._SafeStr_13149)
            {
                _local_5 = (this._SafeStr_9274.findChildByName((("team" + _local_3.final) + "PlayersList")) as IItemListWindow);
                _local_6 = (this._SafeStr_9274.findChildByName(("player" + _local_3.userId)) as IItemListWindow);
                if (_local_6 == null)
                {
                    return;
                }
                if (!_local_3._SafeStr_18910)
                {
                    _local_5.removeListItem(_local_6);
                    _local_2.push(_local_3.userId);
                }
                else
                {
                    _local_7 = (_local_6.getListItemByName("playerDataContainer") as IWindowContainer);
                    _local_8 = (_local_6.getListItemByName("playerScoreContainer") as IWindowContainer);
                    _local_7.findChildByName("playerStats").visible = false;
                    WindowUtils._Str_4180(this.findChildByName(_local_7, "playerName"), _local_3.userName);
                    WindowUtils._Str_26294(_local_8, "playerScore");
                }
            }
            for each (_local_4 in _local_2)
            {
                delete this._SafeStr_13149[_local_4];
            }
            WindowUtils._Str_26294(this._SafeStr_9274, "buttonsContainer");
            WindowUtils._Str_26294(this._SafeStr_9274, "mostKillsContainer");
            WindowUtils._Str_26294(this._SafeStr_9274, "mostHitsContainer");
            WindowUtils._Str_26294(this._SafeStr_9274, "team1Score");
            WindowUtils._Str_26294(this._SafeStr_9274, "team2Score");
            WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, "endingInformation"), "${snowwar.lobby_waiting_for_more_players}");
        }

        private function _SafeStr_18897():void
        {
            var _local_2:SnowWarAnimatedWindowElement;
            this._SafeStr_5998 = _SafeStr_18879;
            if (this._SafeStr_18882)
            {
                for each (_local_2 in this._SafeStr_18882)
                {
                    _local_2.dispose();
                }
                this._SafeStr_18882.reset();
            }
            this._SafeStr_18904();
            if (this._SafeStr_18579._SafeStr_13224 == 0)
            {
                return;
            }
            this._SafeStr_9274.findChildByName("button_rematch").visible = false;
            this._SafeStr_9274.findChildByName("button_play_again").visible = true;
            var k:IWindow = this._SafeStr_9274.findChildByName("button_play_again");
            k.enable();
            k.color = 0x55CC00;
        }

        private function _SafeStr_18592():void
        {
            if (this._SafeStr_5041)
            {
                return;
            }
            var k:ITextWindow = (this._SafeStr_9274.findChildByName("endingInformation") as ITextWindow);
            var _local_2:ITextWindow = (this._SafeStr_9274.findChildByName("endingInformation_stroke") as ITextWindow);
            k.fontSize = 28;
            _local_2.fontSize = 28;
            if (this._SafeStr_18579._SafeStr_13224 == 0)
            {
                WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, "button_rematch"), "${catalog.vip.buy.title}");
            }
            else
            {
                if (this._SafeStr_5998 == _SafeStr_18874)
                {
                    this._SafeStr_18579.localization.registerParameter("snowwar.rematch", "seconds", this._SafeStr_5217.toString());
                    WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, "button_rematch"), "${snowwar.rematch}");
                }
                else
                {
                    if (this._SafeStr_5998 == _SafeStr_18875)
                    {
                        this._SafeStr_18579.localization.registerParameter("snowwar.please_wait", "seconds", this._SafeStr_5217.toString());
                        WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, "button_rematch"), "${snowwar.please_wait}");
                    }
                    else
                    {
                        if (this._SafeStr_5998 == _SafeStr_18877)
                        {
                            this._SafeStr_18579.localization.registerParameter("snowwar.lobby_game_start_countdown", "seconds", this._SafeStr_5217.toString());
                            WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, "endingInformation"), "${snowwar.lobby_game_start_countdown}");
                            k.fontSize = 22;
                            _local_2.fontSize = 22;
                        }
                        else
                        {
                            if (this._SafeStr_5998 == _SafeStr_18876)
                            {
                                WindowUtils._Str_4180(this.findChildByName(this._SafeStr_9274, "endingInformation"), "${snowwar.lobby_waiting_for_more_players}");
                                k.fontSize = 22;
                                _local_2.fontSize = 22;
                            }
                        }
                    }
                }
            }
        }

        private function _SafeStr_18898(k:int):void
        {
            this._SafeStr_18885();
            this._SafeStr_18584 = new Timer(1000, k);
            this._SafeStr_18584.addEventListener(TimerEvent.TIMER, this._SafeStr_18589);
            this._SafeStr_18584.start();
            this._SafeStr_5217 = k;
        }

        private function _SafeStr_18589(k:TimerEvent):void
        {
            if (((this._SafeStr_5217) && (this._SafeStr_5217 > 0)))
            {
                this._SafeStr_5217--;
                HabboGamesCom.log(("On results window tick " + this._SafeStr_5217));
                this._SafeStr_18592();
            }
        }

        private function _SafeStr_18899(k:int):void
        {
            this._SafeStr_18898(k);
            this._SafeStr_18592();
        }

        private function _SafeStr_18900():void
        {
            this._SafeStr_18885();
            this._SafeStr_18592();
        }

        public function _SafeStr_13268(k:int):void
        {
            this._SafeStr_5998 = _SafeStr_18877;
            this._SafeStr_18898(k);
            this._SafeStr_18592();
        }

        public function _SafeStr_18901():void
        {
            this._SafeStr_18885();
            this._SafeStr_18592();
        }

        public function _SafeStr_13271(k:_SafeStr_4018):void
        {
            var _local_3:Game2TeamPlayerData;
            var _local_4:int;
            var _local_5:IItemListWindow;
            var _local_6:IItemListWindow;
            this._SafeStr_5998 = _SafeStr_18877;
            this._SafeStr_18881 = new Map();
            var _local_2:Array = [];
            for each (_local_3 in this._SafeStr_13149)
            {
                _local_5 = (this._SafeStr_9274.findChildByName((("team" + _local_3.final) + "PlayersList")) as IItemListWindow);
                _local_6 = (this._SafeStr_9274.findChildByName(("player" + _local_3.userId)) as IItemListWindow);
                if (_local_6 == null)
                {
                    return;
                }
                _local_5.removeListItem(_local_6);
                _local_2.push(_local_3.userId);
            }
            for each (_local_4 in _local_2)
            {
                delete this._SafeStr_13149[_local_4];
            }
            this._SafeStr_9274.findChildByName("loadingContainer").visible = true;
            WindowUtils._Str_26294((this._SafeStr_9274.findChildByName("loadingContainer") as IWindowContainer), "loadingText");
            WindowUtils._Str_4180(this._SafeStr_9274.findChildByName("arenaName"), this._SafeStr_18579.gameArenaName(k));
            WindowUtils._Str_26442(this.findChildByName(this._SafeStr_9274, "headerContainer"), this._SafeStr_18895(1));
            WindowUtils._Str_2972(this._SafeStr_9274.findChildByName("arenaPreview"), this._SafeStr_12987((("arena_" + k.fieldName) + "_preview")));
        }

        public function _SafeStr_13272(k:_SafeStr_4032):void
        {
            if (k)
            {
                this._SafeStr_18881.add(k.userId, k);
                this._SafeStr_18902();
            }
        }

        public function _SafeStr_13276(k:int):void
        {
            var _local_2:_SafeStr_4032 = this._SafeStr_18881[k];
            if (_local_2 != null)
            {
                this._SafeStr_18881.remove(k);
            }
            this._SafeStr_18902();
        }

        private function _SafeStr_18902():void
        {
            var _local_2:_SafeStr_4032;
            this._SafeStr_18797();
            var k:Array = this._SafeStr_18881.getValues();
            if (((!(this._SafeStr_5998 == _SafeStr_18874)) && (!(this._SafeStr_5998 == _SafeStr_18875))))
            {
                k.sort(_SafeStr_4032._SafeStr_18802);
            }
            for each (_local_2 in k)
            {
                this._SafeStr_18903(_local_2);
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

        private function _SafeStr_18903(k:_SafeStr_4032):void
        {
            HabboGamesCom.log(("Add Lobby Player: " + [k.name, k.userId, k.final]));
            var _local_2:int = ((this._SafeStr_18881.getKeys().indexOf(k.userId) % _SafeStr_18873) + 1);
            var _local_3:IItemListWindow = (this._SafeStr_9274.findChildByName((("team" + _local_2) + "PlayersList")) as IItemListWindow);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:IItemListWindow = (WindowUtils.createWindow(("snowwar_lobby_player_team_" + _local_2)) as IItemListWindow);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IWindowContainer = (_local_4.getListItemByName("playerImageContainer") as IWindowContainer);
            var _local_6:IWindowContainer = (_local_4.getListItemByName("playerDataContainer") as IWindowContainer);
            var _local_7:IWindowContainer = (_local_4.getListItemByName("playerScoreContainer") as IWindowContainer);
            WindowUtils._Str_2972(this.findChildByName(_local_5, "playerImage"), this._SafeStr_18801(_local_2, k.figure, k.gender));
            WindowUtils._Str_4180(this.findChildByName(_local_6, "playerName"), k.name);
            WindowUtils._Str_26294(_local_6, "playerStats");
            WindowUtils._Str_26294(_local_7, "playerScore");
            WindowUtils._Str_26294(_local_6, "playerTotalStats");
            var _local_8:IBitmapWrapperWindow = (_local_6.findChildByName("skillLevel") as IBitmapWrapperWindow);
            if (_local_8.bitmap)
            {
                _local_8.bitmap.dispose();
            }
            _local_8.bitmap = this._SafeStr_18799(k.skillLevel, _local_2);
            var _local_9:IRegionWindow = (_local_6.findChildByName("scoreTooltip") as IRegionWindow);
            _local_9._Str_2613 = ((k._SafeStr_17897.toString() + "/") + k._SafeStr_18803.toString());
            _local_9.visible = true;
            _local_3.addListItem(_local_4);
        }

        private function _SafeStr_18799(k:int, _arg_2:int):BitmapData
        {
            var _local_8:BitmapData;
            var _local_11:Point;
            k = Math.min(k, 30);
            var _local_3:BitmapData = (this._SafeStr_18579.assets.getAssetByName("star_empty").content as BitmapData);
            var _local_4:BitmapData = (this._SafeStr_18579.assets.getAssetByName("star_filled_bronze").content as BitmapData);
            var _local_5:BitmapData = (this._SafeStr_18579.assets.getAssetByName("star_filled_silver").content as BitmapData);
            var _local_6:BitmapData = (this._SafeStr_18579.assets.getAssetByName("star_filled_gold").content as BitmapData);
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

        public function _SafeStr_13277():void
        {
            var _local_3:ITextWindow;
            var _local_4:IWindow;
            var k:IWindowContainer = (this._SafeStr_9274.findChildByName("buttonsContainer") as IWindowContainer);
            var _local_2:IWindowContainer = (this._SafeStr_9274.findChildByName("statusContainer") as IWindowContainer);
            if (((_local_2) && (k)))
            {
                k.visible = true;
                WindowUtils._Str_4180(_local_2.findChildByName("games_left"), this._SafeStr_18579._SafeStr_13224.toString());
                _local_3 = (_local_2.findChildByName("games_left_stroke") as ITextWindow);
                _local_4 = this._SafeStr_9274.findChildByName("button_rematch");
                this._SafeStr_18772();
                if (this._SafeStr_18579._SafeStr_13223)
                {
                    _local_4.enable();
                    _local_4.color = 0x55CC00;
                    _local_2.visible = false;
                    return;
                }
                switch (this._SafeStr_18579._SafeStr_13224)
                {
                    case -1:
                        _local_4.enable();
                        _local_4.color = 0x55CC00;
                        _local_2.visible = false;
                        return;
                    case 0:
                        _local_3.textColor = 0xFF0000;
                        _local_4.enable();
                        _local_4.color = 0x55CC00;
                        return;
                    default:
                        _local_3.textColor = 1079212;
                        _local_4.enable();
                        _local_4.color = 0x55CC00;
                }
            }
        }

        private function _SafeStr_18770(k:WindowMouseEvent):void
        {
            switch (this._SafeStr_18761)
            {
                case _SafeStr_18752:
                    this._SafeStr_18579._SafeStr_13226("gameFramework.buyTokens.clicked.rematchView");
                    return;
                case _SafeStr_18753:
                    if (!this._SafeStr_18579._SafeStr_13227("gameFramework.videoOffer.clicked.rematchView"))
                    {
                        this._SafeStr_18761 = _SafeStr_18751;
                        this._SafeStr_18772();
                    }
                    return;
                default:
                    this._SafeStr_9859(true);
                    this._SafeStr_18579._SafeStr_7664("gameFramework.getVip.clicked.rematchView");
            }
        }

        private function _SafeStr_18904():void
        {
            this._SafeStr_18579.roomUI._Str_25327(RoomWidgetEnum.CHAT_INPUT_WIDGET);
        }

        public function offersAvailable(k:int):void
        {
            this._SafeStr_18762 = k;
            if (this._SafeStr_18762 < 1)
            {
                this._SafeStr_18761 = _SafeStr_18751;
            }
            if (this._SafeStr_9274)
            {
                this._SafeStr_18772();
            }
        }
    }
}


























































































































































