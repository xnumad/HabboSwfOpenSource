package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class MoveTo extends Interval 
    {
        protected var _startX:Number;
        protected var _startY:Number;
        protected var _endX:Number;
        protected var _endY:Number;
        protected var _deltaX:Number;
        protected var _deltaY:Number;

        public function MoveTo(k:IWindow, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(k, _arg_2);
            this._endX = _arg_3;
            this._endY = _arg_4;
        }

        public override function start():void
        {
            super.start();
            this._startX = target.x;
            this._startY = target.y;
            this._deltaX = (this._endX - this._startX);
            this._deltaY = (this._endY - this._startY);
        }

        public override function update(k:Number):void
        {
            target.x = (this._startX + (this._deltaX * k));
            target.y = (this._startY + (this._deltaY * k));
        }
    }
}
