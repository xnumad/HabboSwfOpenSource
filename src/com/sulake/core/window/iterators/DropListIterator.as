package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.DropListController;
    import com.sulake.core.window.IWindow;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class DropListIterator extends Proxy implements IIterator 
    {
        private var _iterable:DropListController;

        public function DropListIterator(k:DropListController)
        {
            this._iterable = k;
        }

        public function get length():uint
        {
            return this._iterable.numMenuItems;
        }

        public function indexOf(k:*):int
        {
            return this._iterable.getMenuItemIndex(k);
        }

        override flash_proxy function getProperty(k:*):*
        {
            return this._iterable.getMenuItemAt(uint(k));
        }

        override flash_proxy function setProperty(k:*, _arg_2:*):void
        {
            var _local_3:IWindow = (_arg_2 as IWindow);
            var _local_4:int = this._iterable.getMenuItemIndex(_local_3);
            if (_local_4 == k)
            {
                return;
            }
            if (_local_4 > -1)
            {
                this._iterable.removeMenuItem(_local_3);
            }
            this._iterable.addMenuItemAt(_local_3, k);
        }

        override flash_proxy function nextNameIndex(k:int):int
        {
            return (k < this._iterable.numMenuItems) ? (k + 1) : 0;
        }

        override flash_proxy function nextValue(k:int):*
        {
            return this._iterable.getMenuItemAt((uint(k) - 1));
        }
    }
}
