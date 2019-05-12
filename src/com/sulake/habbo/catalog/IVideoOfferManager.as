package com.sulake.habbo.catalog
{
    import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;

    public interface IVideoOfferManager 
    {
        function get enabled():Boolean;
        function load(_arg_1:IVideoOfferLauncher):void;
        function launch(_arg_1:VideoOfferTypeEnum):Boolean;
    }
}
