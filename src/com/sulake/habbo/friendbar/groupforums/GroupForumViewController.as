package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_3372;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class GroupForumViewController 
    {
        private static const _Str_13986:Number = 0.5;

        private var _Str_2278:GroupForumController;
        private var _Str_2439:GroupForumView;
        private var _window:IFrameWindow;
        private var _Str_9870:ISelectorWindow;
        private var _Str_8356:ISelectorWindow;
        private var _Str_9318:ISelectorWindow;
        private var _Str_11160:ISelectorWindow;
        private var _Str_2381:_Str_3372;
        private var _Str_6730:int;
        private var _Str_6541:int;
        private var _Str_9497:int;
        private var _Str_9468:int;

        public function GroupForumViewController(k:GroupForumView, _arg_2:int, _arg_3:int, _arg_4:_Str_3372)
        {
            this._Str_2439 = k;
            this._Str_2278 = this._Str_2439.controller;
            this._Str_2381 = _arg_4;
            this._window = IFrameWindow(this._Str_2278.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_forum_settings_xml())));
            this._window.x = _arg_2;
            var _local_5:int = this._Str_2278.windowManager.getDesktop(1).width;
            if ((this._window.x + this._window.width) > _local_5)
            {
                this._window.x = (_local_5 - this._window.width);
            }
            this._window.y = _arg_3;
            this._Str_7598();
        }

        private static function _Str_4609(k:ISelectorWindow, _arg_2:int, _arg_3:int):int
        {
            var _local_5:ISelectableWindow;
            var _local_6:IWindow;
            if (_arg_3 < _arg_2)
            {
                _arg_3 = _arg_2;
            }
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_5 = k.getSelectableByName(String(_local_4));
                if (_local_5 != null)
                {
                    _local_5.disable();
                    _local_5.blend = _Str_13986;
                    _local_6 = IWindowContainer(k.parent).findChildByName(("label" + _local_4));
                    if (_local_6 != null)
                    {
                        _local_6.blend = _Str_13986;
                    }
                }
                _local_4++;
            }
            _local_4 = _arg_2;
            while (_local_4 < 4)
            {
                _local_5 = k.getSelectableByName(String(_local_4));
                if (_local_5 != null)
                {
                    _local_5.enable();
                    _local_5.blend = 1;
                    _local_6 = IWindowContainer(k.parent).findChildByName(("label" + _local_4));
                    if (_local_6 != null)
                    {
                        _local_6.blend = 1;
                    }
                    if (_local_4 == _arg_3)
                    {
                        k.setSelected(_local_5);
                    }
                }
                _local_4++;
            }
            return _arg_3;
        }

        private static function _Str_6359(k:ISelectorWindow):int
        {
            var _local_2:ISelectableWindow = k.getSelected();
            if (_local_2 == null)
            {
                return 0;
            }
            return int(_local_2.name);
        }


        public function focus(k:_Str_3372):void
        {
            if (this._Str_2381 != k)
            {
                this._Str_2381 = k;
                this._Str_7598();
            }
            this._window.activate();
        }

        private function _Str_7598():void
        {
            var k:IRegionWindow = GroupForumView._Str_14926(this._window, this._Str_2381);
            k.removeEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            k.addEventListener(WindowMouseEvent.CLICK, this._Str_4912);
            var _local_2:IWindow = this._window.findChildByName("cancel_btn");
            _local_2.removeEventListener(WindowMouseEvent.CLICK, this._Str_4604);
            _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_4604);
            var _local_3:IWindow = this._window.findChildByName("header_button_close");
            _local_3.removeEventListener(WindowMouseEvent.CLICK, this._Str_4604);
            _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_4604);
            var _local_4:IWindow = this._window.findChildByName("ok_btn");
            _local_4.removeEventListener(WindowMouseEvent.CLICK, this._Str_10704);
            _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_10704);
            this._Str_9870 = ISelectorWindow(this._window.findChildByName("read_selector"));
            this._Str_9870.addEventListener(WindowMouseEvent.OVER, this._Str_22768);
            this._Str_13970(this._Str_9870);
            this._Str_8356 = ISelectorWindow(this._window.findChildByName("post_message_selector"));
            this._Str_8356.addEventListener(WindowMouseEvent.OVER, this._Str_22910);
            this._Str_13970(this._Str_8356);
            this._Str_9318 = ISelectorWindow(this._window.findChildByName("post_thread_selector"));
            this._Str_9318.addEventListener(WindowMouseEvent.OVER, this._Str_23060);
            this._Str_13970(this._Str_9318);
            this._Str_11160 = ISelectorWindow(this._window.findChildByName("moderate_selector"));
            this._Str_11160.addEventListener(WindowMouseEvent.OVER, this._Str_24316);
            this._Str_13970(this._Str_11160);
            this._Str_6730 = _Str_4609(this._Str_9870, 0, this._Str_2381._Str_24871);
            this._Str_6541 = _Str_4609(this._Str_8356, this._Str_6730, this._Str_2381._Str_25794);
            this._Str_9497 = _Str_4609(this._Str_9318, this._Str_6541, this._Str_2381._Str_24408);
            this._Str_9468 = _Str_4609(this._Str_11160, 2, this._Str_2381._Str_24549);
        }

        public function dispose():void
        {
            this._Str_2278._Str_11338 = null;
            this._window.dispose();
            this._window = null;
        }

        private function _Str_4912(k:WindowMouseEvent):void
        {
            this._Str_2278.context.createLinkEvent(("group/" + this._Str_2381.groupId));
        }

        private function _Str_10704(k:WindowMouseEvent):void
        {
            this._Str_2278._Str_25084(this._Str_2381.groupId, this._Str_6730, this._Str_6541, this._Str_9497, this._Str_9468);
            this.dispose();
        }

        private function _Str_4604(k:WindowMouseEvent):void
        {
            this.dispose();
        }

        private function _Str_13970(k:ISelectorWindow):void
        {
            var _local_3:ISelectableWindow;
            var _local_2:int;
            while (_local_2 < k.numSelectables)
            {
                _local_3 = k.getSelectableAt(_local_2);
                _local_3.removeEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_20995);
                _local_3.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_20995);
                _local_2++;
            }
        }

        private function _Str_20995(k:WindowEvent):void
        {
            this._Str_6730 = _Str_6359(this._Str_9870);
            this._Str_6541 = _Str_4609(this._Str_8356, this._Str_6730, _Str_6359(this._Str_8356));
            this._Str_9497 = _Str_4609(this._Str_9318, this._Str_6541, _Str_6359(this._Str_9318));
            this._Str_9468 = _Str_6359(this._Str_11160);
        }

        private function _Str_22768(k:WindowMouseEvent):void
        {
            this._Str_2278.tracking._Str_3990("InterfaceExplorer", "hover", "forum.can.read.seen");
        }

        private function _Str_22910(k:WindowMouseEvent):void
        {
            this._Str_2278.tracking._Str_3990("InterfaceExplorer", "hover", "forum.can.post.seen");
        }

        private function _Str_23060(k:WindowMouseEvent):void
        {
            this._Str_2278.tracking._Str_3990("InterfaceExplorer", "hover", "forum.can.start.thread.seen");
        }

        private function _Str_24316(k:WindowMouseEvent):void
        {
            this._Str_2278.tracking._Str_3990("InterfaceExplorer", "hover", "forum.can.moderate.seen");
        }
    }
}


