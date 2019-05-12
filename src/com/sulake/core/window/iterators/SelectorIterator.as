package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.SelectorController;
    import com.sulake.core.window.components.ISelectableWindow;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class SelectorIterator extends Proxy implements IIterator 
    {
        private var _iterable:SelectorController;

        public function SelectorIterator(k:SelectorController)
        {
            this._iterable = k;
        }

        public function get length():uint
        {
            return this._iterable._Str_6010;
        }

        public function indexOf(k:*):int
        {
            return this._iterable._Str_8283(k);
        }

        override flash_proxy function getProperty(k:*):*
        {
            return this._iterable.getChildAt(uint(k));
        }

        override flash_proxy function setProperty(k:*, _arg_2:*):void
        {
            var _local_4:int;
            var _local_3:ISelectableWindow = (_arg_2 as ISelectableWindow);
            if (_local_3)
            {
                _local_4 = this._iterable._Str_8283(_local_3);
                if (_local_4 == k)
                {
                    return;
                }
                if (_local_4 > -1)
                {
                    this._iterable._Str_10845(_local_3);
                }
                this._iterable._Str_16835(_local_3, uint(k));
            }
            else
            {
                _local_4 = this._iterable.getChildIndex(_arg_2);
                if (_local_4 == k)
                {
                    return;
                }
                if (_local_4 > -1)
                {
                    this._iterable.removeChild(_local_3);
                }
                this._iterable.addChildAt(_arg_2, uint(k));
            }
        }

        override flash_proxy function nextNameIndex(k:int):int
        {
            return (k < this._iterable._Str_6010) ? (k + 1) : 0;
        }

        override flash_proxy function nextValue(k:int):*
        {
            return this._iterable._Str_5066((uint(k) - 1));
        }
    }
}
