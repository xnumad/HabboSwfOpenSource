//com.sulake.habbo.tablet.catalog.viewer.IGridItem

package com.sulake.habbo.tablet.catalog.viewer{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IGridItem extends IDisposable {

        function set grid(k:IItemGrid):void;
        function setDraggable(k:Boolean):void;
        function activate():void;
        function deactivate():void;

    }
}//package com.sulake.habbo.tablet.catalog.viewer

