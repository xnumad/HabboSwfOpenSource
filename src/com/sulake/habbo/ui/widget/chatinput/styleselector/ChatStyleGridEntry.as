package com.sulake.habbo.ui.widget.chatinput.styleselector
{
    import flash.display.BitmapData;

    public class ChatStyleGridEntry 
    {
        private var _id:int;
        private var _bitmap:BitmapData;

        public function ChatStyleGridEntry(k:int, _arg_2:BitmapData)
        {
            this._id = k;
            this._bitmap = _arg_2;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get bitmap():BitmapData
        {
            return this._bitmap;
        }
    }
}
