package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.room.utils.Rasterizer;
    import flash.geom.Point;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;

    public class PlaneRasterizer implements IPlaneRasterizer 
    {
        protected static const DEFAULT:String = "default";

        private var _assetCollection:IGraphicAssetCollection = null;
        private var _materials:Map = null;
        private var _textures:Map = null;
        private var _planes:Map = null;
        private var _geometries:Map = null;
        private var _data:XML = null;

        public function PlaneRasterizer()
        {
            this._textures = new Map();
            this._materials = new Map();
            this._planes = new Map();
            this._geometries = new Map();
        }

        protected function get data():XML
        {
            return this._data;
        }

        protected function get assetCollection():IGraphicAssetCollection
        {
            return this._assetCollection;
        }

        public function initializeDimensions(k:int, _arg_2:int):Boolean
        {
            return true;
        }

        public function dispose():void
        {
            var _local_2:Plane;
            var _local_3:RoomGeometry;
            var k:int;
            if (this._planes != null)
            {
                k = 0;
                while (k < this._planes.length)
                {
                    _local_2 = (this._planes.getWithIndex(k) as Plane);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._planes.dispose();
                this._planes = null;
            }
            if (this._materials != null)
            {
                this.resetMaterials();
                this._materials.dispose();
                this._materials = null;
            }
            if (this._textures != null)
            {
                this.resetTextures();
                this._textures.dispose();
                this._textures = null;
            }
            if (this._geometries != null)
            {
                k = 0;
                while (k < this._geometries.length)
                {
                    _local_3 = this._geometries.getWithIndex(k);
                    if (_local_3 != null)
                    {
                        _local_3.dispose();
                    }
                    k++;
                }
                this._geometries.dispose();
                this._geometries = null;
            }
            this._data = null;
            this._assetCollection = null;
        }

        public function _Str_3355():void
        {
            var _local_2:Plane;
            var _local_3:PlaneMaterial;
            var k:int;
            k = 0;
            while (k < this._planes.length)
            {
                _local_2 = (this._planes.getWithIndex(k) as Plane);
                if (_local_2 != null)
                {
                    _local_2._Str_3355();
                }
                k++;
            }
            k = 0;
            while (k < this._materials.length)
            {
                _local_3 = (this._materials.getWithIndex(k) as PlaneMaterial);
                if (_local_3 != null)
                {
                    _local_3._Str_3355();
                }
                k++;
            }
        }

        public function initialize(k:XML):void
        {
            this._data = k;
        }

        public function _Str_24005():void
        {
            this.resetTextures();
            this.resetMaterials();
            this.initializeAll();
        }

        private function resetMaterials():void
        {
            var _local_2:PlaneMaterial;
            var k:int;
            while (k < this._materials.length)
            {
                _local_2 = (this._materials.getWithIndex(k) as PlaneMaterial);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                }
                k++;
            }
            this._materials.reset();
        }

        private function resetTextures():void
        {
            var _local_2:PlaneTexture;
            var k:int;
            while (k < this._textures.length)
            {
                _local_2 = (this._textures.getWithIndex(k) as PlaneTexture);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                }
                k++;
            }
            this._textures.reset();
        }

        protected function _Str_10114(k:String):PlaneTexture
        {
            return this._textures.getValue(k) as PlaneTexture;
        }

        protected function material(k:String):PlaneMaterial
        {
            return this._materials.getValue(k) as PlaneMaterial;
        }

        protected function getPlane(k:String):Plane
        {
            return this._planes.getValue(k);
        }

        protected function _Str_3453(k:String, _arg_2:Plane):Boolean
        {
            if (_arg_2 == null)
            {
                return false;
            }
            if (this._planes.getValue(k) == null)
            {
                this._planes.add(k, _arg_2);
                return true;
            }
            return false;
        }

        public function _Str_6703(k:IGraphicAssetCollection):void
        {
            if (this.data == null)
            {
                return;
            }
            this._assetCollection = k;
            this.initializeAll();
        }

        private function initializeAll():void
        {
            if (this.data == null)
            {
                return;
            }
            this.initializeTexturesAndMaterials();
            this.initializePlanes();
        }

        private function initializeTexturesAndMaterials():void
        {
            var k:XMLList = this.data.textures;
            if (k.length() > 0)
            {
                this.parseTextures(k[0], this.assetCollection);
            }
            var _local_2:XMLList = this.data.materials;
            if (_local_2.length() > 0)
            {
                this.parsePlaneMaterials(_local_2[0]);
            }
        }

        protected function initializePlanes():void
        {
        }

        private function parseTextures(k:XML, _arg_2:IGraphicAssetCollection):void
        {
            var _local_5:XML;
            var _local_6:String;
            var _local_7:PlaneTexture;
            var _local_8:XMLList;
            var _local_9:int;
            var _local_10:XML;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:String;
            var _local_16:IGraphicAsset;
            var _local_17:BitmapDataAsset;
            var _local_18:BitmapData;
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            var _local_3:XMLList = k.texture;
            var _local_4:int;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                if (XMLValidator.checkRequiredAttributes(_local_5, ["id"]))
                {
                    _local_6 = _local_5.@id;
                    if (this._textures.getValue(_local_6) == null)
                    {
                        _local_7 = new PlaneTexture();
                        _local_8 = _local_5.bitmap;
                        _local_9 = 0;
                        while (_local_9 < _local_8.length())
                        {
                            _local_10 = _local_8[_local_9];
                            if (XMLValidator.checkRequiredAttributes(_local_10, ["assetName"]))
                            {
                                _local_11 = PlaneTexture.MIN_NORMAL_COORDINATE_VALUE;
                                _local_12 = PlaneTexture.MAX_NORMAL_COORDINATE_VALUE;
                                _local_13 = PlaneTexture.MIN_NORMAL_COORDINATE_VALUE;
                                _local_14 = PlaneTexture.MAX_NORMAL_COORDINATE_VALUE;
                                if (String(_local_10.@normalMinX) != "")
                                {
                                    _local_11 = parseFloat(_local_10.@normalMinX);
                                }
                                if (String(_local_10.@normalMaxX) != "")
                                {
                                    _local_12 = parseFloat(_local_10.@normalMaxX);
                                }
                                if (String(_local_10.@normalMinY) != "")
                                {
                                    _local_13 = parseFloat(_local_10.@normalMinY);
                                }
                                if (String(_local_10.@normalMaxY) != "")
                                {
                                    _local_14 = parseFloat(_local_10.@normalMaxY);
                                }
                                _local_15 = _local_10.@assetName;
                                _local_16 = _arg_2.getAsset(_local_15);
                                if (_local_16 != null)
                                {
                                    _local_17 = (_local_16.asset as BitmapDataAsset);
                                    if (_local_17 != null)
                                    {
                                        _local_18 = (_local_17.content as BitmapData);
                                        if (_local_18 != null)
                                        {
                                            if (_local_16.flipH)
                                            {
                                                _local_18 = Rasterizer.getFlipHBitmapData(_local_18);
                                            }
                                            else
                                            {
                                                _local_18 = _local_18.clone();
                                            }
                                            _local_7.addBitmap(_local_18, _local_11, _local_12, _local_13, _local_14, _local_15);
                                        }
                                    }
                                }
                            }
                            _local_9++;
                        }
                        this._textures.add(_local_6, _local_7);
                    }
                }
                _local_4++;
            }
        }

        private function parsePlaneMaterials(k:XML):void
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:PlaneMaterial;
            var _local_7:XMLList;
            var _local_8:int;
            var _local_9:XML;
            var _local_10:String;
            var _local_11:String;
            var _local_12:int;
            var _local_13:int;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:XMLList;
            var _local_19:PlaneMaterialCellMatrix;
            var _local_20:int;
            var _local_21:XML;
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.material;
            var _local_3:int;
            while (_local_3 < _local_2.length())
            {
                _local_4 = _local_2[_local_3];
                if (XMLValidator.checkRequiredAttributes(_local_4, ["id"]))
                {
                    _local_5 = _local_4.@id;
                    _local_6 = new PlaneMaterial();
                    _local_7 = _local_4.materialCellMatrix;
                    _local_8 = 0;
                    while (_local_8 < _local_7.length())
                    {
                        _local_9 = _local_7[_local_8];
                        _local_10 = _local_9.@repeatMode;
                        _local_11 = _local_9.@align;
                        _local_12 = PlaneMaterialCellMatrix.REPEAT_MODE_DEFAULT;
                        switch (_local_10)
                        {
                            case "borders":
                                _local_12 = PlaneMaterialCellMatrix.REPEAT_MODE_BORDERS;
                                break;
                            case "center":
                                _local_12 = PlaneMaterialCellMatrix.REPEAT_MODE_CENTER;
                                break;
                            case "first":
                                _local_12 = PlaneMaterialCellMatrix.REPEAT_MODE_FIRST;
                                break;
                            case "last":
                                _local_12 = PlaneMaterialCellMatrix.REPEAT_MODE_LAST;
                                break;
                            case "random":
                                _local_12 = PlaneMaterialCellMatrix.REPEAT_MODE_RANDOM;
                                break;
                        }
                        _local_13 = PlaneMaterialCellMatrix.ALIGN_DEFAULT;
                        switch (_local_11)
                        {
                            case "top":
                                _local_13 = PlaneMaterialCellMatrix.ALIGN_TOP;
                                break;
                            case "bottom":
                                _local_13 = PlaneMaterialCellMatrix.ALIGN_BOTTOM;
                                break;
                        }
                        _local_14 = PlaneMaterialCellMatrix.MIN_NORMAL_COORDINATE_VALUE;
                        _local_15 = PlaneMaterialCellMatrix.MAX_NORMAL_COORDINATE_VALUE;
                        _local_16 = PlaneMaterialCellMatrix.MIN_NORMAL_COORDINATE_VALUE;
                        _local_17 = PlaneMaterialCellMatrix.MAX_NORMAL_COORDINATE_VALUE;
                        if (String(_local_9.@normalMinX) != "")
                        {
                            _local_14 = parseFloat(_local_9.@normalMinX);
                        }
                        if (String(_local_9.@normalMaxX) != "")
                        {
                            _local_15 = parseFloat(_local_9.@normalMaxX);
                        }
                        if (String(_local_9.@normalMinY) != "")
                        {
                            _local_16 = parseFloat(_local_9.@normalMinY);
                        }
                        if (String(_local_9.@normalMaxY) != "")
                        {
                            _local_17 = parseFloat(_local_9.@normalMaxY);
                        }
                        _local_18 = _local_9.materialCellColumn;
                        if (_local_18.length() > 0)
                        {
                            _local_19 = null;
                            _local_19 = _local_6.addMaterialCellMatrix(_local_18.length(), _local_12, _local_13, _local_14, _local_15, _local_16, _local_17);
                            _local_20 = 0;
                            while (_local_20 < _local_18.length())
                            {
                                _local_21 = _local_18[_local_20];
                                this.parsePlaneMaterialCellColumn(_local_21, _local_19, _local_20);
                                _local_20++;
                            }
                        }
                        this._materials.add(_local_5, _local_6);
                        _local_8++;
                    }
                }
                _local_3++;
            }
        }

        private function parsePlaneMaterialCellColumn(k:XML, _arg_2:PlaneMaterialCellMatrix, _arg_3:int):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            var _local_4:String = k.@repeatMode;
            var _local_5:int = parseInt(k.@width);
            var _local_6:int = PlaneMaterialCellColumn.REPEAT_MODE_ALL;
            switch (_local_4)
            {
                case "borders":
                    _local_6 = PlaneMaterialCellColumn.REPEAT_MODE_BORDERS;
                    break;
                case "center":
                    _local_6 = PlaneMaterialCellColumn.REPEAT_MODE_CENTER;
                    break;
                case "first":
                    _local_6 = PlaneMaterialCellColumn.REPEAT_MODE_FIRST;
                    break;
                case "last":
                    _local_6 = PlaneMaterialCellColumn.REPEAT_MODE_LAST;
                    break;
                case "none":
                    _local_6 = PlaneMaterialCellColumn.REPEAT_MODE_NONE;
            }
            var _local_7:Array = this.parsePlaneMaterialCells(k);
            _arg_2.createColumn(_arg_3, _local_5, _local_7, _local_6);
        }

        private function parsePlaneMaterialCells(k:XML):Array
        {
            var _local_5:XML;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:int;
            var _local_11:XMLList;
            var _local_12:PlaneTexture;
            var _local_13:PlaneMaterialCell;
            var _local_14:XML;
            var _local_15:XMLList;
            var _local_16:XMLList;
            var _local_17:XML;
            var _local_18:XML;
            var _local_19:int;
            var _local_20:String;
            var _local_21:IGraphicAsset;
            if (k == null)
            {
                return null;
            }
            var _local_2:Array = [];
            var _local_3:XMLList = k.materialCell;
            var _local_4:int;
            while (_local_4 < _local_3.length())
            {
                _local_5 = _local_3[_local_4];
                _local_6 = _local_5.@textureId;
                _local_7 = null;
                _local_8 = null;
                _local_9 = null;
                _local_10 = 0;
                _local_11 = _local_5.extraItemData;
                if (_local_11.length() > 0)
                {
                    _local_14 = _local_11[0];
                    _local_15 = _local_14.extraItemTypes;
                    _local_16 = _local_14.offsets;
                    if (((_local_15.length() > 0) && (_local_16.length() > 0)))
                    {
                        _local_17 = _local_15[0];
                        _local_18 = _local_16[0];
                        _local_7 = this.parseExtraItemTypes(_local_17);
                        _local_9 = this.parseExtraItemOffsets(_local_18);
                        _local_10 = _local_9.length;
                        if (String(_local_14.@limitMax) != "")
                        {
                            _local_10 = parseInt(_local_14.@limitMax);
                        }
                    }
                }
                if (_local_7 != null)
                {
                    _local_8 = [];
                    _local_19 = 0;
                    while (_local_19 < _local_7.length)
                    {
                        _local_20 = _local_7[_local_4];
                        _local_21 = this._assetCollection.getAsset(_local_20);
                        if (_local_21 != null)
                        {
                            _local_8.push(_local_21);
                        }
                        _local_19++;
                    }
                }
                _local_12 = this._Str_10114(_local_6);
                _local_13 = new PlaneMaterialCell(_local_12, _local_8, _local_9, _local_10);
                _local_2.push(_local_13);
                _local_4++;
            }
            if (_local_2.length == 0)
            {
                _local_2 = null;
            }
            return _local_2;
        }

        private function parseExtraItemTypes(k:XML):Array
        {
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:XML;
            var _local_7:String;
            var _local_2:Array = [];
            var _local_3:Array = ["assetName"];
            if (k != null)
            {
                _local_4 = k.extraItemType;
                _local_5 = 0;
                while (_local_5 < _local_4.length())
                {
                    _local_6 = _local_4[_local_5];
                    if (XMLValidator.checkRequiredAttributes(_local_6, _local_3))
                    {
                        _local_7 = _local_6.@assetName;
                        _local_2.push(_local_7);
                    }
                    _local_5++;
                }
            }
            return _local_2;
        }

        private function parseExtraItemOffsets(k:XML):Array
        {
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:XML;
            var _local_7:int;
            var _local_8:int;
            var _local_2:Array = [];
            var _local_3:Array = ["x", "y"];
            if (k != null)
            {
                _local_4 = k.offset;
                _local_5 = 0;
                while (_local_5 < _local_4.length())
                {
                    _local_6 = _local_4[_local_5];
                    if (XMLValidator.checkRequiredAttributes(_local_6, _local_3))
                    {
                        _local_7 = parseInt(_local_6.@x);
                        _local_8 = parseInt(_local_6.@y);
                        _local_2.push(new Point(_local_7, _local_8));
                    }
                    _local_5++;
                }
            }
            return _local_2;
        }

        protected function getGeometry(k:int, _arg_2:Number, _arg_3:Number):IRoomGeometry
        {
            _arg_2 = Math.abs(_arg_2);
            if (_arg_2 > 90)
            {
                _arg_2 = 90;
            }
            _arg_3 = Math.abs(_arg_3);
            if (_arg_3 > 90)
            {
                _arg_3 = 90;
            }
            var _local_4:String = ((((k + "_") + Math.round(_arg_2)) + "_") + Math.round(_arg_3));
            var _local_5:IRoomGeometry = this._geometries.getValue(_local_4);
            if (_local_5 == null)
            {
                _local_5 = new RoomGeometry(k, new Vector3d(_arg_2, _arg_3), new Vector3d(-10, 0, 0));
                this._geometries.add(_local_4, _local_5);
            }
            return _local_5;
        }

        protected function parseVisualizations(k:Plane, _arg_2:XMLList):void
        {
            var _local_4:XML;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:XMLList;
            var _local_11:PlaneVisualization;
            var _local_12:int;
            var _local_13:XML;
            var _local_14:PlaneMaterial;
            var _local_15:int;
            var _local_16:String;
            var _local_17:int;
            var _local_18:String;
            var _local_19:uint;
            var _local_20:String;
            var _local_21:String;
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            var _local_3:int;
            while (_local_3 < _arg_2.length())
            {
                _local_4 = _arg_2[_local_3];
                if (XMLValidator.checkRequiredAttributes(_local_4, ["size"]))
                {
                    _local_5 = parseInt(_local_4.@size);
                    _local_6 = _local_4.@horizontalAngle;
                    _local_7 = _local_4.@verticalAngle;
                    _local_8 = FloorPlane.HORIZONTAL_ANGLE_DEFAULT;
                    if (_local_6 != "")
                    {
                        _local_8 = parseFloat(_local_6);
                    }
                    _local_9 = FloorPlane.VERTICAL_ANGLE_DEFAULT;
                    if (_local_7 != "")
                    {
                        _local_9 = parseFloat(_local_7);
                    }
                    _local_10 = _local_4.visualizationLayer;
                    _local_11 = k.createPlaneVisualization(_local_5, _local_10.length(), this.getGeometry(_local_5, _local_8, _local_9));
                    if (_local_11 != null)
                    {
                        _local_12 = 0;
                        while (_local_12 < _local_10.length())
                        {
                            _local_13 = _local_10[_local_12];
                            _local_14 = null;
                            _local_15 = PlaneVisualizationLayer.ALIGN_DEFAULT;
                            if (XMLValidator.checkRequiredAttributes(_local_13, ["materialId"]))
                            {
                                _local_21 = _local_13.@materialId;
                                _local_14 = this.material(_local_21);
                            }
                            _local_16 = _local_13.@offset;
                            _local_17 = PlaneVisualizationLayer.DEFAULT_OFFSET;
                            if (_local_16.length > 0)
                            {
                                _local_17 = parseInt(_local_16);
                            }
                            _local_18 = _local_13.@color;
                            _local_19 = FloorPlane.DEFAULT_COLOR;
                            if (_local_18.length > 0)
                            {
                                _local_19 = parseInt(_local_18);
                            }
                            _local_20 = _local_13.@align;
                            if (_local_20 == "bottom")
                            {
                                _local_15 = PlaneVisualizationLayer.ALIGN_BOTTOM;
                            }
                            else
                            {
                                if (_local_20 == "top")
                                {
                                    _local_15 = PlaneVisualizationLayer.ALIGN_TOP;
                                }
                            }
                            _local_11.setLayer(_local_12, _local_14, _local_19, _local_15, _local_17);
                            _local_12++;
                        }
                    }
                }
                _local_3++;
            }
        }

        public function render(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, _arg_10:Number=0, _arg_11:Number=0, _arg_12:int=0):PlaneBitmapData
        {
            return null;
        }

        public function getTextureIdentifier(k:Number, _arg_2:IVector3d):String
        {
            return String(k);
        }

        public function _Str_8988(k:String):Array
        {
            var _local_2:Plane = this.getPlane(k);
            if (_local_2 == null)
            {
                _local_2 = this.getPlane(DEFAULT);
            }
            return _local_2._Str_8988();
        }
    }
}
