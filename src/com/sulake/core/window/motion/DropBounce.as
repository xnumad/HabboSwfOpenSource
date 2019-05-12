package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class DropBounce extends Interval 
    {
        private var _height:int;
        private var _offset:int;

        public function DropBounce(k:IWindow, _arg_2:int, _arg_3:int)
        {
            super(k, _arg_2);
            this._height = _arg_3;
        }

        public override final function start():void
        {
            super.start();
            this._offset = target.y;
            target.y = (this._offset - this._height);
        }

        public override final function update(k:Number):void
        {
            super.update(k);
            target.y = ((this._offset - this._height) + (this.getBounceOffset(k) * this._height));
        }

        protected function getBounceOffset(k:Number):Number
        {
            if (k < 0.364)
            {
                return (7.5625 * k) * k;
            }
            if (k < 0.727)
            {
                k = (k - 0.545);
                return ((7.5625 * k) * k) + 0.75;
            }
            if (k < 0.909)
            {
                k = (k - 0.9091);
                return ((7.5625 * k) * k) + 0.9375;
            }
            k = (k - 0.955);
            return ((7.5625 * k) * k) + 0.984375;
        }

        public override final function stop():void
        {
            target.y = this._offset;
            super.stop();
        }
    }
}
