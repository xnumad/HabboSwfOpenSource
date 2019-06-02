package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IScrollableWindow;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.toolbar.HabboToolbarEnum;
    import flash.display.DisplayObject;
    import flash.display.Stage;
    import flash.events.MouseEvent;

    public class RoomChatHistoryViewer implements IDisposable 
    {
        private static const _Str_16289:int = 18;
        private static const _Str_4906:int = 20;
        public static const _Str_14515:int = 3;

        private var _historyPulldown:RoomChatHistoryPulldown;
        private var _historyViewerActive:Boolean = false;
        private var _historyViewerDragStartY:Number = -1;
        private var _scrollbarWindow:IScrollbarWindow;
        private var _scrollTarget:Number = 1;
        private var _disabled:Boolean = false;
        private var _widget:RoomChatWidget;
        private var _isDisposed:Boolean = false;
        private var _forcedResize:Boolean = false;
        private var _hysteresisBlockOn:Boolean = false;

        public function RoomChatHistoryViewer(k:RoomChatWidget, _arg_2:IHabboWindowManager, _arg_3:IWindowContainer, _arg_4:IAssetLibrary)
        {
            this._isDisposed = false;
            this._widget = k;
            this._historyPulldown = new RoomChatHistoryPulldown(k, _arg_2, _arg_3, _arg_4);
            this._historyPulldown.state = RoomChatHistoryPulldown._Str_5954;
            var _local_5:IItemListWindow = (_arg_3.getChildByName("chat_contentlist") as IItemListWindow);
            if (_local_5 == null)
            {
                return;
            }
            _arg_3.removeChild(_local_5);
            _arg_3.addChild(_local_5);
            this._scrollbarWindow = (_arg_2.createWindow("chatscroller", "", WindowType.WINDOW_TYPE_SCROLLBAR_VERTICAL, _Str_3108.NULL, (WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT | WindowParam.WINDOW_PARAM_NULL), new Rectangle((_arg_3.right - _Str_4906), _arg_3.y, _Str_4906, (_arg_3.height - RoomChatHistoryPulldown._Str_3788)), null, 0) as IScrollbarWindow);
            _arg_3.addChild(this._scrollbarWindow);
            this._scrollbarWindow.visible = false;
            this._scrollbarWindow.scrollable = (_local_5 as IScrollableWindow);
        }

        public function set disabled(k:Boolean):void
        {
            this._disabled = k;
        }

        public function set visible(k:Boolean):void
        {
            if (((this._historyPulldown == null) || (this._disabled)))
            {
                return;
            }
            this._historyPulldown.state = ((k) ? RoomChatHistoryPulldown._Str_8230 : RoomChatHistoryPulldown._Str_5954);
        }

        public function get active():Boolean
        {
            return this._historyViewerActive;
        }

        public function get _Str_10683():Number
        {
            return (this._historyViewerActive) ? _Str_4906 : 0;
        }

        public function get _Str_22103():Number
        {
            return RoomChatHistoryPulldown._Str_3788;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get visible():Boolean
        {
            if (this._historyPulldown == null)
            {
                return false;
            }
            return (this._historyPulldown.state == RoomChatHistoryPulldown._Str_8230) || (this._historyPulldown.state == RoomChatHistoryPulldown._Str_3847);
        }

        public function dispose():void
        {
            this._Str_7189();
            if (this._scrollbarWindow != null)
            {
                this._scrollbarWindow.dispose();
                this._scrollbarWindow = null;
            }
            if (this._historyPulldown != null)
            {
                this._historyPulldown.dispose();
                this._historyPulldown = null;
            }
            this._isDisposed = true;
        }

        public function update(k:uint):void
        {
            if (this._historyPulldown != null)
            {
                this._historyPulldown.update(k);
            }
            this._Str_17156();
        }

        public function _Str_24994():void
        {
            if (this._historyViewerActive)
            {
                this._Str_7189();
            }
            else
            {
                this._Str_18199();
            }
        }

        public function _Str_7189():void
        {
            this._scrollTarget = 1;
            this._Str_21402();
            this._historyViewerActive = false;
            this._Str_20323(false);
            this._historyPulldown.state = RoomChatHistoryPulldown._Str_5954;
            if (this._widget != null)
            {
                this._widget._Str_8599();
                this._widget._Str_25376();
                this._widget.handler.container.toolbar.extensionView.extraMargin = 0;
            }
        }

        public function _Str_18199():void
        {
            var k:RoomChatItem;
            var _local_2:int;
            var _local_3:IWindowContainer;
            if (((!(this._historyViewerActive)) && (!(this._disabled))))
            {
                this._historyViewerActive = true;
                this._Str_20323(true);
                this._historyPulldown.state = RoomChatHistoryPulldown._Str_8230;
                if (this._widget != null)
                {
                    this._widget._Str_20247();
                    this._widget._Str_25298();
                }
            }
        }

        private function _Str_20323(k:Boolean):void
        {
            if (this._scrollbarWindow != null)
            {
                this._scrollbarWindow.visible = k;
                if (k)
                {
                    this._scrollbarWindow.scrollV = 1;
                    this._scrollTarget = 1;
                }
                else
                {
                    this._historyViewerActive = false;
                    this._historyViewerDragStartY = -1;
                }
            }
        }

        public function _Str_8958(k:Rectangle, _arg_2:Boolean=false):void
        {
            if (this._scrollbarWindow != null)
            {
                this._scrollbarWindow.x = ((k.x + k.width) - this._scrollbarWindow.width);
                this._scrollbarWindow.y = k.y;
                this._scrollbarWindow.height = (k.height - RoomChatHistoryPulldown._Str_3788);
                if (_arg_2)
                {
                    this._scrollbarWindow.scrollV = this._scrollTarget;
                }
            }
            if (this._historyPulldown != null)
            {
                this._historyPulldown._Str_8958(k);
            }
        }

        private function _Str_24773(k:Number, _arg_2:Boolean=false):void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:Boolean;
            if (((this._historyViewerDragStartY > 0) && (_arg_2)))
            {
                if (this._hysteresisBlockOn)
                {
                    if (Math.abs((k - this._historyViewerDragStartY)) > _Str_14515)
                    {
                        this._hysteresisBlockOn = false;
                    }
                    else
                    {
                        return;
                    }
                }
                if (!this._historyViewerActive)
                {
                    this._widget._Str_23995();
                    this._Str_18199();
                    this._Str_17156();
                }
                if (this._historyViewerActive)
                {
                    this._widget.handler.container.toolbar.extensionView.extraMargin = HabboToolbarEnum._Str_18993;
                    this._Str_17156();
                    _local_4 = (this._scrollbarWindow.scrollable.visibleRegion.height / this._scrollbarWindow.scrollable._Str_3707.height);
                    _local_5 = ((k - this._historyViewerDragStartY) / this._scrollbarWindow.height);
                    _local_3 = (this._scrollTarget - (_local_5 / _local_4));
                    _local_3 = Math.max(0, _local_3);
                    _local_3 = Math.min(1, _local_3);
                    _local_6 = (k - this._historyViewerDragStartY);
                    _local_7 = true;
                    _local_8 = true;
                    if (this._scrollbarWindow.scrollV < (1 - (_Str_16289 / this._scrollbarWindow.scrollable.visibleRegion.height)))
                    {
                        _local_8 = false;
                    }
                    if (((_local_8) || (this._forcedResize)))
                    {
                        this._widget._Str_23426(_local_6);
                        _local_7 = false;
                        this._scrollTarget = 1;
                        this._scrollbarWindow.scrollV = 1;
                    }
                    if (_local_7)
                    {
                        this._scrollTarget = _local_3;
                    }
                    this._historyViewerDragStartY = k;
                }
            }
            else
            {
                this._historyViewerDragStartY = -1;
            }
        }

        public function _Str_19757(k:Number, _arg_2:Boolean=false):void
        {
            var _local_3:DisplayObject;
            var _local_4:Stage;
            if (this._disabled)
            {
                return;
            }
            this._historyViewerDragStartY = k;
            this._forcedResize = _arg_2;
            this._hysteresisBlockOn = true;
            if (this._scrollbarWindow != null)
            {
                this._scrollTarget = this._scrollbarWindow.scrollV;
            }
            if (this._scrollbarWindow != null)
            {
                _local_3 = this._scrollbarWindow.context.getDesktopWindow().getDisplayObject();
                if (_local_3 != null)
                {
                    _local_4 = _local_3.stage;
                    if (_local_4 != null)
                    {
                        _local_4.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_3983);
                        _local_4.addEventListener(MouseEvent.MOUSE_UP, this._Str_1703);
                    }
                }
            }
        }

        public function _Str_21402():void
        {
            var k:DisplayObject;
            var _local_2:Stage;
            this._historyViewerDragStartY = -1;
            if (this._scrollbarWindow != null)
            {
                k = this._scrollbarWindow.context.getDesktopWindow().getDisplayObject();
                if (k != null)
                {
                    _local_2 = k.stage;
                    if (_local_2 != null)
                    {
                        _local_2.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_3983);
                        _local_2.removeEventListener(MouseEvent.MOUSE_UP, this._Str_1703);
                    }
                }
            }
        }

        private function _Str_17156():void
        {
            if (!this._historyViewerActive)
            {
                return;
            }
            if (this._historyViewerDragStartY < 0)
            {
                return;
            }
            if (this._forcedResize)
            {
                return;
            }
            var k:Number = (this._scrollTarget - this._scrollbarWindow.scrollV);
            if (k == 0)
            {
                return;
            }
            if (Math.abs(k) < 0.01)
            {
                this._scrollbarWindow.scrollV = this._scrollTarget;
            }
            else
            {
                this._scrollbarWindow.scrollV = (this._scrollbarWindow.scrollV + (k / 2));
            }
        }

        private function _Str_1703(k:MouseEvent):void
        {
            this._Str_21402();
            if (this._widget != null)
            {
                this._widget._Str_20437();
            }
        }

        private function _Str_3983(k:MouseEvent):void
        {
            this._Str_24773(k.stageY, k.buttonDown);
        }
    }
}
