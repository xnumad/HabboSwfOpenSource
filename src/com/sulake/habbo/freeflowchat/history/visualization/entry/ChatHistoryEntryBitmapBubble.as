package com.sulake.habbo.freeflowchat.history.visualization.entry
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import com.sulake.habbo.freeflowchat.history.visualization.enum.ChatHistoryLayoutEnum;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.text.AntiAliasType;
    import flash.text.GridFitType;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import com.sulake.habbo.freeflowchat.data.ChatItem;

    public class ChatHistoryEntryBitmapBubble implements IChatHistoryEntryBitmap 
    {
        private var _bitmap:BitmapData;
        private var _overlap:Rectangle;
        private var _userId:int;
        private var _roomId:int;
        private var _canIgnore:Boolean;
        private var _userName:String;

        public function ChatHistoryEntryBitmapBubble(k:ChatItem, _arg_2:Boolean, _arg_3:String, _arg_4:BitmapData, _arg_5:Rectangle=null)
        {
            this._overlap = _arg_5;
            this._userId = k.userId;
            this._roomId = k.roomId;
            var _local_6:TextField = new TextField();
            _local_6.defaultTextFormat = ChatHistoryLayoutEnum._Str_14898;
            _local_6.text = HabboFreeFlowChat._Str_21613();
            _local_6.thickness = -15;
            _local_6.sharpness = 80;
            _local_6.antiAliasType = AntiAliasType.ADVANCED;
            _local_6.embedFonts = true;
            _local_6.gridFitType = GridFitType.PIXEL;
            var _local_7:int = _arg_4.height;
            var _local_8:int = ChatHistoryLayoutEnum._Str_7140;
            var _local_9:int = Math.max(ChatHistoryLayoutEnum._Str_13160, (ChatHistoryLayoutEnum._Str_13160 + _arg_5.top));
            this._bitmap = new BitmapData((_local_8 + _arg_4.width), _local_7, true, 0);
            this._bitmap.draw(_local_6, new Matrix(1, 0, 0, 1, 0, _local_9));
            this._bitmap.copyPixels(_arg_4, _arg_4.rect, new Point(_local_8, 0));
            this._canIgnore = _arg_2;
            this._userName = _arg_3;
        }

        public function get bitmap():BitmapData
        {
            return this._bitmap;
        }

        public function get overlap():Rectangle
        {
            return this._overlap;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_6123():Boolean
        {
            return this._canIgnore;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
