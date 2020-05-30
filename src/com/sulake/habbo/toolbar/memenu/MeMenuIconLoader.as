package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.FigureUpdateEvent;
    import com.sulake.habbo.avatar.IAvatarImage;
    import flash.geom.Rectangle;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import flash.geom.Point;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;

    public class MeMenuIconLoader implements IAvatarImageListener 
    {
        private static const MAX_ICON_HEIGHT:int = 50;
        private static const HEAD_MARGIN:int = 3;

        private var _toolbar:HabboToolbar;
        private var _lastFigure:String;
        private var _lastUserImage:BitmapData;
        private var _lastHeadImage:BitmapData;
        private var _userObjectEvent:UserObjectEvent;
        private var _userChangeMessageEvent:FigureUpdateEvent;

        public function MeMenuIconLoader(k:HabboToolbar)
        {
            this._toolbar = k;
            this._userObjectEvent = new UserObjectEvent(this.onUserObject);
            this._userChangeMessageEvent = new FigureUpdateEvent(this.onFigureUpdate);
            this._toolbar.communicationManager.addHabboConnectionMessageEvent(this._userObjectEvent);
            this._toolbar.communicationManager.addHabboConnectionMessageEvent(this._userChangeMessageEvent);
            this.setMeMenuToolbarIcon();
        }

        private function setMeMenuToolbarIcon(k:String=null):void
        {
            var _local_2:BitmapData;
            var _local_3:BitmapData;
            var _local_4:String;
            var _local_5:String;
            var _local_6:IAvatarImage;
            var _local_7:BitmapData;
            var _local_8:BitmapData;
            var _local_9:Rectangle;
            if (this._toolbar.avatarRenderManager != null)
            {
                _local_4 = ((k == null) ? this._toolbar.sessionDataManager.figure : k);
                if (_local_4 != this._lastFigure)
                {
                    _local_5 = this._toolbar.sessionDataManager.gender;
                    _local_6 = this._toolbar.avatarRenderManager.createAvatarImage(_local_4, AvatarScaleType.LARGE, _local_5, this);
                    if (_local_6 != null)
                    {
                        _local_6.setDirection(AvatarSetType.FULL, 2);
                        _local_2 = _local_6._Str_818(AvatarSetType.FULL);
                        _local_3 = _local_6._Str_818(AvatarSetType.HEAD);
                        _local_6.dispose();
                    }
                    this._lastFigure = _local_4;
                    if (this._lastUserImage != null)
                    {
                        this._lastUserImage.dispose();
                    }
                    this._lastUserImage = _local_2;
                    if (this._lastHeadImage != null)
                    {
                        this._lastHeadImage.dispose();
                    }
                    this._lastHeadImage = _local_3;
                }
                else
                {
                    _local_2 = this._lastUserImage;
                    _local_3 = this._lastHeadImage;
                }
            }
            if (this._toolbar != null)
            {
                if (((!(_local_2 == null)) && (!(_local_3 == null))))
                {
                    if (_local_2.height > MAX_ICON_HEIGHT)
                    {
                        _local_8 = new BitmapData(_local_2.width, MAX_ICON_HEIGHT, true, 0);
                        _local_9 = _local_8.rect.clone();
                        if (_local_3.height > (MAX_ICON_HEIGHT - HEAD_MARGIN))
                        {
                            _local_9.offset(0, ((_local_3.height - MAX_ICON_HEIGHT) + HEAD_MARGIN));
                        }
                        _local_8.copyPixels(_local_2, _local_9, new Point(0, 0));
                        _local_7 = _local_8;
                    }
                    else
                    {
                        _local_7 = _local_2.clone();
                    }
                }
                this._toolbar.setAssetUri(HabboToolbarIconEnum.MEMENU, _local_7);
            }
        }

        public function avatarImageReady(k:String):void
        {
            this._lastFigure = "";
            this.setMeMenuToolbarIcon();
        }

        private function onUserObject(k:UserObjectEvent):void
        {
            this.setMeMenuToolbarIcon(k.getParser().figure);
        }

        private function onFigureUpdate(k:FigureUpdateEvent):void
        {
            if (this.disposed)
            {
                return;
            }
            this.setMeMenuToolbarIcon(k.figure);
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._userObjectEvent != null)
            {
                this._toolbar.communicationManager.removeHabboConnectionMessageEvent(this._userObjectEvent);
                this._userObjectEvent = null;
            }
            if (this._userChangeMessageEvent != null)
            {
                this._toolbar.communicationManager.removeHabboConnectionMessageEvent(this._userChangeMessageEvent);
                this._userChangeMessageEvent = null;
            }
            this._toolbar = null;
        }

        public function get disposed():Boolean
        {
            return this._toolbar == null;
        }
    }
}
