package com.sulake.core.window.graphics.renderer
{
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import com.sulake.core.window.utils.TextStyle;
    import flash.text.TextField;
    import com.sulake.core.window.components.TextLabelController;
    import com.sulake.core.window.utils.TextFieldCache;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class LabelRenderer extends SkinRenderer 
    {
        private static const _Str_4005:ColorTransform = new ColorTransform(0, 0, 0, 1, 0xFF, 0xFF, 0xFF, 0);

        protected var _Str_2085:Matrix;
        protected var _Str_20528:TextStyle;
        protected var _Str_7685:TextField;

        public function LabelRenderer(k:String)
        {
            super(k);
            this._Str_2085 = new Matrix();
        }

        override public function draw(k:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            var _local_6:TextLabelController;
            var _local_7:TextStyle;
            var _local_8:uint;
            var _local_9:ColorTransform;
            var _local_10:Object;
            if (_arg_2 != null)
            {
                _local_6 = TextLabelController(k);
                _local_7 = _local_6.textStyle;
                if (_local_7 != this._Str_20528)
                {
                    this._Str_7685 = TextFieldCache._Str_17336(_local_7);
                    this._Str_20528 = _local_7;
                }
                this._Str_2085.tx = _local_6._Str_22822;
                this._Str_2085.ty = _local_6._Str_23873;
                this._Str_7685.text = _local_6.text;
                _local_8 = uint(_local_7.color);
                this._Str_7685.textColor = ((_local_6._Str_25634) ? _local_6.textColor : _local_8);
                if (_local_6.vertical)
                {
                    this._Str_2085.a = 0;
                    this._Str_2085.b = -1;
                    this._Str_2085.c = 1;
                    this._Str_2085.d = 0;
                    this._Str_2085.ty = (this._Str_2085.ty + _local_6.height);
                }
                if ((uint(_local_7.etchingColor) & 0xFF000000) != 0)
                {
                    _Str_4005.redOffset = ((uint(_local_7.etchingColor) >> 16) & 0xFF);
                    _Str_4005.greenOffset = ((uint(_local_7.etchingColor) >> 8) & 0xFF);
                    _Str_4005.blueOffset = (uint(_local_7.etchingColor) & 0xFF);
                    _local_10 = _Str_3766[_local_7.etchingPosition];
                    if (_local_10 != null)
                    {
                        if (_local_6.vertical)
                        {
                            this._Str_2085.tx = (this._Str_2085.tx + _local_10.y);
                            this._Str_2085.ty = (this._Str_2085.ty - _local_10.x);
                            _arg_2.draw(this._Str_7685, this._Str_2085, _Str_4005, null, null, false);
                            this._Str_2085.tx = (this._Str_2085.tx - _local_10.y);
                            this._Str_2085.ty = (this._Str_2085.ty + _local_10.x);
                        }
                        else
                        {
                            this._Str_2085.tx = (this._Str_2085.tx + _local_10.x);
                            this._Str_2085.ty = (this._Str_2085.ty + _local_10.y);
                            _arg_2.draw(this._Str_7685, this._Str_2085, _Str_4005, null, null, false);
                            this._Str_2085.tx = (this._Str_2085.tx - _local_10.x);
                            this._Str_2085.ty = (this._Str_2085.ty - _local_10.y);
                        }
                    }
                }
                if (k._Str_6120)
                {
                    _local_9 = k._Str_6120;
                }
                _arg_2.draw(this._Str_7685, this._Str_2085, _local_9, null, null, false);
                if (_local_6.vertical)
                {
                    this._Str_2085.a = 1;
                    this._Str_2085.b = 0;
                    this._Str_2085.c = 0;
                    this._Str_2085.d = 1;
                    this._Str_2085.ty = (this._Str_2085.ty - _local_6.height);
                }
                this._Str_7685.textColor = _local_8;
            }
        }

        override public function isStateDrawable(k:uint):Boolean
        {
            return k == 0;
        }
    }
}
