package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.visualization.data.SizeData;
    import com.sulake.habbo.room.object.visualization.data.AnimationSizeData;
    import com.sulake.habbo.room.object.visualization.data.AnimationFrame;

    public class AnimatedFurnitureVisualizationData extends FurnitureVisualizationData 
    {


        override protected function createSizeData(k:int, _arg_2:int, _arg_3:int):SizeData
        {
            var _local_4:SizeData;
            _local_4 = new AnimationSizeData(_arg_2, _arg_3);
            return _local_4;
        }

        override protected function processVisualizationElement(k:SizeData, _arg_2:XML):Boolean
        {
            var _local_3:AnimationSizeData;
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            switch (String(_arg_2.name()))
            {
                case "animations":
                    _local_3 = (k as AnimationSizeData);
                    if (_local_3 != null)
                    {
                        if (!_local_3.defineAnimations(_arg_2))
                        {
                            return false;
                        }
                    }
                    break;
                default:
                    if (!super.processVisualizationElement(k, _arg_2))
                    {
                        return false;
                    }
            }
            return true;
        }

        public function _Str_6839(k:int, _arg_2:int):Boolean
        {
            var _local_3:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_3 != null)
            {
                return _local_3._Str_6839(_arg_2);
            }
            return false;
        }

        public function _Str_17743(k:int):int
        {
            var _local_2:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_2 != null)
            {
                return _local_2._Str_17743();
            }
            return 0;
        }

        public function getAnimationId(k:int, _arg_2:int):int
        {
            var _local_3:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_3 != null)
            {
                return _local_3.getAnimationId(_arg_2);
            }
            return 0;
        }

        public function _Str_12484(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_4 != null)
            {
                return _local_4._Str_12484(_arg_2, _arg_3);
            }
            return false;
        }

        public function _Str_9722(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_4 != null)
            {
                return _local_4._Str_9722(_arg_2, _arg_3);
            }
            return 0;
        }

        public function _Str_2259(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):AnimationFrame
        {
            var _local_6:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_6 != null)
            {
                return _local_6._Str_2259(_arg_2, _arg_3, _arg_4, _arg_5);
            }
            return null;
        }

        public function _Str_7945(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int):AnimationFrame
        {
            var _local_8:AnimationSizeData = (getSizeData(k) as AnimationSizeData);
            if (_local_8 != null)
            {
                return _local_8._Str_7945(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
            }
            return null;
        }
    }
}
