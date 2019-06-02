package com.sulake.habbo.inventory.pets
{
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_2848;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import flash.display.BitmapData;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;

    public class PetsGridItem 
    {
        private static const _Str_4072:int = 0xCCCCCC;
        private static const _Str_4169:int = 10275685;

        private var _petData:_Str_2848;
        private var _window:IWindowContainer;
        private var _assets:IAssetLibrary;
        private var _selectionHighlighter:IWindow;
        private var _isSelected:Boolean;
        private var _petsView:PetsView;
        private var _imageDownloadId:int = -1;
        private var _isMouseDown:Boolean;
        private var _isUnseen:Boolean;

        public function PetsGridItem(k:PetsView, _arg_2:_Str_2848, _arg_3:IHabboWindowManager, _arg_4:IAssetLibrary, _arg_5:Boolean)
        {
            if (((((k == null) || (_arg_2 == null)) || (_arg_3 == null)) || (_arg_4 == null)))
            {
                return;
            }
            this._assets = _arg_4;
            this._petsView = k;
            this._petData = _arg_2;
            this._isUnseen = _arg_5;
            var _local_6:XmlAsset = (_arg_4.getAssetByName("inventory_thumb_xml") as XmlAsset);
            if (((_local_6 == null) || (_local_6.content == null)))
            {
                return;
            }
            this._window = (_arg_3.buildFromXML((_local_6.content as XML)) as IWindowContainer);
            this._window.procedure = this.eventHandler;
            var _local_7:int = 64;
            var _local_8:int = 3;
            var _local_9:Boolean;
            var _local_10:String;
            if (_arg_2.typeId == PetTypeEnum.HORSE)
            {
                _local_7 = 32;
                _local_8 = 2;
                _local_9 = true;
            }
            else
            {
                if (((_arg_2.typeId == PetTypeEnum.GNOME) || (_arg_2.typeId == PetTypeEnum.LEPRECHAUN)))
                {
                    _local_7 = 32;
                    _local_8 = 3;
                    _local_9 = true;
                }
                else
                {
                    if (_arg_2.typeId == PetTypeEnum.MONSTERPLANT)
                    {
                        _local_7 = 32;
                        _local_8 = 2;
                        _local_9 = true;
                        if (_arg_2.level >= 7)
                        {
                            _local_10 = "std";
                        }
                        else
                        {
                            _local_10 = ("grw" + _arg_2.level);
                        }
                    }
                }
            }
            var _local_11:BitmapData = k.getPetImage(_arg_2, _local_8, _local_9, this, _local_7, _local_10);
            this._Str_19232(_local_11);
            this._Str_7681();
        }

        public function dispose():void
        {
            this._assets = null;
            this._petsView = null;
            this._petData = null;
            this._selectionHighlighter = null;
            this._imageDownloadId = -1;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.DOWN:
                    this._petsView._Str_7828(this);
                    this._isMouseDown = true;
                    return;
                case WindowMouseEvent.UP:
                    this._isMouseDown = false;
                    return;
                case WindowMouseEvent.OUT:
                    if (this._isMouseDown)
                    {
                        this._isMouseDown = false;
                        this._petsView._Str_6675(this._petData.id, true);
                    }
                    return;
            }
        }

        public function _Str_19232(k:BitmapData):void
        {
            if (!this._window)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("bitmap") as IBitmapWrapperWindow);
            var _local_3:BitmapData = new BitmapData(_local_2.width, _local_2.height);
            _local_3.fillRect(_local_3.rect, 0);
            _local_3.copyPixels(k, k.rect, new Point(((_local_3.width / 2) - (k.width / 2)), ((_local_3.height / 2) - (k.height / 2))));
            if (_local_2.bitmap)
            {
                _local_2.bitmap.dispose();
            }
            _local_2.bitmap = _local_3;
        }

        public function _Str_17526(k:Boolean):void
        {
            if (this._isUnseen != k)
            {
                this._isUnseen = k;
                this._Str_7681();
            }
        }

        public function setSelected(k:Boolean):void
        {
            if (this._isSelected != k)
            {
                this._isSelected = k;
                if (((!(this._window)) || (!(this._selectionHighlighter))))
                {
                    return;
                }
                this._Str_7681();
            }
        }

        private function _Str_7681():void
        {
            var k:IWindow = this._window.findChildByName("outline");
            if (k != null)
            {
                k.visible = this._isSelected;
            }
            if (!this._selectionHighlighter)
            {
                this._selectionHighlighter = this._window.findChildByTag("BG_COLOR");
            }
            this._selectionHighlighter.color = ((this._isUnseen) ? _Str_4169 : _Str_4072);
        }

        public function get window():IWindow
        {
            return this._window;
        }

        public function get pet():_Str_2848
        {
            return this._petData;
        }

        public function set _Str_17747(k:int):void
        {
            this._imageDownloadId = k;
        }

        public function get _Str_17747():int
        {
            return this._imageDownloadId;
        }
    }
}
