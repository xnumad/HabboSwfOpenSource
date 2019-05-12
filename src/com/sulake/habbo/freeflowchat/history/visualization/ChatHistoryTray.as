package com.sulake.habbo.freeflowchat.history.visualization
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
	import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.history.visualization.enum.ChatHistoryLayoutEnum;
    import flash.events.Event;
    import com.sulake.habbo.freeflowchat.viewer.enum.ChatBubbleWidth;
    import flash.events.MouseEvent;

    public class ChatHistoryTray implements IDisposable, IUpdateReceiver 
    {
        private var _rootDisplayObject:DisplayObjectContainer;
        private var _registeredStage:Stage;
        private var _component:HabboFreeFlowChat;
        private var _scrollView:ChatHistoryScrollView;
        private var _tab:Sprite;
        private var _tabBg:Bitmap;
        private var _tabHandle:Bitmap;
        private var _bg:Bitmap;
        private var _openedWidth:int;
        private var _flagUpdateDisableRoomMouseEvents:Boolean = false;

        public function ChatHistoryTray(k:HabboFreeFlowChat, _arg_2:ChatHistoryScrollView)
        {
            this._component = k;
            this._scrollView = _arg_2;
            this._rootDisplayObject = new Sprite();
            this._tabBg = new Bitmap();
            this._tabBg.bitmapData = BitmapData(this._component.assets.getAssetByName("tray_bar").content);
            this._tabBg.width = this._tabBg.bitmapData.width;
            this._tabBg.height = 0;
            this._tabBg.scaleX = 1;
            this._tabBg.x = -(this._tabBg.bitmapData.width);
            this._tabHandle = new Bitmap();
            this._tabHandle.bitmapData = BitmapData(this._component.assets.getAssetByName("tray_handle_open").content);
            this._tabHandle.scaleX = 1;
            this._tabHandle.scaleY = 1;
            this._tabHandle.x = -(ChatHistoryLayoutEnum._Str_10590);
            this._tabHandle.y = 350;
            this._tabHandle.visible = false;
            this._tab = new Sprite();
            this._tab.scaleX = 1;
            this._tab.scaleY = 1;
            this._tab.visible = true;
            this._tab.addChild(this._tabBg);
            this._tab.addChild(this._tabHandle);
            this._rootDisplayObject.addChild(this._tab);
            this._bg = new Bitmap();
            this._bg.bitmapData = new BitmapData(1, 1, true, 2720277278);
            this._bg.width = 0;
            this._bg.height = 0;
            this._rootDisplayObject.addChild(this._bg);
            this._rootDisplayObject.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this._openedWidth = ((ChatBubbleWidth.NORMAL + ChatHistoryLayoutEnum._Str_7140) + 1);
        }

        public function dispose():void
        {
            this._component._Str_20784(0);
            if (this._rootDisplayObject)
            {
                this._scrollView._Str_15425();
                if (this._registeredStage)
                {
                    this._registeredStage.removeEventListener(MouseEvent.MOUSE_DOWN, this._Str_20390);
                }
            }
            this._rootDisplayObject = null;
        }

        public function get disposed():Boolean
        {
            return this._rootDisplayObject == null;
        }

        public function get _Str_5128():DisplayObjectContainer
        {
            return this._rootDisplayObject;
        }

        public function resize(k:int, _arg_2:int):void
        {
            this._tab.height = (_arg_2 - ChatHistoryLayoutEnum._Str_7235);
            this._tabBg.height = (_arg_2 - ChatHistoryLayoutEnum._Str_7235);
            this._bg.height = (_arg_2 - ChatHistoryLayoutEnum._Str_7235);
            this._tab.scaleY = 1;
            this._tabHandle.scaleY = 1;
            this._tabHandle.y = (_arg_2 - ChatHistoryLayoutEnum._Str_16016);
        }

        private function onAddedToStage(k:Event):void
        {
            this.resize(this._rootDisplayObject.stage.stageWidth, this._rootDisplayObject.stage.stageHeight);
            this._rootDisplayObject.stage.addEventListener(MouseEvent.CLICK, this._Str_20390);
            this._registeredStage = this._rootDisplayObject.stage;
        }

        public function _Str_19537():void
        {
            if (this._scrollView.isActive)
            {
                this._scrollView._Str_15425();
                this._rootDisplayObject.removeChild(this._scrollView._Str_5128);
                this._scrollView._Str_17611();
                this._bg.width = 0;
                this._tabBg.x = -(this._tabBg.bitmapData.width);
                this._tabHandle.x = -(ChatHistoryLayoutEnum._Str_10590);
                this._tabHandle.visible = false;
                this._scrollView._Str_20800 = 0;
                this._tabHandle.bitmapData = BitmapData(this._component.assets.getAssetByName("tray_handle_open").content);
            }
            else
            {
                this._rootDisplayObject.addChild(this._scrollView._Str_5128);
                this._scrollView._Str_24783();
                this._scrollView._Str_24219();
                this._scrollView._Str_24280();
                this._bg.width = this._openedWidth;
                this._tabBg.x = this._openedWidth;
                this._tabHandle.visible = true;
                this._tabHandle.x = ((this._openedWidth - ChatHistoryLayoutEnum._Str_10590) + this._tabBg.bitmapData.width);
                this._scrollView._Str_20800 = this._openedWidth;
                this._tabHandle.bitmapData = BitmapData(this._component.assets.getAssetByName("tray_handle_close").content);
            }
            this._flagUpdateDisableRoomMouseEvents = true;
        }

        private function _Str_20390(k:Event):void
        {
            if (((!(this._rootDisplayObject)) || (!(this._rootDisplayObject.stage))))
            {
                return;
            }
            var _local_2:MouseEvent = MouseEvent(k);
            if ((((((this._scrollView.isActive) && (this._tabHandle.x <= _local_2.stageX)) && (_local_2.stageX <= (this._tabHandle.x + this._tabHandle.width))) && (this._tabHandle.y <= _local_2.stageY)) && (_local_2.stageY <= (this._tabHandle.y + this._tabHandle.height))))
            {
                this._Str_19537();
            }
        }

        public function update(k:uint):void
        {
            if (((this._flagUpdateDisableRoomMouseEvents) && (k > 20)))
            {
                this._component._Str_20784(((this._scrollView.isActive) ? (this._openedWidth + this._tabBg.bitmapData.width) : 0));
                this._flagUpdateDisableRoomMouseEvents = false;
            }
        }
    }
}
