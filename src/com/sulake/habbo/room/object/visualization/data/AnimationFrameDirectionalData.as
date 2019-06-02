package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrameDirectionalData extends AnimationFrameData 
    {
        private var _directionalOffsets:DirectionalOffsetData;

        public function AnimationFrameDirectionalData(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:DirectionalOffsetData, _arg_7:int)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_7);
            this._directionalOffsets = _arg_6;
        }

        override public function hasDirectionalOffsets():Boolean
        {
            return !(this._directionalOffsets == null);
        }

        override public function getX(k:int):int
        {
            if (this._directionalOffsets != null)
            {
                return this._directionalOffsets.getOffsetX(k, super.getX(k));
            }
            return super.getX(k);
        }

        override public function getY(k:int):int
        {
            if (this._directionalOffsets != null)
            {
                return this._directionalOffsets.getOffsetY(k, super.getY(k));
            }
            return super.getY(k);
        }
    }
}
