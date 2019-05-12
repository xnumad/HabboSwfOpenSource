package com.sulake.core.window.graphics.renderer
{
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import com.sulake.core.window.utils.TextStyleManager;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.utils.ITextFieldContainer;
    import com.sulake.core.window.components.ITextWindow;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class TextSkinRenderer extends SkinRenderer 
    {
        private static const _Str_4005:ColorTransform = new ColorTransform(0, 0, 0, 1, 0xFF, 0xFF, 0xFF, 0);

        protected var _Str_2085:Matrix;

        public function TextSkinRenderer(k:String)
        {
            super(k);
            this._Str_2085 = new Matrix();
        }

        override public function parse(k:IAsset, _arg_2:XMLList, _arg_3:IAssetLibrary):void
        {
            var _local_4:String = k.content.toString();
            TextStyleManager.setStyles(TextStyleManager.parseCSS(_local_4));
        }

        override public function draw(k:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            var _local_6:ITextFieldContainer;
            var _local_7:ITextWindow;
            var _local_8:String;
            var _local_9:TextField;
            var _local_10:ColorTransform;
            var _local_11:Object;
            if (_arg_2 != null)
            {
                _local_6 = ITextFieldContainer(k);
                _local_7 = ITextWindow(k);
                _local_8 = _local_7.autoSize;
                _local_9 = _local_6.textField;
                this._Str_2085.tx = _local_6.margins.left;
                this._Str_2085.ty = _local_6.margins.top;
                if (_local_8 == TextFieldAutoSize.RIGHT)
                {
                    this._Str_2085.tx = Math.floor((k.width - _local_9.width));
                }
                else
                {
                    if (_local_8 == TextFieldAutoSize.CENTER)
                    {
                        this._Str_2085.tx = Math.floor(((k.width / 2) - (_local_9.width / 2)));
                    }
                }
                if ((uint(_local_7.etchingColor) & 0xFF000000) != 0)
                {
                    _Str_4005.redOffset = ((_local_7.etchingColor >> 16) & 0xFF);
                    _Str_4005.greenOffset = ((_local_7.etchingColor >> 8) & 0xFF);
                    _Str_4005.blueOffset = (_local_7.etchingColor & 0xFF);
                    _Str_4005.alphaMultiplier = (((_local_7.etchingColor >> 24) & 0xFF) / 0xFF);
                    _local_11 = _Str_3766[_local_7.etchingPosition];
                    if (_local_11 != null)
                    {
                        this._Str_2085.tx = (this._Str_2085.tx + _local_11.x);
                        this._Str_2085.ty = (this._Str_2085.ty + _local_11.y);
                        _arg_2.draw(_local_9, this._Str_2085, _Str_4005, null, null, false);
                        this._Str_2085.tx = (this._Str_2085.tx - _local_11.x);
                        this._Str_2085.ty = (this._Str_2085.ty - _local_11.y);
                    }
                }
                if (k._Str_6120)
                {
                    _local_10 = k._Str_6120;
                }
                _arg_2.draw(_local_9, this._Str_2085, _local_10, null, null, false);
            }
        }

        override public function isStateDrawable(k:uint):Boolean
        {
            return k == 0;
        }
    }
}
