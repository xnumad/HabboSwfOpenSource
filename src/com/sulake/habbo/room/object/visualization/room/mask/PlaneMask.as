package com.sulake.habbo.room.object.visualization.room.mask
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.utils.IVector3d;

    public class PlaneMask 
    {
        private var _maskVisualizations:Map;
        private var _sizes:Array;
        private var _assetNames:Map;
        private var _lastMaskVisualization:PlaneMaskVisualization = null;
        private var _lastSize:int = -1;

        public function PlaneMask()
        {
            this._sizes = [];
            super();
            this._maskVisualizations = new Map();
            this._assetNames = new Map();
        }

        public function dispose():void
        {
            var k:PlaneMaskVisualization;
            var _local_2:int;
            if (this._maskVisualizations != null)
            {
                k = null;
                _local_2 = 0;
                while (_local_2 < this._maskVisualizations.length)
                {
                    k = (this._maskVisualizations.getWithIndex(_local_2) as PlaneMaskVisualization);
                    if (k != null)
                    {
                        k.dispose();
                    }
                    _local_2++;
                }
                this._maskVisualizations.dispose();
                this._maskVisualizations = null;
            }
            this._lastMaskVisualization = null;
            this._sizes = null;
        }

        public function createMaskVisualization(k:int):PlaneMaskVisualization
        {
            if (this._maskVisualizations.getValue(String(k)) != null)
            {
                return null;
            }
            var _local_2:PlaneMaskVisualization = new PlaneMaskVisualization();
            this._maskVisualizations.add(String(k), _local_2);
            this._sizes.push(k);
            this._sizes.sort();
            return _local_2;
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

        protected function getMaskVisualization(k:int):PlaneMaskVisualization
        {
            if (k == this._lastSize)
            {
                return this._lastMaskVisualization;
            }
            var _local_2:int = this._Str_8560(k);
            if (_local_2 < this._sizes.length)
            {
                this._lastMaskVisualization = (this._maskVisualizations.getValue(String(this._sizes[_local_2])) as PlaneMaskVisualization);
            }
            else
            {
                this._lastMaskVisualization = null;
            }
            this._lastSize = k;
            return this._lastMaskVisualization;
        }

        public function getGraphicAsset(k:Number, _arg_2:IVector3d):IGraphicAsset
        {
            var _local_3:PlaneMaskVisualization = this.getMaskVisualization(k);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:IGraphicAsset = _local_3.getAsset(_arg_2);
            return _local_4;
        }

        public function getAliasByName(k:int):String
        {
            return this._assetNames.getValue(k);
        }

        public function _Str_24425(k:int, _arg_2:String):void
        {
            this._assetNames.add(k, _arg_2);
        }
    }
}
