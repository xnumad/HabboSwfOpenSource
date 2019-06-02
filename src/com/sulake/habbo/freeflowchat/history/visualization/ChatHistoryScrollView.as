package com.sulake.habbo.freeflowchat.history.visualization
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.history.ChatHistoryBuffer;
	import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollBar;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.BitmapSpriteWithUserId;
    import flash.geom.Rectangle;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.IChatHistoryEntryBitmap;
    import com.sulake.habbo.freeflowchat.history.visualization.enum.ChatHistoryLayoutEnum;
    import flash.events.MouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2910;
    import __AS3__.vec.*;
    import com.sulake.habbo.freeflowchat.history.*;

    public class ChatHistoryScrollView implements IDisposable 
    {
        private var _component:HabboFreeFlowChat;
        private var _historyBuffer:ChatHistoryBuffer;
        private var _rootDisplayObject:DisplayObjectContainer;
        private var _registeredStage:Stage;
        private var _bufferDisplays:Vector.<BitmapSpriteWithUserId>;
        private var _topY:int = 0;
        private var _viewPort:Rectangle;
        private var _visibleWidth:int = 0;
        private var _dragStartY:int;
        private var _dragStartTopY:int;
        private var _clipMask:Sprite;
        private var _isActive:Boolean = false;
        private var _scrollBar:ChatHistoryScrollBar;
        private var _ignore:Bitmap;
        private var _currentIgnored:BitmapSpriteWithUserId;

        public function ChatHistoryScrollView(k:HabboFreeFlowChat, _arg_2:ChatHistoryBuffer)
        {
            this._component = k;
            this._historyBuffer = _arg_2;
            this._rootDisplayObject = new Sprite();
            this._rootDisplayObject.x = 0;
            this._rootDisplayObject.y = 0;
            this._rootDisplayObject.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this._scrollBar = new ChatHistoryScrollBar(this, k);
            this._ignore = new Bitmap();
            this._ignore.bitmapData = BitmapData(this._component.assets.getAssetByName("close_x").content);
            this._currentIgnored = null;
        }

        public function dispose():void
        {
            this._Str_15425();
            this._Str_17611();
            this._clipMask = null;
            this._ignore = null;
            this._currentIgnored = null;
            if (this._rootDisplayObject)
            {
                this._rootDisplayObject.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
                this._rootDisplayObject = null;
            }
        }

        public function get disposed():Boolean
        {
            return (this._clipMask == null) && (this._rootDisplayObject == null);
        }

        public function get _Str_5128():DisplayObjectContainer
        {
            return this._rootDisplayObject;
        }

        public function _Str_24280():void
        {
            var _local_3:BitmapSpriteWithUserId;
            var _local_4:IChatHistoryEntryBitmap;
            if (!this._historyBuffer)
            {
                return;
            }
            this._Str_17611();
            this._bufferDisplays = new Vector.<BitmapSpriteWithUserId>(this._historyBuffer.entries.length);
            var k:int;
            var _local_2:int = -(this._topY);
            while (k < this._historyBuffer.entries.length)
            {
                _local_3 = new BitmapSpriteWithUserId();
                _local_4 = this._historyBuffer.entries[k];
                _local_3.roomId = _local_4.roomId;
                _local_3.userId = _local_4.userId;
                _local_3.bitmapData = _local_4.bitmap;
                _local_3._Str_6123 = _local_4._Str_6123;
                _local_3.userName = _local_4.userName;
                _local_2 = (_local_2 - _local_4.overlap.y);
                _local_3.y = _local_2;
                _local_3.x = ChatHistoryLayoutEnum._Str_10820;
                _local_2 = (_local_2 + _local_3.bitmapData.height);
                _local_2 = (_local_2 - ChatHistoryLayoutEnum._Str_6853);
                this._bufferDisplays[k] = _local_3;
                this._rootDisplayObject.addChild(this._bufferDisplays[k]);
                k++;
            }
            this._rootDisplayObject.addChild(this._scrollBar.displayObject);
            this._isActive = true;
        }

        public function _Str_17611():void
        {
            var k:Bitmap;
            if (this.disposed)
            {
                return;
            }
            for each (k in this._bufferDisplays)
            {
                this._rootDisplayObject.removeChild(k);
                k.bitmapData = null;
            }
            if (this._currentIgnored != null)
            {
                this._rootDisplayObject.removeChild(this._ignore);
                this._currentIgnored = null;
            }
            this._bufferDisplays = new Vector.<BitmapSpriteWithUserId>(0);
            if (((!(this._scrollBar.displayObject == null)) && (this._scrollBar.displayObject.parent == this._rootDisplayObject)))
            {
                this._rootDisplayObject.removeChild(this._scrollBar.displayObject);
            }
            this._isActive = false;
        }

        public function _Str_24219():void
        {
            this._Str_15425();
            this._rootDisplayObject.stage.addEventListener(MouseEvent.MOUSE_DOWN, this._Str_4596);
            this._registeredStage = this._rootDisplayObject.stage;
            this._registeredStage.addEventListener(Event.RESIZE, this._Str_11094);
        }

        public function _Str_15425():void
        {
            if (this._registeredStage)
            {
                this._registeredStage.removeEventListener(MouseEvent.MOUSE_DOWN, this._Str_4596);
                this._registeredStage.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_4596, true);
                this._registeredStage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_4596);
                this._registeredStage.removeEventListener(Event.RESIZE, this._Str_11094);
            }
        }

        public function get _Str_7317():int
        {
            return this._topY;
        }

        public function get _Str_18682():int
        {
            return this._historyBuffer.totalHeight;
        }

        public function set _Str_7317(k:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:IChatHistoryEntryBitmap;
            this._topY = k;
            if (this._bufferDisplays)
            {
                _local_2 = 0;
                _local_3 = -(this._topY);
                while (_local_2 < this._historyBuffer.entries.length)
                {
                    if (this._bufferDisplays.length <= _local_2) break;
                    _local_4 = this._historyBuffer.entries[_local_2];
                    _local_3 = (_local_3 - _local_4.overlap.y);
                    this._bufferDisplays[_local_2].y = _local_3;
                    _local_3 = (_local_3 + (_local_4.bitmap.height - ChatHistoryLayoutEnum._Str_6853));
                    _local_2++;
                }
            }
            if (this._currentIgnored != null)
            {
                this._ignore.y = (this._currentIgnored.y + ((this._currentIgnored.height - this._ignore.height) / 2));
            }
            this._scrollBar._Str_20818();
        }

        public function _Str_23438(k:IChatHistoryEntryBitmap):void
        {
            var _local_2:BitmapSpriteWithUserId = new BitmapSpriteWithUserId();
            _local_2.bitmapData = k.bitmap;
            _local_2.y = (((-(this._topY) + this._historyBuffer.totalHeight) - k.bitmap.height) + ChatHistoryLayoutEnum._Str_6853);
            _local_2.x = ChatHistoryLayoutEnum._Str_10820;
            _local_2.userId = k.userId;
            _local_2.roomId = k.roomId;
            _local_2._Str_6123 = k._Str_6123;
            _local_2.userName = k.userName;
            this._bufferDisplays.push(_local_2);
            this._rootDisplayObject.addChild(this._bufferDisplays[(this._bufferDisplays.length - 1)]);
        }

        public function _Str_25251(k:int):void
        {
            var _local_2:Bitmap;
            if (((this._bufferDisplays) && (this._bufferDisplays.length > 0)))
            {
                this._rootDisplayObject.removeChild(this._bufferDisplays[0]);
                this._bufferDisplays.splice(0, 1);
                for each (_local_2 in this._bufferDisplays)
                {
                    _local_2.y = (_local_2.y - k);
                }
            }
        }

        public function get _Str_5924():Rectangle
        {
            return this._viewPort;
        }

        public function set _Str_5924(k:Rectangle):void
        {
            this._viewPort = k;
            this._rootDisplayObject.width = k.width;
            this._rootDisplayObject.height = k.height;
            this._rootDisplayObject.scaleX = 1;
            this._rootDisplayObject.scaleY = 1;
            if (!this._clipMask)
            {
                this._clipMask = new Sprite();
                this._rootDisplayObject.addChild(this._clipMask);
            }
            this._clipMask.graphics.clear();
            this._clipMask.graphics.beginFill(0xFFFFFF);
            this._clipMask.graphics.drawRect(0, 0, this._Str_5924.width, this._Str_5924.height);
            this._rootDisplayObject.mask = this._clipMask;
            this._scrollBar.displayObject.x = (this._viewPort.width - ChatHistoryScrollBar._Str_14287);
            this._Str_12498 = k.height;
        }

        public function set _Str_12498(k:int):void
        {
            this._rootDisplayObject.y = (k - this._viewPort.height);
            this._scrollBar.height = k;
            this._scrollBar.displayObject.y = (this._viewPort.height - k);
        }

        public function set _Str_20800(k:int):void
        {
            this._visibleWidth = k;
            this._scrollBar.displayObject.x = (this._visibleWidth - ChatHistoryScrollBar._Str_14287);
        }

        public function _Str_24783():void
        {
            this._Str_7317 = ((this._historyBuffer.totalHeight - this._Str_5924.height) + 100);
        }

        public function get isActive():Boolean
        {
            return this._isActive;
        }

        private function _Str_25157(k:int):BitmapSpriteWithUserId
        {
            var _local_2:BitmapSpriteWithUserId;
            for each (_local_2 in this._bufferDisplays)
            {
                if (((k >= _local_2.y) && (k <= (_local_2.y + _local_2.height))))
                {
                    return _local_2;
                }
            }
            return null;
        }

        private function _Str_4596(k:Event):void
        {
            var _local_2:MouseEvent;
            var _local_3:int;
            var _local_4:int;
            var _local_5:BitmapSpriteWithUserId;
            if (((!(this._rootDisplayObject)) || (!(this._rootDisplayObject.stage))))
            {
                return;
            }
            _local_2 = MouseEvent(k);
            switch (_local_2.type)
            {
                case MouseEvent.MOUSE_DOWN:
                    if (((_local_2.stageY < (this._rootDisplayObject.y + this._viewPort.height)) && (_local_2.stageX < this._scrollBar.displayObject.x)))
                    {
                        this._scrollBar._Str_20615();
                        this._dragStartY = _local_2.stageY;
                        this._dragStartTopY = this._Str_7317;
                        this._registeredStage.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_4596, true);
                        this._registeredStage.addEventListener(MouseEvent.MOUSE_UP, this._Str_4596);
                    }
                    return;
                case MouseEvent.MOUSE_MOVE:
                    _local_3 = (_local_2.stageY - this._dragStartY);
                    this._Str_7317 = (this._dragStartTopY - _local_3);
                    k.stopImmediatePropagation();
                    return;
                case MouseEvent.MOUSE_UP:
                    this._registeredStage.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_4596, true);
                    this._registeredStage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_4596);
                    _local_4 = (_local_2.stageY - this._dragStartY);
                    if (((_local_4 < 1) && (_local_4 > -1)))
                    {
                        if (this._Str_23688(_local_2.stageX, _local_2.stageY))
                        {
                            return;
                        }
                        _local_5 = this._Str_25157(_local_2.stageY);
                        if (_local_5)
                        {
                            this._Str_23890(_local_5);
                            this._Str_23554(_local_5);
                        }
                    }
                    return;
            }
        }

        private function onAddedToStage(k:Event):void
        {
            var _local_2:Stage = this._rootDisplayObject.stage;
            this._Str_5924 = new Rectangle(0, 0, _local_2.stageWidth, (_local_2.stageHeight - ChatHistoryLayoutEnum._Str_7235));
        }

        private function _Str_11094(k:Event):void
        {
            if (this._registeredStage)
            {
                this._Str_5924 = new Rectangle(0, 0, this._registeredStage.stageWidth, (this._registeredStage.stageHeight - ChatHistoryLayoutEnum._Str_7235));
            }
        }

        private function _Str_23890(k:BitmapSpriteWithUserId):void
        {
            if (!this._component)
            {
                return;
            }
            this._component.selectAvatar(k.roomId, k.userId);
        }

        private function _Str_23554(k:BitmapSpriteWithUserId):void
        {
            if (((!(this._component)) || (k == this._currentIgnored)))
            {
                return;
            }
            if (((!(k._Str_6123)) || (this._component.sessionDataManager.isIgnored(k.userName))))
            {
                if (this._currentIgnored != null)
                {
                    this._rootDisplayObject.removeChild(this._ignore);
                    this._currentIgnored = null;
                }
                return;
            }
            this._ignore.x = ((k.x + k.width) + 5);
            this._ignore.y = (k.y + ((k.height - this._ignore.height) / 2));
            this._rootDisplayObject.addChild(this._ignore);
            this._currentIgnored = k;
        }

        private function _Str_23688(k:int, _arg_2:int):Boolean
        {
            if ((((((this._currentIgnored == null) || (k < this._ignore.x)) || (k > (this._ignore.x + this._ignore.width))) || (_arg_2 < this._ignore.y)) || (_arg_2 > (this._ignore.y + this._ignore.height))))
            {
                return false;
            }
            this._component.localizations.registerParameter("chat.ignore_user.confirm.info", "username", this._currentIgnored.userName);
            var _local_3:String = this._component.localizations.getLocalization("chat.ignore_user.confirm.title");
            var _local_4:String = this._component.localizations.getLocalization("chat.ignore_user.confirm.info");
            this._component.windowManager._Str_21720(_local_3, _local_4, 0, this._Str_22950);
            return true;
        }

        private function _Str_22950(k:_Str_2910, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this._component.sessionDataManager.ignoreUser(this._currentIgnored.userName);
            }
            if (this._currentIgnored != null)
            {
                this._rootDisplayObject.removeChild(this._ignore);
                this._currentIgnored = null;
            }
        }
    }
}
