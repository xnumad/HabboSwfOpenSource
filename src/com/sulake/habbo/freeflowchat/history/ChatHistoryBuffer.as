package com.sulake.habbo.freeflowchat.history
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.IChatHistoryEntryBitmap;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.freeflowchat.history.visualization.enum.ChatHistoryLayoutEnum;
    import __AS3__.vec.*;

    public class ChatHistoryBuffer implements IDisposable 
    {
        private const _Str_22590:int = 1000;

        private var _component:HabboFreeFlowChat;
        private var _entries:Vector.<IChatHistoryEntryBitmap>;

        public function ChatHistoryBuffer(k:HabboFreeFlowChat)
        {
            this._entries = new Vector.<IChatHistoryEntryBitmap>(0);
            super();
            this._component = k;
        }

        public function dispose():void
        {
            this._entries = null;
            this._component = null;
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        public function _Str_15063(chatItem:ChatItem):void
        {
            var entry:IChatHistoryEntryBitmap;
            try
            {
                entry = this._component._Str_5827._Str_23020(chatItem);
            }
            catch(e:Error)
            {
                if (e.errorID == 2015)
                {
                    return;
                }
                throw (e);
            }
            this._entries.push(entry);
            this._Str_19617(entry);
            if (this._component._Str_18503.isActive)
            {
                this._component._Str_18503._Str_23438(this._entries[(this._entries.length - 1)]);
            }
        }

        public function _Str_24587(k:_Str_2370):void
        {
            var _local_2:IChatHistoryEntryBitmap = this._component._Str_5827._Str_23311(k);
            this._entries.push(_local_2);
            this._Str_19617(_local_2);
        }

        private function _Str_19617(k:IChatHistoryEntryBitmap):void
        {
            if (this._entries.length > this._Str_22590)
            {
                this._component._Str_18503._Str_25251(((k.bitmap.height - k.overlap.y) - ChatHistoryLayoutEnum._Str_6853));
                this._entries.splice(0, 1);
            }
        }

        public function get entries():Vector.<IChatHistoryEntryBitmap>
        {
            return this._entries;
        }

        public function get totalHeight():int
        {
            var _local_2:IChatHistoryEntryBitmap;
            var k:int;
            for each (_local_2 in this._entries)
            {
                k = (k + ((_local_2.bitmap.height - _local_2.overlap.y) - ChatHistoryLayoutEnum._Str_6853));
            }
            return k;
        }
    }
}
