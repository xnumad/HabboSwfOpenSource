package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class ResizeTo extends Interval 
    {
        protected var _startW:Number;
        protected var _startH:Number;
        protected var _endW:Number;
        protected var _endH:Number;
        protected var _deltaW:Number;
        protected var _deltaH:Number;

        public function ResizeTo(k:IWindow, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(k, _arg_2);
            this._endW = _arg_3;
            this._endH = _arg_4;
        }

        public override final function start():void
        {
            super.start();
            this._startW = target.width;
            this._startH = target.height;
            this._deltaW = (this._endW - this._startW);
            this._deltaH = (this._endH - this._startH);
        }

        public override final function update(k:Number):void
        {
            target.width = (this._startW + (this._deltaW * k));
            target.height = (this._startH + (this._deltaH * k));
        }
    }
}
