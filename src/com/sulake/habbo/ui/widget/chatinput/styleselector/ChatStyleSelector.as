package com.sulake.habbo.ui.widget.chatinput.styleselector
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputView;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import flash.display.Shape;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.style.IChatStyle;
    import flash.display.Sprite;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;

    public class ChatStyleSelector implements IDisposable 
    {
        private static const _Str_17267:int = 1;
        private static const _Str_16506:int = 3;
        private static var _Str_1007:ChatStyleGridEntry = null;
        private static var _Str_6012:Boolean = false;

        private var _roomChatInputView:RoomChatInputView;
        private var _container:IWindowContainer;
        private var _Str_3334:ChatStyleGridView;
        private var _Str_2514:Vector.<ChatStyleGridEntry>;
        private var _Str_11421:IWindow;
        private var _Str_4357:Shape;

        public function ChatStyleSelector(k:RoomChatInputView, _arg_2:IWindowContainer, _arg_3:ISessionDataManager)
        {
            this._Str_2514 = new Vector.<ChatStyleGridEntry>();
            super();
            this._roomChatInputView = k;
            this._Str_3334 = new ChatStyleGridView(this, this._roomChatInputView.sessionDataManager);
            this._Str_11421 = k.widget.windowManager.buildFromXML((k.widget.assets.getAssetByName("chatinput_chatstyle_template_xml").content as XML));
            this._container = _arg_2;
            this._container.procedure = this._Str_12416;
            this._roomChatInputView._Str_22667.addChild(this._Str_3334.window);
            this._Str_3334.window.x = 0;
            this._Str_3334.window.y = 0;
        }

        public function dispose():void
        {
            while (this._Str_2514.length > 1)
            {
                this._Str_2514.pop();
            }
            this._Str_2514 = null;
            this._Str_3334.dispose();
            this._Str_3334 = null;
            if (((this._Str_4357) && (this._Str_4357.parent)))
            {
                this._Str_4357.parent.removeChild(this._Str_4357);
            }
        }

        public function get disposed():Boolean
        {
            return this._Str_3334 == null;
        }

        public function get _Str_20286():RoomChatInputView
        {
            return this._roomChatInputView;
        }

        public function _Str_2822(k:int, _arg_2:BitmapData):void
        {
            this._Str_2514.push(new ChatStyleGridEntry(k, _arg_2));
            var _local_3:IWindowContainer = this._Str_22807(_arg_2);
            this._Str_3334.grid._Str_2816(_local_3);
            _local_3.findChildByName("background_color").visible = false;
        }

        public function get _Str_22824():int
        {
            if (((_Str_6012) && (this.selected)))
            {
                _Str_6012 = false;
                return this.selected.id;
            }
            return -1;
        }

        public function get _Str_26237():BitmapData
        {
            if (this.selected)
            {
                return this.selected.bitmap;
            }
            return null;
        }

        public function _Str_24820():void
        {
            this.selected = this.selected;
            _Str_6012 = false;
        }

        public function set _Str_22746(k:int):void
        {
            k = Math.min(k, _Str_16506);
            var _local_2:int = (((k - 1) * (this._Str_11421.width + _Str_17267)) + this._Str_11421.width);
            if (k > 1)
            {
                this._Str_3334.grid.width = _local_2;
            }
            else
            {
                this._Str_3334.grid.width = (this._Str_11421.width + 16);
            }
        }

        private function set selected(k:ChatStyleGridEntry):void
        {
            _Str_1007 = k;
            _Str_6012 = true;
            var _local_2:IChatStyle = this._roomChatInputView.widget._Str_13265.chatStyleLibrary.getStyle(k.id);
            if (this._roomChatInputView.window.findChildByName("chat_bg_preview") == null)
            {
                return;
            }
            var _local_3:Sprite = _local_2.getNewBackgroundSprite(0xFFFFFF);
            var _local_4:IDisplayObjectWrapper = IDisplayObjectWrapper(this._roomChatInputView.window.findChildByName("chat_bg_preview"));
            _local_3.width = (_local_4.width + _local_2.overlap.width);
            _local_3.height = ((_local_4.height + _local_2.overlap.y) + _local_2.overlap.height);
            _local_3.y = (_local_3.y - _local_2.overlap.y);
            if (!this._Str_4357)
            {
                this._Str_4357 = new Shape();
            }
            else
            {
                this._Str_4357.graphics.clear();
            }
            this._Str_4357.graphics.beginFill(0xFF0000);
            this._Str_4357.graphics.drawRect(0, 0, (_local_3.width - 28), _local_3.height);
            _local_4.setDisplayObject(_local_3);
            if (_local_3.parent)
            {
                _local_3.parent.addChild(this._Str_4357);
                this._Str_4357.x = (_local_3.x + 28);
                this._Str_4357.y = _local_3.y;
                _local_3.mask = this._Str_4357;
            }
            this._roomChatInputView._Str_24855((_local_2.textFormat.color as uint));
        }

        private function get selected():ChatStyleGridEntry
        {
            if (_Str_1007 == null)
            {
                _Str_1007 = this._Str_2514[(this._Str_2514.length - 1)];
            }
            return _Str_1007;
        }

        private function _Str_22807(k:BitmapData):IWindowContainer
        {
            var _local_2:IWindowContainer = IWindowContainer(this._Str_11421.clone());
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(_local_2.findChildByName("bubble_preview"));
            _local_3.bitmap = k;
            _local_3.center();
            _local_2.procedure = this._Str_25202;
            return _local_2;
        }

        public function _Str_19515():void
        {
            if (this._Str_3334.window.visible)
            {
                this._Str_3334._Str_25385(this._container);
            }
        }

        private function _Str_12416(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_3334.window.visible = (!(this._Str_3334.window.visible));
                this._Str_19515();
            }
        }

        private function _Str_25202(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._Str_3334.grid._Str_3373(_arg_2);
                this._Str_23446(_arg_2);
                this.selected = this._Str_2514[_local_3];
                this._Str_3334.window.visible = false;
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                IWindowContainer(_arg_2).findChildByName("background_color").color = 4291875024;
            }
            if (k.type == WindowMouseEvent.OUT)
            {
                IWindowContainer(_arg_2).findChildByName("background_color").color = 0xFFFFFFFF;
            }
        }

        private function _Str_23446(k:IWindow):void
        {
            var _local_2:int;
            while (_local_2 < this._Str_3334.grid.numGridItems)
            {
                IWindowContainer(this._Str_3334.grid._Str_2830(_local_2)).findChildByName("background_color").visible = false;
                _local_2++;
            }
            IWindowContainer(k).findChildByName("background_color").visible = true;
        }
    }
}
