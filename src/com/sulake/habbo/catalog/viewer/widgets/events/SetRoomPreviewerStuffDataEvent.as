package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;
    import com.sulake.habbo.room.IStuffData;

    public class SetRoomPreviewerStuffDataEvent extends Event 
    {
        private var _stuffData:IStuffData;

        public function SetRoomPreviewerStuffDataEvent(k:IStuffData, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.SET_PREVIEWER_STUFFDATA, _arg_2, _arg_3);
            this._stuffData = k;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }
    }
}
