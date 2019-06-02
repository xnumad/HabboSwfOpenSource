package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.XmlAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class _Str_7647 
    {
        private var _windowManager:IHabboWindowManager;
        private var _assetLibrary:IAssetLibrary;
        private var _window:IWindowContainer;
        private var _Str_2840:IBitmapWrapperWindow;

        public function _Str_7647(k:IHabboWindowManager, _arg_2:IAssetLibrary, _arg_3:Boolean)
        {
            this._windowManager = k;
            this._assetLibrary = _arg_2;
            var _local_4:XmlAsset = (this._assetLibrary.getAssetByName("Outfit") as XmlAsset);
            this._window = IWindowContainer(this._windowManager.buildFromXML((_local_4.content as XML)));
            if (this._window != null)
            {
                this._Str_2840 = (this._window.findChildByName("bitmap") as IBitmapWrapperWindow);
            }
            if (!_arg_3)
            {
                this._window.findChildByName("button").disable();
            }
        }

        public function dispose():void
        {
            this._windowManager = null;
            this._assetLibrary = null;
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
            if (this._Str_2840)
            {
                this._Str_2840.dispose();
            }
            this._Str_2840 = null;
        }

        public function _Str_25268(k:BitmapData):void
        {
            this._Str_2840.bitmap = new BitmapData(this._Str_2840.width, this._Str_2840.height, true, 0xFFFFFF);
            var _local_2:int = ((this._Str_2840.width - k.width) / 2);
            var _local_3:int = (this._Str_2840.height - k.height);
            this._Str_2840.bitmap.copyPixels(k, k.rect, new Point(_local_2, _local_3));
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        private function _Str_3328(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    this._window.color = 0xCCCCCC;
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        this._window.color = 0x666666;
                    }
                }
            }
        }
    }
}
