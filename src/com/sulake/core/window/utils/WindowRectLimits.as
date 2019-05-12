package com.sulake.core.window.utils
{
    import com.sulake.core.window.IWindow;

    public class WindowRectLimits implements IRectLimiter 
    {
        private var _minWidth:int = -2147483648;
        private var _maxWidth:int = 2147483647;
        private var _minHeight:int = -2147483648;
        private var _maxHeight:int = 2147483647;
        private var _target:IWindow;

        public function WindowRectLimits(target:IWindow)
        {
            this._target = target;
        }

        public function get minWidth():int
        {
            return this._minWidth;
        }

        public function get maxWidth():int
        {
            return this._maxWidth;
        }

        public function get minHeight():int
        {
            return this._minHeight;
        }

        public function get maxHeight():int
        {
            return this._maxHeight;
        }

        public function set minWidth(minWidth:int):void
        {
            this._minWidth = minWidth;
            if ((((this._minWidth > int.MIN_VALUE) && (!(this._target.disposed))) && (this._target.width < this._minWidth)))
            {
                this._target.width = this._minWidth;
            }
        }

        public function set maxWidth(maxWidth:int):void
        {
            this._maxWidth = maxWidth;
            if ((((this._maxWidth < int.MAX_VALUE) && (!(this._target.disposed))) && (this._target.width > this._maxWidth)))
            {
                this._target.width = this._maxWidth;
            }
        }

        public function set minHeight(minHeight:int):void
        {
            this._minHeight = minHeight;
            if ((((this._minHeight > int.MIN_VALUE) && (!(this._target.disposed))) && (this._target.height < this._minHeight)))
            {
                this._target.height = this._minHeight;
            }
        }

        public function set maxHeight(maxHeight:int):void
        {
            this._maxHeight = maxHeight;
            if ((((this._maxHeight < int.MAX_VALUE) && (!(this._target.disposed))) && (this._target.height > this._maxHeight)))
            {
                this._target.height = this._maxHeight;
            }
        }

        public function get isEmpty():Boolean
        {
            return (((this._minWidth == int.MIN_VALUE) && (this._maxWidth == int.MAX_VALUE)) && (this._minHeight == int.MIN_VALUE)) && (this._maxHeight == int.MAX_VALUE);
        }

        public function setEmpty():void
        {
            this._minWidth = int.MIN_VALUE;
            this._maxWidth = int.MAX_VALUE;
            this._minHeight = int.MIN_VALUE;
            this._maxHeight = int.MAX_VALUE;
        }

        public function limit():void
        {
            if (((!(this.isEmpty)) && (this._target)))
            {
                if (this._target.width < this._minWidth)
                {
                    this._target.width = this._minWidth;
                }
                else
                {
                    if (this._target.width > this._maxWidth)
                    {
                        this._target.width = this._maxWidth;
                    }
                }
                if (this._target.height < this._minHeight)
                {
                    this._target.height = this._minHeight;
                }
                else
                {
                    if (this._target.height > this._maxHeight)
                    {
                        this._target.height = this._maxHeight;
                    }
                }
            }
        }

        public function assign(minWidth:int, maxWidth:int, minHeight:int, maxHeight:int):void
        {
            this._minWidth = minWidth;
            this._maxWidth = maxWidth;
            this._minHeight = minHeight;
            this._maxHeight = maxHeight;
            this.limit();
        }

        public function clone(k:IWindow):WindowRectLimits
        {
            var limits:WindowRectLimits = new WindowRectLimits(k);
            limits._minWidth = this._minWidth;
            limits._maxWidth = this._maxWidth;
            limits._minHeight = this._minHeight;
            limits._maxHeight = this._maxHeight;
            return limits;
        }
    }
}
