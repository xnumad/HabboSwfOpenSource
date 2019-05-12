package com.sulake.habbo.freeflowchat.history.visualization.entry
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import com.sulake.habbo.freeflowchat.history.visualization.enum.ChatHistoryLayoutEnum;
    import flash.text.AntiAliasType;
    import flash.text.GridFitType;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;

    public class ChatHistoryRoomChangeEntry implements IChatHistoryEntryBitmap 
    {
        private static const _Str_9511:int = 4;

        private var _bitmap:BitmapData;
        private var _overlap:Rectangle;

        public function ChatHistoryRoomChangeEntry(k:_Str_2370, _arg_2:HabboFreeFlowChat)
        {
            this._overlap = new Rectangle(0, 0, 0, 0);
            super();
            var _local_3:TextField = new TextField();
            _local_3.defaultTextFormat = ChatHistoryLayoutEnum._Str_16769;
            _local_3.htmlText = ((k == null) ? "null" : k.roomName);
            _local_3.width = (_local_3.textWidth + 5);
            _local_3.height = (_local_3.textHeight + 5);
            _local_3.thickness = -15;
            _local_3.sharpness = 80;
            _local_3.antiAliasType = AntiAliasType.ADVANCED;
            _local_3.embedFonts = true;
            _local_3.gridFitType = GridFitType.PIXEL;
            var _local_4:TextField = new TextField();
            _local_4.defaultTextFormat = ChatHistoryLayoutEnum._Str_14898;
            _local_4.text = HabboFreeFlowChat._Str_21613();
            _local_4.width = (_local_4.textWidth + 5);
            _local_4.height = (_local_4.textHeight + 5);
            _local_4.thickness = -15;
            _local_4.sharpness = 80;
            _local_4.antiAliasType = AntiAliasType.ADVANCED;
            _local_4.embedFonts = true;
            _local_4.gridFitType = GridFitType.PIXEL;
            this._bitmap = new BitmapData(ChatHistoryLayoutEnum._Str_18359, (((_local_3.textHeight + 5) + ChatHistoryLayoutEnum._Str_6853) + _Str_9511), true, 0);
            this._bitmap.copyPixels(_arg_2._Str_19756(), _arg_2._Str_19756().rect, new Point(ChatHistoryLayoutEnum._Str_7140, (1 + _Str_9511)));
            this._bitmap.draw(_local_4, new Matrix(1, 0, 0, 1, 0, _Str_9511));
            this._bitmap.draw(_local_3, new Matrix(1, 0, 0, 1, (ChatHistoryLayoutEnum._Str_7140 + 20), _Str_9511));
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
            return -1;
        }

        public function get roomId():int
        {
            return -1;
        }

        public function get _Str_6123():Boolean
        {
            return false;
        }

        public function get userName():String
        {
            return "";
        }
    }
}
