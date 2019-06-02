package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.userclassification._Str_6854;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.moderation._Str_556._Str_10411;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class UserClassificationCtrl implements IDisposable, ITrackedWindow 
    {
        private static var _Str_8819:Array = [];
        private static var _Str_16643:int = 200;

        private var _main:ModerationManager;
        private var _frame:IFrameWindow;
        private var _list:IItemListWindow;
        private var _classificationType:int;
        private var _classifications:Array;
        private var _disposed:Boolean;
        private var _row:IWindowContainer;
        private var _resizeTimer:Timer;
        private var _classificationRows:Array;

        public function UserClassificationCtrl(k:ModerationManager, _arg_2:int)
        {
            this._classificationRows = [];
            super();
            this._main = k;
            this._classificationType = _arg_2;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            this._resizeTimer = new Timer(300, 1);
            this._resizeTimer.addEventListener(TimerEvent.TIMER, this._Str_3774);
            this._main.moderationMessageHandler._Str_24655(this);
            this._frame = IFrameWindow(this._main.getXmlWindow("userclassification_frame"));
            this._list = IItemListWindow(this._frame.findChildByName("userclassification_list"));
            this._row = (this._list.getListItemAt(0) as IWindowContainer);
            this._list.removeListItems();
            this._frame.procedure = this._Str_7142;
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this._Str_2392;
        }

        public function _Str_22627(k:int, _arg_2:Array):void
        {
            if (k != this._classificationType)
            {
                return;
            }
            if (this._disposed)
            {
                return;
            }
            this._classifications = _arg_2;
            this._frame.caption = "";
            this.populate();
            this._Str_3774(null);
            this._frame.visible = true;
            this._main.moderationMessageHandler._Str_24247(this);
        }

        private function populate():void
        {
            var _local_2:_Str_6854;
            var k:Boolean = true;
            for each (_local_2 in this._classifications)
            {
                this._Str_16455(_local_2, k);
                k = (!(k));
            }
        }

        private function _Str_16455(k:_Str_6854, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = this._Str_16012();
            var _local_4:uint = ((_arg_2) ? 4288861930 : 0xFFFFFFFF);
            _local_3.color = _local_4;
            var _local_5:IWindow = _local_3.findChildByName("user_name_txt");
            _local_5.caption = k.username;
            _local_5.color = _local_4;
            var _local_6:ITextWindow = ITextWindow(_local_3.findChildByName("visit_room_txt"));
            _local_6.color = _local_4;
            var _local_7:ITextWindow = ITextWindow(_local_3.findChildByName("user_classification_txt"));
            _local_7.text = k._Str_25450;
            if (((!(this._main)) || (!(this._main._Str_3853))))
            {
                _local_7.visible = false;
                _local_6.visible = false;
            }
            this._Str_24423(_local_3, this._list);
            if (((this._main) && (this._main._Str_3853)))
            {
                new OpenUserInfo(this._frame, this._main, _local_5, k.userId);
                new _Str_10411(this._main, _local_6, k.userId);
            }
        }

        private function _Str_24423(k:IWindowContainer, _arg_2:IItemListWindow):void
        {
            _arg_2.addListItem(k);
            this._classificationRows.push(k);
        }

        private function _Str_16012():IWindowContainer
        {
            if (_Str_8819.length > 0)
            {
                return _Str_8819.pop() as IWindowContainer;
            }
            return IWindowContainer(this._row.clone());
        }

        private function _Str_25463(k:IWindowContainer):void
        {
            var _local_2:IWindow;
            var _local_3:IWindow;
            if (_Str_8819.length < _Str_16643)
            {
                _local_2 = k.findChildByName("user_name_txt");
                _local_2.procedure = null;
                _local_3 = k.findChildByName("visit_room_txt");
                _local_3.procedure = null;
                k.width = this._row.width;
                k.height = this._row.height;
                _Str_8819.push(k);
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
            for each (k in this._classificationRows)
            {
                this._Str_25463(k);
            }
            if (this._row != null)
            {
                this._row.dispose();
                this._row = null;
            }
            this._classificationRows = [];
        }

        public function getType():int
        {
            return WindowTracker._Str_14197;
        }

        public function getId():String
        {
            return "" + this._classificationType;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame;
        }
    }
}
