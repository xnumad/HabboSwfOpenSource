package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class FurnitureCuboidVisualization extends RoomObjectSpriteVisualization 
    {
        private var _assetLibrary:AssetLibrary = null;
        private var _planes:Array;
        private var _planesInitialized:Boolean = false;
        private var _assetUpdateCounter:int = 0;

        public function FurnitureCuboidVisualization()
        {
            this._planes = [];
            super();
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:FurniturePlane;
            super.dispose();
            if (this._assetLibrary != null)
            {
                this._assetLibrary.dispose();
                this._assetLibrary = null;
            }
            if (this._planes != null)
            {
                k = 0;
                while (k < this._planes.length)
                {
                    _local_2 = (this._planes[k] as FurniturePlane);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._planes = null;
            }
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            reset();
            return true;
        }

        protected function _Str_18024():void
        {
            var k:int = 1;
            createSprites(k);
        }

        protected function initializePlanes():void
        {
            var _local_9:IVector3d;
            var _local_10:FurniturePlane;
            if (this._planesInitialized)
            {
                return;
            }
            var k:IRoomObject = object;
            if (k == null)
            {
                return;
            }
            var _local_2:int = 1;
            var _local_3:Number = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
            var _local_4:Number = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
            var _local_5:Number = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z);
            if ((((isNaN(_local_3)) || (isNaN(_local_4))) || (isNaN(_local_5))))
            {
                return;
            }
            var _local_6:Vector3d = new Vector3d(_local_3, 0, 0);
            var _local_7:Vector3d = new Vector3d(0, _local_4, 0);
            var _local_8:Vector3d = new Vector3d(-0.5, -0.5, 0);
            if ((((!(_local_8 == null)) && (!(_local_6 == null))) && (!(_local_7 == null))))
            {
                _local_9 = Vector3d.crossProduct(_local_6, _local_7);
                _local_10 = new FurniturePlane(_local_8, _local_6, _local_7);
                _local_10.color = 0xFFFF00;
                this._planes.push(_local_10);
            }
            else
            {
                return;
            }
            this._planesInitialized = true;
            this._Str_18024();
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_5:IRoomObject = object;
            if (_local_5 == null)
            {
                return;
            }
            if (this._assetLibrary == null)
            {
                this._assetLibrary = new AssetLibrary(("furniture cuboid visualization - " + _local_5.getInstanceId()));
            }
            if (k == null)
            {
                return;
            }
            this.initializePlanes();
            this._Str_16913(k, _arg_2);
        }

        protected function _Str_16913(k:IRoomGeometry, _arg_2:int):void
        {
            var _local_6:Boolean;
            var _local_7:String;
            var _local_8:BitmapDataAsset;
            var _local_9:FurniturePlane;
            var _local_10:IRoomObjectSprite;
            var _local_11:int;
            var _local_12:BitmapData;
            var _local_13:BitmapData;
            var _local_14:Point;
            var _local_3:IRoomObject = object;
            if (_local_3 == null)
            {
                return;
            }
            if (((k == null) || (this._assetLibrary == null)))
            {
                return;
            }
            this._assetUpdateCounter++;
            var _local_4:int = _arg_2;
            var _local_5:int;
            while (_local_5 < this._planes.length)
            {
                _local_6 = false;
                _local_7 = ((("plane " + _local_5) + " ") + k.scale);
                _local_8 = (this._assetLibrary.getAssetByName(_local_7) as BitmapDataAsset);
                if (_local_8 == null)
                {
                    _local_8 = new BitmapDataAsset(this._assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
                    this._assetLibrary.setAsset(_local_7, _local_8);
                }
                _local_9 = (this._planes[_local_5] as FurniturePlane);
                if (_local_9 != null)
                {
                    _local_11 = _local_3.getDirection().x;
                    if ((((_local_11 / 45) == 2) || ((_local_11 / 45) == 6)))
                    {
                        _local_9.setRotation(true);
                    }
                    else
                    {
                        _local_9.setRotation(false);
                    }
                    if (_local_9.update(k, _local_4))
                    {
                        _local_12 = _local_9.bitmapData;
                        _local_13 = (_local_8.content as BitmapData);
                        if (_local_12 == null)
                        {
                            _local_8 = null;
                        }
                        else
                        {
                            if (_local_13 != _local_12)
                            {
                                if (_local_13 != null)
                                {
                                    _local_13.dispose();
                                }
                                _local_8.setUnknownContent(_local_12);
                            }
                        }
                        _local_6 = true;
                    }
                }
                else
                {
                    _local_8 = null;
                }
                _local_10 = getSprite(_local_5);
                if (_local_10 != null)
                {
                    if (_local_9 != null)
                    {
                        _local_14 = _local_9.offset;
                        _local_10.offsetX = -(_local_14.x);
                        _local_10.offsetY = -(_local_14.y);
                        _local_10.color = _local_9.color;
                        _local_10.visible = _local_9.visible;
                    }
                    else
                    {
                        _local_10.visible = false;
                    }
                    if (_local_8 != null)
                    {
                        _local_10.asset = (_local_8.content as BitmapData);
                    }
                    else
                    {
                        _local_10.asset = null;
                    }
                    if (_local_6)
                    {
                        _local_10.assetName = ((((_local_7 + "_") + _local_3.getInstanceId()) + "_") + this._assetUpdateCounter);
                    }
                    _local_10.relativeDepth = _local_9.relativeDepth;
                }
                _local_5++;
            }
        }
    }
}
