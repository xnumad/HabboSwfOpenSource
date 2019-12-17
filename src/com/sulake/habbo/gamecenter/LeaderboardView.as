package com.sulake.habbo.gamecenter
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.game.WindowUtils;
    import com.sulake.habbo.communication.messages.incoming.game.score._Str_8022;
    import com.sulake.habbo.communication.messages.incoming.game.score._Str_5142;
    import com.sulake.habbo.communication.messages.outgoing._Str_356._Str_5198;
    import com.sulake.habbo.communication.messages.outgoing._Str_356._Str_11321;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_3326;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class LeaderboardView implements IDisposable, IAvatarImageListener, IGameRewardListener 
    {
        private static const GAME_CENTER_LEADERBOARD_VIEW_XML:String = "game_center_leaderboard_view_xml";
        private static const _Str_18486:uint = 4290888129;
        private static const _Str_16286:uint = 4292664540;
        private static const _Str_13218:uint = 0xFFFFFFFF;

        private var _disposed:Boolean;
        private var _initialized:Boolean;
        private var _gameCenterView:GameCenterView;
        private var _leaderboardDialog:_Str_2784;
        private var _leaderboardWindow:IWindowContainer;
        private var _entryWindow:IWindowContainer;
        private var _thisWeekList:IItemListWindow;
        private var _thisWeekToggle:ITextLinkWindow;
        private var _lastWeekList:IItemListWindow;
        private var _ownEntryList:IItemListWindow;
        private var _selectedGame:int;
        private var _waitingRewardFurniId:int;
        private var _waitingWeeklyTopFigure:String;
        private var _thisWeekTopScoresMode:Boolean = false;

        public function LeaderboardView(k:GameCenterView)
        {
            this._gameCenterView = k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._leaderboardDialog)
            {
                this._leaderboardDialog.dispose();
                this._leaderboardDialog = null;
            }
            if (this._entryWindow)
            {
                this._entryWindow.dispose();
                this._entryWindow = null;
            }
            if (this._thisWeekToggle)
            {
                this._thisWeekToggle.removeEventListener(WindowMouseEvent.CLICK, this._Str_21106);
            }
            this._thisWeekList = null;
            this._lastWeekList = null;
            this._ownEntryList = null;
            this._thisWeekToggle = null;
            this._gameCenterView = null;
            this._disposed = true;
            this._initialized = false;
        }

        public function activate(k:int):void
        {
            this._selectedGame = k;
            if (!this._leaderboardDialog)
            {
                this.createWindow();
            }
            this._leaderboardWindow.invalidate();
            this._leaderboardWindow.visible = true;
            this._Str_6199();
        }

        public function disable():void
        {
            if (!this._leaderboardDialog)
            {
                return;
            }
            this._leaderboardDialog.dispose();
            this._leaderboardDialog = null;
            this._leaderboardWindow = null;
        }

        public function _Str_18157(k:int):void
        {
            if (((this._leaderboardWindow) && (this._leaderboardWindow.visible)))
            {
                this.activate(k);
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.disable();
        }

        private function createWindow():void
        {
            var k:IAsset = this._gameCenterView.assets.getAssetByName(GAME_CENTER_LEADERBOARD_VIEW_XML);
            var _local_2:XmlAsset = XmlAsset(k);
            this._leaderboardDialog = this._gameCenterView.windowManager.buildModalDialogFromXML(XML(_local_2.content));
            this._leaderboardWindow = (this._leaderboardDialog._Str_2429 as IWindowContainer);
            this._leaderboardWindow.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            this._thisWeekList = (this._leaderboardWindow.findChildByName("this_week_list") as IItemListWindow);
            this._thisWeekToggle = (this._leaderboardWindow.findChildByName("this_week_toggle") as ITextLinkWindow);
            this._thisWeekToggle.addEventListener(WindowMouseEvent.CLICK, this._Str_21106);
            this._lastWeekList = (this._leaderboardWindow.findChildByName("last_week_list") as IItemListWindow);
            this._ownEntryList = (this._leaderboardWindow.findChildByName("own_entry_list") as IItemListWindow);
            var _local_3:IWindowContainer = (this._leaderboardWindow.findChildByName("weekly_top_container") as IWindowContainer);
            if (_local_3 != null)
            {
                _local_3.visible = false;
            }
            if (!this._initialized)
            {
                this._entryWindow = (WindowUtils.createWindow("game_leaderboard_entry_small_xml") as IWindowContainer);
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new _Str_8022(this._Str_23035));
                this._gameCenterView.communication.addHabboConnectionMessageEvent(new _Str_5142(this._Str_25832));
                this._initialized = true;
            }
        }

        private function _Str_6199():void
        {
            this._Str_20297(null);
            this._leaderboardWindow.findChildByName("weekly_top_avatar_name").caption = "";
            this._leaderboardWindow.findChildByName("weekly_top_avatar_score").caption = "";
            this._leaderboardWindow.findChildByName("weekly_top_avatar_score").caption = "";
            this._gameCenterView.registerParameter(this._selectedGame, "gamecenter.full_leaderboard_title");
            this._thisWeekList.destroyListItems();
            this._lastWeekList.destroyListItems();
            this._ownEntryList.destroyListItems();
            this._Str_21845();
            this.send(new _Str_5198(this._selectedGame, 1, 0, 0, 5, 5));
            this._gameCenterView._Str_20681(this);
        }

        private function _Str_21845():void
        {
            if (this._thisWeekTopScoresMode)
            {
                this._thisWeekToggle.caption = "${gamecenter.leaderboard_my_ranking_link}";
                this.send(new _Str_5198(this._selectedGame, 0, 0, 0, 10, 10));
            }
            else
            {
                this._thisWeekToggle.caption = "${gamecenter.leaderboard_top_scores_link}";
                this.send(new _Str_11321(this._selectedGame, 5));
            }
        }

        private function _Str_23035(k:IMessageEvent):void
        {
            if (!this._leaderboardWindow)
            {
                return;
            }
            var _local_2:_Str_8022 = (k as _Str_8022);
            this._Str_17910(this._thisWeekList, _local_2.getParser(), 10, false);
        }

        private function _Str_25832(k:IMessageEvent):void
        {
            var _local_4:_Str_3326;
            var _local_5:_Str_3326;
            if (!this._leaderboardWindow)
            {
                return;
            }
            var _local_2:_Str_5142 = (k as _Str_5142);
            var _local_3:Game2WeeklyLeaderboardParser = _local_2.getParser();
            if (_local_3.currentOffset == 0)
            {
                this._Str_17910(this._thisWeekList, _local_3, 10, true);
            }
            else
            {
                _local_4 = this._Str_17910(this._lastWeekList, _local_3, 5, true);
                if (_local_4)
                {
                    this._Str_20301(this._ownEntryList, _local_4, _Str_13218);
                }
                if (_local_3.leaderboard.length > 0)
                {
                    _local_5 = (_local_3.leaderboard[0] as _Str_3326);
                    this._Str_20814(_local_5.figure, _local_5.gender);
                    this._leaderboardWindow.findChildByName("weekly_top_avatar_name").caption = _local_5.name;
                    this._leaderboardWindow.findChildByName("weekly_top_avatar_score").caption = this._gameCenterView.localization.registerParameter("gamecenter.leaderboard_score", "score", _local_5.score.toString());
                }
            }
        }

        private function _Str_17910(k:IItemListWindow, _arg_2:Game2WeeklyLeaderboardParser, _arg_3:int, _arg_4:Boolean):_Str_3326
        {
            var _local_5:_Str_3326;
            var _local_6:IWindowContainer;
            var _local_7:int;
            var _local_8:_Str_3326;
            var _local_9:uint;
            if (((k) && (_arg_2.gameTypeId == this._selectedGame)))
            {
                k.destroyListItems();
                _local_6 = (WindowUtils.createWindow("game_leaderboard_entry_small_xml") as IWindowContainer);
                _local_7 = 1;
                for each (_local_8 in _arg_2.leaderboard)
                {
                    if ((((_arg_4) && (_local_7 == _arg_2.leaderboard.length)) && (_local_8.userId == this._gameCenterView.sessionDataManager.userId)))
                    {
                        _local_5 = _local_8;
                        break;
                    }
                    if (_local_7 > _arg_3)
                    {
                        break;
                    }
                    if (_local_8.userId == this._gameCenterView.sessionDataManager.userId)
                    {
                        _local_9 = _Str_13218;
                    }
                    else
                    {
                        if ((_local_7 % 2) == 0)
                        {
                            _local_9 = _Str_16286;
                        }
                        else
                        {
                            _local_9 = _Str_18486;
                        }
                    }
                    this._Str_20301(k, _local_8, _local_9);
                    _local_7++;
                }
                return _local_5;
            }
            return null;
        }

        private function _Str_20301(k:IItemListWindow, _arg_2:_Str_3326, _arg_3:uint):void
        {
            var _local_4:IWindowContainer = (this._entryWindow.clone() as IWindowContainer);
            _local_4.color = _arg_3;
            _local_4.findChildByName("avatar_rank").caption = (_arg_2.rank + ". ");
            _local_4.findChildByName("avatar_name").caption = _arg_2.name;
            _local_4.findChildByName("avatar_score").caption = this._gameCenterView.localization.registerParameter("gamecenter.leaderboard_score", "score", _arg_2.score.toString());
            _local_4.name = _arg_2.figure;
            var _local_5:IBitmapWrapperWindow = (_local_4.findChildByName("avatar_image") as IBitmapWrapperWindow);
            this._Str_21627(_local_5, _arg_2.figure, _arg_2.gender);
            k.addListItem(_local_4);
        }

        private function _Str_21106(k:WindowMouseEvent):void
        {
            if (this._thisWeekTopScoresMode)
            {
                this._thisWeekTopScoresMode = false;
            }
            else
            {
                this._thisWeekTopScoresMode = true;
            }
            this._Str_21845();
        }

        private function _Str_21627(k:IBitmapWrapperWindow, _arg_2:String, _arg_3:String=null):void
        {
            var _local_5:BitmapData;
            var _local_4:Boolean = this._gameCenterView._Str_3479.getBoolean("zoom.enabled");
            var _local_6:IAvatarImage = this._gameCenterView.avatarRenderManager.createAvatarImage(_arg_2, ((_local_4) ? AvatarScaleType.LARGE : AvatarScaleType.SMALL), _arg_3, this);
            if (_local_6)
            {
                _local_6.setDirection(AvatarSetType.FULL, 2);
                _local_5 = _local_6._Str_818(AvatarSetType.HEAD, ((_local_4) ? 0.5 : 1));
                WindowUtils._Str_2972(k, _local_5);
                _local_5.dispose();
            }
        }

        public function _Str_840(k:String):void
        {
            this._Str_17941(this._thisWeekList, k);
            this._Str_17941(this._lastWeekList, k);
            this._Str_17941(this._ownEntryList, k);
            this._Str_23178(k);
        }

        private function _Str_17941(k:IItemListWindow, _arg_2:String):void
        {
            var _local_3:int;
            var _local_4:IWindowContainer;
            var _local_5:IBitmapWrapperWindow;
            if (k)
            {
                _local_3 = 0;
                while (_local_3 < k.iterator.length)
                {
                    _local_4 = (k.getListItemAt(_local_3) as IWindowContainer);
                    _local_5 = (_local_4.findChildByName("avatar_image") as IBitmapWrapperWindow);
                    if (_local_4.name == _arg_2)
                    {
                        this._Str_21627(_local_5, _arg_2);
                    }
                    _local_3++;
                }
            }
        }

        private function _Str_23178(k:String):void
        {
            if (this._waitingWeeklyTopFigure == k)
            {
                this._Str_20814(k);
            }
        }

        private function _Str_20814(k:String, _arg_2:String=null):void
        {
            var _local_3:BitmapData;
            var _local_4:IAvatarImage = this._gameCenterView.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, _arg_2, this);
            if (_local_4)
            {
                _local_4.setDirection(AvatarSetType.FULL, 4);
                _local_3 = _local_4._Str_818(AvatarSetType.FULL);
                this._Str_20297(_local_3);
                _local_3.dispose();
            }
        }

        public function _Str_16195(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = (this._leaderboardWindow.findChildByName("weekly_top_reward_image") as IBitmapWrapperWindow);
            this._Str_14846(_local_2, k);
        }

        public function _Str_20140(k:String):void
        {
            this._leaderboardWindow.findChildByName("weekly_top_reward_name").caption = k;
        }

        public function _Str_20559(k:int):void
        {
        }

        public function _Str_18928():int
        {
            return this._selectedGame;
        }

        public function _Str_21957(k:Boolean):void
        {
            this._leaderboardWindow.findChildByName("weekly_top_container").visible = false;
        }

        private function _Str_20297(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = (this._leaderboardWindow.findChildByName("weekly_top_avatar_image") as IBitmapWrapperWindow);
            this._Str_14846(_local_2, k);
        }

        private function _Str_14846(k:IBitmapWrapperWindow, _arg_2:BitmapData):void
        {
            if (_arg_2)
            {
                WindowUtils._Str_2972(k, _arg_2);
            }
            else
            {
                k.bitmap = null;
                k.invalidate();
            }
        }

        public function send(k:IMessageComposer):void
        {
            this._gameCenterView.send(k);
        }
    }
}
