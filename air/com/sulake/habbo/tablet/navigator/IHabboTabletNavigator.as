//com.sulake.habbo.tablet.navigator.IHabboTabletNavigator

package com.sulake.habbo.tablet.navigator{
    import com.sulake.core.runtime.IUnknown;
    import starling.display.DisplayObject;

    public /*dynamic*/ interface IHabboTabletNavigator extends IUnknown {

        function get view():DisplayObject;
        function exitRoom():void;
        function isViewLoaded():Boolean;
        function updateView():void;
        function requestClubPurchaseView():void;
        function goToHomeRoom():Boolean;

    }
}//package com.sulake.habbo.tablet.navigator

