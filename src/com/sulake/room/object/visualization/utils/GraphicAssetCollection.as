package com.sulake.room.object.visualization.utils
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import com.sulake.core.assets.IAsset;
    import flash.utils.ByteArray;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;

    public class GraphicAssetCollection implements IGraphicAssetCollection 
    {
        private static const PALETTE_ASSET_DISPOSE_THRESHOLD:int = 10;
        private static const PALETTE_ATTRIBUTES:Array = ["id", "source"];
        private static const USE_LAZY_ASSETS:Boolean = false;

        private var _assets:Map;
        private var _library:IAssetLibrary;
        private var _palettes:Map;
        private var _paletteAssetNames:Array;
        private var _paletteXMLs:Map;
        private var _referenceCount:int = 0;
        private var _referenceTimeStamp:int = 0;
        private var _lazyAssetTable:Dictionary;

        public function GraphicAssetCollection()
        {
            this._assets = new Map();
            this._palettes = new Map();
            this._paletteXMLs = new Map();
            this._paletteAssetNames = [];
            this._lazyAssetTable = new Dictionary();
        }

        public function dispose():void
        {
            var k:String;
            var _local_2:GraphicAssetPalette;
            var _local_3:GraphicAsset;
            var _local_4:String;
            if (this._palettes != null)
            {
                for (k in this._palettes)
                {
                    _local_2 = this._palettes[k];
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                }
                this._palettes.reset();
            }
            if (this._paletteXMLs != null)
            {
                this._palettes.reset();
            }
            if (this._paletteAssetNames != null)
            {
                this.disposePaletteAssets();
                this._paletteAssetNames = null;
            }
            if (this._assets != null)
            {
                for (k in this._assets)
                {
                    _local_3 = this._assets[k];
                    if (_local_3 != null)
                    {
                        _local_3.recycle();
                    }
                }
                this._assets.reset();
            }
            if (this._lazyAssetTable)
            {
                for (_local_4 in this._lazyAssetTable)
                {
                    delete this._lazyAssetTable[_local_4];
                }
            }
            this._library = null;
        }

        public function set assetLibrary(k:IAssetLibrary):void
        {
            this._library = k;
        }

        public function _Str_9215():void
        {
            this._referenceCount++;
            this._referenceTimeStamp = getTimer();
        }

        public function _Str_19942():void
        {
            this._referenceCount--;
            if (this._referenceCount <= 0)
            {
                this._referenceCount = 0;
                this._referenceTimeStamp = getTimer();
                this.disposePaletteAssets(false);
            }
        }

        public function _Str_20679():int
        {
            return this._referenceCount;
        }

        public function _Str_21431():int
        {
            return this._referenceTimeStamp;
        }

        public function _Str_13182(k:XML):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:XMLList = k.asset;
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:XMLList = k.palette;
            if (_local_3 != null)
            {
                this.definePalettes(_local_3);
            }
            if (USE_LAZY_ASSETS)
            {
                this.defineAssetsLazy(_local_2);
            }
            else
            {
                this.defineAssets(_local_2);
            }
            return true;
        }

        private function defineAssetsLazy(k:XMLList):void
        {
            var _local_2:XML;
            var _local_3:String;
            for each (_local_2 in k)
            {
                _local_3 = _local_2.@name;
                if (_local_3.length > 0)
                {
                    this._lazyAssetTable[_local_3] = _local_2;
                }
            }
        }

        private function defineAssets(k:XMLList):void
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:String;
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:Boolean;
            var _local_10:int;
            var _local_11:int;
            var _local_12:IAsset;
            var _local_13:Boolean;
            var _local_14:IGraphicAsset;
            var _local_2:int = k.length();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k[_local_3];
                _local_5 = _local_4.@name;
                if (_local_5.length > 0)
                {
                    _local_6 = null;
                    _local_7 = false;
                    _local_8 = false;
                    _local_9 = false;
                    _local_10 = 0;
                    _local_11 = 0;
                    _local_10 = -(int(_local_4.@x));
                    _local_11 = -(int(_local_4.@y));
                    _local_6 = _local_4.@source;
                    if (int(_local_4.@flipH) > 0)
                    {
                        if (_local_6.length > 0)
                        {
                            _local_7 = true;
                        }
                    }
                    if (int(_local_4.@flipV) > 0)
                    {
                        if (_local_6.length > 0)
                        {
                            _local_8 = true;
                        }
                    }
                    _local_9 = (!(int(_local_4.@usesPalette) == 0));
                    if (_local_6.length == 0)
                    {
                        _local_6 = _local_5;
                    }
                    _local_12 = this._library.getAssetByName(_local_6);
                    if (_local_12 != null)
                    {
                        _local_13 = this.createAsset(_local_5, _local_6, _local_12, _local_7, _local_8, _local_10, _local_11, _local_9);
                        if (!_local_13)
                        {
                            _local_14 = this.getAsset(_local_5);
                            if (((!(_local_14 == null)) && (!(_local_14.assetName == _local_14._Str_3582))))
                            {
                                _local_13 = this.replaceAsset(_local_5, _local_6, _local_12, _local_7, _local_8, _local_10, _local_11, _local_9);
                            }
                        }
                    }
                }
                _local_3++;
            }
        }

        private function definePalettes(k:XMLList):void
        {
            var _local_2:XML;
            var _local_3:String;
            var _local_4:String;
            var _local_5:IAsset;
            var _local_6:ByteArray;
            var _local_7:int;
            var _local_8:int;
            var _local_9:String;
            var _local_10:GraphicAssetPalette;
            for each (_local_2 in k)
            {
                if (XMLValidator.checkRequiredAttributes(_local_2, PALETTE_ATTRIBUTES))
                {
                    _local_3 = _local_2.@id;
                    _local_4 = _local_2.@source;
                    if (this._palettes[_local_3] == null)
                    {
                        _local_5 = this._library.getAssetByName(_local_4);
                        if ((_local_5.content is Class))
                        {
                            _local_6 = (new ((_local_5.content as Class))() as ByteArray);
                        }
                        else
                        {
                            _local_6 = (_local_5.content as ByteArray);
                        }
                        _local_7 = 0xFFFFFF;
                        _local_8 = 0xFFFFFF;
                        _local_9 = _local_2.@color1;
                        if (_local_9.length > 0)
                        {
                            _local_7 = parseInt(_local_9, 16);
                            _local_8 = _local_7;
                        }
                        _local_9 = _local_2.@color2;
                        if (_local_9.length > 0)
                        {
                            _local_8 = parseInt(_local_9, 16);
                        }
                        _local_10 = new GraphicAssetPalette(_local_6, _local_7, _local_8);
                        this._palettes[_local_3] = _local_10;
                        this._paletteXMLs[_local_3] = _local_2;
                    }
                }
            }
        }

        protected function createAsset(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Number, _arg_7:Number, _arg_8:Boolean):Boolean
        {
            if (this._assets[k] != null)
            {
                return false;
            }
            if (this._lazyAssetTable[k])
            {
                return false;
            }
            var _local_9:GraphicAsset = GraphicAsset._Str_2363(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
            this._assets[k] = _local_9;
            return true;
        }

        protected function replaceAsset(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Number, _arg_7:Number, _arg_8:Boolean):Boolean
        {
            var _local_9:GraphicAsset = this._assets.remove(k);
            if (_local_9 != null)
            {
                _local_9.recycle();
            }
            else
            {
                delete this._lazyAssetTable[k];
            }
            return this.createAsset(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
        }

        public function getAsset(k:String):IGraphicAsset
        {
            var _local_4:String;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:int;
            var _local_9:int;
            var _local_10:IAsset;
            var _local_11:IGraphicAsset;
            var _local_2:IGraphicAsset = this._assets.getValue(k);
            if (_local_2)
            {
                return _local_2;
            }
            var _local_3:XML = this._lazyAssetTable[k];
            if (_local_3)
            {
                delete this._lazyAssetTable[k];
                _local_4 = null;
                _local_5 = false;
                _local_6 = false;
                _local_7 = false;
                _local_8 = 0;
                _local_9 = 0;
                _local_8 = -(int(_local_3.@x));
                _local_9 = -(int(_local_3.@y));
                _local_4 = _local_3.@source;
                if (int(_local_3.@flipH) > 0)
                {
                    if (_local_4.length > 0)
                    {
                        _local_5 = true;
                    }
                }
                if (int(_local_3.@flipV) > 0)
                {
                    if (_local_4.length > 0)
                    {
                        _local_6 = true;
                    }
                }
                _local_7 = (!(int(_local_3.@usesPalette) == 0));
                if (_local_4.length == 0)
                {
                    _local_4 = k;
                }
                _local_10 = this._library.getAssetByName(_local_4);
                if (_local_10 != null)
                {
                    if (this.createAsset(k, _local_4, _local_10, _local_5, _local_6, _local_8, _local_9, _local_7))
                    {
                        return this._assets[k];
                    }
                    _local_11 = this.getAsset(k);
                    if (((!(_local_11 == null)) && (!(_local_11.assetName == _local_11._Str_3582))))
                    {
                        if (!this.replaceAsset(k, _local_4, _local_10, _local_5, _local_6, _local_8, _local_9, _local_7))
                        {
                            return null;
                        }
                    }
                }
            }
            return null;
        }

        public function getAssetWithPalette(k:String, _arg_2:String):IGraphicAsset
        {
            var _local_5:IGraphicAsset;
            var _local_6:String;
            var _local_7:BitmapDataAsset;
            var _local_8:BitmapData;
            var _local_9:GraphicAssetPalette;
            var _local_10:BitmapData;
            var _local_3:String = ((k + "@") + _arg_2);
            var _local_4:IGraphicAsset = this.getAsset(_local_3);
            if (_local_4 == null)
            {
                _local_5 = this.getAsset(k);
                if (((_local_5 == null) || (!(_local_5.usesPalette))))
                {
                    return _local_5;
                }
                _local_6 = ((_local_5._Str_3582 + "@") + _arg_2);
                _local_7 = this.getLibraryAsset(_local_6);
                if (_local_7 == null)
                {
                    _local_8 = (_local_5.asset.content as BitmapData);
                    if (_local_8 != null)
                    {
                        _local_9 = this.getPalette(_arg_2);
                        if (_local_9 != null)
                        {
                            _local_10 = _local_8.clone();
                            _local_9.colorizeBitmap(_local_10);
                            _local_7 = this.addLibraryAsset(_local_6, _local_10);
                            if (_local_7 == null)
                            {
                                _local_10.dispose();
                                return null;
                            }
                        }
                        else
                        {
                            return _local_5;
                        }
                    }
                }
                this._paletteAssetNames.push(_local_3);
                this.createAsset(_local_3, _local_6, _local_7, _local_5.flipH, _local_5.flipV, _local_5._Str_20249, _local_5._Str_19351, false);
                _local_4 = this.getAsset(_local_3);
            }
            return _local_4;
        }

        public function _Str_21825():Array
        {
            return this._palettes.getKeys();
        }

        public function _Str_20963(k:String):Array
        {
            var _local_2:GraphicAssetPalette = this.getPalette(k);
            if (_local_2 != null)
            {
                return [_local_2._Str_5845, _local_2._Str_6659];
            }
            return null;
        }

        public function _Str_17888(k:String):XML
        {
            return this._paletteXMLs[k];
        }

        private function getPalette(k:String):GraphicAssetPalette
        {
            var _local_2:GraphicAssetPalette = this._palettes[k];
            return _local_2;
        }

        public function addAsset(k:String, _arg_2:BitmapData, _arg_3:Boolean, _arg_4:int=0, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean
        {
            var _local_9:BitmapData;
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            if (this._library == null)
            {
                return false;
            }
            var _local_8:BitmapDataAsset = this.getLibraryAsset(k);
            if (_local_8 == null)
            {
                _local_8 = new BitmapDataAsset(this._library.getAssetTypeDeclarationByClass(BitmapDataAsset));
                this._library.setAsset(k, _local_8);
                _local_8.setUnknownContent(_arg_2);
                return this.createAsset(k, k, _local_8, _arg_6, _arg_7, _arg_4, _arg_5, false);
            }
            if (_arg_3)
            {
                _local_9 = (_local_8.content as BitmapData);
                if (((!(_local_9 == null)) && (!(_local_9 == _arg_2))))
                {
                    _local_9.dispose();
                }
                _local_8.setUnknownContent(_arg_2);
                return true;
            }
            return false;
        }

        public function disposeAsset(k:String):void
        {
            var _local_3:BitmapDataAsset;
            var _local_2:GraphicAsset = this._assets.remove(k);
            if (_local_2 != null)
            {
                _local_3 = this.getLibraryAsset(_local_2._Str_3582);
                if (_local_3 != null)
                {
                    this._library.removeAsset(_local_3);
                    _local_3.dispose();
                }
                _local_2.recycle();
            }
            else
            {
                delete this._lazyAssetTable[k];
            }
        }

        private function getLibraryAsset(k:String):BitmapDataAsset
        {
            var _local_2:BitmapDataAsset = (this._library.getAssetByName(k) as BitmapDataAsset);
            return _local_2;
        }

        private function addLibraryAsset(k:String, _arg_2:BitmapData):BitmapDataAsset
        {
            var _local_3:BitmapDataAsset = this.getLibraryAsset(k);
            if (_local_3 == null)
            {
                _local_3 = new BitmapDataAsset(this._library.getAssetTypeDeclarationByClass(BitmapDataAsset));
                this._library.setAsset(k, _local_3);
                _local_3.setUnknownContent(_arg_2);
                return _local_3;
            }
            return null;
        }

        private function disposePaletteAssets(k:Boolean=true):void
        {
            var _local_2:String;
            if (this._paletteAssetNames != null)
            {
                if (((k) || (this._paletteAssetNames.length > PALETTE_ASSET_DISPOSE_THRESHOLD)))
                {
                    for each (_local_2 in this._paletteAssetNames)
                    {
                        this.disposeAsset(_local_2);
                    }
                    this._paletteAssetNames = [];
                }
            }
        }
    }
}
