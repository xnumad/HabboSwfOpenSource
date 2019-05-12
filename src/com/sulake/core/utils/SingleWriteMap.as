package com.sulake.core.utils
{
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class SingleWriteMap extends Map 
    {
        override flash_proxy function setProperty(key:*, value:*):void
        {
            if (hasKey(((key is QName) ? QName(key).localName : key)))
            {
                throw (new Error(((("Trying to overwrite value in SingleWriteMap - key: " + key) + ", value: ") + value)));
            }
            super.setProperty(key, value);
        }
    }
}
