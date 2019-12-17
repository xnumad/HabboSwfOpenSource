package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3084;
    import com.sulake.habbo.avatar.IAvatarImage;
    import flash.geom.Rectangle;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import flash.geom.Point;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;

    public class MeMenuNewIconLoader implements IAvatarImageListener 
    {
        private static const _Str_4588:int = 50;
        private static const _Str_6185:int = 3;

        private var _toolbar:HabboToolbar;
        private var _lastFigure:String;
        private var _lastUserImage:BitmapData;
        private var _lastHeadImage:BitmapData;
        private var _userObjectEvent:UserObjectEvent;
        private var _figureUpdateEvent:_Str_3084;

        public function MeMenuNewIconLoader(k:HabboToolbar)
        {
            this._toolbar = k;
            this._userObjectEvent = new UserObjectEvent(this._Str_3241);
            this._figureUpdateEvent = new _Str_3084(this._Str_5174);
            this._toolbar.communicationManager.addHabboConnectionMessageEvent(this._userObjectEvent);
            this._toolbar.communicationManager.addHabboConnectionMessageEvent(this._figureUpdateEvent);
            this.renderAvatar();
        }

        private function renderAvatar(k:String=null):void
        {
            var fullImage:BitmapData;
            var headImage:BitmapData;
            var _local_4:String;
            var _local_7:BitmapData;
            var _local_8:BitmapData;
            var _local_9:Rectangle;
            if (this._toolbar.avatarRenderManager != null)
            {
                _local_4 = ((k == null) ? this._toolbar.sessionDataManager.figure : k);
                if (_local_4 != this._lastFigure)
                {
                    var avatarImage:IAvatarImage = this._toolbar.avatarRenderManager.createAvatarImage(_local_4, AvatarScaleType.LARGE, this._toolbar.sessionDataManager.gender, this);
                    if (avatarImage != null)
                    {
                        avatarImage.setDirection(AvatarSetType.FULL, 2);
                        fullImage = avatarImage._Str_818(AvatarSetType.FULL);
                        headImage = avatarImage._Str_818(AvatarSetType.HEAD);
                        avatarImage.dispose();
                    }
                    this._lastFigure = _local_4;
                    if (this._lastUserImage != null)
                    {
                        this._lastUserImage.dispose();
                    }
                    this._lastUserImage = fullImage;
                    if (this._lastHeadImage != null)
                    {
                        this._lastHeadImage.dispose();
                    }
                    this._lastHeadImage = headImage;
                }
                else
                {
                    fullImage = this._lastUserImage;
                    headImage = this._lastHeadImage;
                }
            }
            if (this._toolbar != null)
            {
                if (((!(fullImage == null)) && (!(headImage == null))))
                {
                    if (fullImage.height > _Str_4588)
                    {
                        _local_8 = new BitmapData(fullImage.width, _Str_4588, true, 0);
                        _local_9 = _local_8.rect.clone();
                        if (headImage.height > (_Str_4588 - _Str_6185))
                        {
                            _local_9.offset(0, ((headImage.height - _Str_4588) + _Str_6185));
                        }
                        _local_8.copyPixels(fullImage, _local_9, new Point(0, 0));
                        _local_7 = _local_8;
                    }
                    else
                    {
                        _local_7 = fullImage.clone();
                    }
                }
                this._toolbar.setAssetUri(HabboToolbarIconEnum.MEMENU, _local_7);
            }
        }

        public function _Str_840(k:String):void
        {
            this._lastFigure = "";
            this.renderAvatar();
        }

        private function _Str_3241(k:UserObjectEvent):void
        {
            this.renderAvatar(k.getParser().figure);
        }

        private function _Str_5174(k:_Str_3084):void
        {
            if (k.id == -1)
            {
                this.renderAvatar(k.figure);
            }
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
            if (this._figureUpdateEvent != null)
            {
                this._toolbar.communicationManager.removeHabboConnectionMessageEvent(this._figureUpdateEvent);
                this._figureUpdateEvent = null;
            }
            this._toolbar = null;
        }

        public function get disposed():Boolean
        {
            return this._toolbar == null;
        }
    }
}
