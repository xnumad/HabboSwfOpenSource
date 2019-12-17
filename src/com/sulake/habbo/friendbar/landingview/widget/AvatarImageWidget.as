package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3084;
    import com.sulake.habbo.avatar.events.AvatarUpdateEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.window.widgets._Str_2483;

    public class AvatarImageWidget implements ILandingViewWidget 
    {
        private var _landingView:HabboLandingView;
        private var _avatarImageWidget:IWidgetWindow;
        private var _userObjectEvent:UserObjectEvent;
        private var _userChangeMessageEvent:_Str_3084;

        public function AvatarImageWidget(k:HabboLandingView)
        {
            this._landingView = k;
            this._userObjectEvent = new UserObjectEvent(this._Str_3241);
            this._userChangeMessageEvent = new _Str_3084(this._Str_5174);
            this._landingView.communicationManager.addHabboConnectionMessageEvent(this._userObjectEvent);
            this._landingView.communicationManager.addHabboConnectionMessageEvent(this._userChangeMessageEvent);
            this._landingView.avatarEditor.events.addEventListener(AvatarUpdateEvent.AVATAR_FIGURE_UPDATED, this._Str_20230);
        }

        public function get container():IWindow
        {
            return this._avatarImageWidget;
        }

        public function dispose():void
        {
            if (this._userObjectEvent != null)
            {
                this._landingView.communicationManager.removeHabboConnectionMessageEvent(this._userObjectEvent);
                this._userObjectEvent = null;
            }
            if (this._userChangeMessageEvent != null)
            {
                this._landingView.communicationManager.removeHabboConnectionMessageEvent(this._userChangeMessageEvent);
                this._userChangeMessageEvent = null;
            }
            if (this._landingView != null)
            {
                this._landingView.avatarEditor.events.removeEventListener(AvatarUpdateEvent.AVATAR_FIGURE_UPDATED, this._Str_20230);
                this._landingView = null;
            }
            this._avatarImageWidget = null;
        }

        public function initialize():void
        {
            this._avatarImageWidget = IWidgetWindow(this._landingView.getXmlWindow("avatar_image"));
        }

        public function refresh():void
        {
            this._Str_7815();
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        private function _Str_3241(k:UserObjectEvent):void
        {
            this._Str_7815(k.getParser().figure);
        }

        private function _Str_5174(k:IMessageEvent):void
        {
            var _local_2:_Str_3084 = (k as _Str_3084);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.id == -1)
            {
                this._Str_7815(_local_2.figure);
            }
        }

        private function _Str_20230(k:AvatarUpdateEvent):void
        {
            this._Str_7815(k.figure);
        }

        private function _Str_7815(k:String=null):void
        {
            var _local_2:_Str_2483;
            if (((!(k)) && (this._landingView.sessionDataManager)))
            {
                k = this._landingView.sessionDataManager.figure;
            }
            if (this._avatarImageWidget != null)
            {
                _local_2 = (this._avatarImageWidget.widget as _Str_2483);
                if (_local_2 != null)
                {
                    _local_2.figure = k;
                }
            }
        }
    }
}
