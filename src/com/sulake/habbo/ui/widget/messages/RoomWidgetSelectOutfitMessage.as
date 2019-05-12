package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage 
    {
        public static const SELECT_OUTFIT:String = "select_outfit";

        private var _outfitId:int;

        public function RoomWidgetSelectOutfitMessage(k:int)
        {
            super(SELECT_OUTFIT);
            this._outfitId = k;
        }

        public function get _Str_26349():int
        {
            return this._outfitId;
        }
    }
}
