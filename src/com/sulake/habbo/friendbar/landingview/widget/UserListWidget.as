package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.enum._Str_3724;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_4106;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.friendbar.landingview.*;

    public class UserListWidget implements ILandingViewWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _popup:IWindowContainer;
        private var _startOffset:int = 150;
        private var _avatarOffsetsY:Array;
        private var _avatarContainerWidths:Array;
        private var _avatarDirections:Array;

        public function UserListWidget(k:HabboLandingView)
        {
            this._avatarOffsetsY = [0, 10, 5, 0, 5, 10, 0, 10, 5, 10];
            this._avatarContainerWidths = [];
            this._avatarDirections = [_Str_3724._Str_4519, _Str_3724._Str_8287, _Str_3724._Str_4519, _Str_3724._Str_4519, _Str_3724._Str_8287, _Str_3724._Str_4519, _Str_3724._Str_4519, _Str_3724._Str_4519, _Str_3724._Str_8287, _Str_3724._Str_4519];
            super();
            this._landingView = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._container = null;
            if (this._popup != null)
            {
                this._popup.dispose();
                this._popup = null;
            }
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("user_list"));
            this.registerMessageListeners();
        }

        public function refresh():void
        {
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function refreshContent():void
        {
            if (this.users == null)
            {
                this._container.visible = false;
                return;
            }
            this._container.visible = true;
            this._Str_3836();
            this._Str_20962();
        }

        private function _Str_3836():void
        {
            var _local_3:IWindowContainer;
            var _local_4:_Str_4106;
            var _local_5:IWidgetWindow;
            var _local_6:_Str_2483;
            var k:int = this._startOffset;
            var _local_2:int;
            while (_local_2 < 10)
            {
                _local_3 = this._Str_25068(_local_2);
                if (_local_3 == null)
                {
                    _local_3 = this._Str_24841(_local_2);
                    this._container.addChild(_local_3);
                    _local_3.x = k;
                    k = (k + _local_3.width);
                }
                _local_4 = this.users[_local_2];
                _local_3.visible = (!(_local_4 == null));
                if (_local_4)
                {
                    _local_5 = IWidgetWindow(_local_3.findChildByName("avatar_image_widget"));
                    _local_6 = _Str_2483(_local_5.widget);
                    _local_6.figure = _local_4.figure;
                }
                _local_2++;
            }
        }

        private function _Str_25068(k:int):IWindowContainer
        {
            return IWindowContainer(this._container.getChildByID(k));
        }

        private function _Str_24841(k:int):IWindowContainer
        {
            var _local_2:IWindowContainer = IWindowContainer(this._landingView.getXmlWindow("user_entry"));
            this._Str_24987(_local_2, k);
            _local_2.procedure = this._Str_6514;
            _local_2.id = k;
            if (this._avatarContainerWidths.length > k)
            {
                _local_2.width = this._avatarContainerWidths[k];
            }
            var _local_3:IWindow = _local_2.findChildByName("extra_link_region");
            _local_3.visible = this.hasExtraLink();
            _local_3.procedure = this._Str_23122;
            _local_3.id = k;
            return _local_2;
        }

        private function _Str_24987(k:IWindowContainer, _arg_2:int):void
        {
            var _local_3:IWidgetWindow = IWidgetWindow(k.findChildByName("avatar_image_widget"));
            var _local_4:_Str_2483 = _Str_2483(_local_3.widget);
            k.y = (k.y + (this._avatarOffsetsY[_arg_2] + 70));
            if (this._avatarOffsetsY[_arg_2] < 0)
            {
                k.height = (k.height + -(this._avatarOffsetsY[_arg_2]));
            }
            _local_4.direction = this._avatarDirections[_arg_2];
            k.findChildByName("extra_link_region").y = (k.findChildByName("extra_link_region").y - this._avatarOffsetsY[_arg_2]);
        }

        private function _Str_4666(k:IWindow):_Str_4106
        {
            var _local_2:int = k.id;
            return this.users[_local_2];
        }

        private function _Str_6514(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_4106 = this._Str_4666(_arg_2);
            if (_local_3 == null)
            {
                return;
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.send(new _Str_2553(_local_3.userId));
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    this._Str_8168(_local_3, _arg_2);
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        this._Str_20962();
                    }
                }
            }
        }

        private function _Str_23122(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_4106;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._Str_4666(_arg_2);
                if (_local_3 == null)
                {
                    return;
                }
                this.extraLinkClicked(_local_3);
            }
            else
            {
                this._Str_6514(k, _arg_2.parent);
            }
        }

        private function _Str_8168(k:_Str_4106, _arg_2:IWindow):void
        {
            if (this._popup == null)
            {
                this._popup = IWindowContainer(this._landingView.getXmlWindow(this.getPopupXml()));
                this._container.addChild(this._popup);
            }
            this.refreshPopup(k, this._popup);
            this._popup.y = Math.max(0, (79 - this._popup.height));
            this._popup.x = (_arg_2.x + ((_arg_2.width - this._popup.width) / 2));
            this._popup.visible = true;
        }

        private function _Str_20962():void
        {
            if (this.users.length > 0)
            {
                this._Str_8168(this.users[0], this._container.getChildByID(0));
            }
            else
            {
                if (this._popup != null)
                {
                    this._popup.visible = false;
                }
            }
        }

        protected function get landingView():HabboLandingView
        {
            return this._landingView;
        }

        protected function getText(k:String):String
        {
            return ("${" + k) + "}";
        }

        protected function registerMessageListeners():void
        {
        }

        protected function get users():Array
        {
            return null;
        }

        protected function refreshPopup(k:_Str_4106, _arg_2:IWindowContainer):void
        {
        }

        protected function getPopupXml():String
        {
            return null;
        }

        protected function hasExtraLink():Boolean
        {
            return false;
        }

        protected function extraLinkClicked(k:_Str_4106):void
        {
        }

        protected function set _Str_21503(k:Array):void
        {
            this._avatarOffsetsY = k;
        }

        protected function set _Str_20102(k:Array):void
        {
            this._avatarContainerWidths = k;
        }

        public function set _Str_19229(k:int):void
        {
            this._startOffset = k;
        }
    }
}

