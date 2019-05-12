package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.IWindow;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class ContainerIterator extends Proxy implements IIterator 
    {
        private var _iterable:WindowController;

        public function ContainerIterator(k:WindowController)
        {
            this._iterable = k;
        }

        public function get length():uint
        {
            return this._iterable.numChildren;
        }

        public function indexOf(k:*):int
        {
            return this._iterable.getChildIndex(k);
        }

        override flash_proxy function getProperty(k:*):*
        {
            return this._iterable.getChildAt(uint(k));
        }

        override flash_proxy function setProperty(k:*, _arg_2:*):void
        {
            var _local_3:IWindow = (_arg_2 as IWindow);
            var _local_4:int = this._iterable.getChildIndex(_local_3);
            if (_local_4 == k)
            {
                return;
            }
            if (_local_4 > -1)
            {
                this._iterable.removeChild(_local_3);
            }
            this._iterable.addChildAt(_local_3, uint(k));
        }

        override flash_proxy function nextNameIndex(k:int):int
        {
            return (k < this._iterable.numChildren) ? (k + 1) : 0;
        }

        override flash_proxy function nextValue(k:int):*
        {
            return this._iterable.getChildAt((uint(k) - 1));
        }
    }
}
