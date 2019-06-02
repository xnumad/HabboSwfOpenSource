package com.sulake.habbo.session.product
{
    import com.sulake.core.runtime.IDisposable;

    public interface IProductDataListener extends IDisposable 
    {
        function productDataReady():void;
    }
}
