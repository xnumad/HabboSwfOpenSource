package com.sulake.habbo.ui.widget.messages
{
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;

    public class RoomWidgetAvatarExpressionMessage extends RoomWidgetMessage 
    {
        public static const RWCM_MESSAGE_AVATAR_EXPRESSION:String = "RWCM_MESSAGE_AVATAR_EXPRESSION";

        private var _animation:AvatarExpressionEnum;

        public function RoomWidgetAvatarExpressionMessage(k:AvatarExpressionEnum)
        {
            super(RWCM_MESSAGE_AVATAR_EXPRESSION);
            this._animation = k;
        }

        public function get animation():AvatarExpressionEnum
        {
            return this._animation;
        }
    }
}
