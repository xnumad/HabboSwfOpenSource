package com.sulake.core.window.iterators
{
    import flash.utils.Proxy;
    import com.sulake.core.window.utils.IIterator;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class EmptyIterator extends Proxy implements IIterator 
    {
        public static const INSTANCE:EmptyIterator = new (EmptyIterator)();


        public function get length():uint
        {
            return 0;
        }

        public function indexOf(k:*):int
        {
            return -1;
        }

        override flash_proxy function getProperty(k:*):*
        {
            return null;
        }

        override flash_proxy function setProperty(k:*, _arg_2:*):void
        {
        }

        override flash_proxy function nextNameIndex(k:int):int
        {
            return 0;
        }

        override flash_proxy function nextValue(k:int):*
        {
            return null;
        }
    }
}
