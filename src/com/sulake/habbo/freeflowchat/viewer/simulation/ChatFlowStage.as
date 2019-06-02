package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import flash.geom.Point;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import __AS3__.vec.*;

    public class ChatFlowStage implements IDisposable, IUpdateReceiver 
    {
        public static const _Str_7698:int = 19;
        private static const _Str_18607:int = 5000;
        private static const _Str_21041:int = 10000;
        private static const _Str_14840:int = 20;
        private static const _Str_18713:int = 15;
        private static const _Str_16866:Number = 8;

        private const _Str_25857:int = 240;

        private var _component:HabboFreeFlowChat;
        private var _simulationTime:uint = 0;
        private var _lastCycleAt:uint = 0;
        private var _lastCleanUpAt:uint = 0;
        private var _gravity:ChatFlowGravity;
        private var _bubbles:Vector.<ChatBubbleSimulationEntity>;
        private var _toRemove:Vector.<ChatBubbleSimulationEntity>;
        private var _lineByLineMode:Boolean = false;
        private var _scrollUpTimerDelay:int = 10000;
        private var _gravityEnabled:Boolean = true;
        private var _debugEnabled:Boolean = false;
        private var _oldChatAreaHeight:int = 0;

        public function ChatFlowStage(k:HabboFreeFlowChat)
        {
            this._gravity = new ChatFlowGravity();
            this._bubbles = new Vector.<ChatBubbleSimulationEntity>(0);
            this._toRemove = new Vector.<ChatBubbleSimulationEntity>(0);
            super();
            this._component = k;
            this._component.registerUpdateReceiver(this, 2);
            this._Str_18127();
        }

        public function _Str_18127():void
        {
            if (this._component._Str_7277)
            {
                this._lineByLineMode = (this._component._Str_7277.mode == RoomChatSettingsParser._Str_12787);
                this._gravityEnabled = (!(this._lineByLineMode));
                switch (this._component._Str_7277.speed)
                {
                    case RoomChatSettingsParser._Str_18404:
                        this._scrollUpTimerDelay = 3000;
                        return;
                    case RoomChatSettingsParser._Str_17874:
                        this._scrollUpTimerDelay = 6000;
                        return;
                    case RoomChatSettingsParser._Str_16469:
                        this._scrollUpTimerDelay = 12000;
                        return;
                }
            }
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._component)
                {
                    this._component.removeUpdateReceiver(this);
                    this._component = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        public function _Str_12872(k:PooledChatBubble):Point
        {
            var _local_2:ChatBubbleSimulationEntity;
            var _local_5:int;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:ChatBubbleSimulationWithLimitedWideRect;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:ChatBubbleSimulationEntity;
            if (this._oldChatAreaHeight == 0)
            {
                this._oldChatAreaHeight = this._component._Str_9270._Str_12498;
            }
            if (((!(this._lineByLineMode)) && (k.width < this._Str_25857)))
            {
                _local_2 = new ChatBubbleSimulationWithLimitedWideRect(k);
            }
            else
            {
                _local_2 = new ChatBubbleSimulationEntity(k, this._lineByLineMode);
            }
            var _local_3:Point = new Point((k._Str_11643.x - (_local_2._Str_6163.width / 2)), this._component._Str_9270._Str_12498);
            var _local_4:Point = this._component.roomEngine.getRoomCanvasScreenOffset(k.roomId);
            if (_local_4 != null)
            {
                _local_3.x = (_local_3.x - _local_4.x);
            }
            _local_3.y = (_local_3.y - ((k.overlap) ? k.overlap.y : 0));
            _local_3.x = (_local_3.x - ((k.overlap) ? k.overlap.x : 0));
            _local_2.initializePosition(_local_3.x, _local_3.y);
            if (((this._gravityEnabled) && (!(this._lineByLineMode))))
            {
                _local_5 = 0;
                while (_local_5 < (_Str_14840 / 2))
                {
                    _local_10 = 0;
                    for each (_local_11 in this._bubbles)
                    {
                        _local_10 = (_local_10 + this._gravity._Str_20468(_local_2, _local_11, ChatFlowGravity._Str_16724, ChatFlowGravity._Str_16944));
                    }
                    _local_2.x = (_local_2.x + _local_10);
                    _local_5++;
                }
                _local_6 = _local_2.x;
                _local_9 = (k._Str_11643.x - ((_local_4 != null) ? _local_4.x : 0));
                if (_local_2.x > (_local_9 - ChatFlowGravity._Str_8857))
                {
                    _local_6 = (_local_9 - ChatFlowGravity._Str_8857);
                    if (_local_2._Str_20442)
                    {
                        _local_8 = ChatBubbleSimulationWithLimitedWideRect(_local_2);
                        _local_7 = (_local_2.x - _local_6);
                        _local_8._Str_5036 = (_local_8._Str_5036 + _local_7);
                        _local_8._Str_5036 = Math.min(0, _local_8._Str_5036);
                    }
                }
                else
                {
                    if ((_local_2.x + _local_2._Str_6163.width) < (_local_9 + ChatFlowGravity._Str_8857))
                    {
                        _local_6 = ((_local_9 - _local_2._Str_6163.width) + ChatFlowGravity._Str_8857);
                        if (_local_2._Str_20442)
                        {
                            _local_8 = ChatBubbleSimulationWithLimitedWideRect(_local_2);
                            _local_7 = (_local_2.x - _local_6);
                            _local_8._Str_5036 = (_local_8._Str_5036 + _local_7);
                            _local_8._Str_5036 = Math.max(-(_local_8._Str_10759.width - _local_8._Str_6163.width), _local_8._Str_5036);
                        }
                    }
                }
                _local_2.x = (_local_3.x = _local_6);
            }
            this._bubbles.push(_local_2);
            _local_3.x = (_local_3.x - ((k.overlap) ? k.overlap.x : 0));
            if (this._lineByLineMode)
            {
                this._lastCycleAt = this._simulationTime;
            }
            return _local_3;
        }

        public function update(k:uint):void
        {
            var _local_3:ChatBubbleSimulationEntity;
            this._simulationTime = (this._simulationTime + k);
            this._Str_19305();
            if ((this._lastCycleAt + this._scrollUpTimerDelay) < this._simulationTime)
            {
                this._Str_25140();
                this._lastCycleAt = this._simulationTime;
            }
            var _local_2:int;
            while (_local_2 < this._bubbles.length)
            {
                _local_3 = this._bubbles[_local_2];
                _local_3._Str_18740();
                if (!_local_3.isSpacer)
                {
                    _local_3.fullHeightCollision = false;
                    if (((_local_2 > 0) && (_local_3._Str_25178)))
                    {
                        _local_3.fullHeightCollision = true;
                        this._bubbles[int((_local_2 - 1))].fullHeightCollision = true;
                    }
                }
                _local_2++;
            }
            if ((this._lastCleanUpAt + _Str_18607) < this._simulationTime)
            {
                this._Str_22963();
                this._lastCleanUpAt = this._simulationTime;
            }
        }

        public function clear():void
        {
            var k:ChatBubbleSimulationEntity;
            for each (k in this._bubbles)
            {
                k._Str_4702 = true;
            }
            this.update(0);
            this._component._Str_9270.update(0);
        }

        private function _Str_19305():void
        {
            var k:Vector.<ChatBubbleCollisionEvent>;
            var _local_2:ChatBubbleCollisionEvent;
            var _local_3:ChatBubbleSimulationEntity;
            var _local_4:ChatBubbleSimulationEntity;
            var _local_5:ChatBubbleSimulationEntity;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            _local_6 = 0;
            while (_local_6 < _Str_14840)
            {
                k = new Vector.<ChatBubbleCollisionEvent>(0);
                for each (_local_4 in this._bubbles)
                {
                    _local_4._Str_23377();
                    for each (_local_5 in this._bubbles)
                    {
                        if (((!(_local_4 == _local_5)) && (_local_4._Str_25372(_local_5))))
                        {
                            k.push(new ChatBubbleCollisionEvent(_local_4, _local_5));
                        }
                    }
                }
                if (k.length == 0)
                {
                    return;
                }
                if (this._lineByLineMode)
                {
                    for each (_local_2 in k)
                    {
                        if (((!(_local_2.first._Str_14539(_local_2._Str_6122))) && (!(_local_2._Str_6122._Str_14539(_local_2.first)))))
                        {
                            if (_local_2._Str_21189)
                            {
                                _local_2._Str_14418._Str_13455(-(_local_2._Str_14418._Str_10759.height));
                            }
                            else
                            {
                                _local_7 = ((_local_2.first._Str_23025(_local_2._Str_6122)) ? _local_2.top._Str_6163.bottom : _local_2.top._Str_10759.bottom);
                                _local_2.top._Str_13455(-((_local_7 - _local_2.bottom.y) + 1));
                            }
                        }
                        _local_2.first._Str_13441(_local_2._Str_6122);
                        _local_2._Str_6122._Str_13441(_local_2.first);
                    }
                }
                else
                {
                    for each (_local_2 in k)
                    {
                        if (((!(_local_2.first._Str_14539(_local_2._Str_6122))) && (!(_local_2._Str_6122._Str_14539(_local_2.first)))))
                        {
                            _local_8 = ((_local_2.left is ChatBubbleSimulationWithLimitedWideRect) ? (ChatBubbleSimulationWithLimitedWideRect(_local_2.left)._Str_5036 + _local_2.left.x) : _local_2.left.x);
                            _local_9 = ((_local_2.right is ChatBubbleSimulationWithLimitedWideRect) ? (ChatBubbleSimulationWithLimitedWideRect(_local_2.right)._Str_5036 + _local_2.right.x) : _local_2.right.x);
                            _local_10 = ((_local_2.left is ChatBubbleSimulationWithLimitedWideRect) ? _local_2.left._Str_10759.width : _local_2.left._Str_6163.width);
                            _local_11 = (Math.abs(((_local_8 + _local_10) - _local_9)) / 2);
                            if (_local_11 <= _Str_18713)
                            {
                                _local_2.left._Str_20224(-(_local_11));
                                _local_2.right._Str_20224((_local_11 + 1));
                            }
                            else
                            {
                                if (_local_2._Str_21189)
                                {
                                    _local_2._Str_14418._Str_13455(-(_local_2._Str_14418._Str_6163.height));
                                }
                                else
                                {
                                    _local_2.top._Str_13455(-((_local_2.top._Str_6163.bottom - _local_2.bottom.y) + 1));
                                }
                            }
                            _local_2.first._Str_13441(_local_2._Str_6122);
                            _local_2._Str_6122._Str_13441(_local_2.first);
                        }
                    }
                }
                for each (_local_3 in this._bubbles)
                {
                    _local_3._Str_23082(_Str_16866);
                }
                _local_6++;
            }
        }

        private function _Str_25140():void
        {
            var k:ChatBubbleSimulationEntity;
            var _local_2:ChatBubbleSimulationEntity;
            if (this._component._Str_9270 == null)
            {
                return;
            }
            for each (k in this._bubbles)
            {
                if (this._gravityEnabled)
                {
                    for each (_local_2 in this._bubbles)
                    {
                        if (k != _local_2)
                        {
                            k.x = (k.x + this._gravity._Str_20468(k, _local_2));
                        }
                    }
                }
                k.y = (k.y - _Str_7698);
            }
            if (this._lineByLineMode)
            {
                this._Str_12872(this._component._Str_5827._Str_25435(_Str_7698));
                this._bubbles[(this._bubbles.length - 1)].fullHeightCollision = true;
                this._bubbles[(this._bubbles.length - 1)].isSpacer = true;
            }
            this._Str_19305();
        }

        private function _Str_22963():void
        {
            var k:ChatBubbleSimulationEntity;
            var _local_2:ChatBubbleSimulationEntity;
            var _local_3:int;
            for each (k in this._bubbles)
            {
                if (((k._Str_6163.bottom < -10) || (k._Str_4702)))
                {
                    k._Str_4702 = true;
                    if (this._toRemove.indexOf(k) == -1)
                    {
                        this._toRemove.push(k);
                    }
                }
            }
            if (this._toRemove.length > 0)
            {
                for each (_local_2 in this._toRemove)
                {
                    _local_3 = this._bubbles.indexOf(_local_2);
                    _local_2.dispose();
                    this._bubbles.splice(_local_3, 1);
                }
                this._toRemove = new Vector.<ChatBubbleSimulationEntity>(0);
            }
        }

        public function resize(k:int, _arg_2:int):void
        {
            var _local_4:ChatBubbleSimulationEntity;
            var _local_5:int;
            var _local_6:int;
            if (!this._component)
            {
                return;
            }
            if (!this._component._Str_9270)
            {
                return;
            }
            var _local_3:int = this._component._Str_9270._Str_12498;
            if (this._oldChatAreaHeight != _local_3)
            {
                if (this._oldChatAreaHeight < _local_3)
                {
                    _local_5 = (_local_3 - this._oldChatAreaHeight);
                    for each (_local_4 in this._bubbles)
                    {
                        _local_4.y = (_local_4.y + _local_5);
                        _local_4._Str_18740(true);
                    }
                }
                else
                {
                    _local_6 = (this._oldChatAreaHeight - _local_3);
                    for each (_local_4 in this._bubbles)
                    {
                        _local_4.y = (_local_4.y - _local_6);
                        _local_4._Str_18740(true);
                    }
                }
            }
            this._oldChatAreaHeight = _local_3;
        }
    }
}
