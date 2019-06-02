package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.habbo.window.enum._Str_3724;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class IlluminaChatBubbleWidget implements _Str_3904 
    {
        public static const ILLUMINA_CHAT_BUBBLE:String = "illumina_chat_bubble";
        private static const _Str_14688:String = (ILLUMINA_CHAT_BUBBLE + ":flipped");
        private static const _Str_15777:String = (ILLUMINA_CHAT_BUBBLE + ":user_name");
        private static const _Str_4305:String = (ILLUMINA_CHAT_BUBBLE + ":figure");
        private static const _Str_15458:String = (ILLUMINA_CHAT_BUBBLE + ":message");
        private static const _Str_13641:PropertyStruct = new PropertyStruct(_Str_14688, false, PropertyStruct.BOOLEAN);
        private static const _Str_13288:PropertyStruct = new PropertyStruct(_Str_15777, "", PropertyStruct.STRING);
        private static const _Str_3804:PropertyStruct = new PropertyStruct(_Str_4305, "", PropertyStruct.STRING);
        private static const _Str_13034:PropertyStruct = new PropertyStruct(_Str_15458, "", PropertyStruct.STRING);

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _flipped:Boolean;
        private var _userName:ILabelWindow;
        private var _avatarWrapper:IWindow;
        private var _avatarWidget:_Str_2483;
        private var _bubbleWrapper:IWindow;
        private var _message:ITextWindow;
        private var _postTime:_Str_5483;
        private var _offline:IRegionWindow;
        private var _arrowPoint:IStaticBitmapWrapperWindow;
        private var _refreshing:Boolean;

        public function IlluminaChatBubbleWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._flipped = Boolean(_Str_13641.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("illumina_chat_bubble_xml").content as XML)) as IWindowContainer);
            this._userName = (this._root.findChildByName("user_name") as ILabelWindow);
            var _local_3:IWidgetWindow = (this._root.findChildByName("user_avatar") as IWidgetWindow);
            this._avatarWrapper = _local_3.parent;
            this._avatarWidget = (_local_3.widget as _Str_2483);
            this._bubbleWrapper = this._root.findChildByName("bubble_wrapper");
            this._message = (this._root.findChildByName("message") as ITextWindow);
            this._postTime = (IWidgetWindow(this._root.findChildByName("post_time")).widget as _Str_5483);
            this._offline = (this._root.findChildByName("offline_placeholder") as IRegionWindow);
            this._offline.height = 0;
            this._arrowPoint = (this._root.findChildByName("arrow_point") as IStaticBitmapWrapperWindow);
            this._root.findChildByName("message_region").setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, false);
            this._root.procedure = this._Str_24924;
            this.userName = String(_Str_13288.value);
            this.figure = String(_Str_3804.value);
            this.message = String(_Str_13034.value);
            this._widgetWindow._Str_2429 = this._root;
            this._widgetWindow.setParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN);
            this._root.width = this._widgetWindow.width;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow._Str_2429 = null;
                    this._widgetWindow = null;
                }
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_13641.withValue(this._Str_6764));
            k.push(_Str_13288.withValue(this.userName));
            k.push(_Str_3804.withValue(this.figure));
            k.push(_Str_13034.withValue(this.message));
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            if (this._disposed)
            {
                return;
            }
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_14688:
                        this._Str_6764 = Boolean(_local_2.value);
                        break;
                    case _Str_15777:
                        this.userName = String(_local_2.value);
                        break;
                    case _Str_4305:
                        this.figure = String(_local_2.value);
                        break;
                    case _Str_15458:
                        this.message = String(_local_2.value);
                        break;
                }
            }
        }

        public function get _Str_6764():Boolean
        {
            return this._flipped;
        }

        public function set _Str_6764(k:Boolean):void
        {
            this._flipped = k;
            this.refresh();
        }

        public function get userName():String
        {
            return this._userName.caption.slice(0, -1);
        }

        public function set userName(k:String):void
        {
            this._userName.caption = (k + ":");
        }

        public function get userId():int
        {
            return this._avatarWidget.userId;
        }

        public function set userId(k:int):void
        {
            this._avatarWidget.userId = k;
        }

        public function get figure():String
        {
            return this._avatarWidget.figure;
        }

        public function set figure(k:String):void
        {
            this._avatarWidget.figure = k;
        }

        public function get message():String
        {
            return this._message.caption;
        }

        public function set message(k:String):void
        {
            this._message.caption = k;
        }

        public function get timeStamp():Number
        {
            return this._postTime.timeStamp;
        }

        public function set timeStamp(k:Number):void
        {
            this._postTime.timeStamp = k;
        }

        public function set _Str_21245(k:Boolean):void
        {
            this._offline.height = ((k) ? 0 : 16);
        }

        public function refresh():void
        {
            if (this._refreshing)
            {
                return;
            }
            this._refreshing = true;
            this._root.limits.minWidth = this._root.width;
            this._root.limits.maxWidth = this._root.width;
            this._root.height = this._bubbleWrapper.bottom;
            this._bubbleWrapper.width = (this._root.width - this._avatarWrapper.width);
            this._message.width = this._bubbleWrapper.width;
            this._avatarWidget.direction = ((this._flipped) ? _Str_3724._Str_8287 : _Str_3724._Str_4519);
            if (this._flipped)
            {
                this._avatarWrapper.x = (this._root.width - this._avatarWrapper.width);
                this._arrowPoint.zoomX = 1;
                this._arrowPoint.x = this._avatarWrapper.x;
                this._bubbleWrapper.x = 0;
            }
            else
            {
                this._avatarWrapper.x = 0;
                this._arrowPoint.zoomX = -1;
                this._arrowPoint.x = (this._avatarWrapper.right - this._arrowPoint.width);
                this._bubbleWrapper.x = this._avatarWrapper.right;
            }
            this._root.limits.setEmpty();
            this._arrowPoint.invalidate();
            this._refreshing = false;
        }

        private function _Str_24924(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowEvent.WINDOW_EVENT_RESIZED:
                    this.refresh();
                    return;
                case WindowEvent.WINDOW_EVENT_CHILD_RESIZED:
                    this.refresh();
                    return;
                case WindowMouseEvent.CLICK:
                    if (((this.userId > 0) && (_arg_2.name == "user_name_region")))
                    {
                        this._windowManager.communication.connection.send(new _Str_2553(this.userId));
                    }
                    return;
            }
        }
    }
}
