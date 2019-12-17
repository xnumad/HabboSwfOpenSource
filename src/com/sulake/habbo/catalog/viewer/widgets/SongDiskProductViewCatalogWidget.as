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
    import com.sulake.habbo.communication.messages.incoming.sound._Str_9631;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.communication.messages.outgoing._Str_341._Str_10944;
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
                this._playButton.addEventListener(WindowMouseEvent.CLICK, this._Str_10844);
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
                this._soundManager.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
            }
            this._connection = _arg_2.connection;
            if (((this._connection) && (!(this._officialSongIdListener))))
            {
                this._officialSongIdListener = new _Str_9631(this._Str_22652);
                this._connection.addMessageEvent(this._officialSongIdListener);
            }
        }

        override public function dispose():void
        {
            if (this._playButton != null)
            {
                this._playButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_10844);
            }
            if (((!(this._soundManager == null)) && (!(this._soundManager._Str_2774 == null))))
            {
                this._soundManager._Str_2774.stop(HabboMusicPrioritiesEnum._Str_5352);
                if (this._soundManager.events != null)
                {
                    this._soundManager.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
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
            if (((!(this._soundManager == null)) && (!(this._soundManager._Str_2774 == null))))
            {
                this._soundManager._Str_2774.stop(HabboMusicPrioritiesEnum._Str_5352);
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
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_3115);
            return true;
        }

        private function _Str_10844(k:WindowMouseEvent):void
        {
            if (((!(this._soundManager == null)) && (!(this._soundManager._Str_2774 == null))))
            {
                this._Str_9908(HabboMusicPrioritiesEnum._Str_4350);
                this._Str_9908(HabboMusicPrioritiesEnum._Str_5352);
                this._soundManager._Str_2774._Str_9539(this._selectedSongId, HabboMusicPrioritiesEnum._Str_5352, 15, 40, 0.5, 2);
            }
        }

        private function _Str_9908(k:int):void
        {
            var _local_3:ISongInfo;
            var _local_2:int = this._soundManager._Str_2774._Str_6665(k);
            if (_local_2 != -1)
            {
                _local_3 = this._soundManager._Str_2774._Str_3255(_local_2);
                if (_local_3._Str_3502 != null)
                {
                    _local_3._Str_3502._Str_4908 = 0;
                }
            }
        }

        private function _Str_3115(k:SelectProductEvent):void
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
                        this._connection.send(new _Str_10944(this._officialSongId));
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
            this._Str_2491();
        }

        private function _Str_2491():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:IHabboLocalizationManager;
            var _local_8:String;
            var k:Boolean;
            var _local_2:int = this._Str_25216();
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

        private function _Str_25216():int
        {
            var k:ISongInfo;
            if (((!(this._soundManager == null)) && (!(this._soundManager._Str_2774 == null))))
            {
                k = this._soundManager._Str_2774._Str_3255(this._selectedSongId);
                if (k != null)
                {
                    return k.length / 1000;
                }
                this._soundManager._Str_2774._Str_7732(this._selectedSongId);
            }
            return -1;
        }

        private function _Str_3530(k:SongInfoReceivedEvent):void
        {
            if (k.id == this._selectedSongId)
            {
                this._Str_2491();
            }
        }

        private function _Str_22652(k:_Str_9631):void
        {
            if (k.getParser()._Str_25744 == this._officialSongId)
            {
                this._selectedSongId = k.getParser()._Str_3951;
                this._Str_2491();
            }
        }
    }
}
