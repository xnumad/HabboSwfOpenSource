package com.sulake.habbo.friendlist
{
    import flash.geom.Point;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.friendlist.events._Str_3797;
    import com.sulake.core.window.IWindow;
    import flash.utils.Dictionary;

    public class _Str_7249 
    {
        private static const _Str_3163:Point = new Point(110, 50);
        private static const _Str_16690:int = 110;
        private static const _Str_3446:int = 1;

        private var _habboFriendList:HabboFriendList;
        private var _Str_18526:_Str_8553;
        private var _mainWindow:IFrameWindow;
        private var _Str_21315:IWindowContainer;
        private var _Str_3541:IWindowContainer;
        private var _Str_5074:ITextWindow;
        private var _Str_3860:int = -1;
        private var _Str_4481:int = -1;
        private var _Str_18916:Boolean;

        public function _Str_7249(k:HabboFriendList)
        {
            this._habboFriendList = k;
            this._Str_18526 = new _Str_8553(this._habboFriendList);
        }

        public function openFriendList():void
        {
            if (this._mainWindow == null)
            {
                this.prepare();
                this._mainWindow.position = _Str_3163;
            }
            else
            {
                this._mainWindow.visible = true;
                this._mainWindow.activate();
            }
        }

        public function _Str_3476(k:WindowEvent, _arg_2:String):void
        {
            var _local_3:WindowMouseEvent = (k as WindowMouseEvent);
            if (_local_3 == null)
            {
                return;
            }
            if (_local_3.type == WindowMouseEvent.OUT)
            {
                this._Str_5074.text = "";
            }
            else
            {
                if (_local_3.type == WindowMouseEvent.OVER)
                {
                    this._Str_5074.text = _arg_2;
                }
            }
        }

        public function refresh(k:String):void
        {
            if (this._mainWindow == null)
            {
                return;
            }
            this._Str_18526.refresh(k);
            this._Str_23758();
        }

        public function close():void
        {
            if (this._mainWindow != null)
            {
                this._mainWindow.visible = false;
            }
        }

        public function isOpen():Boolean
        {
            return (this._mainWindow) && (this._mainWindow.visible);
        }

        private function prepare():void
        {
            this._mainWindow = IFrameWindow(this._habboFriendList.getXmlWindow("main_window"));
            this._mainWindow.findChildByTag("close").procedure = this._Str_3046;
            this._Str_21315 = IWindowContainer(this._mainWindow.content.findChildByName("main_content"));
            this._Str_3541 = IWindowContainer(this._mainWindow.content.findChildByName("footer"));
            this._Str_18526.prepare(this._Str_21315);
            this._mainWindow.procedure = this._Str_7142;
            this._mainWindow.content.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER, false);
            this._mainWindow.content.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED, true);
            this._mainWindow.header.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER, false);
            this._mainWindow.header.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED, true);
            this._mainWindow.content.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER, false);
            this._mainWindow.content.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED, true);
            var k:Boolean = this._habboFriendList.getBoolean("friendship.category.management.enabled");
            if (((k) && (!(this._habboFriendList.getInteger("spaweb", 0) == 1))))
            {
                this._mainWindow.findChildByName("open_edit_ctgs_but").procedure = this._Str_24823;
            }
            else
            {
                this._mainWindow.findChildByName("open_edit_ctgs_but").visible = false;
            }
            this._Str_5074 = ITextWindow(this._mainWindow.findChildByName("info_text"));
            this._Str_5074.text = "";
            this._habboFriendList.refreshButton(this._mainWindow, "open_edit_ctgs", true, null, 0);
            this.refresh("prepare");
            this._mainWindow.height = 350;
            this._mainWindow.width = 230;
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Close window");
            this._mainWindow.visible = false;
            this._habboFriendList._Str_9727(_Str_3797.HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED);
            this._habboFriendList.categories.view._Str_18123();
        }

        private function _Str_7142(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowEvent.WINDOW_EVENT_RELOCATE) || (k.type == WindowEvent.WINDOW_EVENT_RESIZED)))
            {
                this._habboFriendList.categories.view._Str_18123();
            }
            if (((!(k.type == WindowEvent.WINDOW_EVENT_RESIZED)) || (!(_arg_2 == this._mainWindow))))
            {
                return;
            }
            if (this._Str_18916)
            {
                return;
            }
            var _local_3:int = ((this._Str_3860 == -1) ? 0 : (this._mainWindow.height - this._Str_3860));
            var _local_4:int = ((this._Str_4481 == -1) ? 0 : (this._mainWindow.width - this._Str_4481));
            this._habboFriendList.tabs._Str_12266 = Math.max(100, (this._habboFriendList.tabs._Str_12266 + _local_3));
            this._habboFriendList.tabs._Str_4971 = Math.max(147, (this._habboFriendList.tabs._Str_4971 + _local_4));
            this.refresh(("resize: " + _local_3));
        }

        private function _Str_23758():void
        {
            this._Str_18916 = true;
            this._Str_3541.visible = false;
            this._Str_3541.y = Util._Str_2647(this._mainWindow.content);
            this._Str_3541.width = this._habboFriendList.tabs._Str_4971;
            this._Str_3541.visible = true;
            this._mainWindow.content.height = Util._Str_2647(this._mainWindow.content);
            this._mainWindow.content.width = (this._habboFriendList.tabs._Str_4971 - 10);
            this._mainWindow.header.width = (this._habboFriendList.tabs._Str_4971 - 10);
            this._mainWindow.height = (this._mainWindow.content.height + 30);
            this._mainWindow.width = this._habboFriendList.tabs._Str_4971;
            this._Str_18916 = false;
            this._mainWindow.scaler.setParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TRIGGER, false);
            this._mainWindow.scaler.setParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TRIGGER, (!(this._habboFriendList.tabs._Str_14015() == null)));
            this._mainWindow.scaler.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER, false);
            this._mainWindow.scaler.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER, false);
            this._mainWindow.scaler.x = (this._mainWindow.width - this._mainWindow.scaler.width);
            this._mainWindow.scaler.y = (this._mainWindow.height - this._mainWindow.scaler.height);
            this._Str_3860 = this._mainWindow.height;
            this._Str_4481 = this._mainWindow.width;
            Logger.log(("RESIZED: " + this._habboFriendList.tabs._Str_4971));
        }

        private function _Str_24823(k:WindowEvent, _arg_2:IWindow):void
        {
            this._habboFriendList.view._Str_3476(k, "${friendlist.tip.preferences}");
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            Logger.log("Edit categories clicked");
            var _local_3:WindowMouseEvent = (k as WindowMouseEvent);
            this._habboFriendList._Str_12559("link.format.friendlist.pref", new Dictionary(), _local_3.stageX, _local_3.stageY);
        }

        public function get mainWindow():IWindowContainer
        {
            return this._mainWindow;
        }

        public function _Str_18944(k:Point):void
        {
            var _local_2:Point = k.clone();
            _local_2.y = (_local_2.y - this._mainWindow.height);
            var _local_3:int = this._habboFriendList.windowManager.getWindowContext(_Str_3446).getDesktopWindow().width;
            _local_2.x = Math.min((_local_3 - this._mainWindow.width), _local_2.x);
            _local_2.x = Math.max(_Str_16690, _local_2.x);
            this._mainWindow.position = _local_2;
        }
    }
}
