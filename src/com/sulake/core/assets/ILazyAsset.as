package com.sulake.core.assets
{
    public interface ILazyAsset extends IAsset 
    {
        function prepareLazyContent():void;
    }
}
