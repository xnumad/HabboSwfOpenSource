package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import com.sulake.habbo.freeflowchat.viewer.enum.ChatBubbleWidth;
    import flash.geom.Rectangle;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;

    public class ChatBubbleSimulationWithLimitedWideRect extends ChatBubbleSimulationEntity 
    {
        public static const _Str_13155:int = ChatBubbleWidth.WIDE;//240

        private var _wideRectOffset:Number;

        public function ChatBubbleSimulationWithLimitedWideRect(k:PooledChatBubble)
        {
            super(k, false);
            _Str_2864 = new Rectangle();
            _Str_2864.width = _Str_13155;
            _Str_2864.height = (_Str_2700.height / 2);
            this._wideRectOffset = (-(_Str_13155 - _Str_2700.width) / 2);
            _Str_2864.x = (_Str_2700.x + this._wideRectOffset);
            _Str_2864.y = _Str_2700.y;
        }

        override public function set x(k:Number):void
        {
            _x = (_x + ((k - _x) * (1 - _Str_20405)));
            _Str_2700.x = _x;
            if (_Str_2864)
            {
                _Str_2864.x = (_Str_2700.x + this._wideRectOffset);
            }
        }

        override public function initializePosition(k:Number, _arg_2:Number):void
        {
            var _local_3:Rectangle;
            _local_3 = _visualization.overlap;
            _x = (k + ((_local_3) ? _local_3.x : 0));
            _y = (_arg_2 + ((_local_3) ? _local_3.y : 0));
            _Str_2700.x = _x;
            _Str_2700.y = _y;
            if (_Str_2864)
            {
                _Str_2864.x = (_Str_2700.x + this._wideRectOffset);
                _Str_2864.y = _Str_2700.y;
            }
        }

        public function get _Str_5036():Number
        {
            return this._wideRectOffset;
        }

        public function set _Str_5036(k:Number):void
        {
            this._wideRectOffset = k;
        }
    }
}
