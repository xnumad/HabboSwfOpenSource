package com.sulake.habbo.freeflowchat.viewer
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
    import flash.display.DisplayObjectContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import flash.display.Sprite;
    import flash.geom.Point;
    import __AS3__.vec.*;

    public class ChatFlowViewer implements IDisposable, IUpdateReceiver 
    {
        private const _Str_22565:int = 230;

        private var _component:HabboFreeFlowChat;
        private var _chatFlowStage:ChatFlowStage;
        private var _rootDisplayObject:DisplayObjectContainer;
        private var _lastAddedToRoomId:int;
        private var _lastCanvasOffsetX:int = 0;
        private var _runTime:uint = 0;
        private var _chatAreaVsScreenSize:Number = 0.25;
        private var _bubbles:Vector.<PooledChatBubble>;
        private var _toRemove:Vector.<PooledChatBubble>;

        public function ChatFlowViewer(k:HabboFreeFlowChat, _arg_2:ChatFlowStage)
        {
            this._bubbles = new Vector.<PooledChatBubble>(0);
            this._toRemove = new Vector.<PooledChatBubble>(0);
            super();
            this._rootDisplayObject = new Sprite();
            this._component = k;
            this._component.registerUpdateReceiver(this, 1);
            this._chatFlowStage = _arg_2;
        }

        public function dispose():void
        {
            if (this._component)
            {
                this._component.removeUpdateReceiver(this);
                this._component = null;
            }
            this._chatFlowStage = null;
            this._rootDisplayObject = null;
        }

        public function get disposed():Boolean
        {
            return (this._rootDisplayObject == null) && (this._component == null);
        }

        public function _Str_12872(k:PooledChatBubble, _arg_2:Point):void
        {
            k._Str_18364 = this._lastCanvasOffsetX;
            this._bubbles.push(k);
            this._rootDisplayObject.addChild(k);
            k._Str_12023(_arg_2.x, _arg_2.y);
            k._Str_12210();
            this._lastAddedToRoomId = k.roomId;
        }

        public function update(k:uint):void
        {
            var _local_3:PooledChatBubble;
            var _local_4:PooledChatBubble;
            var _local_5:PooledChatBubble;
            var _local_6:int;
            this._runTime = (this._runTime + k);
            var _local_2:Point = this._component.roomEngine.getRoomCanvasScreenOffset(this._lastAddedToRoomId);
            if (_local_2 != null)
            {
                if (((!(_local_2.x == this._lastCanvasOffsetX)) && (this._bubbles.length > 0)))
                {
                    for each (_local_4 in this._bubbles)
                    {
                        _local_4._Str_18364 = _local_2.x;
                    }
                }
                this._lastCanvasOffsetX = _local_2.x;
            }
            for each (_local_3 in this._bubbles)
            {
                _local_3.update(k);
                if (_local_3._Str_4702)
                {
                    this._toRemove.push(_local_3);
                }
            }
            if (this._toRemove.length > 0)
            {
                for each (_local_5 in this._toRemove)
                {
                    this._rootDisplayObject.removeChild(_local_5);
                    _local_6 = this._bubbles.indexOf(_local_5);
                    this._bubbles.splice(_local_6, 1);
                    _local_5._Str_23848();
                    this._component._Str_5827.recycle(_local_5);
                }
                this._toRemove = new Vector.<PooledChatBubble>(0);
            }
        }

        public function get _Str_5128():DisplayObjectContainer
        {
            return this._rootDisplayObject;
        }

        public function get _Str_12498():int
        {
            if (!this._rootDisplayObject.stage)
            {
                return this._Str_22565;
            }
            return this._rootDisplayObject.stage.stageHeight * this._chatAreaVsScreenSize;
        }

        public function resize(k:int, _arg_2:int):void
        {
            if (this._chatFlowStage)
            {
                this._chatFlowStage.resize(k, _arg_2);
            }
        }
    }
}
