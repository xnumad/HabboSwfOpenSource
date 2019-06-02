package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.ItemListController;
    import com.sulake.core.window.IWindow;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class ItemListIterator extends Proxy implements IIterator 
    {
        private var _iterable:ItemListController;

        public function ItemListIterator(k:ItemListController)
        {
            this._iterable = k;
        }

        public function get length():uint
        {
            return this._iterable.numListItems;
        }

        public function indexOf(k:*):int
        {
            return this._iterable.getListItemIndex(k);
        }

        override flash_proxy function getProperty(k:*):*
        {
            return this._iterable.getListItemAt(uint(k));
        }

        override flash_proxy function setProperty(k:*, _arg_2:*):void
        {
            var _local_3:IWindow = (_arg_2 as IWindow);
            var _local_4:int = this._iterable.getListItemIndex(_local_3);
            if (_local_4 == k)
            {
                return;
            }
            if (_local_4 > -1)
            {
                this._iterable.removeListItem(_local_3);
            }
            this._iterable.addListItemAt(_local_3, uint(k));
        }

        override flash_proxy function nextNameIndex(k:int):int
        {
            return (k < this._iterable.numListItems) ? (k + 1) : 0;
        }

        override flash_proxy function nextValue(k:int):*
        {
            return this._iterable.getListItemAt((uint(k) - 1));
        }
    }
}
