//com.sulake.habbo.catalog.IVideoOfferManager

package com.sulake.habbo.catalog{
    import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;

    public /*dynamic*/ interface IVideoOfferManager {

        function get enabled():Boolean;
        function load(k:IVideoOfferLauncher):void;
        function launch(k:VideoOfferTypeEnum):Boolean;

    }
}//package com.sulake.habbo.catalog

