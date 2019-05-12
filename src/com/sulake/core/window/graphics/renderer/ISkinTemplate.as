package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils.IChildEntityArray;
    import com.sulake.core.window.utils.IChildEntity;
    import com.sulake.core.assets.IAsset;

    public interface ISkinTemplate extends IChildEntityArray, IChildEntity 
    {
        function get asset():IAsset;
        function dispose():void;
    }
}
