package com.sulake.habbo.session.furniture
{
    import com.sulake.core.runtime.IDisposable;

    public interface IFurniDataListener extends IDisposable 
    {
        function furniDataReady():void;
    }
}
