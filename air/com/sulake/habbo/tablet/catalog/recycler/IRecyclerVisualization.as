//com.sulake.habbo.tablet.catalog.recycler.IRecyclerVisualization

package com.sulake.habbo.tablet.catalog.recycler{
    public /*dynamic*/ interface IRecyclerVisualization {

        function displayNormalView():void;
        function displayProcessingView():void;
        function displayFinishedView():void;
        function displayDisabledView():void;
        function displayTimeOutView(k:int):void;
        function updateSlots():void;
        function updateRecycleButton(k:Boolean):void;
        function get disposed():Boolean;

    }
}//package com.sulake.habbo.tablet.catalog.recycler

