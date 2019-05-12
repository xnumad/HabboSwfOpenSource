package com.sulake.habbo.freeflowchat.viewer.simulation
{
    public class ChatFlowGravity 
    {
        public static const _Str_16724:int = 60;
        public static const _Str_8857:int = 15;
        public static const _Str_16944:Number = 40;

        private const _Str_24843:Number = 380;
        private const _Str_26204:Number = 1;


        public function _Str_20468(k:ChatBubbleSimulationEntity, _arg_2:ChatBubbleSimulationEntity, _arg_3:Number=1, _arg_4:Number=100):Number
        {
            var _local_5:Number = Math.abs((_arg_2._Str_13971 - k._Str_13971));
            if (_local_5 > this._Str_24843)
            {
                return 0;
            }
            if (_local_5 < 1)
            {
                return 0;
            }
            var _local_6:int = ((k._Str_13971 <= _arg_2._Str_13971) ? 1 : -1);
            return _local_6 * Math.min(Math.min(_local_5, (_arg_3 / _local_5)), _arg_4);
        }
    }
}
