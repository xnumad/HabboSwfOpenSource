package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.sound.ISongInfo;

    public class TraxPreviewCatalogWidget extends CatalogWidget
    {
        private var _soundManager:IHabboSoundManager;
        private var _playButton:IButtonWindow;
        private var _selectedSongId:int = -1;

        public function TraxPreviewCatalogWidget(k:IWindowContainer, _arg_2:IHabboSoundManager)
        {
            super(k);
            this._playButton = (_window.findChildByName("listen") as IButtonWindow);
            Logger.log(("Trax listener found button: " + this._playButton));
            if (this._playButton != null)
            {
                this._playButton.addEventListener(WindowMouseEvent.CLICK, this._Str_10844);
                this._playButton.disable();
            }
            this._soundManager = _arg_2;
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
                this._soundManager = null;
            }
            super.dispose();
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

        override public function closed():void
        {
            super.closed();
            if (((!(this._soundManager == null)) && (!(this._soundManager._Str_2774 == null))))
            {
                this._soundManager._Str_2774.stop(HabboMusicPrioritiesEnum._Str_5352);
            }
        }

        private function _Str_3115(k:SelectProductEvent):void
        {
            if (((k == null) || (k.offer == null)))
            {
                return;
            }
            var _local_2:Boolean;
            var _local_3:IProduct = k.offer.product;
            if (_local_3.extraParam.length > 0)
            {
                this._selectedSongId = parseInt(_local_3.extraParam);
                _local_2 = true;
            }
            if (this._playButton != null)
            {
                if (_local_2)
                {
                    this._playButton.enable();
                }
                else
                {
                    this._playButton.disable();
                }
            }
        }

        private function _Str_10844(k:WindowMouseEvent):void
        {
            if (((!(this._soundManager == null)) && (!(this._soundManager._Str_2774 == null))))
            {
                this._Str_9908(HabboMusicPrioritiesEnum._Str_4350);
                this._Str_9908(HabboMusicPrioritiesEnum._Str_5352);
                this._soundManager._Str_2774._Str_9539(this._selectedSongId, HabboMusicPrioritiesEnum._Str_5352, 15, 40, 0, 2);
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
    }
}
