package com.sulake.habbo.room.object.visualization.pet
{
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualizationData;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.object.visualization.data.SizeData;
    import com.sulake.habbo.room.object.visualization.data.AnimationSizeData;

    public class AnimatedPetVisualizationData extends AnimatedFurnitureVisualizationData 
    {
        private var _commonAssets:IAssetLibrary = null;
        private var _isAllowedToTurnHead:Boolean = true;


        public function set _Str_14822(k:IAssetLibrary):void
        {
            this._commonAssets = k;
        }

        public function get _Str_14822():IAssetLibrary
        {
            return this._commonAssets;
        }

        override protected function defineVisualizations(k:XML):Boolean
        {
            this._isAllowedToTurnHead = ((k.graphics.hasOwnProperty("@disableheadturn")) ? (!(k.graphics.@disableheadturn == "1")) : true);
            return super.defineVisualizations(k);
        }

        override protected function createSizeData(k:int, _arg_2:int, _arg_3:int):SizeData
        {
            var _local_4:SizeData;
            if (k > 1)
            {
                _local_4 = new PetAnimationSizeData(_arg_2, _arg_3);
            }
            else
            {
                _local_4 = new AnimationSizeData(_arg_2, _arg_3);
            }
            return _local_4;
        }

        override protected function processVisualizationElement(k:SizeData, _arg_2:XML):Boolean
        {
            var _local_3:PetAnimationSizeData;
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            switch (String(_arg_2.name()))
            {
                case "postures":
                    _local_3 = (k as PetAnimationSizeData);
                    if (_local_3 != null)
                    {
                        if (!_local_3.definePostures(_arg_2))
                        {
                            return false;
                        }
                    }
                    break;
                case "gestures":
                    _local_3 = (k as PetAnimationSizeData);
                    if (_local_3 != null)
                    {
                        if (!_local_3.defineGestures(_arg_2))
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

        public function _Str_17648(k:int, _arg_2:String):int
        {
            var _local_3:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_3 != null)
            {
                return _local_3._Str_17648(_arg_2);
            }
            return PetAnimationSizeData.ANIMATION_NOT_DEFINED_ID;
        }

        public function _Str_18284(k:int, _arg_2:String):Boolean
        {
            var _local_3:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_3 != null)
            {
                return _local_3._Str_18284(_arg_2);
            }
            return false;
        }

        public function _Str_18268(k:int, _arg_2:String):int
        {
            var _local_3:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_3 != null)
            {
                return _local_3._Str_18268(_arg_2);
            }
            return PetAnimationSizeData.ANIMATION_NOT_DEFINED_ID;
        }

        public function _Str_14207(k:int, _arg_2:int, _arg_3:Boolean):String
        {
            var _local_4:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_4 != null)
            {
                return _local_4._Str_14207(_arg_2, _arg_3);
            }
            return null;
        }

        public function _Str_17844(k:int, _arg_2:int):String
        {
            var _local_3:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_3 != null)
            {
                return _local_3._Str_17844(_arg_2);
            }
            return null;
        }

        public function _Str_17976(k:int, _arg_2:int):String
        {
            var _local_3:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            return (_local_3 == null) ? null : _local_3._Str_17976(_arg_2);
        }

        public function _Str_17398(k:int):int
        {
            var _local_2:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_2 != null)
            {
                return _local_2._Str_17398();
            }
            return 0;
        }

        public function _Str_16869(k:int):int
        {
            var _local_2:PetAnimationSizeData = (getSizeData(k) as PetAnimationSizeData);
            if (_local_2 != null)
            {
                return _local_2._Str_16869();
            }
            return 0;
        }

        public function get isAllowedToTurnHead():Boolean
        {
            return this._isAllowedToTurnHead;
        }
    }
}
