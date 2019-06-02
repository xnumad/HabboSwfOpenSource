package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.graphics.WindowRedrawFlag;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BitmapWrapperController extends BitmapDataController implements IBitmapWrapperWindow, IBitmapDataContainer 
    {
        protected var _handleDisposing:Boolean;
        protected var _bitmapAssetName:String;

        public function BitmapWrapperController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._handleDisposing = Boolean(_arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3).get(PropertyKeys.HANDLE_BITMAP_DISPOSING));
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get bitmap():BitmapData
        {
            return _bitmapData;
        }

        public function set bitmap(k:BitmapData):void
        {
            if ((((this._handleDisposing) && (_bitmapData)) && (!(k == _bitmapData))))
            {
                _bitmapData.dispose();
            }
            _bitmapData = k;
            _Str_8020();
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
        }

        public function set bitmapData(k:BitmapData):void
        {
            this.bitmap = k;
        }

        public function get bitmapAssetName():String
        {
            return this._bitmapAssetName;
        }

        public function set bitmapAssetName(bitmapAssetName:String):void
        {
            this._bitmapAssetName = bitmapAssetName;
        }

        public function get disposesBitmap():Boolean
        {
            return this._handleDisposing;
        }

        public function set disposesBitmap(k:Boolean):void
        {
            this._handleDisposing = k;
        }

        override public function clone():IWindow
        {
            var controller:BitmapWrapperController = (super.clone() as BitmapWrapperController);
            controller._bitmapData = (((this._handleDisposing) && (_bitmapData)) ? _bitmapData.clone() : _bitmapData);
            controller._handleDisposing = this._handleDisposing;
            controller._bitmapAssetName = this._bitmapAssetName;
            return controller;
        }

        override public function dispose():void
        {
            if (_bitmapData)
            {
                if (this._handleDisposing)
                {
                    _bitmapData.dispose();
                }
                _bitmapData = null;
            }
            super.dispose();
        }

        override public function get properties():Array
        {
            var properties:Array = super.properties;
            properties.unshift(createProperty(PropertyKeys.HANDLE_BITMAP_DISPOSING, this._handleDisposing));
            properties.unshift(createProperty(PropertyKeys.BITMAP_ASSET_NAME, this._bitmapAssetName));
            return properties;
        }

        override public function set properties(properties:Array):void
        {
            for each (var property:PropertyStruct in properties)
            {
                switch (property.key)
                {
                    case PropertyKeys.HANDLE_BITMAP_DISPOSING:
                        this._handleDisposing = (property.value as Boolean);
                        break;
                    case PropertyKeys.BITMAP_ASSET_NAME:
                        this._bitmapAssetName = (property.value as String);
                        break;
                }
            }
            super.properties = properties;
        }
    }
}
