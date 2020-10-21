package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.communication.messages.incoming.sound.OfficialSongIdMessageEvent;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.communication.messages.outgoing.sound.GetOfficialSongIdMessageComposer;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.localization.IHabboLocalizationManager;

    public class SongDiskProductViewCatalogWidget extends ProductViewCatalogWidget 
    {
        private var _soundManager:IHabboSoundManager;
        private var _connection:IConnection;
        private var _playPreviewContainer:IWindowContainer;
        private var _playButton:IButtonWindow;
        private var _songLengthText:IWindow;
        private var _selectedSongId:int = -1;
        private var _officialSongId:String = "";
        private var _timeLocalization:String = "";
        private var _officialSongIdListener:IMessageEvent = null;

        public function SongDiskProductViewCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k, _arg_2);
            this._playButton = (_window.findChildByName("listen") as IButtonWindow);
            this._songLengthText = _window.findChildByName("ctlg_song_length");
            if (this._playButton != null)
            {
                this._playButton.addEventListener(WindowMouseEvent.CLICK, this.onClickPlay);
                this._playButton.disable();
            }
            this._playPreviewContainer = (_window.findChildByName("playPreviewContainer") as IWindowContainer);
            if (this._playPreviewContainer != null)
            {
                this._playPreviewContainer.visible = false;
            }
            this._soundManager = _arg_2.soundManager;
            if (this._soundManager != null)
            {
                this._soundManager.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this.onSongInfoReceivedEvent);
            }
            this._connection = _arg_2.connection;
            if (((this._connection) && (!(this._officialSongIdListener))))
            {
                this._officialSongIdListener = new OfficialSongIdMessageEvent(this.onOfficialSongIdMessageEvent);
                this._connection.addMessageEvent(this._officialSongIdListener);
            }
        }

        override public function dispose():void
        {
            if (this._playButton != null)
            {
                this._playButton.removeEventListener(WindowMouseEvent.CLICK, this.onClickPlay);
            }
            if (((!(this._soundManager == null)) && (!(this._soundManager.musicController == null))))
            {
                this._soundManager.musicController.stop(HabboMusicPrioritiesEnum.PRIORITY_PURCHASE_PREVIEW);
                if (this._soundManager.events != null)
                {
                    this._soundManager.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this.onSongInfoReceivedEvent);
                }
                this._soundManager = null;
                if (((this._connection) && (this._officialSongIdListener)))
                {
                    this._connection.removeMessageEvent(this._officialSongIdListener);
                    this._officialSongIdListener = null;
                }
                this._connection = null;
            }
            super.dispose();
        }

        override public function closed():void
        {
            super.closed();
            if (((!(this._soundManager == null)) && (!(this._soundManager.musicController == null))))
            {
                this._soundManager.musicController.stop(HabboMusicPrioritiesEnum.PRIORITY_PURCHASE_PREVIEW);
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            if (page.offers.length == 0)
            {
                return false;
            }
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this.onSelectProduct);
            return true;
        }

        private function onClickPlay(k:WindowMouseEvent):void
        {
            if (((!(this._soundManager == null)) && (!(this._soundManager.musicController == null))))
            {
                this.forceNoFadeoutOnPlayingSong(HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST);
                this.forceNoFadeoutOnPlayingSong(HabboMusicPrioritiesEnum.PRIORITY_PURCHASE_PREVIEW);
                this._soundManager.musicController.playSong(this._selectedSongId, HabboMusicPrioritiesEnum.PRIORITY_PURCHASE_PREVIEW, 15, 40, 0.5, 2);
            }
        }

        private function forceNoFadeoutOnPlayingSong(k:int):void
        {
            var _local_3:ISongInfo;
            var _local_2:int = this._soundManager.musicController.getSongIdPlayingAtPriority(k);
            if (_local_2 != -1)
            {
                _local_3 = this._soundManager.musicController.getSongInfo(_local_2);
                if (_local_3.soundObject != null)
                {
                    _local_3.soundObject.fadeOutSeconds = 0;
                }
            }
        }

        private function onSelectProduct(k:SelectProductEvent):void
        {
            if (((k == null) || (k.offer == null)))
            {
                return;
            }
            var _local_2:IProduct = k.offer.product;
            if (_local_2.extraParam.length > 0)
            {
                this._selectedSongId = parseInt(_local_2.extraParam);
                if (this._selectedSongId == 0)
                {
                    this._officialSongId = _local_2.extraParam;
                    if (this._connection)
                    {
                        this._connection.send(new GetOfficialSongIdMessageComposer(this._officialSongId));
                    }
                }
                if (this._playPreviewContainer != null)
                {
                    this._playPreviewContainer.visible = true;
                }
            }
            else
            {
                this._selectedSongId = -1;
            }
            this.updateView();
        }

        private function updateView():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:IHabboLocalizationManager;
            var _local_8:String;
            var k:Boolean;
            var _local_2:int = this.getSongLength();
            if (_local_2 >= 0)
            {
                _local_3 = (_local_2 / 60);
                _local_4 = (_local_2 % 60);
                _local_5 = ("" + _local_3);
                _local_6 = ("" + _local_4);
                if (_local_4 < 10)
                {
                    _local_6 = ("0" + _local_6);
                }
                _local_7 = (page.viewer.catalog as HabboCatalog).localization;
                _local_7.registerParameter("catalog.song.length", "min", _local_5);
                _local_8 = _local_7.registerParameter("catalog.song.length", "sec", _local_6);
                k = true;
                if (this._songLengthText != null)
                {
                    this._songLengthText.caption = _local_8;
                }
            }
            else
            {
                if (this._songLengthText != null)
                {
                    this._songLengthText.caption = "";
                }
            }
            if (this._playButton != null)
            {
                if (k)
                {
                    this._playButton.enable();
                }
                else
                {
                    this._playButton.disable();
                }
            }
        }

        private function getSongLength():int
        {
            var k:ISongInfo;
            if (((!(this._soundManager == null)) && (!(this._soundManager.musicController == null))))
            {
                k = this._soundManager.musicController.getSongInfo(this._selectedSongId);
                if (k != null)
                {
                    return k.length / 1000;
                }
                this._soundManager.musicController.requestSongInfoWithoutSamples(this._selectedSongId);
            }
            return -1;
        }

        private function onSongInfoReceivedEvent(k:SongInfoReceivedEvent):void
        {
            if (k.id == this._selectedSongId)
            {
                this.updateView();
            }
        }

        private function onOfficialSongIdMessageEvent(k:OfficialSongIdMessageEvent):void
        {
            if (k.getParser().officialSongId == this._officialSongId)
            {
                this._selectedSongId = k.getParser().songId;
                this.updateView();
            }
        }
    }
}
