package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.IRoomGeometry;

    public class Plane 
    {
        private var _planeVisualizations:Map;
        private var _sizes:Array;
        private var _lastPlaneVisualization:PlaneVisualization = null;
        private var _lastSize:int = -1;

        public function Plane()
        {
            this._sizes = [];
            super();
            this._planeVisualizations = new Map();
        }

        public function isStatic(k:int):Boolean
        {
            return true;
        }

        public function dispose():void
        {
            var k:PlaneVisualization;
            var _local_2:int;
            if (this._planeVisualizations != null)
            {
                k = null;
                _local_2 = 0;
                while (_local_2 < this._planeVisualizations.length)
                {
                    k = (this._planeVisualizations.getWithIndex(_local_2) as PlaneVisualization);
                    if (k != null)
                    {
                        k.dispose();
                    }
                    _local_2++;
                }
                this._planeVisualizations.dispose();
                this._planeVisualizations = null;
            }
            this._lastPlaneVisualization = null;
            this._sizes = null;
        }

        public function _Str_3355():void
        {
            var _local_2:PlaneVisualization;
            var k:int;
            while (k < this._planeVisualizations.length)
            {
                _local_2 = (this._planeVisualizations.getWithIndex(k) as PlaneVisualization);
                if (_local_2 != null)
                {
                    _local_2._Str_3355();
                }
                k++;
            }
        }

        public function createPlaneVisualization(k:int, _arg_2:int, _arg_3:IRoomGeometry):PlaneVisualization
        {
            if (this._planeVisualizations.getValue(String(k)) != null)
            {
                return null;
            }
            var _local_4:PlaneVisualization = new PlaneVisualization(k, _arg_2, _arg_3);
            this._planeVisualizations.add(String(k), _local_4);
            this._sizes.push(k);
            this._sizes.sort();
            return _local_4;
        }

        private function _Str_8560(k:int):int
        {
            var _local_2:int;
            var _local_3:int = 1;
            while (_local_3 < this._sizes.length)
            {
                if (this._sizes[_local_3] > k)
                {
                    if ((this._sizes[_local_3] - k) < (k - this._sizes[(_local_3 - 1)]))
                    {
                        _local_2 = _local_3;
                    }
                    break;
                }
                _local_2 = _local_3;
                _local_3++;
            }
            return _local_2;
        }

        protected function getPlaneVisualization(k:int):PlaneVisualization
        {
            if (k == this._lastSize)
            {
                return this._lastPlaneVisualization;
            }
            var _local_2:int = this._Str_8560(k);
            if (_local_2 < this._sizes.length)
            {
                this._lastPlaneVisualization = (this._planeVisualizations.getValue(String(this._sizes[_local_2])) as PlaneVisualization);
            }
            else
            {
                this._lastPlaneVisualization = null;
            }
            this._lastSize = k;
            return this._lastPlaneVisualization;
        }

        public function _Str_8988():Array
        {
            return this.getPlaneVisualization(this._lastSize)._Str_8988();
        }
    }
}
