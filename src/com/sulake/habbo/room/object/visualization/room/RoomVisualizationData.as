package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
    import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public class RoomVisualizationData implements IRoomObjectVisualizationData 
    {
        private var _wallRasterizer:WallRasterizer;
        private var _floorRasterizer:FloorRasterizer;
        private var _wallAdRasterizer:WallAdRasterizer;
        private var _landscapeRasterizer:LandscapeRasterizer;
        private var _maskManager:PlaneMaskManager;
        private var _initialized:Boolean = false;

        public function RoomVisualizationData()
        {
            this._wallRasterizer = new WallRasterizer();
            this._floorRasterizer = new FloorRasterizer();
            this._wallAdRasterizer = new WallAdRasterizer();
            this._landscapeRasterizer = new LandscapeRasterizer();
            this._maskManager = new PlaneMaskManager();
        }

        public function get _Str_3961():Boolean
        {
            return this._initialized;
        }

        public function get floorRasterizer():IPlaneRasterizer
        {
            return this._floorRasterizer;
        }

        public function get wallRasterizer():IPlaneRasterizer
        {
            return this._wallRasterizer;
        }

        public function get wallAdRasterizr():WallAdRasterizer
        {
            return this._wallAdRasterizer;
        }

        public function get landscapeRasterizer():IPlaneRasterizer
        {
            return this._landscapeRasterizer;
        }

        public function get _Str_16279():PlaneMaskManager
        {
            return this._maskManager;
        }

        public function dispose():void
        {
            if (this._wallRasterizer != null)
            {
                this._wallRasterizer.dispose();
                this._wallRasterizer = null;
            }
            if (this._floorRasterizer != null)
            {
                this._floorRasterizer.dispose();
                this._floorRasterizer = null;
            }
            if (this._wallAdRasterizer != null)
            {
                this._wallAdRasterizer.dispose();
                this._wallAdRasterizer = null;
            }
            if (this._landscapeRasterizer != null)
            {
                this._landscapeRasterizer.dispose();
                this._landscapeRasterizer = null;
            }
            if (this._maskManager != null)
            {
                this._maskManager.dispose();
                this._maskManager = null;
            }
        }

        public function _Str_3355():void
        {
            if (this._wallRasterizer != null)
            {
                this._wallRasterizer._Str_3355();
            }
            if (this._floorRasterizer != null)
            {
                this._floorRasterizer._Str_3355();
            }
            if (this._landscapeRasterizer != null)
            {
                this._landscapeRasterizer._Str_3355();
            }
        }

        public function initialize(k:XML):Boolean
        {
            var _local_7:XML;
            var _local_8:XML;
            var _local_9:XML;
            var _local_10:XML;
            var _local_11:XML;
            this.reset();
            if (k == null)
            {
                return false;
            }
            var _local_2:XMLList = k.wallData;
            if (_local_2.length() > 0)
            {
                _local_7 = _local_2[0];
                this._wallRasterizer.initialize(_local_7);
            }
            var _local_3:XMLList = k.floorData;
            if (_local_3.length() > 0)
            {
                _local_8 = _local_3[0];
                this._floorRasterizer.initialize(_local_8);
            }
            var _local_4:XMLList = k.wallAdData;
            if (_local_4.length() > 0)
            {
                _local_9 = _local_4[0];
                this._wallAdRasterizer.initialize(_local_9);
            }
            var _local_5:XMLList = k.landscapeData;
            if (_local_5.length() > 0)
            {
                _local_10 = _local_5[0];
                this._landscapeRasterizer.initialize(_local_10);
            }
            var _local_6:XMLList = k.maskData;
            if (_local_6.length() > 0)
            {
                _local_11 = _local_6[0];
                this._maskManager.initialize(_local_11);
            }
            return true;
        }

        public function _Str_6703(k:IGraphicAssetCollection):void
        {
            if (this._initialized)
            {
                return;
            }
            this._wallRasterizer._Str_6703(k);
            this._floorRasterizer._Str_6703(k);
            this._wallAdRasterizer._Str_6703(k);
            this._landscapeRasterizer._Str_6703(k);
            this._maskManager._Str_6703(k);
            this._initialized = true;
        }

        protected function reset():void
        {
        }
    }
}
