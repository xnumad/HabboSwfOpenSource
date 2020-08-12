package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.GetCustomRoomFilterMessageComposer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings.UpdateRoomFilterMessageComposer;
    import com.sulake.core.window.components.IRegionWindow;

    public class RoomFilterCtrl implements IDisposable 
    {
        private var _flatId:int;
        private var _navigator:IHabboTransitionalNavigator;
        private var _selectedRow:int = -1;
        private var _window:IWindowContainer;
        private var _badWords:Array;
        private var _badWordList:IItemListWindow;
        private var _badWordField:ITextFieldWindow;

        public function RoomFilterCtrl(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
            this._badWords = new Array();
        }

        public function startRoomFilterEdit(k:int):void
        {
            this._flatId = k;
            this._navigator.send(new GetCustomRoomFilterMessageComposer(this._flatId));
            this._Str_24741();
        }

        private function _Str_24741():void
        {
            if (this._navigator.data.enteredGuestRoom == null)
            {
                return;
            }
            this.prepareWindow();
            this._window.visible = true;
            this._window.invalidate();
            this._window.activate();
            this._navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "open", "room.filter.seen");
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._navigator.getXmlWindow("iro_room_filter_framed"));
            this._window.findChildByName("badword_remove_btn").addEventListener(WindowMouseEvent.CLICK, this._Str_24328);
            this._window.findChildByName("badword_add_btn").addEventListener(WindowMouseEvent.CLICK, this._Str_24260);
            this._window.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this.onCloseButtonClick);
            this._badWordField = (this._window.findChildByName("roomfilter_addword_txt") as ITextFieldWindow);
            this._badWordList = IItemListWindow(this._window.findChildByName("badwords_itemlist"));
            this._Str_20699();
            this._window.center();
        }

        public function _Str_9592(k:Array):void
        {
            var _local_2:int;
            while (_local_2 < k.length)
            {
                if (this._badWords.indexOf(k[_local_2]) == -1)
                {
                    this._badWords.push(k[_local_2]);
                }
                _local_2++;
            }
            if (this._badWordList)
            {
                this._badWordList.removeListItems();
                this._Str_20699();
            }
        }

        private function _Str_20699():void
        {
            var _local_2:IWindowContainer;
            this._badWordList.autoArrangeItems = false;
            var k:int;
            while (true)
            {
                _local_2 = IWindowContainer(this._badWordList.getListItemAt(k));
                if (_local_2 == null)
                {
                    if (this._badWords[k] == null)
                    {
                        break;
                    }
                    _local_2 = this.getListEntry(k);
                    this._badWordList.addListItem(_local_2);
                }
                if (this._badWords[k] != null)
                {
                    _local_2.color = this.getBgColor(k, false);
                    this.refreshEntryDetails(_local_2, this._badWords[k]);
                    _local_2.visible = true;
                    _local_2.height = 20;
                }
                else
                {
                    _local_2.height = 0;
                    _local_2.visible = false;
                }
                k++;
            }
            this._badWordList.autoArrangeItems = true;
            this._badWordList.invalidate();
        }

        private function refreshEntryDetails(k:IWindowContainer, _arg_2:String):void
        {
            k.findChildByName("badword_txt").caption = _arg_2;
        }

        private function onCloseButtonClick(k:WindowEvent):void
        {
            this.disposeWindow();
        }

        private function _Str_24260(k:WindowMouseEvent):void
        {
            this.addBadWord(this._badWordField.text);
        }

        private function addBadWord(k:String):void
        {
            if (((!(this._badWordField == null)) && (this._badWordField.text.length > 0)))
            {
                this._navigator.send(new UpdateRoomFilterMessageComposer(this._flatId, UpdateRoomFilterMessageComposer._Str_16408, k));
                this._navigator.send(new GetCustomRoomFilterMessageComposer(this._flatId));
                this._badWordField.text = "bobba";
            }
        }

        private function _Str_24328(k:WindowMouseEvent):void
        {
            if (this._selectedRow < 0)
            {
                return;
            }
            var _local_2:IWindowContainer = IWindowContainer(this._badWordList.getListItemAt(this._selectedRow));
            if (!_local_2)
            {
                return;
            }
            var _local_3:String = _local_2.findChildByName("badword_txt").caption;
            _local_2.height = 0;
            _local_2.visible = false;
            _local_2 = null;
            if (this._badWords.indexOf(_local_3) >= 0)
            {
                this._badWords.splice(this._badWords.indexOf(_local_3), 1);
            }
            this._navigator.send(new UpdateRoomFilterMessageComposer(this._flatId, UpdateRoomFilterMessageComposer._Str_16962, _local_3));
        }

        private function _Str_17449(k:IItemListWindow):void
        {
            var _local_3:IWindowContainer;
            var _local_2:int;
            while (_local_2 < this._badWords.length)
            {
                _local_3 = IWindowContainer(k.getListItemAt(_local_2));
                _local_3.color = this.getBgColor(_local_2, false);
                _local_2++;
            }
        }

        private function getListEntry(k:int):IWindowContainer
        {
            if (!this._navigator)
            {
                return null;
            }
            var _local_2:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("ros_badword"));
            if (!_local_2)
            {
                return null;
            }
            var _local_3:IRegionWindow = IRegionWindow(_local_2.findChildByName("bg_region"));
            _local_3.addEventListener(WindowMouseEvent.CLICK, this.onBgMouseClick);
            _local_3.addEventListener(WindowMouseEvent.OVER, this._Str_18088);
            _local_3.addEventListener(WindowMouseEvent.OUT, this._Str_17027);
            _local_2.id = k;
            return _local_2;
        }

        protected function getBgColor(k:int, _arg_2:Boolean):uint
        {
            if (k == this._selectedRow)
            {
                return 4288329945;
            }
            return (_arg_2) ? 4290173439 : (((k % 2) != 0) ? 0xFFFFFFFF : 4293519841);
        }

        private function onBgMouseClick(k:WindowEvent):void
        {
            this._selectedRow = k.target.parent.id;
            this._Str_17449((k.target.findParentByName("badwords_itemlist") as IItemListWindow));
        }

        private function _Str_18088(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = IWindowContainer(k.target.parent);
            _local_2.color = this.getBgColor(-1, true);
        }

        private function _Str_17027(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = IWindowContainer(k.target.parent);
            _local_2.color = this.getBgColor(_local_2.id, false);
        }

        public function close():void
        {
            this._flatId = 0;
            if (this._window != null)
            {
                this._window.visible = false;
            }
        }

        public function disposeWindow():void
        {
            if (this._window)
            {
                this._window.visible = false;
                this._window.dispose();
                this._window = null;
            }
            if (this._badWordList)
            {
                this._badWordList.removeListItems();
                this._badWordList.dispose();
                this._badWordList = null;
            }
            if (this._badWordField)
            {
                this._badWordField.dispose();
                this._badWordField = null;
            }
            if (this._badWords)
            {
                this._badWords.length = 0;
            }
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this.disposeWindow();
            this._navigator = null;
        }

        public function get disposed():Boolean
        {
            return this._navigator == null;
        }
    }
}
