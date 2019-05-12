package com.sulake.habbo.freeflowchat.history.visualization
{
	import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
    import flash.display.Sprite;
    import flash.display.Stage;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class ChatHistoryScrollBar 
    {
        public static const _Str_14287:int = 0;

        private var _scrollView:ChatHistoryScrollView;
        private var _displayObject:Sprite;
        private var _background:Sprite;
        private var _thumbTrack:Sprite;
        private var _dragStartY:int;
        private var _dragStartBufferTopY:int;
        private var _registeredStage:Stage;

        public function ChatHistoryScrollBar(k:ChatHistoryScrollView, _arg_2:HabboFreeFlowChat)
        {
            this._scrollView = k;
            this._thumbTrack = HabboFreeFlowChat._Str_18206(new Rectangle(2, 2, 1, 1), (_arg_2.assets.getAssetByName("scrollbar_thumb").content as BitmapData));
            this._thumbTrack.x = 2;
            this._thumbTrack.y = 2;
            this._background = HabboFreeFlowChat._Str_18206(new Rectangle(2, 2, 5, 5), (_arg_2.assets.getAssetByName("scrollbar_back").content as BitmapData));
            this._displayObject = new Sprite();
            this._displayObject.addChild(this._background);
            this._displayObject.addChild(this._thumbTrack);
            this._thumbTrack.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this._thumbTrack.addEventListener(Event.REMOVED_FROM_STAGE, this._Str_583);
            this._thumbTrack.addEventListener(MouseEvent.MOUSE_DOWN, this._Str_24838);
        }

        public function set height(k:int):void
        {
            this._background.height = k;
            this._Str_20818();
        }

        public function get displayObject():Sprite
        {
            return this._displayObject;
        }

        public function _Str_20818():void
        {
            var k:int = (this._scrollView._Str_7317 + (this._scrollView._Str_5924.height - this._background.height));
            this._thumbTrack.height = Math.min((this._background.height - 4), Math.max(5, int(((this._background.height - 4) * (this._background.height / this._scrollView._Str_18682)))));
            this._thumbTrack.y = Math.min(((this._background.height - 2) - this._thumbTrack.height), Math.max(2, int((((this._background.height - 4) * (Math.max(1, k) / this._scrollView._Str_18682)) - (this._thumbTrack.height / 2)))));
        }

        private function onAddedToStage(k:Event):void
        {
            this._registeredStage = this._thumbTrack.stage;
        }

        private function _Str_583(k:Event):void
        {
            this._registeredStage = null;
        }

        private function _Str_24838(k:Event):void
        {
            this._dragStartY = MouseEvent(k).stageY;
            this._dragStartBufferTopY = this._scrollView._Str_7317;
            this._registeredStage.addEventListener(MouseEvent.MOUSE_UP, this._Str_4596);
            this._registeredStage.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_4596);
            k.stopImmediatePropagation();
        }

        private function _Str_4596(k:Event):void
        {
            var _local_2:MouseEvent;
            var _local_3:Number;
            var _local_4:int;
            _local_2 = MouseEvent(k);
            switch (_local_2.type)
            {
                case MouseEvent.MOUSE_MOVE:
                    _local_3 = (this._scrollView._Str_18682 / this._background.height);
                    _local_4 = ((_local_2.stageY - this._dragStartY) * _local_3);
                    this._scrollView._Str_7317 = (this._dragStartBufferTopY + _local_4);
                    break;
                case MouseEvent.MOUSE_UP:
                    this._Str_20615();
                    break;
            }
            k.stopImmediatePropagation();
        }

        public function _Str_20615():void
        {
            if (this._registeredStage)
            {
                this._registeredStage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_4596);
                this._registeredStage.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_4596);
            }
        }
    }
}
