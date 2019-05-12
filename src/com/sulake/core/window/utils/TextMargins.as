package com.sulake.core.window.utils
{
    import com.sulake.core.runtime.IDisposable;

    public class TextMargins implements IMargins, IDisposable 
    {
        private var _left:int;
        private var _right:int;
        private var _top:int;
        private var _bottom:int;
        private var _callback:Function;
        private var _disposed:Boolean = false;

        public function TextMargins(left:int, top:int, right:int, bottom:int, callback:Function)
        {
            this._left = left;
            this._top = top;
            this._right = right;
            this._bottom = bottom;
            this._callback = ((callback != null) ? callback : this.nullCallback);
        }

        public function get left():int
        {
            return this._left;
        }

        public function get right():int
        {
            return this._right;
        }

        public function get top():int
        {
            return this._top;
        }

        public function get bottom():int
        {
            return this._bottom;
        }

        public function set left(left:int):void
        {
            this._left = left;
            this._callback(this);
        }

        public function set right(right:int):void
        {
            this._right = right;
            this._callback(this);
        }

        public function set top(top:int):void
        {
            this._top = top;
            this._callback(this);
        }

        public function set bottom(bottom:int):void
        {
            this._bottom = bottom;
            this._callback(this);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get isZeroes():Boolean
        {
            return (((this._left == 0) && (this._right == 0)) && (this._top == 0)) && (this._bottom == 0);
        }

        public function assign(left:int, top:int, right:int, bottom:int, callback:Function):void
        {
            this._left = left;
            this._top = top;
            this._right = right;
            this._bottom = bottom;
            this._callback = ((callback != null) ? callback : this.nullCallback);
        }

        public function clone(callback:Function):TextMargins
        {
            return new TextMargins(this._left, this._top, this._right, this._bottom, callback);
        }

        public function dispose():void
        {
            this._callback = null;
            this._disposed = true;
        }

        private function nullCallback(k:IMargins):void
        {
        }
    }
}
