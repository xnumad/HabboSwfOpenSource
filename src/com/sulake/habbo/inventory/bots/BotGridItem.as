package com.sulake.habbo.inventory.bots
{
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_3013;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;

    public class BotGridItem 
    {
        private static const _Str_4072:int = 0xCCCCCC;
        private static const _Str_4169:int = 10275685;

        private var _data:_Str_3013;
        private var _window:IWindowContainer;
        private var _assets:IAssetLibrary;
        private var _selectionHighlighter:IWindow;
        private var _isSelected:Boolean;
        private var _view:BotsView;
        private var _imageDownloadId:int = -1;
        private var _isMouseDown:Boolean;
        private var _isUnseen:Boolean;

        public function BotGridItem(k:BotsView, _arg_2:_Str_3013, _arg_3:IHabboWindowManager, _arg_4:IAssetLibrary, _arg_5:Boolean)
        {
            if (((((k == null) || (_arg_2 == null)) || (_arg_3 == null)) || (_arg_4 == null)))
            {
                return;
            }
            this._assets = _arg_4;
            this._view = k;
            this._data = _arg_2;
            this._isUnseen = _arg_5;
            var _local_6:XmlAsset = (_arg_4.getAssetByName("inventory_thumb_xml") as XmlAsset);
            if (((_local_6 == null) || (_local_6.content == null)))
            {
                return;
            }
            this._window = (_arg_3.buildFromXML((_local_6.content as XML)) as IWindowContainer);
            this._window.procedure = this.eventHandler;
            var _local_7:BitmapData = k._Str_20649(_arg_2);
            this._Str_3523(_local_7);
            this._Str_7681();
        }

        public function dispose():void
        {
            this._assets = null;
            this._view = null;
            this._data = null;
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
                    this._view._Str_7828(this);
                    this._isMouseDown = true;
                    return;
                case WindowMouseEvent.UP:
                    this._isMouseDown = false;
                    return;
                case WindowMouseEvent.OUT:
                    if (this._isMouseDown)
                    {
                        this._isMouseDown = false;
                        this._view._Str_7009(this._data.id, true);
                    }
                    return;
            }
        }

        public function _Str_3523(k:BitmapData):void
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

        public function get data():_Str_3013
        {
            return this._data;
        }
    }
}
