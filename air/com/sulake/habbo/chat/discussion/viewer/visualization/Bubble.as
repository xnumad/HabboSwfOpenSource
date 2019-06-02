//com.sulake.habbo.chat.discussion.viewer.visualization.Bubble

package com.sulake.habbo.chat.discussion.viewer.visualization{
    import starling.display.Sprite;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.chat.Chat;
    import com.sulake.habbo.chat.discussion.viewer.ChatView;
    import com.sulake.habbo.chat.discussion.data.ChatItem;
    import com.sulake.habbo.chat.discussion.viewer.visualization.style.ChatStyle;
    import feathers.display.Scale3Image;
    import starling.display.Image;
    import feathers.controls.text.TextFieldTextRenderer;
    import starling.animation.Tween;
    import flash.geom.Point;
    import starling.textures.Texture;
    import starling.events.TouchEvent;

    public class Bubble extends Sprite implements IAvatarImageListener {

        private static const NAME_SEPARATOR:String;
        private static const FACE_TEXTURE_PREFIX:String;
        private static const FONT_REGULAR:String;
        private static const FONT_BOLD:String;
        private static const FONT_ITALIC:String;

        private const POINTER_MARGIN_LEFT:int;
        private const POINTER_MARGIN_RIGHT:int;

        private var _chat:Chat;
        private var _chatView:ChatView;
        private var _chatItem:ChatItem;
        private var _style:ChatStyle;
        private var _appliedStyleId:String;
        private var _background:Scale3Image;
        private var _pointer:Image;
        private var _face:Image;
        private var _faceTextureName:String;
        private var _textField:TextFieldTextRenderer;
        private var _moveTween:Tween;
        private var _avatarFigure:String;

        public function Bubble(k:Chat);

        private static function parseGesture(k:String):String;


        public function get disposed():Boolean;

        public function onRecycle():void;

        public function set style(k:ChatStyle):void;

        public function set chatItem(k:ChatItem):void;

        public function get chatItem():ChatItem;

        public function updateTextures():void;

        public function getBgWidth():int;

        private function updateStyle():void;

        public function updateVisuals():Boolean;

        private function setUserChat(k:String, _arg_2:String, _arg_3:Boolean, _arg_4:Boolean):void;

        private function useAvatar(k:String, _arg_2:String):void;

        private function updateFace(k:String):void;

        public function updateToTextMeasurement():void;

        public function animateTo(k:int, _arg_2:int):void;

        public function warpTo(k:int, _arg_2:int):void;

        private function updatePointerPosition():void;

        private function get chatterScreenPos():Point;

        private function getAvatarTextureName(k:String, _arg_2:String):String;

        private function updateAvatarToSharedTexture(k:String, _arg_2:String, _arg_3:String):Texture;

        private function onFaceTouched(k:TouchEvent):void;

        public function avatarImageReady(k:String):void;


    }
}//package com.sulake.habbo.chat.discussion.viewer.visualization

