package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class JumpBy extends Interval 
    {
        protected var _startX:int;
        protected var _startY:int;
        protected var _deltaX:Number;
        protected var _deltaY:Number;
        protected var _height:Number;
        protected var _numJumps:int;

        public function JumpBy(k:IWindow, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            super(k, _arg_2);
            this._deltaX = _arg_3;
            this._deltaY = _arg_4;
            this._height = -(_arg_5);
            this._numJumps = _arg_6;
        }

        public override function start():void
        {
            super.start();
            this._startX = target.x;
            this._startY = target.y;
        }

        public override function update(k:Number):void
        {
            super.update(k);
            target.x = (this._startX + (this._deltaX * k));
            target.y = ((this._startY + (this._height * Math.abs(Math.sin(((k * Math.PI) * this._numJumps))))) + (this._deltaY * k));
        }
    }
}
