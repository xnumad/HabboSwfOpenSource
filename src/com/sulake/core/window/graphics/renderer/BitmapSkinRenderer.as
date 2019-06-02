package com.sulake.core.window.graphics.renderer
{
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import flash.geom.Matrix;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.graphics.BitmapSkinParser;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;

    public class BitmapSkinRenderer extends SkinRenderer implements ISkinRenderer 
    {
        protected static const _Str_2681:Rectangle = new Rectangle();
        protected static const _Str_17316:Point = new Point();

        protected var _Str_7047:Dictionary;
        protected var _Str_4651:Matrix;
        protected var _Str_591:ColorTransform;

        public function BitmapSkinRenderer(k:String)
        {
            super(k);
            this._Str_7047 = new Dictionary(false);
            this._Str_4651 = new Matrix();
            this._Str_591 = new ColorTransform();
        }

        override public function parse(k:IAsset, _arg_2:XMLList, _arg_3:IAssetLibrary):void
        {
            BitmapSkinParser._Str_24598((k.content as XML), _arg_2, this, name, _arg_3);
        }

        override public function dispose():void
        {
            var k:String;
            var _local_2:BitmapData;
            if (!disposed)
            {
                super.dispose();
                this._Str_4651 = null;
                this._Str_591 = null;
                for (k in this._Str_7047)
                {
                    _local_2 = (this._Str_7047[k] as BitmapData);
                    _local_2.dispose();
                    delete this._Str_7047[k];
                }
                this._Str_7047 = null;
            }
        }

        override public function isStateDrawable(k:uint):Boolean
        {
            return !(_Str_5217[k] == null);
        }

        override public function draw(k:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            var _local_8:uint;
            var _local_9:SkinLayoutEntity;
            var _local_10:ISkinTemplateEntity;
            var _local_11:Boolean;
            var _local_12:Boolean;
            var _local_13:int;
            var _local_14:int;
            var _local_15:Boolean;
            var _local_16:uint;
            var _local_17:BitmapData;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            var _local_22:int;
            var _local_23:int;
            var _local_24:Point;
            var _local_25:Rectangle;
            var _local_26:Rectangle;
            var _local_27:uint;
            var _local_28:int;
            var _local_29:BitmapData;
            var _local_6:ISkinLayout = _Str_5580[_arg_4];
            var _local_7:ISkinTemplate = _Str_5217[_arg_4];
            if (_local_6 == null)
            {
                _local_6 = _Str_5580[WindowState.DEFAULT];
                _local_7 = _Str_5217[WindowState.DEFAULT];
            }
            _local_8 = _local_6.numChildren;
            if (((!(_local_6 == null)) && (_local_8 > 0)))
            {
                _local_13 = (_arg_3.width - _local_6.width);
                _local_14 = (_arg_3.height - _local_6.height);
                _local_15 = ((!(k.background)) && ((k.color & 0xFFFFFF) < 0xFFFFFF));
                if (_local_15)
                {
                    this._Str_591.redMultiplier = (((k.color & 0xFF0000) >> 16) / 0xFF);
                    this._Str_591.greenMultiplier = (((k.color & 0xFF00) >> 8) / 0xFF);
                    this._Str_591.blueMultiplier = ((k.color & 0xFF) / 0xFF);
                    this._Str_591.alphaMultiplier = 1;
                }
                _local_16 = 0;
                while (_local_16 < _local_8)
                {
                    _local_9 = (_local_6.getChildAt(_local_16) as SkinLayoutEntity);
                    _local_10 = (_local_7.getChildByName(_local_9.name) as ISkinTemplateEntity);
                    if (_local_10 != null)
                    {
                        _local_17 = this._Str_21725(_local_7, _local_9.name);
                        if (((_local_15) && (_local_9.colorize)))
                        {
                            _local_17 = _local_17.clone();
                            _local_17.colorTransform(_local_17.rect, this._Str_591);
                        }
                        _local_11 = false;
                        _local_12 = false;
                        _Str_2681.x = (_local_9.region.x + _arg_3.x);
                        _Str_2681.y = (_local_9.region.y + _arg_3.y);
                        _Str_2681.width = _local_9.region.width;
                        _Str_2681.height = _local_9.region.height;
                        if (_local_9.scaleH == SkinLayoutEntity.SCALE_TYPE_MOVE)
                        {
                            _Str_2681.x = (_Str_2681.x + _local_13);
                        }
                        else
                        {
                            if (_local_9.scaleH == SkinLayoutEntity.SCALE_TYPE_STRECH)
                            {
                                _local_11 = true;
                                _Str_2681.right = (_Str_2681.right + _local_13);
                                if (_Str_2681.width < 1) break;
                            }
                            else
                            {
                                if (_local_9.scaleH == SkinLayoutEntity.SCALE_TYPE_TILED)
                                {
                                    _local_11 = true;
                                    _Str_2681.right = (_Str_2681.right + _local_13);
                                    if (_Str_2681.width < 1) break;
                                }
                                else
                                {
                                    if (_local_9.scaleH == SkinLayoutEntity.SCALE_TYPE_CENTER)
                                    {
                                        _Str_2681.x = ((_arg_3.width / 2) - (_Str_2681.width / 2));
                                    }
                                }
                            }
                        }
                        if (_local_9.scaleV == SkinLayoutEntity.SCALE_TYPE_MOVE)
                        {
                            _Str_2681.y = (_Str_2681.y + _local_14);
                        }
                        else
                        {
                            if (_local_9.scaleV == SkinLayoutEntity.SCALE_TYPE_STRECH)
                            {
                                _local_12 = true;
                                _Str_2681.bottom = (_Str_2681.bottom + _local_14);
                                if (_Str_2681.height < 1) break;
                            }
                            else
                            {
                                if (_local_9.scaleV == SkinLayoutEntity.SCALE_TYPE_TILED)
                                {
                                    _local_12 = true;
                                    _Str_2681.bottom = (_Str_2681.bottom + _local_14);
                                    if (_Str_2681.height < 1) break;
                                }
                                else
                                {
                                    if (_local_9.scaleV == SkinLayoutEntity.SCALE_TYPE_CENTER)
                                    {
                                        _Str_2681.y = ((_arg_3.height / 2) - (_Str_2681.height / 2));
                                    }
                                }
                            }
                        }
                        if (((!(_local_11)) && (!(_local_12))))
                        {
                            _arg_2.copyPixels(_local_17, _local_17.rect, _Str_2681.topLeft, null, null, true);
                        }
                        else
                        {
                            if (((_local_9.scaleV == SkinLayoutEntity.SCALE_TYPE_TILED) || (_local_9.scaleH == SkinLayoutEntity.SCALE_TYPE_TILED)))
                            {
                                _local_18 = _local_17.width;
                                _local_19 = _local_17.height;
                                _local_20 = (_Str_2681.width / _local_18);
                                _local_21 = (_Str_2681.height / _local_19);
                                _local_22 = (_Str_2681.width % _local_18);
                                _local_23 = (_Str_2681.height % _local_19);
                                _local_24 = new Point(_Str_2681.x, _Str_2681.y);
                                _local_25 = new Rectangle(0, 0, _local_22, _local_17.height);
                                _local_26 = new Rectangle(0, 0, _local_17.width, _local_23);
                                _local_27 = 0;
                                while (_local_27 < _local_21)
                                {
                                    _local_24.x = _Str_2681.x;
                                    _local_28 = 0;
                                    while (_local_28 < _local_20)
                                    {
                                        _arg_2.copyPixels(_local_17, _local_17.rect, _local_24, null, null, true);
                                        _local_24.x = (_local_24.x + _local_18);
                                        _local_28++;
                                    }
                                    if (_local_22 > 0)
                                    {
                                        _arg_2.copyPixels(_local_17, _local_25, _local_24, null, null, true);
                                    }
                                    _local_24.y = (_local_24.y + _local_19);
                                    _local_27++;
                                }
                                if (_local_23 > 0)
                                {
                                    _local_24.x = _Str_2681.x;
                                    _local_27 = 0;
                                    while (_local_27 < _local_20)
                                    {
                                        _arg_2.copyPixels(_local_17, _local_26, _local_24, null, null, true);
                                        _local_24.x = (_local_24.x + _local_18);
                                        _local_27++;
                                    }
                                }
                            }
                            else
                            {
                                if (((_local_17.width == 1) && (_local_17.height == 1)))
                                {
                                    this._Str_4651.a = _Str_2681.width;
                                    this._Str_4651.d = _Str_2681.height;
                                    this._Str_4651.tx = _Str_2681.x;
                                    this._Str_4651.ty = _Str_2681.y;
                                    _arg_2.draw(_local_17, this._Str_4651);
                                }
                                else
                                {
                                    this._Str_4651.a = (_Str_2681.width / _local_17.width);
                                    this._Str_4651.d = (_Str_2681.height / _local_17.height);
                                    this._Str_4651.tx = 0;
                                    this._Str_4651.ty = 0;
                                    _local_29 = new BitmapData(_Str_2681.width, _Str_2681.height, true, 0);
                                    _local_29.draw(_local_17, this._Str_4651);
                                    _arg_2.copyPixels(_local_29, _local_29.rect, _Str_2681.topLeft, null, null, true);
                                    _local_29.dispose();
                                }
                            }
                        }
                        if (((_local_15) && (_local_9.colorize)))
                        {
                            _local_17.dispose();
                        }
                    }
                    _local_16++;
                }
            }
        }

        protected function _Str_25947(k:BitmapData, _arg_2:Rectangle, _arg_3:ISkinLayout, _arg_4:SkinLayoutEntity, _arg_5:ISkinTemplate, _arg_6:ISkinTemplateEntity):void
        {
            var _local_8:BitmapData;
            var _local_7:Rectangle = _arg_4.region.clone();
            _local_7.x = (_local_7.x + _arg_2.x);
            _local_7.y = (_local_7.y + _arg_2.y);
            switch (_arg_6.type)
            {
                case "bitmap":
                    _local_8 = this._Str_21725(_arg_5, _arg_4.name);
                    if (_arg_4.scaleH == SkinLayoutEntity.SCALE_TYPE_MOVE)
                    {
                        _local_7.x = (_local_7.x + (_arg_2.width - _arg_3.width));
                    }
                    if (_arg_4.scaleV == SkinLayoutEntity.SCALE_TYPE_MOVE)
                    {
                        _local_7.y = (_local_7.y + (_arg_2.height - _arg_3.height));
                    }
                    k.copyPixels(_local_8, _local_8.rect, _local_7.topLeft, null, null, true);
                    return;
                case "fill":
                    k.fillRect(_local_7, _arg_4.color);
                    return;
            }
        }

        protected function _Str_21725(k:ISkinTemplate, _arg_2:String):BitmapData
        {
            var _local_5:ISkinTemplateEntity;
            var _local_6:BitmapData;
            var _local_3:String = ((_arg_2 + "@") + k.name);
            var _local_4:BitmapData = this._Str_7047[_local_3];
            if (_local_4 == null)
            {
                _local_5 = (k.getChildByName(_arg_2) as ISkinTemplateEntity);
                if (_local_5 == null)
                {
                    throw (new Error((("Template entity" + _arg_2) + "not found!")));
                }
                _local_6 = (k.asset.content as BitmapData);
                if (_local_6 == null)
                {
                    throw (new Error((("Asset " + k.asset) + " not found!")));
                }
                _local_4 = new TrackedBitmapData(this, _local_5.region.width, _local_5.region.height, true);
                _local_4.copyPixels(_local_6, _local_5.region, _Str_17316);
                this._Str_7047[_local_3] = _local_4;
            }
            return _local_4;
        }

        private function drawBorders(k:BitmapData, _arg_2:Rectangle, _arg_3:uint):void
        {
            var _local_4:int;
            var _local_5:int = (_arg_2.bottom - 1);
            _local_4 = _arg_2.left;
            while (_local_4 < (_arg_2.right - 1))
            {
                k.setPixel32(_local_4, 0, _arg_3);
                k.setPixel32(_local_4, _local_5, _arg_3);
                _local_4++;
            }
            _local_5 = _arg_2.top;
            while (_local_5 < (_arg_2.bottom - 1))
            {
                k.setPixel32(0, _local_5, _arg_3);
                k.setPixel32(_local_4, _local_5, _arg_3);
                _local_5++;
            }
        }
    }
}
