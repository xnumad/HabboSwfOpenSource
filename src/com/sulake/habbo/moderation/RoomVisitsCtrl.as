package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_10092;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_6294;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_6952;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class RoomVisitsCtrl implements IDisposable, ITrackedWindow 
    {
        private static var _Str_8375:Array = [];
        private static var _Str_17861:int = 200;

        private var _main:ModerationManager;
        private var _frame:IFrameWindow;
        private var _list:IItemListWindow;
        private var _userId:int;
        private var _rooms:Array;
        private var _disposed:Boolean;
        private var _row:IWindowContainer;
        private var _resizeTimer:Timer;
        private var _roomRows:Array;

        public function RoomVisitsCtrl(k:ModerationManager, _arg_2:int)
        {
            this._roomRows = [];
            super();
            this._main = k;
            this._userId = _arg_2;
        }

        public static function _Str_20063(k:int, _arg_2:int):String
        {
            return (_Str_12660(k) + ":") + _Str_12660(_arg_2);
        }

        public static function _Str_12660(k:int):String
        {
            return (k < 10) ? ("0" + k) : ("" + k);
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            this._resizeTimer = new Timer(300, 1);
            this._resizeTimer.addEventListener(TimerEvent.TIMER, this._Str_3774);
            this._main.moderationMessageHandler._Str_23596(this);
            this._main.connection.send(new _Str_10092(this._userId));
            this._frame = IFrameWindow(this._main.getXmlWindow("roomvisits_frame"));
            this._list = IItemListWindow(this._frame.findChildByName("visits_list"));
            this._row = (this._list.getListItemAt(0) as IWindowContainer);
            this._list.removeListItems();
            this._frame.procedure = this._Str_7142;
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this._Str_2392;
        }

        public function _Str_16877(k:_Str_6294):void
        {
            if (k.userId != this._userId)
            {
                return;
            }
            if (this._disposed)
            {
                return;
            }
            this._rooms = k.rooms;
            this._frame.caption = ("Room visits: " + k.userName);
            this.populate();
            this._Str_3774(null);
            this._frame.visible = true;
            this._main.moderationMessageHandler._Str_23642(this);
        }

        public function getType():int
        {
            return WindowTracker._Str_14197;
        }

        public function getId():String
        {
            return "" + this._userId;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame;
        }

        private function populate():void
        {
            var _local_2:_Str_6952;
            var k:Boolean = true;
            for each (_local_2 in this._rooms)
            {
                this._Str_16455(_local_2, k);
                k = (!(k));
            }
        }

        private function _Str_16455(k:_Str_6952, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = this._Str_16012();
            var _local_4:uint = ((_arg_2) ? 4288861930 : 0xFFFFFFFF);
            _local_3.color = _local_4;
            var _local_5:IWindow = _local_3.findChildByName("room_name_txt");
            _local_5.caption = k.roomName;
            new OpenRoomTool(this._frame, this._main, _local_5, k.roomId);
            _local_5.color = _local_4;
            var _local_6:ITextWindow = ITextWindow(_local_3.findChildByName("time_txt"));
            _local_6.text = _Str_20063(k._Str_22929, k._Str_25550);
            var _local_7:ITextWindow = ITextWindow(_local_3.findChildByName("view_room_txt"));
            new OpenRoomInSpectatorMode(this._main, _local_7, k.roomId);
            _local_7.color = _local_4;
            this._Str_25322(_local_3, this._list);
        }

        private function _Str_25322(k:IWindowContainer, _arg_2:IItemListWindow):void
        {
            _arg_2.addListItem(k);
            this._roomRows.push(k);
        }

        private function _Str_16012():IWindowContainer
        {
            if (_Str_8375.length > 0)
            {
                return _Str_8375.pop() as IWindowContainer;
            }
            return IWindowContainer(this._row.clone());
        }

        private function _Str_24242(k:IWindowContainer):void
        {
            var _local_2:IWindow;
            var _local_3:IWindow;
            if (_Str_8375.length < _Str_17861)
            {
                _local_2 = k.findChildByName("room_name_txt");
                _local_2.procedure = null;
                _local_3 = k.findChildByName("view_room_txt");
                _local_3.procedure = null;
                k.width = this._row.width;
                k.height = this._row.height;
                _Str_8375.push(k);
            }
            else
            {
                k.dispose();
            }
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.dispose();
        }

        private function _Str_7142(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowEvent.WINDOW_EVENT_RESIZED)) || (!(_arg_2 == this._frame))))
            {
                return;
            }
            if (!this._resizeTimer.running)
            {
                this._resizeTimer.reset();
                this._resizeTimer.start();
            }
        }

        private function _Str_3774(k:TimerEvent):void
        {
            var _local_2:IWindowContainer = IWindowContainer(this._list.parent);
            var _local_3:IWindow = (_local_2.getChildByName("scroller") as IWindow);
            var _local_4:* = (this._list.visibleRegion.height > this._list.height);
            var _local_5:int = 17;
            if (_local_3.visible)
            {
                if (!_local_4)
                {
                    _local_3.visible = false;
                    this._list.width = (this._list.width + _local_5);
                }
            }
            else
            {
                if (_local_4)
                {
                    _local_3.visible = true;
                    this._list.width = (this._list.width - _local_5);
                }
            }
        }

        public function dispose():void
        {
            var k:IWindowContainer;
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._list != null)
            {
                this._list.removeListItems();
                this._list.dispose();
                this._list = null;
            }
            if (this._frame != null)
            {
                this._frame.destroy();
                this._frame = null;
            }
            this._main = null;
            if (this._resizeTimer != null)
            {
                this._resizeTimer.stop();
                this._resizeTimer.removeEventListener(TimerEvent.TIMER, this._Str_3774);
                this._resizeTimer = null;
            }
            for each (k in this._roomRows)
            {
                this._Str_24242(k);
            }
            if (this._row != null)
            {
                this._row.dispose();
                this._row = null;
            }
            this._roomRows = [];
        }
    }
}
