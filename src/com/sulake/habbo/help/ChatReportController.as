package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistryItem;
    import com.sulake.habbo.help.cfh.registry.chat.ChatRegistryItem;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class ChatReportController implements IDisposable 
    {
        private static const _Str_9415:uint = 4282169599;
        private static const _Str_6492:uint = 4293848814;

        private var _habboHelp:HabboHelp;
        private var _window:IWindowContainer;
        private var _submitFunction:Function;
        private var _reportedRoomId:int;
        private var _reportedUserId:int;
        private var _disposed:Boolean = false;

        public function ChatReportController(k:HabboHelp, _arg_2:Function)
        {
            this._habboHelp = k;
            this._submitFunction = _arg_2;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_3469():int
        {
            return this._reportedRoomId;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.closeWindow();
                this._habboHelp = null;
                this._disposed = true;
            }
        }

        public function show(k:int, _arg_2:int, _arg_3:int):void
        {
            this._window = (this._habboHelp.getXmlWindow("chat_report") as IWindowContainer);
            this._window.procedure = this._submitFunction;
            this._window.center();
            this._reportedUserId = _arg_2;
            this._reportedRoomId = -1;
            if (_arg_3 == HabboHelp._Str_4315)
            {
                this._Str_25143();
                this._Str_25723(k, _arg_2);
            }
            else
            {
                this._Str_14598();
                this._Str_23828(k, _arg_2);
            }
        }

        public function closeWindow():void
        {
            if (((this._habboHelp) && (this._habboHelp._Str_3531)))
            {
                this._habboHelp._Str_3531._Str_7724 = false;
            }
            if (((this._habboHelp) && (this._habboHelp._Str_3977)))
            {
                this._habboHelp._Str_3977._Str_7724 = false;
            }
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
        }

        public function _Str_9701(k:int, _arg_2:int):Array
        {
            var _local_4:int;
            var _local_5:Vector.<InstantMessageRegistryItem>;
            var _local_6:InstantMessageRegistryItem;
            var _local_7:ChatRegistryItem;
            var _local_3:Array = new Array();
            if (k == HabboHelp._Str_4315)
            {
                _local_4 = ((_arg_2 > 0) ? _arg_2 : this._reportedUserId);
                _local_5 = this._habboHelp._Str_3977._Str_5150(_local_4);
                for each (_local_6 in _local_5)
                {
                    if (_local_6.selected)
                    {
                        if (_local_6.userId < 0)
                        {
                            _local_3.push(Number(_local_6.userName.split(":")[0]));
                            _local_3.push(_local_6.text);
                        }
                        else
                        {
                            _local_3.push(_local_6.userId);
                            _local_3.push(_local_6.text);
                        }
                    }
                }
            }
            else
            {
                for each (_local_7 in this._habboHelp._Str_3531._Str_6828())
                {
                    if (_local_7.selected)
                    {
                        _local_3.push(_local_7.userId);
                        _local_3.push(_local_7.text);
                    }
                }
            }
            return _local_3;
        }

        private function _Str_25723(k:int, _arg_2:int):void
        {
            var _local_9:InstantMessageRegistryItem;
            var _local_10:IWindowContainer;
            var _local_11:ITextWindow;
            var _local_3:IItemListWindow = (this._window.findChildByName("room_items") as IItemListWindow);
            var _local_4:IWindowContainer = (_local_3.getListItemAt(0) as IWindowContainer);
            var _local_5:IWindowContainer = (this._habboHelp.getXmlWindow("chat_report_item") as IWindowContainer);
            _local_3.removeListItems();
            var _local_6:IWindowContainer = (_local_4.clone() as IWindowContainer);
            _local_3.addListItemAt(_local_6, 0);
            var _local_7:IItemListWindow = (_local_6.findChildByName("chat_items") as IItemListWindow);
            _local_7.removeListItems();
            this._habboHelp._Str_3977._Str_7724 = true;
            var _local_8:Vector.<InstantMessageRegistryItem> = this._habboHelp._Str_3977._Str_5150(_arg_2);
            for each (_local_9 in _local_8)
            {
                _local_10 = (_local_5.clone() as IWindowContainer);
                _local_11 = (_local_10.getChildByName("text") as ITextWindow);
                if (_local_9.userId < 0)
                {
                    _local_11.caption = ((_local_9.userName.split(":")[1] + ": ") + _local_9.text);
                }
                else
                {
                    _local_11.caption = ((_local_9.userName + ": ") + _local_9.text);
                }
                _local_10.id = _local_9.index;
                _local_10.procedure = this._Str_17227;
                _local_10.color = _Str_6492;
                _local_7.addListItem(_local_10);
            }
        }

        private function _Str_23828(k:int, _arg_2:int):void
        {
            var _local_6:int;
            var _local_7:IWindowContainer;
            var _local_8:IItemListWindow;
            var _local_10:ChatRegistryItem;
            var _local_11:IWindowContainer;
            var _local_12:ITextWindow;
            var _local_3:IItemListWindow = (this._window.findChildByName("room_items") as IItemListWindow);
            var _local_4:IWindowContainer = (_local_3.getListItemAt(0) as IWindowContainer);
            var _local_5:IWindowContainer = (this._habboHelp.getXmlWindow("chat_report_item") as IWindowContainer);
            _local_3.removeListItems();
            this._habboHelp._Str_3531._Str_7724 = true;
            var _local_9:Vector.<ChatRegistryItem> = ((_arg_2 > 0) ? this._habboHelp._Str_3531._Str_5150(_arg_2) : this._habboHelp._Str_3531._Str_6828());
            for each (_local_10 in _local_9)
            {
                if (_local_10.userId == k)
                {
                }
                else
                {
                    if (_local_10.roomId != _local_6)
                    {
                        _local_6 = _local_10.roomId;
                        _local_7 = (_local_4.clone() as IWindowContainer);
                        _local_7.findChildByName("room_name").caption = ("Room: " + _local_10.roomName);
                        _local_3.addListItemAt(_local_7, 0);
                        _local_8 = (_local_7.findChildByName("chat_items") as IItemListWindow);
                        _local_8.removeListItems();
                    }
                    _local_11 = (_local_5.clone() as IWindowContainer);
                    _local_12 = (_local_11.getChildByName("text") as ITextWindow);
                    _local_12.caption = ((_local_10.userName + ": ") + _local_10.text);
                    _local_11.id = _local_10.index;
                    _local_11.procedure = this._Str_18834;
                    _local_11.color = _Str_6492;
                    _local_8.addListItem(_local_11);
                }
            }
        }

        private function _Str_18834(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ChatRegistryItem;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._habboHelp._Str_3531._Str_2990(_arg_2.id);
                if (!_local_3)
                {
                    return;
                }
                if (((!(_local_3.selected)) && (!(_local_3.roomId == this._reportedRoomId))))
                {
                    this._reportedRoomId = _local_3.roomId;
                    this._Str_14598();
                }
                _local_3.selected = (!(_local_3.selected));
                _arg_2.color = ((_local_3.selected) ? _Str_9415 : _Str_6492);
            }
        }

        private function _Str_17227(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:InstantMessageRegistryItem;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._habboHelp._Str_3977._Str_2990(this._reportedUserId, _arg_2.id);
                if (!_local_3)
                {
                    return;
                }
                _local_3.selected = (!(_local_3.selected));
                _arg_2.color = ((_local_3.selected) ? _Str_9415 : _Str_6492);
            }
        }

        private function _Str_25143():void
        {
            this._Str_19667();
            this._Str_25110();
        }

        private function _Str_14598():void
        {
            this._Str_19667();
            this._Str_23459();
        }

        private function _Str_19667():void
        {
            var k:Vector.<InstantMessageRegistryItem>;
            var _local_2:ChatRegistryItem;
            var _local_3:InstantMessageRegistryItem;
            for each (k in this._habboHelp._Str_3977._Str_6828())
            {
                for each (_local_3 in k)
                {
                    _local_3.selected = false;
                }
            }
            for each (_local_2 in this._habboHelp._Str_3531._Str_6828())
            {
                _local_2.selected = false;
            }
        }

        private function _Str_23459():void
        {
            var _local_3:IWindowContainer;
            var _local_4:IItemListWindow;
            var _local_5:int;
            var _local_6:IWindow;
            var _local_7:ChatRegistryItem;
            var k:IItemListWindow = (this._window.findChildByName("room_items") as IItemListWindow);
            var _local_2:int;
            while (_local_2 < k.numListItems)
            {
                _local_3 = (k.getListItemAt(_local_2) as IWindowContainer);
                _local_4 = (_local_3.findChildByName("chat_items") as IItemListWindow);
                _local_5 = 0;
                while (_local_5 < _local_4.numListItems)
                {
                    _local_6 = (_local_4.getListItemAt(_local_5) as IWindow);
                    _local_7 = this._habboHelp._Str_3531._Str_2990(_local_6.id);
                    if (_local_7)
                    {
                        _local_6.color = ((_local_7.selected) ? _Str_9415 : _Str_6492);
                    }
                    _local_5++;
                }
                _local_2++;
            }
        }

        public function _Str_25110():void
        {
            var _local_3:IWindowContainer;
            var _local_4:IItemListWindow;
            var _local_5:int;
            var _local_6:IWindow;
            var _local_7:InstantMessageRegistryItem;
            var k:IItemListWindow = (this._window.findChildByName("room_items") as IItemListWindow);
            var _local_2:int;
            while (_local_2 < k.numListItems)
            {
                _local_3 = (k.getListItemAt(_local_2) as IWindowContainer);
                _local_4 = (_local_3.findChildByName("chat_items") as IItemListWindow);
                _local_5 = 0;
                while (_local_5 < _local_4.numListItems)
                {
                    _local_6 = (_local_4.getListItemAt(_local_5) as IWindow);
                    _local_7 = this._habboHelp._Str_3977._Str_2990(this._reportedUserId, _local_6.id);
                    if (_local_7)
                    {
                        _local_6.color = ((_local_7.selected) ? _Str_9415 : _Str_6492);
                    }
                    _local_5++;
                }
                _local_2++;
            }
        }
    }
}
